function menuState(obj) {
	// var s=obj.getAttribute("tagName");
	// alert(s);
	var menu = document.getElementById("content_left")
			.getElementsByTagName("A");
	for (var i = 0; i < menu.length; i++) {
		menu[i].className = "submenuOff";
	}
	obj.className = "submenuOn";
	// obj.backgroundImage="images/menudot_over.gif";
}

function sack(parentId, Name, Url) {
	
	var dataValue = "";
	this.AjaxFailedAlert = "Your browser does not support the enhanced functionality of this website, and therefore you will have an experience that differs from the intended one.\n";
	if (Name == "") {
		this.requestFile = Url;
		// alert(this.requestFile);
	} else if (Name != "") {
		var formID = document.getElementById(Name);
		var i, queryString = "", and = "";

		var item; // for each form's object

		var itemValue;// store each form object's value

		for (i = 0; i < formID.length; i++)

		{

			item = formID[i];// get form's each object

			if (item.name != '')

			{

				if (item.type == 'select-one')

				{

					itemValue = item.options[item.selectedIndex].value;

				}

				else if (item.type == 'checkbox' || item.type == 'radio')

				{

					if (item.checked == false)

					{

						continue;

					}

					itemValue = item.value;

				}

				else if (item.type == 'button' || item.type == 'submit'
						|| item.type == 'reset' || item.type == 'image')

				{// ignore this type

					continue;

				}

				else

				{

					itemValue = item.value;

				}

				itemValue = encodeURIComponent(itemValue);

				// dataValue=itemValue;

				queryString += and + item.name + '=' + itemValue;

				and = "&";
				dataValue = queryString;
			}

		}
		// alert(queryString);
		// return queryString;
		this.requestFile = Url + "?" + queryString;

	}

	if(parentId=="merInfoBeanLstTable"){
		$("." + parentId).hide();
		$("#LoadingPanel").show();
		jQuery.post(Url, dataValue, function(data) {
			document.getElementById("show").innerHTML="";
			$("." + parentId).html("");
			$("." + parentId).css( {
				"display" :"none"
			});
			$("." + parentId).html(data);
			$("#LoadingPanel").hide();
			$("." + parentId).show()
			//$("#" + parentId).fadeIn("slow");
			
		})
	}
	else{
	$("#" + parentId).hide();
	$("#LoadingPanel").show();
	jQuery.post(Url, dataValue, function(data) {
		document.getElementById("show").innerHTML="";
		document.getElementById(parentId).innetHTML = '';
		$("#" + parentId).css( {
			"display" :"none"
		});
		$("#" + parentId).html(data);
		$("#LoadingPanel").hide();
		$("#" + parentId).show()
		//$("#" + parentId).fadeIn("slow");
		
	})
	
	}
	
}
function ajaxload(parentId, Name, Url) {
	if($('#loading').length > 1) $('#loading').remove();
	$("<div class='row mb15' id='loading'><p class=' text-center ' style='margin:150px 0 0 0;'></p></div>").prependTo("#content_right");
	$('#loading > p').html('<img src="/newConsoleV2-web/statics/v2/vendors/lightbox/img/loading.gif">  &nbsp;&nbsp; '+'数据加载中');

	var dataValue = "";
	this.AjaxFailedAlert = "Your browser does not support the enhanced functionality of this website, and therefore you will have an experience that differs from the intended one.\n";
	if (Name == "") {
		this.requestFile = Url;
		// alert(this.requestFile);
	} else if (Name != "") {
		var formID = document.getElementById(Name);
		var i, queryString = "", and = "";

		var item; // for each form's object

		var itemValue;// store each form object's value

		for (i = 0; i < formID.length; i++)

		{

			item = formID[i];// get form's each object

			if (item.name != '')

			{

				if (item.type == 'select-one')

				{

					itemValue = item.options[item.selectedIndex].value;

				}

				else if (item.type == 'checkbox' || item.type == 'radio')

				{

					if (item.checked == false)

					{

						continue;

					}

					itemValue = item.value;

				}

				else if (item.type == 'button' || item.type == 'submit'
						|| item.type == 'reset' || item.type == 'image')

				{// ignore this type

					continue;

				}

				else

				{

					itemValue = item.value;

				}

				itemValue = encodeURIComponent(itemValue);

				// dataValue=itemValue;

				queryString += and + item.name + '=' + itemValue;

				and = "&";
				dataValue = queryString;
			}

		}
		// alert(queryString);
		// return queryString;
		this.requestFile = Url + "?" + queryString;

	}

	if(parentId=="merInfoBeanLstTable"){
		$("." + parentId).hide();
		$("#LoadingPanel").show();
		jQuery.post(Url, dataValue, function(data) {
			$("." + parentId).html("");
			$("." + parentId).css( {
				"display" :"none"
			});
			$("." + parentId).html(data);
			$("#LoadingPanel").hide();
			$("." + parentId).show()
			$('#loading').remove();
			//$("#" + parentId).fadeIn("slow");
			
		})
	}
	else{
	$("#" + parentId).hide();
	$("#LoadingPanel").show();
	jQuery.post(Url, dataValue, function(data) {
		document.getElementById(parentId).innetHTML = '';
		$("#" + parentId).css( {
			"display" :"none"
		});
		$("#" + parentId).html(data);
		$("#LoadingPanel").hide();
		$("#" + parentId).show()
		$('#loading').remove();
		//$("#" + parentId).fadeIn("slow");
		
	})
	
	}
	
}


function change(Name, Url) {
	var dataValue = "";
	// alert(this.requestFile);
	this.method = "POST";
	this.URLString = "";
	this.encodeURIString = true;
	this.execute = false;

	this.onLoading = function() {
	};
	this.onLoaded = function() {

	};
	this.onInteractive = function() {
	};
	this.onCompletion = function() {

	};

	this.createAJAX = function() {
		try {
			this.xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				this.xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (err) {
				this.xmlhttp = null;
			}
		}
		if (!this.xmlhttp && typeof XMLHttpRequest != "undefined")
			this.xmlhttp = new XMLHttpRequest();
		if (!this.xmlhttp) {
			this.failed = true;
		}
	};

	this.setVar = function(name, value) {
		if (this.URLString.length < 3) {
			this.URLString = name + "=" + value;
		} else {
			this.URLString += "&" + name + "=" + value;
		}
	}

	this.encVar = function(name, value) {
		var varString = encodeURIComponent(name) + "="
				+ encodeURIComponent(value);
		return varString;
	}

	this.encodeURLString = function(string) {
		varArray = string.split('&');
		for (i = 0; i < varArray.length; i++) {
			urlVars = varArray[i].split('=');
			if (urlVars[0].indexOf('amp;') != -1) {
				urlVars[0] = urlVars[0].substring(4);
			}
			varArray[i] = this.encVar(urlVars[0], urlVars[1]);
		}
		return varArray.join('&');
	}

	this.runResponse = function() {
		eval(this.response);
	}

	this.runAJAX = function(urlstring) {
		this.responseStatus = new Array(2);
		if (this.failed && this.AjaxFailedAlert) {
			res(this.AjaxFailedAlert);
		} else {
			if (urlstring) {
				if (this.URLString.length) {
					this.URLString = this.URLString + "&" + urlstring;
				} else {
					this.URLString = urlstring;
				}
			}
			if (this.encodeURIString) {
				var timeval = new Date().getTime();
				this.URLString = this.encodeURLString(this.URLString);
				this.setVar("rndval", timeval);
			}
			if (this.element) {
				this.elementObj = document.getElementById(this.element);
			}
			if (this.xmlhttp) {
				var self = this;
				if (this.method == "GET") {
					var totalurlstring = this.requestFile + "?"
							+ this.URLString;
					this.xmlhttp.open(this.method, totalurlstring, true);
					this.xmlhttp.send(this.requestFile);
				} else if (this.method == "POST") {
					this.xmlhttp.open(this.method, Url, true);
					this.xmlhttp.setRequestHeader('Content-Type',
							'application/x-www-form-urlencoded')
					this.xmlhttp.send(dataValue);
				}
				// alert(this.URLString);

				this.xmlhttp.onreadystatechange = function() {
					switch (self.xmlhttp.readyState) {
					case 1:
						self.onLoading();
						break;
					case 2:
						self.onLoaded();
						break;
					case 3:
						self.onInteractive();
						break;
					case 4:

						self.response = self.xmlhttp.responseText;
						self.responseXML = self.xmlhttp.responseXML;
						self.responseStatus[0] = self.xmlhttp.status;
						self.responseStatus[1] = self.xmlhttp.statusText;
						self.onCompletion();
						if (self.execute) {
							self.runResponse();
						}
						if (self.elementObj) {
							var elemNodeName = self.elementObj.nodeName;
							elemNodeName.toLowerCase();
							if (elemNodeName == "input"
									|| elemNodeName == "select"
									|| elemNodeName == "option"
									|| elemNodeName == "textarea") {
								self.elementObj.value = self.response;
							} else {
								self.elementObj.innerHTML = self.response;
							}
						}
						self.URLString = "";
						break;
					}
				};
			}
		}
	};
	this.createAJAX();
	//
}




function editInfo(Name, Url) {

	var dataValue = "";
	this.AjaxFailedAlert = "Your browser does not support the enhanced functionality of this website, and therefore you will have an experience that differs from the intended one.\n";
	if (Name == "") {
		this.requestFile = Url;
		// alert(this.requestFile);
	} else if (Name != "") {
		var formID = document.getElementById(Name);
		var i, queryString = "", and = "";

		var item; // for each form's object

		var itemValue;// store each form object's value

		for (i = 0; i < formID.length; i++)

		{

			item = formID[i];// get form's each object

			if (item.name != '')

			{

				if (item.type == 'select-one')

				{

					itemValue = item.options[item.selectedIndex].value;

				}

				else if (item.type == 'checkbox' || item.type == 'radio')

				{

					if (item.checked == false)

					{

						continue;

					}

					itemValue = item.value;

				}

				else if (item.type == 'button' || item.type == 'submit'
						|| item.type == 'reset' || item.type == 'image')

				{// ignore this type

					continue;

				}

				else

				{

					itemValue = item.value;

				}

				itemValue = encodeURIComponent(itemValue);

				// dataValue=itemValue;

				queryString += and + item.name + '=' + itemValue;

				and = "&";
				dataValue = queryString;
			}

		}
		// alert(queryString);
		// return queryString;
		$.ajax({
			   type: "POST",
			   url: Url,
			   data: queryString,
			   success: function(msg){
			    
        var dataOld = msg;
		//alert(submitEnd.response);
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
			document.getElementById('contactText').innerHTML = "<span class='green'>操作成功!"
					+ myArray[1] + "</span>";
	document.getElementById('go').style.display = "none";
	document.getElementById('back').style.display = "block";
	$("#confirmCtrl").click( function() {
		disablePopup();
		try{
			document.getElementById('billMerName').value='';
			document.getElementById('merId').value='';
			document.getElementById('outId').value='';		
		}catch(e){
			//如果异常不做处理
		}
	});
		} else {
			document.getElementById('contactText').innerHTML = "<span class='red'>操作失败!"
					+ myArray[1] + "</span>";
	document.getElementById('go').style.display = "none";
	document.getElementById('back').style.display = "block";
			//alert(myArray[1]);
		}


			   }
			});
		this.requestFile = Url + "?" + queryString;
		
		//alert(this.requestFile);
		//change('',this.requestFile);

	}
	
}

// 复制editInfo方法，删除backCtrl的操作
function editFormInfo(Name, Url) {

	var dataValue = "";
	this.AjaxFailedAlert = "Your browser does not support the enhanced functionality of this website, and therefore you will have an experience that differs from the intended one.\n";
	if (Name == "") {
		this.requestFile = Url;
		// alert(this.requestFile);
	} else if (Name != "") {
		var formID = document.getElementById(Name);
		var i, queryString = "", and = "";

		var item; // for each form's object

		var itemValue;// store each form object's value

		for (i = 0; i < formID.length; i++)

		{

			item = formID[i];// get form's each object

			if (item.name != '')

			{

				if (item.type == 'select-one')

				{

					itemValue = item.options[item.selectedIndex].value;

				}

				else if (item.type == 'checkbox' || item.type == 'radio')

				{

					if (item.checked == false)

					{

						continue;

					}

					itemValue = item.value;

				}

				else if (item.type == 'button' || item.type == 'submit'
						|| item.type == 'reset' || item.type == 'image')

				{// ignore this type

					continue;

				}

				else

				{

					itemValue = item.value;

				}

				itemValue = encodeURIComponent(itemValue);

				// dataValue=itemValue;

				queryString += and + item.name + '=' + itemValue;

				and = "&";
				dataValue = queryString;
			}

		}
		// alert(queryString);
		// return queryString;
		$.ajax({
			   type: "POST",
			   url: Url,
			   data: queryString,
			   success: function(msg){
			    
        var dataOld = msg;
		//alert(submitEnd.response);
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
			document.getElementById('contactText').innerHTML = "<div id='contactTextM'><span class='green'>操作成功!"
					+ myArray[1] + "</span></div>";
	document.getElementById('go').style.display = "none";
	document.getElementById('back').style.display = "block";
		} else {
			document.getElementById('contactText').innerHTML = "<div id='contactTextM'><span class='red'>操作失败!"
					+ myArray[1] + "</span></div>";
	document.getElementById('go').style.display = "none";
	document.getElementById('back').style.display = "block";
			//alert( myArray[1]);
		}


			   }
			});
		this.requestFile = Url + "?" + queryString;
		
		//alert(this.requestFile);
		//change('',this.requestFile);

	}
	
}


//取得form中的数据元素
function getDataValue(Name) {
	var dataValue = "";
	if (Name != "") {
		var formID = document.getElementById(Name);
		var i, queryString = "", and = "";

		var item; // for each form's object

		var itemValue;// store each form object's value

		for (i = 0; i < formID.length; i++)

		{

			item = formID[i];// get form's each object

			if (item.name != '')

			{

				if (item.type == 'select-one')

				{

					itemValue = item.options[item.selectedIndex].value;

				}

				else if (item.type == 'checkbox' || item.type == 'radio')

				{

					if (item.checked == false)

					{

						continue;

					}

					itemValue = item.value;

				}

				else if (item.type == 'button' || item.type == 'submit'
						|| item.type == 'reset' || item.type == 'image')

				{// ignore this type

					continue;

				}

				else

				{

					itemValue = item.value;

				}

				itemValue = encodeURIComponent(itemValue);

				// dataValue=itemValue;

				queryString += and + item.name + '=' + itemValue;

				and = "&";
				dataValue = queryString;
			}

		}
	}
	return dataValue;
}


/*function submitDiv(divID, requestForm, requestUrl) {
	var submitObj = new sack(requestForm, requestUrl);
	submitObj.onCompletion = function() {
		var obj = document.getElementById(divID);
		var data = submitObj.response;
		obj.innerHTML = "<xml></xml>"
				+ data.replace(/<script/gi, "<script defer=''");
	}
	submitObj.runAJAX();
}*/
