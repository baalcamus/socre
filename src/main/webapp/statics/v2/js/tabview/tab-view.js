//浏览器版本判断
var Sys = {};
var ua = navigator.userAgent.toLowerCase();
var s;
(s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :
(s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
(s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
(s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
(s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;

// 执行js
var global_html_pool = [];
var global_script_pool = [];
var global_script_src_pool = [];
var global_lock_pool = [];
var innerhtml_lock = null;
var document_buffer = "";

function set_innerHTML(obj_id, html, time) {
	if (innerhtml_lock == null) {
		innerhtml_lock = obj_id;
	} else if (typeof (time) == "undefined") {
		global_lock_pool[obj_id + "_html"] = html;
		window.setTimeout("set_innerHTML('" + obj_id + "', global_lock_pool['"
				+ obj_id + "_html']);", 10);
		return;
	} else if (innerhtml_lock != obj_id) {
		global_lock_pool[obj_id + "_html"] = html;
		window.setTimeout("set_innerHTML('" + obj_id + "', global_lock_pool['"
				+ obj_id + "_html'], " + time + ");", 10);
		return;
	}

	function get_script_id() {
		return "script_" + (new Date()).getTime().toString(36)
				+ Math.floor(Math.random() * 100000000).toString(36);
	}

	document_buffer = "";

	document.write = function(str) {
		document_buffer += str;
	}
	document.writeln = function(str) {
		document_buffer += str + "\n";
	}

	global_html_pool = [];

	var scripts = [];
	html = html.split(/<\/script>/i);
	for ( var i = 0; i < html.length; i++) {
		global_html_pool[i] = html[i].replace(/<script[\s\S]*$/ig, "");
		scripts[i] = {
			text :'',
			src :''
		};
		scripts[i].text = html[i].substr(global_html_pool[i].length);
		scripts[i].src = scripts[i].text.substr(0,
				scripts[i].text.indexOf('>') + 1);
		scripts[i].src = scripts[i].src
				.match(/src\s*=\s*(\"([^\"]*)\"|\'([^\']*)\'|([^\s]*)[\s>])/i);
		if (scripts[i].src) {
			if (scripts[i].src[2]) {
				scripts[i].src = scripts[i].src[2];
			} else if (scripts[i].src[3]) {
				scripts[i].src = scripts[i].src[3];
			} else if (scripts[i].src[4]) {
				scripts[i].src = scripts[i].src[4];
			} else {
				scripts[i].src = "";
			}
			scripts[i].text = "";
		} else {
			scripts[i].src = "";
			scripts[i].text = scripts[i].text.substr(scripts[i].text
					.indexOf('>') + 1);
			scripts[i].text = scripts[i].text.replace(/^\s*<\!--\s*/g, "");
		}
	}

	var s;
	if (typeof (time) == "undefined") {
		s = 0;
	} else {
		s = time;
	}

	var script, add_script, remove_script;

	for ( var i = 0; i < scripts.length; i++) {
		var add_html = "document_buffer += global_html_pool[" + i + "];\n";
		add_html += "document.getElementById('" + obj_id
				+ "').innerHTML = document_buffer;\n";
		script = document.createElement("script");
		if (scripts[i].src) {
			script.src = scripts[i].src;
			if (typeof (global_script_src_pool[script.src]) == "undefined") {
				global_script_src_pool[script.src] = true;
				s += 2000;
			} else {
				s += 10;
			}
		} else {
			script.text = scripts[i].text;
			s += 10;
		}
		script.defer = true;
		script.type = "text/javascript";
		script.id = get_script_id();
		global_script_pool[script.id] = script;
		add_script = add_html;
		add_script += "document.getElementsByTagName('head').item(0)";
		add_script += ".appendChild(global_script_pool['" + script.id
				+ "']);\n";
		window.setTimeout(add_script, s);
		remove_script = "document.getElementsByTagName('head').item(0)";
		remove_script += ".removeChild(document.getElementById('" + script.id
				+ "'));\n";
		remove_script += "delete global_script_pool['" + script.id + "'];\n";
		window.setTimeout(remove_script, s + 10000);
	}

	var end_script = "if (document_buffer.match(/<\\/script>/i)) {\n";
	end_script += "set_innerHTML('" + obj_id + "', document_buffer, " + s
			+ ");\n";
	end_script += "}\n";
	end_script += "else {\n";
	end_script += "document.getElementById('" + obj_id
			+ "').innerHTML = document_buffer;\n";
	end_script += "innerhtml_lock = null;\n";
	end_script += "}";
	window.setTimeout(end_script, s);
	document.getElementById("LoadingPanel").style.display = "none";
}

// 禁止选中处理
function disableSelection(target) {
	if (typeof target.onselectstart != "undefined") // IE route
		target.onselectstart = function() {
			return false
		}
	else if (typeof target.style.MozUserSelect != "undefined") // Firefox route
		target.style.MozUserSelect = "none"
	else
		// All other route (ie: Opera)
		target.onmousedown = function() {
			return false
		}
	target.style.cursor = "default"
}

// 字符计算截断处理
String.prototype.len = function() {

	return this.replace(/[^\x00-\xff]/g, "rr").length;
}
String.prototype.sub = function(n) {

	var r = /[^\x00-\xff]/g;

	if (this.replace(r, "mm").length <= n)
		return this;

	// n = n - 3;

	var m = Math.floor(n / 2);

	for ( var i = m; i < this.length; i++) {

		if (this.substr(0, i).replace(r, "mm").length >= n) {

			return this.substr(0, i);
		}
	}
	return this;
};

var textPadding = 3; // Padding at the left of tab text - bigger value gives
// you wider tabs
var strictDocType = true;
var tabView_maxNumberOfTabs = 11; // Maximum number of tabs

/* Don't change anything below here */
var mainTabObj = new Array();
var activeTabIndex = new Array();
var MSIE = navigator.userAgent.indexOf('MSIE') >= 0 ? true : false;

var regExp = new RegExp(".*MSIE ([0-9]\.[0-9]).*", "g");
var navigatorVersion = navigator.userAgent.replace(regExp, '$1');

var ajaxObjects = new Array();
var tabView_countTabs = new Array();
var tabViewHeight = new Array();
var tabDivCounter = 0;
var closeImageHeight = 11; // Pixel height of close buttons
var closeImageWidth = 11; // Pixel height of close buttons

function setPadding(obj, padding) {
	var span = obj.getElementsByTagName('SPAN')[0];
	span.style.paddingLeft = padding + 'px';
	span.style.paddingRight = padding + 'px';
}
function showTab(parentId, tabIndex) {
	$("#LoadingPanel").hide();
	var parentId_div = parentId + "_";
	if (!document.getElementById('tabView' + parentId_div + tabIndex)) {
		return;
	}
	if (activeTabIndex[parentId] >= 0) {
		if (activeTabIndex[parentId] == tabIndex) {
			return;
		}

		var obj = document.getElementById('tabTab' + parentId_div
				+ activeTabIndex[parentId]);

		obj.className = 'tabInactive';
		var img = obj.getElementsByTagName('IMG')[0];
		if (img.src.indexOf('tab_') == -1)
			img = obj.getElementsByTagName('IMG')[1];
		img.src = 'images/tab_right_inactive.gif';
		img.height = 26;
		img.style.marginTop = 0;
		document.getElementById('tabView' + parentId_div
				+ activeTabIndex[parentId]).style.display = 'none';
	}

	var thisObj = document.getElementById('tabTab' + parentId_div + tabIndex);

	thisObj.className = 'tabActive';
	var img = thisObj.getElementsByTagName('IMG')[0];
	if (img.src.indexOf('tab_') == -1)
		img = thisObj.getElementsByTagName('IMG')[1];
	img.src = 'images/tab_right_active.gif';
	img.height = 26;
	img.style.marginTop = 0;
	document.getElementById('tabView' + parentId_div + tabIndex).style.display = 'block';
	activeTabIndex[parentId] = tabIndex;

	var parentObj = thisObj.parentNode;
	var aTab = parentObj.getElementsByTagName('DIV')[0];
	countObjects = 0;
	var startPos = 0;
	var previousObjectActive = false;
	while (aTab) {
		if (aTab.tagName == 'DIV') {
			if (previousObjectActive) {
				previousObjectActive = false;
				startPos -= 0;
			}
			if (aTab == thisObj) {
				startPos -= 0;
				previousObjectActive = true;
				setPadding(aTab, textPadding + 0);
			} else {
				setPadding(aTab, textPadding);
			}

			aTab.style.left = startPos + 'px';
			countObjects++;
			startPos += 0;
		}
		aTab = aTab.nextSibling;
	}
	var maxTab = (Math.floor(84 / tabDivCounter)) - 3;
	var spanTitle = [];
	var spanTitlenew = [];
	// alert(maxTab);
	for ( var no = 0; no < tabDivCounter; no++) {
		// alert(tabDivCounter+'|'+maxTab);
		spanTitle[no] = document.getElementById(parentId).getElementsByTagName(
				'SPAN')[no];
		// spanTitlenew[no]=spanTitle[no].title;
		if (spanTitle[no].title.len() > maxTab) {
			spanTitlenew[no] = spanTitle[no].title.sub(maxTab);
			spanTitle[no].innerHTML = spanTitlenew[no] + '...';
		} else {
			spanTitle[no].innerHTML = spanTitle[no].title;
		}
	}
	return;
}

function tabClick() {
	var idArray = this.id.split('_');
	showTab(this.parentNode.parentNode.id, idArray[idArray.length - 1].replace(
			/[^0-9]/gi, ''));

}

function rolloverTab() {
	if (this.className.indexOf('tabInactive') >= 0) {
		this.className = 'inactiveTabOver';

		var img = this.getElementsByTagName('IMG')[0];
		if (img.src.indexOf('tab_') <= 0)
			img = this.getElementsByTagName('IMG')[1];
		img.src = 'images/tab_right_over.gif';
		img.height = 26;

	}

}
function rolloutTab() {
	if (this.className == 'inactiveTabOver') {
		this.className = 'tabInactive';
		var img = this.getElementsByTagName('IMG')[0];
		if (img.src.indexOf('tab_') <= 0)
			img = this.getElementsByTagName('IMG')[1];
		img.src = 'images/tab_right_inactive.gif';
		img.height = 26;

	}

}

function hoverTabViewCloseButton() {
	this.src = this.src.replace('close.gif', 'close_over.gif');

}

function stopHoverTabViewCloseButton() {
	this.src = this.src.replace('close_over.gif', 'close.gif');
}

function initTabs(mainContainerID, tabTitles, activeTab, width, height,
		closeButtonArray, additionalTab) {
	var maxTab;
	var divCounter = 0;
	if (!closeButtonArray)
		closeButtonArray = new Array();

	if (!additionalTab || additionalTab == 'undefined') {
		mainTabObj[mainContainerID] = document.getElementById(mainContainerID);
		width = width + '';
		if (width.indexOf('%') < 0)
			width = width + 'px';
		mainTabObj[mainContainerID].style.width = width;
		if (height != 0) {
			height = height + '';
			if (height.length > 0) {
				if (height.indexOf('%') < 0)
					height = height + 'px';
				mainTabObj[mainContainerID].style.height = height;
			}

			tabViewHeight[mainContainerID] = height;
		} else if (height == 0) {
			// alert(document.getElementById(mainContainerID).offsetHeight);
			tabViewHeight[mainContainerID] = document
					.getElementById(mainContainerID).style.height;
		}

		var tabDiv = document.createElement('DIV');
		var firstDiv = mainTabObj[mainContainerID].getElementsByTagName('DIV')[0];

		mainTabObj[mainContainerID].insertBefore(tabDiv, firstDiv);
		tabDiv.className = 'mainTabPane';
		tabView_countTabs[mainContainerID] = 0;

		var dataDiv = document.createElement('DIV');
		dataDiv.className = 'tabinfo';

	} else {
		var tabDiv = mainTabObj[mainContainerID].getElementsByTagName('DIV')[0];
		var firstDiv = mainTabObj[mainContainerID].getElementsByTagName('DIV')[1];
		height = tabViewHeight[mainContainerID];
		activeTab = tabView_countTabs[mainContainerID];

	}
	maxTab = Math.floor(84 / tabDivCounter) - 3;
	// alert(tabTitles.length);
	for ( var no = 0; no < tabTitles.length; no++) {
		var aTab = document.createElement('DIV');
		aTab.id = 'tabTab' + mainContainerID + "_"
				+ (no + tabView_countTabs[mainContainerID]);
		aTab.onmouseover = rolloverTab;
		aTab.onmouseout = rolloutTab;
		aTab.onclick = tabClick;
		aTab.className = 'tabInactive';
		tabDiv.appendChild(aTab);
		var span = document.createElement('SPAN');
		span.title = tabTitles[no];
		span.innerHTML = tabTitles[no];
		span.style.marginRight = "5px";
		// span.innerHTML = tabTitles[no];
		// var a = tabTitles[no];
		// if (a.len() > maxTab) {
		// tabTitles[no] = a.sub(maxTab);
		// span.innerHTML = tabTitles[no] + '...';
		// } else {
		// span.innerHTML = tabTitles[no];
		// }

		span.style.position = 'relative';
		aTab.appendChild(span);

		if (closeButtonArray[no]) {
			var closeButton = document.createElement('IMG');
			closeButton.src = 'images/close.gif';
			closeButton.alt = '关闭此操作标签';
			closeButton.height = closeImageHeight + 'px';
			closeButton.width = closeImageHeight + 'px';
			closeButton.setAttribute('height', closeImageHeight);
			closeButton.setAttribute('width', closeImageHeight);
			closeButton.style.position = 'absolute';
			closeButton.style.top = '2px';
			closeButton.style.right = '2px';
			closeButton.onmouseover = hoverTabViewCloseButton;
			closeButton.onmouseout = stopHoverTabViewCloseButton;

			span.innerHTML = span.innerHTML + '&nbsp;&nbsp;&nbsp;';

			var deleteTxt = span.innerHTML + '';

			closeButton.onclick = function() {
				// alert(this.parentNode.parentNode.id);
				deleteTab(this.parentNode.id);
			}
			aTab.appendChild(closeButton);
		}

		var img = document.createElement('IMG');
		img.valign = 'bottom';
		img.src = 'images/tab_right_inactive.gif';
		// IE5.X FIX
		if ((navigatorVersion && navigatorVersion < 6)
				|| (MSIE && !strictDocType)) {
			img.style.styleFloat = 'none';
			img.style.position = 'relative';
			img.style.top = '4px'
			span.style.paddingTop = '4px';
			aTab.style.cursor = 'hand';
		} // End IE5.x FIX
		aTab.appendChild(img);
	}

	var tabs = mainTabObj[mainContainerID].getElementsByTagName('DIV');
	// alert(tabs.length);
	for ( var no = 0; no < tabs.length; no++) {
		if (tabs[no].className == 'mainTab'
				&& tabs[no].parentNode.id == mainContainerID) {
			if (height.length > 0)
				tabs[no].style.height = height;
			tabs[no].style.display = 'none';
			tabs[no].id = 'tabView' + mainContainerID + "_" + divCounter;
			divCounter++;
			tabDivCounter = divCounter;
		}
	}
	// alert(divCounter);
	tabView_countTabs[mainContainerID] = tabView_countTabs[mainContainerID]
			+ tabTitles.length;

	// alert(tabDivCounter);
	showTab(mainContainerID, activeTab);

	return activeTab;
}

function showAjaxTabContent(ajaxIndex, parentId, tabId) {

	var obj = document.getElementById('tabView' + parentId + '_' + tabId);
	sack(obj, requestForm, requestUrl);

	// var data = ajaxObjects[ajaxIndex].response;
	// if (Sys.firefox) {
	// set_innerHTML(parentId, data);
	// } else {
	// obj.innerHTML = "<xml></xml>"
	// + data.replace(/<script/gi, "<script defer=''");
	// document.getElementById("LoadingPanel").style.display = "none";
	// }

}

function resetTabIds(parentId) {
	var tabTitleCounter = 0;
	var tabContentCounter = 0;

	var divs = mainTabObj[parentId].getElementsByTagName('DIV');
	// alert(divs.length);
	for ( var no = 0; no < divs.length; no++) {
		if (divs[no].className == 'mainTab') {
			divs[no].id = 'tabView' + parentId + '_' + tabTitleCounter;
			tabTitleCounter++;
		}
		if (divs[no].id.indexOf('tabTab') >= 0) {
			divs[no].id = 'tabTab' + parentId + '_' + tabContentCounter;
			tabContentCounter++;
		}

	}

	tabView_countTabs[parentId] = tabContentCounter;
	tabDivCounter = tabContentCounter;
	var maxTab = Math.floor(84 / tabDivCounter) - 3;
	var spanTitle = [];
	var spanTitlenew = [];
	for ( var no = 0; no < tabDivCounter; no++) {
		// alert(tabDivCounter+'|'+maxTab);
		spanTitle[no] = document.getElementById(parentId).getElementsByTagName(
				'SPAN')[no];
		// spanTitlenew[no]=spanTitle[no].title;
		if (spanTitle[no].title.len() > maxTab) {
			spanTitlenew[no] = spanTitle[no].title.sub(maxTab);
			spanTitle[no].innerHTML = spanTitlenew[no] + '...';
		} else {
			spanTitle[no].innerHTML = spanTitle[no].title;
		}
	}

}

function submitDiv(parentId, requestForm, requestUrl) {
	sack(parentId, requestForm, requestUrl);
}

/*function createNewTab(parentId, tabTitle, requestForm, requestUrl, closeButton,
		only) {
	if (only) {
		var index = getTabIndexByTitle(tabTitle);
		if (index == -1) {
			// alert('不重复');
			var pI = parentId;
			var tT = tabTitle;
			var rF = requestForm;
			var rU = requestUrl;
			var cB = closeButton;
			// var sI = spanId;
			createNewTab(pI, tT, rF, rU, cB, false);

		} else if (index != -1) {
			// alert('重复');
			showTab(index[0], index[1]);
		}
	} else {
		// alert('111');
		if (tabTitle != '') {
			if (tabView_countTabs[parentId] >= tabView_maxNumberOfTabs)
				return; // Maximum number of tabs reached - return
			var div = document.createElement('DIV');
			div.className = 'mainTab';
			mainTabObj[parentId].appendChild(div);

			var tabId = initTabs(parentId, Array(tabTitle), 0, '', '',
					Array(closeButton), true);
		} else {
			var tabId = tabDivCounter;
		}
		if (requestUrl) {

			var obj = "tabView" + parentId + "_" + tabId;
			// alert(obj);
			sack(obj, requestForm, requestUrl);

		}
	}
}*/

function getTabIndexByTitle(tabTitle) {
	var regExp = new RegExp("(.*?)&nbsp.*$", "gi");
	tabTitle = tabTitle.replace(regExp, '$1');
	for ( var prop in mainTabObj) {
		var divs = mainTabObj[prop].getElementsByTagName('DIV');
		for ( var no = 0; no < divs.length; no++) {
			if (divs[no].id.indexOf('tabTab') >= 0) {
				var span = divs[no].getElementsByTagName('SPAN')[0];
				var regExp2 = new RegExp("(.*?)&nbsp.*$", "gi");
				var spanTitle = span.title.replace(regExp2, '$1');
				// var spanTitle = span.innerHTML.replace(regExp2, '$1');

				if (spanTitle == tabTitle) {

					var tmpId = divs[no].id.split('_');
					return Array(prop, tmpId[tmpId.length - 1].replace(
							/[^0-9]/g, '') / 1);
				}
			}
		}
	}

	return -1;

}

function addAjaxContentToTab(tabTitle, tabContentUrl) {
	var index = getTabIndexByTitle(tabTitle);
	if (index != -1) {
		var ajaxIndex = ajaxObjects.length;

		tabId = index[1];
		parentId = index[0];

		ajaxObjects[ajaxIndex] = new sack();
		ajaxObjects[ajaxIndex].requestFile = tabContentUrl; // Specifying which
		// file to get

		ajaxObjects[ajaxIndex].onCompletion = function() {
			showAjaxTabContent(ajaxIndex, parentId, tabId);
		}; // Specify function that will be executed after file has been found
		ajaxObjects[ajaxIndex].runAJAX(); // Execute AJAX function

	}
}

function deleteTab(objId) {
	if (!objId) {
		for ( var prop in mainTabObj) {
			// alert(activeTabIndex[prop]);
			var obj = document.getElementById('tabTab' + prop + '_'
					+ activeTabIndex[prop]);
			var id = obj.parentNode.parentNode.id;
			obj.parentNode.removeChild(obj);
			var obj2 = document.getElementById('tabView' + prop + '_'
					+ activeTabIndex[prop]);
			obj2.parentNode.removeChild(obj2);
			resetTabIds(prop);
			activeTabIndex[prop] = -1;
			showTab(prop, '0');

		}
	} else if (objId) {

		for ( var prop in mainTabObj) {

			var tmpId = objId.split('_');
			var no = tmpId[tmpId.length - 1].replace(/[^0-9]/g, '') / 1;
			var obj = document.getElementById('tabTab' + prop + '_' + no);
			// alert("当前tab:" + activeTabIndex[prop] + " | 操作tab:" + no);
			var id = obj.parentNode.parentNode.id;
			obj.parentNode.removeChild(obj);
			var obj2 = document.getElementById('tabView' + prop + '_' + no);
			obj2.parentNode.removeChild(obj2);
			var addiframe = document.getElementById("addiframe");
			if(addiframe){
				obj2.removeChild(addiframe);
			}
			if (no < activeTabIndex[prop]) {
				resetTabIds(prop);
				activeTabIndex[prop] = activeTabIndex[prop] - 1;
				showTab(prop, activeTabIndex[prop]);
				// alert('<');
			} else if ((no == activeTabIndex[prop])
					|| activeTabIndex[prop] == 0) {
				// alert(prop);
				resetTabIds(prop);
				activeTabIndex[prop] = -1;
				showTab(prop, '0');
				// alert('=');

			} else if (no > activeTabIndex[prop]) {
				resetTabIds(prop);
				// activeTabIndex[prop] = activeTabIndex[prop] - 1;
				showTab(prop, activeTabIndex[prop]);
				// alert('>');
			}
		}
	}
	tabDivCounter--;
}
function deleteTabName(tabLabel, tabIndex, parentId) {
	// alert(this.parentNode.parentNode.id);
	if (tabLabel) {
		var index = getTabIndexByTitle(tabLabel);
		// alert(index);
		if (index != 0) {
			// alert("1");
			deleteTab(false, index[1], index[0]);
			// index = 0;
			// alert(index);
		}

	} else if (tabIndex != 0) {
		// alert("2");
		// alert(tabView_countTabs[parentId]);
		if (activeTabIndex[parentId] == 0) {
			// alert('0');
			if (document.getElementById('tabTab' + parentId + '_' + tabIndex)) {
				var obj = document.getElementById('tabTab' + parentId + '_'
						+ tabIndex);
				var id = obj.parentNode.parentNode.id;
				obj.parentNode.removeChild(obj);
				var obj2 = document.getElementById('tabView' + parentId + '_'
						+ tabIndex);
				obj2.parentNode.removeChild(obj2);
				resetTabIds(parentId);
				activeTabIndex[parentId] = -1;
				showTab(parentId, '0');
			}

		} else {
			if (tabView_countTabs[parentId] > 2) {
				// alert(tabView_countTabs[parentId]);
				if (document.getElementById('tabTab' + parentId + '_'
						+ tabIndex)) {
					var obj = document.getElementById('tabTab' + parentId + '_'
							+ tabIndex);
					var id = obj.parentNode.id;
					// alert(id);
					obj.parentNode.removeChild(obj);
					var obj2 = document.getElementById('tabView' + parentId
							+ '_' + tabIndex);
					obj2.parentNode.removeChild(obj2);
					resetTabIds(parentId);
					activeTabIndex[parentId] = -1;
					showTab(parentId, '0');

				}
			} else if (tabView_countTabs[parentId] = 2) {
				// alert('2');
				if (document.getElementById('tabTab' + parentId + '_'
						+ tabIndex)) {
					var obj = document.getElementById('tabTab' + parentId + '_'
							+ tabIndex);
					var id = obj.parentNode.parentNode.id;
					obj.parentNode.removeChild(obj);
					var obj2 = document.getElementById('tabView' + parentId
							+ '_' + tabIndex);
					obj2.parentNode.removeChild(obj2);
					resetTabIds(parentId);
					activeTabIndex[parentId] = -1;
					showTab(parentId, '0');
				}
			}
		}

	}

}

// 0 means disabled; 1 means enabled;
var popupStatus = 0;

// loading popup with jQuery magic!
function loadPopup() {
	// document.getElementsByTagName("SELECT");
	// loads popup only if it is disabled
	if (popupStatus == 0) {
		$("#backgroundPopup").css( {
			"opacity" :"0.2"
		});
		$("#backgroundPopup").fadeIn("fast");
		$("#popupContact").fadeIn("fast");
		// for (i = 0; i < 10; i++) {
		// document.getElementsByTagName("SELECT")[i].disabled = "false";
		// }
		popupStatus = 1;
	}

}
var selectDisabled = [];
// disabling popup with jQuery magic!
function disablePopup() {
	// disables popup only if it is enabled
	if (popupStatus == 1) {
		$("#backgroundPopup").fadeOut("slow");
		$("#popupContact").fadeOut("slow");
		$("#refdiv").fadeOut("slow");
		popupStatus = 0;
	}
	document.getElementById('go').style.display = "none";
	document.getElementById('back').style.display = "none";
	var allselect = document.getElementsByTagName("SELECT");

	for ( var i = 0; i < selectDisabled.length; i++) {

		allselect[selectDisabled[i]].disabled = false;
		allselect[selectDisabled[i]].style.backgroundColor = "#fff";
	}

}

// centering popup
function centerPopup() {
	var windowHeight;
	// request data for centering
	var windowWidth;
	if (window.screen.width > document.body.scrollWidth) {
		windowWidth = window.screen.width;
	} else {
		windowWidth = document.body.scrollWidth;

	}
	if (window.screen.height > document.body.scrollHeight) {
		windowHeight = window.screen.height;
	} else {
		windowHeight = document.body.scrollHeight;

	}
	var lookHeight = document.documentElement.clientHeight;
	var popupHeight = $("#popupContact").height();
	var popupWidth = $("#popupContact").width();
	// centering
	$("#popupContact").css( {
		"position" :"absolute",
		"top" :lookHeight / 2 - popupHeight / 2 - 50,
		"left" :windowWidth / 2 - popupWidth / 2
	});
	// only need force for IE6
	
	$("#refdiv").css( {
		"position" :"absolute",
		"top" :lookHeight / 2 - popupHeight / 2 - 50,
		"left" :windowWidth / 2 - popupWidth / 2
	});

	$("#backgroundPopup").css( {
		"width" :windowWidth,
		"height" :windowHeight
	});

	var allselect = document.getElementsByTagName("SELECT");
	var j = 0;
	for ( var i = 0; i < allselect.length; i++) {
		if (!allselect[i].disabled) {
			selectDisabled[j] = i;
			j++;
			allselect[i].disabled = true;
			allselect[i].style.backgroundColor = "#cccccc";
		}

	}

}

var imgObj;
var changeObj;
var imgAction;
var imgForm;
var delObj;
// var value;
function imgExp() {
	var imgUrl = imgObj.src;
	value = imgUrl.indexOf("no_nor.gif");
	return value;
}

// // CONTROLLING EVENTS IN jQuery
function buttonTrue() {
	$("#popupContactClose").click( function() {
		disablePopup();
	});

	$("#cancel").click( function() {
		disablePopup();
	});
	$("#confirm").click( function() {
		disablePopup();
	});
	$("#backgroundPopup").click( function() {
		disablePopup();
	});

	
}



function submitState() {
	document.getElementById('contactText').innerHTML = "<img src='images/loading.gif' /> 系统通信中,请稍候..."
	document.getElementById('go').style.display = "none";
	document.getElementById('back').style.display = "block";
	var requestUrl = imgAction;
	var requestForm = '';
	// alert(requestUrl);
	var submitEnd = new change(requestForm, requestUrl);
	// alert(submitEnd.response);
	submitEnd.onCompletion = function() {
		var dataOld = submitEnd.response;
		var data;
		var endno = dataOld.indexOf('<!');
		if (endno == -1) {
			data = dataOld;
		} else {
			data = dataOld.slice(0, endno);
		}
		var state = imgExp();
		var imgUrl = imgObj.src;
		var imgAlt = changeObj.alt;
		// var imgTitle = changeObj.title;
		var changeUrl = changeObj.src;
		// alert(imgAlt);
		var myArray = data.split("|");
		if (myArray[1] == 'undefined') {
			myArray[1] = "";
		}
		if (myArray[0] == 'true') {
			// alert(imgUrl);
			if (state == -1) {
				imgUrl = imgUrl.replace(/nor.gif/, "no_nor.gif");
				imgObj.src = imgUrl;
				changeUrl = changeUrl.replace(/stop.gif/, "open.gif");
				changeObj.src = changeUrl;
				imgAlt = imgAlt.replace(/停用/, "启用");
				changeObj.alt = imgAlt;
				changeObj.title = imgAlt;
				// alert(imgUrl);
			} else {
				imgUrl = imgUrl.replace(/no_nor.gif/, "nor.gif");
				imgObj.src = imgUrl;
				changeUrl = changeUrl.replace(/open.gif/, "stop.gif");
				changeObj.src = changeUrl;
				imgAlt = imgAlt.replace(/启用/, "停用");
				changeObj.alt = imgAlt;
				changeObj.title = imgAlt;
			}
			document.getElementById('contactText').innerHTML = "<span class='green'>操作成功!"
					+ myArray[1] + "</span>";
		} else {
			document.getElementById('contactText').innerHTML = "<span class='red'>操作失败!"
					+ myArray[1] + "</span>";
		}
	}
	document.getElementById('go').style.display = "none";
	document.getElementById('back').style.display = "block";
	submitEnd.runAJAX();

}
function changeState(obj, id, Action) {
	buttonTrue();
	// alert(obj.alt);
	document.getElementById('go').style.display = "block";
	document.getElementById('back').style.display = "none";
	document.getElementById('submit').onclick = function() {
		submitState();
	}
	centerPopup();
	loadPopup();
	// for (i = 0; i < 10; i++) {
	// document.select[i].style.display = 'none';
	// }
	imgObj = obj.parentNode.parentNode.getElementsByTagName('IMG')[0];

	changeObj = obj;
	var idObj = obj.parentNode.parentNode.getElementsByTagName('TD')[id].innerHTML;

	var title = obj.parentNode.parentNode.parentNode.parentNode
			.getElementsByTagName('THEAD')[0].getElementsByTagName('TR')[0]
			.getElementsByTagName('TD')[id].innerHTML;
	// alert(title);
	var state = imgExp();
	// alert(idObj);
	if (state == -1) {
		document.getElementById('contactText').innerHTML = "请确定将 <strong>"
				+ title + "</strong> 为 <strong>" + idObj
				+ " </strong>的状态调整为<span class='red'>[停用]</span>";
	} else {
		document.getElementById('contactText').innerHTML = "请确定将 <strong>"
				+ title + " </strong>为 <strong>" + idObj
				+ " </strong>的状态调整为<span class='green'>[启用]</span>";
	}
	imgAction = Action;
}
function changeStateNeedImgId(obj, id, Action, imgObjId) {
	buttonTrue();
	// alert(obj.alt);
	document.getElementById('go').style.display = "block";
	document.getElementById('back').style.display = "none";
	document.getElementById('submit').onclick = function() {
		submitState();
	}
	centerPopup();
	loadPopup();
	// for (i = 0; i < 10; i++) {
	// document.select[i].style.display = 'none';
	// }
	
	imgObj = imgObjId!="undefined"?document.getElementById(imgObjId):obj.parentNode.parentNode.getElementsByTagName('IMG')[0];

	changeObj = obj;
	var idObj = obj.parentNode.parentNode.getElementsByTagName('TD')[id].innerHTML;

	var title = obj.parentNode.parentNode.parentNode.parentNode
			.getElementsByTagName('THEAD')[0].getElementsByTagName('TR')[0]
			.getElementsByTagName('TD')[id].innerHTML;
	// alert(title);
	var state = imgExp();
	// alert(idObj);
	if (state == -1) {
		document.getElementById('contactText').innerHTML = "请确定将 <strong>"
				+ title + "</strong> 为 <strong>" + idObj
				+ " </strong>的状态调整为<span class='red'>[停用]</span>";
	} else {
		document.getElementById('contactText').innerHTML = "请确定将 <strong>"
				+ title + " </strong>为 <strong>" + idObj
				+ " </strong>的状态调整为<span class='green'>[启用]</span>";
	}
	imgAction = Action;
}
// 还款提醒
function submitStopState() {
	document.getElementById('contactText').innerHTML = "<img src='images/loading.gif' /> 系统通信中,请稍候..."
	document.getElementById('go').style.display = "none";
	document.getElementById('back').style.display = "block";
	var requestUrl = imgAction;
	var requestForm = '';
	// alert(requestUrl);
	var submitEnd = new change(requestForm, requestUrl);
	// alert(submitEnd.response);
	submitEnd.onCompletion = function() {
		var dataOld = submitEnd.response;
		var data;
		var endno = dataOld.indexOf('<!');
		if (endno == -1) {
			data = dataOld;
		} else {
			data = dataOld.slice(0, endno);
		}

		var imgUrl = imgObj.src;
		// alert(imgAlt);
		var myArray = data.split("|");
		if (myArray[1] == 'undefined') {
			myArray[1] = "";
		}
		if (myArray[0] == 'true') {
			// alert(imgUrl);
			delObj.parentNode.removeChild(delObj);
			imgUrl = imgUrl.replace(/nor.gif/, "no_nor.gif");
			imgObj.src = imgUrl;
			document.getElementById('contactText').innerHTML = "<span class='green'>操作成功!"
					+ myArray[1] + "</span>";
		} else {
			document.getElementById('contactText').innerHTML = "<span class='red'>操作失败!"
					+ myArray[1] + "</span>";
		}
	}
	document.getElementById('go').style.display = "none";
	document.getElementById('back').style.display = "block";
	submitEnd.runAJAX();
}
function changeToStopState(obj, id, Action) {
	buttonTrue();
	document.getElementById('go').style.display = "block";
	document.getElementById('back').style.display = "none";
	document.getElementById('submit').onclick = function() {
		submitStopState();
	}
	centerPopup();
	loadPopup();
	delObj = obj;
	imgObj = obj.parentNode.parentNode.getElementsByTagName('IMG')[0];
	var idObj = obj.parentNode.parentNode.getElementsByTagName('TD')[id].innerHTML;

	var title = obj.parentNode.parentNode.parentNode.parentNode
			.getElementsByTagName('THEAD')[0].getElementsByTagName('TR')[0]
			.getElementsByTagName('TD')[id].innerHTML;

	document.getElementById('contactText').innerHTML = "请确定将 <strong>"
				+ title + "</strong> 为 <strong>" + idObj
				+ " </strong>的记录状态调整为<span class='red'>[停用]</span>";

	imgAction = Action;
}


function refreshMemory(obj, id, Action) {
	buttonTrue();
	// alert(obj.alt);
	document.getElementById('go').style.display = "block";
	document.getElementById('back').style.display = "none";
	document.getElementById('submit').onclick = function() {
		submitState();
	}
	centerPopup();
	loadPopup();
	// for (i = 0; i < 10; i++) {
	// document.select[i].style.display = 'none';
	// }
	imgObj = obj.parentNode.parentNode.getElementsByTagName('IMG')[0];
	changeObj = obj;
	var idObj = obj.parentNode.parentNode.getElementsByTagName('TD')[id].innerHTML;

	var title = obj.parentNode.parentNode.parentNode.parentNode
			.getElementsByTagName('THEAD')[0].getElementsByTagName('TR')[0]
			.getElementsByTagName('TD')[id].innerHTML;
	// alert(title);

	// alert(idObj);

		document.getElementById('contactText').innerHTML = "请确定更新 <strong>"+idObj+ " </strong>表内存";

	imgAction = Action;
}

function refreshFrontier(obj, id, Action) {
	buttonTrue();
	// alert(obj.alt);
	document.getElementById('go').style.display = "block";
	document.getElementById('back').style.display = "none";
	document.getElementById('submit').onclick = function() {
		submitState();
	}
	centerPopup();
	loadPopup();
	// for (i = 0; i < 10; i++) {
	// document.select[i].style.display = 'none';
	// }
	imgObj = obj.parentNode.parentNode.getElementsByTagName('IMG')[0];
	changeObj = obj;
	var idObj = obj.parentNode.parentNode.getElementsByTagName('TD')[id].innerHTML;

	var title = obj.parentNode.parentNode.parentNode.parentNode
			.getElementsByTagName('THEAD')[0].getElementsByTagName('TR')[0]
			.getElementsByTagName('TD')[id].innerHTML;
	// alert(title);

	// alert(idObj);

		document.getElementById('contactText').innerHTML = "请确定 <strong>"+idObj+ " </strong>动态加载";

	imgAction = Action;
}


function reUpLoadFrontier(obj, id, Action) {
	buttonTrue();
	// alert(obj.alt);
	document.getElementById('go').style.display = "block";
	document.getElementById('back').style.display = "none";
	document.getElementById('submit').onclick = function() {
		submitState();
	}
	centerPopup();
	loadPopup();
	// for (i = 0; i < 10; i++) {
	// document.select[i].style.display = 'none';
	// }
	imgObj = obj.parentNode.parentNode.getElementsByTagName('IMG')[0];
	changeObj = obj;
	var idObj = obj.parentNode.parentNode.getElementsByTagName('TD')[id].innerHTML;

	var title = obj.parentNode.parentNode.parentNode.parentNode
			.getElementsByTagName('THEAD')[0].getElementsByTagName('TR')[0]
			.getElementsByTagName('TD')[id].innerHTML;
	// alert(title);

	// alert(idObj);

		document.getElementById('contactText').innerHTML = "请确定 <strong>"+idObj+ " </strong>重新加载";

	imgAction = Action;
}

function refreshMemoryAll(obj, id, Action) {
	buttonTrue();
	// alert(obj.alt);
	document.getElementById('go').style.display = "block";
	document.getElementById('back').style.display = "none";
	document.getElementById('submit').onclick = function() {
		editFormInfo(id, Action);
	}
	centerPopup();
	loadPopup();
	changeObj = obj;
		document.getElementById('contactText').innerHTML = "是否确定更新内存?";
	imgAction = Action;
	imgForm=id;

}

//更新应用系统服务列表
function updateAppService(obj, id, Action,appSysInfo) {
	buttonTrue();
	// alert(obj.alt);
	document.getElementById('go').style.display = "block";
	document.getElementById('back').style.display = "none";
	document.getElementById('submit').onclick = function() {
		editFormInfo(id, Action);
	}
	centerPopup();
	loadPopup();
	changeObj = obj;
		document.getElementById('contactText').innerHTML = "是否确定更新应用系统编号为:"+appSysInfo+" 的服务编号?";
	imgAction = Action;
	imgForm=id;

}

function submitRedoFile() {
	document.getElementById('contactText').innerHTML = "<img src='images/loading.gif' /> 系统通信中,请稍候..."
	document.getElementById('go').style.display = "none";
	document.getElementById('back').style.display = "block";
	var requestUrl = imgAction;
	var requestForm = '';
	// alert(requestUrl);
	var submitEnd = new change(requestForm, requestUrl);
	// alert(submitEnd.response);
	submitEnd.onCompletion = function() {
		var dataOld = submitEnd.response;
		var data;
		var endno = dataOld.indexOf('<!');
		if (endno == -1) {
			data = dataOld;
		} else {
			data = dataOld.slice(0, endno);
		}
		// alert(imgAlt);
		var myArray = data.split("|");
		if (myArray[1] == 'undefined') {
			myArray[1] = "";
		}
		if (myArray[0] == 'true') {
			
			document.getElementById('contactText').innerHTML = "<span class='green'>操作成功!请刷新此页面"
					+ myArray[1] + "</span>";
		} else {
			if (myArray[1] == '') {
				myArray[1] = "通讯超时,请稍后操作";
			}
			document.getElementById('contactText').innerHTML = "<span class='red'>操作失败!"
					+ myArray[1] + "</span>";
		}
	}
	document.getElementById('go').style.display = "none";
	document.getElementById('back').style.display = "block";
	submitEnd.runAJAX();

}



function redoFile(obj, id, Action,text) {
	buttonTrue();
	// alert(obj.alt);
	document.getElementById('go').style.display = "block";
	document.getElementById('back').style.display = "none";
	document.getElementById('submit').onclick = function() {
		submitRedoFile();
	}
	centerPopup();
	loadPopup();
	// for (i = 0; i < 10; i++) {
	// document.select[i].style.display = 'none';
	// }
	changeObj = obj;

	// alert(title);

	// alert(idObj);

		document.getElementById('contactText').innerHTML = text;

	imgAction = Action;
}


function delTr() {
	document.getElementById('contactText').innerHTML = "<img src='images/loading.gif' /> 系统通信中,请稍候..."
	document.getElementById('go').style.display = "none";
	document.getElementById('back').style.display = "block";
	var requestUrl = imgAction;
	var requestForm = '';
	// alert(requestUrl);
	var submitEnd = new change(requestForm, requestUrl);
	// alert(submitEnd.response);
	submitEnd.onCompletion = function() {
		var dataOld = submitEnd.response;
		var data;
		var endno = dataOld.indexOf('<!');
		if (endno == -1) {
			data = dataOld;
		} else {
			data = dataOld.slice(0, endno);
		}

		// var value = data.indexOf("失败");
		// alert(data);
		var myArray = data.split("|");
		if (myArray[1] == 'undefined') {
			myArray[1] = "";
		}
		if (myArray[0] == 'true') {
			delObj.parentNode.removeChild(delObj);
			document.getElementById('contactText').innerHTML = "<span class='green'>删除成功!"
					+ myArray[1] + "</span>";
		} else {

			document.getElementById('contactText').innerHTML = "<span class='red'>删除失败!"
					+ myArray[1] + "</span>";

		}

	}
	document.getElementById('go').style.display = "none";
	document.getElementById('back').style.display = "block"; 
	submitEnd.runAJAX();
}

function delState(obj, id, Action) {
	buttonTrue();
	document.getElementById('go').style.display = "block";
	document.getElementById('back').style.display = "none";
	document.getElementById('submit').onclick = function() {
		delTr();
	}
	centerPopup();
	loadPopup();
	delObj = obj.parentNode.parentNode;
	var idObj = obj.parentNode.parentNode.getElementsByTagName('TD')[id].innerHTML;

	var title = obj.parentNode.parentNode.parentNode.parentNode
			.getElementsByTagName('THEAD')[0].getElementsByTagName('TR')[0]
			.getElementsByTagName('TD')[id].innerHTML;
	document.getElementById('contactText').innerHTML = "请确定删除记录中 <strong>"
			+ title + "</strong> 为 <strong>" + idObj + "</strong>";
	imgAction = Action;
}

//function alert(alertTxt) {
//	buttonTrue();
//	document.getElementById('contactText').innerHTML = alertTxt;
//	document.getElementById('back').style.display = "block";
//	centerPopup();
//	loadPopup();
//}

function pageChange(page, pageId) {
	var currentpageDiv = document.getElementById('currentpage' + pageId);
	var controlsDiv = currentpageDiv.parentNode.parentNode;
	// alert(controlsDiv.getElementsByTagName('DIV')[0].getElementsByTagName('SELECT')[0].type);
	var option = [];
	for ( var i = 0; i < 5; i++) {
		option[i] = controlsDiv.getElementsByTagName('DIV')[0]
				.getElementsByTagName('SELECT')[0]
				.getElementsByTagName('OPTION')[i];
		// alert(option[1].value);
		if (option[i].value == page) {
			option[i].selected = true;
		}
	}
}
function slideBox(divObj, h1Obj) {
	var hObj = document.getElementById(h1Obj);
	if (hObj.className == "open") {
		$("#" + divObj)
				.slideUp(
						"normal",
						function() {
							hObj.title = "展开";
							hObj.parentNode.getElementsByTagName('DIV')[0].className = 'sf_close';
							hObj.className = "close";
						});
		return;
	}
	if (hObj.className == "close") {
		$("#" + divObj)
				.slideDown(
						"normal",
						function() {
							hObj.title = "收起";
							hObj.parentNode.getElementsByTagName('DIV')[0].className = 'sf_open';
							hObj.className = "open";
						});
		return;
	}
}

//add by zhang.xiyun on 10-15

function submitBillInfo(requestForm, requestUrl) {
	document.getElementById('contactText').innerHTML = "<img src='images/loading.gif' /> 出账信息正在提交,请稍候..."
	document.getElementById('go').style.display = "none";
	document.getElementById('back').style.display = "block";
    var id=requestForm;
    var url=requestUrl;
    //alert('222');
	editInfo(id, url);
//	submitEnd.onCompletion = function() {
//		var dataOld = submitEnd.response;
//		alert(submitEnd.response);
//		var data;
//		var endno = dataOld.indexOf('<!');
//		if (endno == -1) {
//		data = dataOld;
//		} else {
//			data = dataOld.slice(0, endno);
//		}
//
//		var myArray = data.split("|");
//		if (myArray[1] == 'undefined') {
//			myArray[1] = "";
//		}
//		if (myArray[0] == 'true') {
//			document.getElementById('contactText').innerHTML = "<span class='green'>操作成功!"
//					+ myArray[1] + "</span>";
//		} else {
//			document.getElementById('contactText').innerHTML = "<span class='red'>操作失败!"
//					+ myArray[1] + "</span>";
//			//alert(myArray[1]);
//		}
//	}

	//submitEnd.runAJAX();

}
function changeBillInfo(id, Url) {
	buttonTrue();
	//alert("3344");
	document.getElementById('go').style.display = "block";
	document.getElementById('back').style.display = "none";
	document.getElementById('submit').onclick = function() {
		submitBillInfo(id,Url);
	}
	centerPopup();
	loadPopup();
	document.getElementById('contactText').innerHTML = "请确定提交编辑";
}


//收缩表格
function divCtrl(ctrlDiv,changeDiv,name,divId,formId,formUrl,Or,obj){
	//alert(eval(obj).divStat);
	objCtrl=eval(obj);
	if(objCtrl.divStat==0){
		if(objCtrl.divData==0){
			submitDiv(divId,formId,formUrl);
			document.getElementById(changeDiv).innerHTML="&nbsp;&nbsp<span class = 'glyphicon glyphicon-chevron-up'></span>&nbsp;&nbsp收起"+name;
			document.getElementById(changeDiv).className="divLineOpen";
			objCtrl.divStat=1;
			objCtrl.divData=1;
		return;
			}
	else if(objCtrl.divData==1){
	$("#"+ctrlDiv).slideDown("fast",function(){
		document.getElementById(changeDiv).innerHTML="&nbsp;&nbsp<span class = 'glyphicon glyphicon-chevron-up'></span>&nbsp;&nbsp收起"+name;
		document.getElementById(changeDiv).className="divLineOpen";
		objCtrl.divStat=1;
		}); 
	return;
	}
		}
	if(objCtrl.divStat==1){
		$("#"+ctrlDiv).slideUp("fast",function(){
			document.getElementById(changeDiv).innerHTML="&nbsp;&nbsp<span class = 'glyphicon glyphicon-chevron-down'></span>&nbsp;&nbsp展开"+name;
			document.getElementById(changeDiv).className="divLineOpen";
			objCtrl.divStat=0;
			if(Or==1){
				objCtrl.divData=0;
				}
		});
		return; 
	}
}

// 退款处理
function refundProcess(obj, id, Action) {
	buttonTrue();
	document.getElementById('go').style.display = "block";
	document.getElementById('back').style.display = "none";
	document.getElementById('submit').onclick = function() {
		submitRefund();
	}
	centerPopup();
	loadPopup();
	delObj = obj;
	var idObj = obj.parentNode.parentNode.getElementsByTagName('TD')[id].innerHTML;

	var title = obj.parentNode.parentNode.parentNode.parentNode
			.getElementsByTagName('THEAD')[0].getElementsByTagName('TR')[0]
			.getElementsByTagName('TD')[id].innerHTML;
	document.getElementById('contactText').innerHTML = "请确定为 <strong>"
			+ title + "</strong> 为 <strong>" + idObj + "</strong>的记录发起退款";
	imgAction = Action;
}

function submitRefund() {
	document.getElementById('contactText').innerHTML = "<img src='images/loading.gif' /> 系统通信中,请稍候..."
	document.getElementById('go').style.display = "none";
	document.getElementById('back').style.display = "block";
	var requestUrl = imgAction;
	var requestForm = '';
	// alert(requestUrl);
	var submitEnd = new change(requestForm, requestUrl);
	// alert(submitEnd.response);
	submitEnd.onCompletion = function() {
		var dataOld = submitEnd.response;
		var data;
		var endno = dataOld.indexOf('<!');
		if (endno == -1) {
			data = dataOld;
		} else {
			data = dataOld.slice(0, endno);
		}

		// var value = data.indexOf("失败");
		// alert(data);
		var myArray = data.split("|");
		if (myArray[1] == 'undefined') {
			myArray[1] = "";
		}
		if (myArray[0] == 'true') {
			delObj.parentNode.removeChild(delObj);
			document.getElementById('contactText').innerHTML = "<span class='green'>退款成功!"
					+ myArray[1] + "</span>";
		} else {

			document.getElementById('contactText').innerHTML = "<span class='red'>退款失败!"
					+ myArray[1] + "</span>";

		}

	}
	document.getElementById('go').style.display = "none";
	document.getElementById('back').style.display = "block"; 
	submitEnd.runAJAX();
}

//退款数据复核
function delRefundTr() {
	document.getElementById('contactText').innerHTML = "<img src='images/loading.gif' /> 系统通信中,请稍候..."
	document.getElementById('go').style.display = "none";
	document.getElementById('back').style.display = "block";
	var requestUrl = imgAction;
	var requestForm = '';
	// alert(requestUrl);
	var submitEnd = new change(requestForm, requestUrl);
	// alert(submitEnd.response);
	submitEnd.onCompletion = function() {
		var dataOld = submitEnd.response;
		var data;
		var endno = dataOld.indexOf('<!');
		if (endno == -1) {
			data = dataOld;
		} else {
			data = dataOld.slice(0, endno);
		}

		// var value = data.indexOf("失败");
		// alert(data);
		var myArray = data.split("|");
		if (myArray[1] == 'undefined') {
			myArray[1] = "";
		}
		if (myArray[0] == 'true') {
			delObj.parentNode.removeChild(delObj);
			document.getElementById('contactText').innerHTML = "<span class='green'>操作成功!"
					+ myArray[1] + "</span>";
		} else {
			delObj.parentNode.removeChild(delObj);
			document.getElementById('contactText').innerHTML = "<span class='red'>操作失败!"
					+ myArray[1] + "</span>";
		}

	}
	document.getElementById('go').style.display = "none";
	document.getElementById('back').style.display = "block"; 
	submitEnd.runAJAX();
}

function refundConfirm(obj, id, tem, Action) {
	buttonTrue();
	document.getElementById('go').style.display = "block";
	document.getElementById('back').style.display = "none";
	document.getElementById('submit').onclick = function() {
		delRefundTr();
	}
	centerPopup();
	loadPopup();
	delObj = obj.parentNode.parentNode;
	var idObj = obj.parentNode.parentNode.getElementsByTagName('TD')[id].innerHTML;

	var title = obj.parentNode.parentNode.parentNode.parentNode
			.getElementsByTagName('THEAD')[0].getElementsByTagName('TR')[0]
			.getElementsByTagName('TD')[id].innerHTML;
	if(tem == '0') {
		document.getElementById('contactText').innerHTML = "请确定复核通过 <strong>"
			+ title + "</strong> 为 <strong>" + idObj + "</strong>的退款数据 ";
	}
	if(tem == '1') {
		document.getElementById('contactText').innerHTML = "请确定复核未通过 <strong>"
			+ title + "</strong> 为 <strong>" + idObj + "</strong>的退款数据";
	}
	imgAction = Action;
}

//CP对账启动
function delReconBtn() {
	document.getElementById('contactText').innerHTML = "<img src='images/loading.gif' /> 系统通信中,请稍候..."
	document.getElementById('go').style.display = "none";
	document.getElementById('back').style.display = "block";
	var requestUrl = imgAction;
	var requestForm = '';
	var submitEnd = new change(requestForm, requestUrl);
	submitEnd.onCompletion = function() {
		var dataOld = submitEnd.response;
		var data;
		var endno = dataOld.indexOf('<!');
		if (endno == -1) {
			data = dataOld;
		} else {
			data = dataOld.slice(0, endno);
		}

		// var value = data.indexOf("失败");
		// alert(data);
		var myArray = data.split("|");
		if (myArray[1] == 'undefined') {
			myArray[1] = "";
		}
		if (myArray[0] == 'true') {
			delObj.parentNode.removeChild(delObj);
			document.getElementById('contactText').innerHTML = "<span class='green'>操作成功!"
					+ myArray[1] + "</span>";
		} else {
			document.getElementById('contactText').innerHTML = "<span class='red'>操作失败!"
					+ myArray[1] + "</span>";
		}

	}
	document.getElementById('go').style.display = "none";
	document.getElementById('back').style.display = "block"; 
	submitEnd.runAJAX();
}

function reconStartup(obj, id, Action) {
	buttonTrue();
	document.getElementById('go').style.display = "block";
	document.getElementById('back').style.display = "none";
	document.getElementById('submit').onclick = function() {
		delReconBtn();
	}
	centerPopup();
	loadPopup();
	delObj = obj;
	var idObj = obj.parentNode.parentNode.getElementsByTagName('TD')[id].innerHTML;

	var title = obj.parentNode.parentNode.parentNode.parentNode
			.getElementsByTagName('THEAD')[0].getElementsByTagName('TR')[0]
			.getElementsByTagName('TD')[id].innerHTML;

	document.getElementById('contactText').innerHTML = "请确定 <strong>"
			+ title + "</strong> 为 <strong>" + idObj + "</strong> 重新发起对账 ";

	imgAction = Action;
}

//手工退款
function getBill(obj, id, formId ,Action) {
	 var div = document.getElementById("refdivText");
	    while(div.lastChild) //初始化提示信息
	    {div.removeChild(div.lastChild) }
	imgAction = Action + "?" + getDataValue(formId);
	var requestForm = '';
	var submitEnd = new change(requestForm, imgAction);
	submitEnd.runAJAX();
	submitEnd.onCompletion = function() {
		var dataOld = submitEnd.response;
		buttonTrue();
		centerPopup();
		refloadPopup();
		delObj = obj.parentNode.parentNode;
		var idObj = obj.parentNode.parentNode.getElementsByTagName('TD')[id].innerHTML;
		var title = obj.parentNode.parentNode.parentNode.parentNode
				.getElementsByTagName('THEAD')[0].getElementsByTagName('TR')[0]
				.getElementsByTagName('TD')[id].innerHTML;
		$("#reftbody").html(dataOld);
	};
};




//手工退款
function refloadPopup(){
	if (popupStatus == 0) {
		$("#backgroundPopup").css( {
			"opacity" :"0.2"
		});
		$("#backgroundPopup").fadeIn("fast");
		$("#refdiv").fadeIn("fast");
		popupStatus = 1;
	}
}



//手工退款
function manualRefund(obj, id, formId ,Action,billCode,billAmt,refundType,merid) {
	$("#"+formId).children("#billCode").val(billCode);
	$("#"+formId).children("#transAmt").val(billAmt);
	$("#"+formId).children("#refundType").val(refundType);
	$("#"+formId).children("#billMerId").val(merid);
      imgAction = Action + "?" + getDataValue(formId);
		submitManaualRefund();
}

function submitManaualRefund() {
	document.getElementById('refdivText').innerHTML = "<img src='images/loading.gif' /> 系统通信中,请稍候...";
	var requestUrl = imgAction;
	var requestForm = '';
	var submitEnd = new change(requestForm, requestUrl);
	// alert(submitEnd.response);
	submitEnd.onCompletion = function() {
		var dataOld = submitEnd.response;
		var data;
		var endno = dataOld.indexOf('<!');
		if (endno == -1) {
			data = dataOld;
		} else {
			data = dataOld.slice(0, endno);
		}

		// var value = data.indexOf("失败");
		// alert(data);
		var myArray = data.split("|");
		if (myArray[1] == 'undefined') {
			myArray[1] = "";
		}
		if (myArray[0] == 'true') {
			//delObj.parentNode.removeChild(delObj);
			document.getElementById('refdivText').innerHTML = "<span class='green'>账单号"+ myArray[1] + "退款成功!"
					+  "</span>";
			var div = document.getElementById(myArray[1]);
		    while(div.lastChild) //当div下还存在末尾节点时 循环继续
		    {div.removeChild(div.lastChild) }
		} else {

			document.getElementById('refdivText').innerHTML = "<span class='red'>退款失败!"
					+ myArray[1] + "</span>";

		}

	}
	submitEnd.runAJAX();
}

function popupProcess(obj, id, Action,text,flag) {
	buttonTrue();
	document.getElementById('go').style.display = "block";
	document.getElementById('back').style.display = "none";
	document.getElementById('submit').onclick = function() {
		submitPopupProcess(flag);
	}
	centerPopup();
	loadPopup();
	delObj = obj.parentNode.parentNode;
	changeObj = obj;
    document.getElementById('contactText').innerHTML = text;
    imgAction = Action;
}

function submitPopupProcess(flag) {
	document.getElementById('contactText').innerHTML = "<img src='images/loading.gif' /> 系统通信中,请稍候..."
	document.getElementById('go').style.display = "none";
	document.getElementById('back').style.display = "block";
	var requestUrl = imgAction;
	var requestForm = '';
	var submitEnd = new change(requestForm, requestUrl);
	submitEnd.onCompletion = function() {
		var dataOld = submitEnd.response;
		var data;
		var endno = dataOld.indexOf('<!');
		if (endno == -1) {
			data = dataOld;
		} else {
			data = dataOld.slice(0, endno);
		}
		var myArray = data.split("|");
		if (myArray[1] == 'undefined') {
			myArray[1] = "";
		}
		if (myArray[0] == 'true') {
			if(delObj != 'undefined' && flag == 'true') {
				delObj.parentNode.removeChild(delObj);	
			} 
			document.getElementById('contactText').innerHTML = "<span class='green'>操作成功!"
				+ myArray[1] + "</span>";
		} else {
			if (myArray[1] == '') {
				myArray[1] = "通讯超时,请稍后操作";
			}
			document.getElementById('contactText').innerHTML = "<span class='red'>操作失败!"
					+ myArray[1] + "</span>";
		}
	}
	document.getElementById('go').style.display = "none";
	document.getElementById('back').style.display = "block";
	submitEnd.runAJAX();
}
//锁定解锁操作
function changeLockState(obj, id, Action) {
	buttonTrue();
	// alert(obj.alt);
	document.getElementById('go').style.display = "block";
	document.getElementById('back').style.display = "none";
	document.getElementById('submit').onclick = function() {
		submitLockState();
	}
	centerPopup();
	loadPopup();
	
	//imgObj = obj.parentNode.parentNode.getElementsByTagName('IMG')[0];
	
	//changeObj = obj;
	
	delObj=obj;
	var idObj = obj.parentNode.parentNode.getElementsByTagName('TD')[id].innerHTML;

	var title = obj.parentNode.parentNode.parentNode.parentNode
			.getElementsByTagName('THEAD')[0].getElementsByTagName('TR')[0]
			.getElementsByTagName('TD')[id].innerHTML;
	var flag = obj.parentNode.parentNode.getElementsByTagName('input')[0].value;
	if (flag == 1) {
		document.getElementById('contactText').innerHTML = "请确定将 <strong>"
			+ title + " </strong>为 <strong>" + idObj
			+ " </strong>的状态调整为<span class='green'>[未锁定]</span>";
		
	} else {
		document.getElementById('contactText').innerHTML = "请确定将 <strong>"
			+ title + "</strong> 为 <strong>" + idObj
			+ " </strong>的状态调整为<span class='red'>[锁定]</span>";
	}
	imgAction = Action;
}

function submitLockState() {
	document.getElementById('contactText').innerHTML = "<img src='images/loading.gif' /> 系统通信中,请稍候...";
	document.getElementById('go').style.display = "none";
	document.getElementById('back').style.display = "block";
	var requestUrl = imgAction;
	var requestForm = '';
	// alert(requestUrl);
	var submitEnd = new change(requestForm, requestUrl);
	// alert(submitEnd.response);
	submitEnd.onCompletion = function() {
		var dataOld = submitEnd.response;
		var data;
		var endno = dataOld.indexOf('<!');
		if (endno == -1) {
			data = dataOld;
		} else {
			data = dataOld.slice(0, endno);
		}
		var flag = delObj.parentNode.parentNode.getElementsByTagName('input')[0].value;
		var myArray = data.split("|");
		if (myArray[1] == 'undefined') {
			myArray[1] = "";
		}
		if (myArray[0] == 'true') {
			if (flag == 1) {
				//获取状态span显示
				 var textSpan = delObj.parentNode.parentNode
						.getElementsByTagName('span')[1];
				// 首先删除所有已新建的Text Node节点
				while (textSpan.hasChildNodes()) {
					textSpan.removeChild(textSpan.childNodes[0]);
				}
				var textNode = document.createTextNode(" 未锁定");
				textSpan.appendChild(textNode);
				//获取次数span显示
				 var textSpan1 = delObj.parentNode.parentNode
					.getElementsByTagName('span')[0];
				// 首先删除所有已新建的Text Node节点
					while (textSpan1.hasChildNodes()) {
						textSpan1.removeChild(textSpan1.childNodes[0]);
					}
				var textNode1 = document.createTextNode("0");
				textSpan1.appendChild(textNode1);
				delObj.parentNode.removeChild(delObj);
			} else {
				delObj.parentNode.removeChild(delObj);
			}
			document.getElementById('contactText').innerHTML = "<span class='green'>操作成功!"
					+ myArray[1] + "</span>";
		} else {
			document.getElementById('contactText').innerHTML = "<span class='red'>操作失败!"
					+ myArray[1] + "</span>";
		}
	}
	document.getElementById('go').style.display = "none";
	document.getElementById('back').style.display = "block";
	submitEnd.runAJAX();
}
// 弹出确认浮层
function showConfirmPopup(text,func) {
	buttonTrue();
	document.getElementById('go').style.display = "block";
	document.getElementById('back').style.display = "none";
	document.getElementById('submit').onclick = function() {
		func();
	}
	centerPopup();
	loadPopup();
	document.getElementById('contactText').innerHTML = text;
}
//浮层文字变成处理中
function runConfirmPopup() {
	document.getElementById('contactText').innerHTML = "<img src='images/loading.gif' /> 系统通信中,请稍候..."
	document.getElementById('go').style.display = "none";
	document.getElementById('back').style.display = "block";
}
//浮层文字变成完成
function endConfirmPopup(data) {
	var myArray = data.split("|");
	if (myArray[1] == 'undefined') {
		myArray[1] = "";
	}
	if (myArray[0] == 'true') {
		document.getElementById('contactText').innerHTML = "<span class='green'>操作成功!"
				+ myArray[1] + "，请刷新此页面</span>";
	} else {
		if (myArray[1] == '') {
			myArray[1] = "通讯超时,请稍后操作";
		}
		document.getElementById('contactText').innerHTML = "<span class='red'>操作失败!"
				+ myArray[1] + "</span>";
	}
	document.getElementById('go').style.display = "none";
	document.getElementById('back').style.display = "block";
}
function res(mess){
	$('#mess > p').html(parseRightLan(mess));
	$('#result').modal('show');
}

function getDate(num){
	var newDate = new Date();
	newDate.setDate(newDate.getDate()+num);
	return formateDate(newDate);
}

function getDate_hhll(num){
	var newDate = new Date();
	newDate.setDate(newDate.getDate()+num);
	return formateDate_hhll(newDate);
}
		
function formateDate(date){
	var month;
	var day;
			
	if((date.getMonth()+1).toString().length < 2)
		month = '0'+(date.getMonth()+1);
	else
		month = date.getMonth()+1;
		
	if((date.getDate()).toString().length < 2)
		day = '0'+(date.getDate()); 
	else
		day = date.getDate();
	
	return date.getFullYear()+"-"+month+"-"+day;
}

function formateDate_hhll(date){
	var month;
	var day;
	
	if((date.getMonth()+1).toString().length < 2)
		month = '0'+(date.getMonth()+1);
	else
		month = date.getMonth()+1;
	
	if((date.getDate()).toString().length < 2)
		day = '0'+(date.getDate()); 
	else
		day = date.getDate();
	
	if((date.getHours()).toString().length < 2)
		hours = '0'+(date.getHours()); 
	else
		hours = date.getHours();
	
	if((date.getMinutes()).toString().length < 2)
		minutes = '0'+(date.getMinutes()); 
	else
		minutes = date.getMinutes();
	
	var time =hours + ":" + minutes;
	return date.getFullYear()+"-"+month+"-"+day+" "+time;
}


