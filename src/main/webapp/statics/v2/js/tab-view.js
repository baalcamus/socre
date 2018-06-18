function deleteTab(obj,ulId,contextId){
			var nextTabId = "";
			
			var unActiveClass = "";
			var activeClass = "active";
			var tabUnActive = "tab-pane ";
			var tabActive = tabUnActive + activeClass;
			var returnFlag;
			
			$('#'+ulId+' > li').each(function(){
				if($(this).attr('class')  == 'active'){
					if($(this).children(':first').attr('id') !=  $(obj).prev().attr('id')){
						nextTabId = $(this).children(':first').attr('id').replace('href','tb');
					}else{
						$(this).attr('class','');
						var tabId = $(this).children(':first').attr('id').replace('href','tb');
						$('#'+tabId).attr('class',tabUnActive);
					}
					
					return false;
				}
			});

			if(nextTabId.length < 1){
				if($(obj).parent().next().length > 0){
					nextTabId = $(obj).parent().next().children(':first').attr('id').replace('href','tb');
				}else{
					nextTabId = $(obj).parent().prev().children(':first').attr('id').replace('href','tb');
				}
			}
			
			var nextHrefId = nextTabId.replace('tb','href');
			
			$(obj).parent().remove();
			var tabId =  $(obj).prev().attr('id').replace('href','tb');
			$('#'+tabId).remove();
			
			getFontSize(ulId,0);
		
			$('#'+nextTabId).attr('class',tabActive);	
			$('#'+nextHrefId).parent().attr('class',activeClass);
		}
			
function createNewTitle(tbId,title,url,ulId,contextId){
			if($('#tb_'+tbId).length > 0){
				var unActiveClass = $('#tb_'+tbId).attr("class")
				var activeClass = unActiveClass + " active";
				
				$('#'+ulId+' > li').attr("class","");
				
				$('#href_'+tbId).html(title);
				$('#href_'+tbId).parent().attr("class","active");
				
				$('#'+contextId+' > div').attr("class",unActiveClass);
				$('#tb_'+tbId).load(url);
  				$('#tb_'+tbId).attr("class",activeClass);
  				return;
			}
	
			var newDiv = $('<div></div>');
			newDiv.attr('id',"tb_"+tbId);
			newDiv.attr('class',"tab-pane");
						
			$('#'+contextId).append(newDiv);

			var s = '<li style = "font-size:'+getFontSize(ulId,1)+';"><a id = "href_'+tbId+'" href="#tb_'+tbId+'">'+title+'</a><a onclick = "deleteTab(this,\''+ulId+'\',\''+contextId+'\')" class="glyphicon glyphicon-remove" style="cursor: pointer;" title="关闭"></a></li>';

			$('#'+ulId).append(s);
			

			$('#href_'+tbId).tab('show');
			
			$('#tb_'+tbId).load(url);
		
			$('#'+ulId+' li a').click(function (e) {
  				e.preventDefault();
  				$(this).tab('show');
			});
		}


function getFontSize(ulId,i){
	var cssFontSize =  $('#'+ulId+' > li').children(":first").css('font-size');
	var fontSize = parseFloat(cssFontSize);
    var unit = cssFontSize.slice(-2);   //获取字体大小的单位 */
    var newFontSize;
    
    var i = i;   //create时因为尚未生成li 所以统计时应加上 1 ,delete时应从0开始算
    $('#'+ulId+' > li').each(function(){
    	i = i + 1;
    })
    
    if(i > 3){
    	newFontSize = 12;
    }else{
    	newFontSize = 14;
    }
    
    if(fontSize != newFontSize){
    	$('#'+ulId+' > li').each(function(){
    		$(this).css('font-size',newFontSize+unit);
    	})
    }
    
    return newFontSize+"px";
}

function changeState(obj,state,url){
	var roleId = $(obj).parent().parent().children(":first").text();
	var oldState = $(obj).parent().prev().children().attr('class');
	oldState = oldState.substring(oldState.indexOf('-')+1);
	
	var warnMess ;
	
	var new_stat;         //用于判断下一次更新状态
	var flag_stat;		  //用于更新状态表格图标
	var flag_titleClass;  //用于更新链接表格图标
	var flag_title;       //用于更新链接提示
	
	if(oldState == "remove"){
		flag_stat = "ok";
		flag_titleClass = "ban";
		flag_title = "停用";
		new_stat = "启用";
	}else{
		flag_stat = "remove";
		flag_titleClass = "ok";
		flag_title = "启用";
		new_stat = "停用"
	}
	
	if(state == '0'){
		warnMess = "请确定将 角色号为"+roleId+" 的角色删除";                            //state 为0时为删除用户，否则为更新用户
	}else{
		warnMess = "请确定将 角色号为 "+roleId+" 的状态改为【"+new_stat+"】";
	}
	
	$('#warnMess > p').text(warnMess);
	$('#warnMess').next().css('display','block');
	$('#adviceText').modal('show');
	$('#changeSubmit').children(":first").click(function(){
		if(state == '0'){
			if(oldState == "ok"){
				$('#adviceText').modal('hide');
				$('#resultMess > p').html("<div class = 'alert alert-danger text-center'><h3><span class = 'glyphicon glyphicon-remove'>&nbsp删除失败，只有停用的用户才能删除!</span></h3></div>");
				$('#resultText').modal('show');
				return;
			}else{
				$.ajax({ url: url, context: document.body , success: function(){
					$(obj).parent().parent().remove();
					$('#adviceText').modal('hide');
					$('#resultMess > p').html("<div class = 'alert alert-success text-center'><h3><span class = 'glyphicon glyphicon-ok'>&nbsp角色号为"+roleId+"的角色已删除</span></h3></div>");
					$('#resultText').modal('show');
				}});
				
				$('#changeSubmit').children(":first").unbind();
			}
		}
		else{
			$('#warnMess > p').html('<img src="images/loading.gif" >');
			$('#warnMess').next().css('display','none');
			
			$.ajax({ url: url, context: document.body , success: function(){
				$('#adviceText').modal("hide");
				$('#resultMess > p').html("<div class = 'alert alert-success text-center'><h3><span class = 'glyphicon glyphicon-ok'>&nbsp角色号为 "+roleId+"的状态已改为【"+new_stat+"】</span></h3></div>");
				$('#resultText').modal("show");
				$(obj).attr('class','glyphicon glyphicon-'+flag_titleClass+'-circle');
				$(obj).attr('title',flag_title);
				$(obj).parent().prev().children().attr('class','glyphicon glyphicon-'+flag_stat);
				}});
			
				$('#changeSubmit').children(":first").unbind();
			}
	})
}

function tableCtrl(obj){
    var hideTbody = $(obj).parent().parent().next();
    
    if(hideTbody.css('display') == 'none')
		hideTbody.css('display','');
	else
		hideTbody.css('display','none');
	
	var ctrlA = $(obj).children(':first');
	var oldClass = ctrlA.attr('class');
	var newClass = oldClass.indexOf('plus') > 0 ? oldClass.replace('plus','minus') : oldClass.replace('minus','plus');
	
	ctrlA.attr('class',newClass);
}

/*function createAdviceWindow(beforeDivId,resFlag){
	//最外层的div 其id用于寻找添加内容的依据
	var outDiv = $('<div class="modal fade" id='+(resFlag == true ? "adviceText" : "resultText")+' tabindex="-1" role="dialog"></div>'); 
	
	//次外层div 用于控制样式	
	var docDiv = $('<div class="modal-dialog" role="document"></div>');
	
	//信息层div
	var conDiv = $('<div class="modal-content"></div>');
	
	//信息头部
	var con_headDiv = $('<div class="modal-header"></div>');
	con_headDiv.append($('<h4 class = "modal-title">'+parseRightLan(resFlag == true ? "操作结果" : "操作确认")+'</h4>'));
	
	//信息主要内容
	var con_descDiv = $('<div id = "warnMess" class="modal-body text-center"></div>');
	con_descDiv.append($('<p></p>'));
	
	//信息按键
	var con_buttonDiv = $('<div class="modal-footer"></div>');
	
	//如果需要取消按钮。
	if(resFlag){
		var button_confirm = $('<button type="button" class="btn btn-primary">'+parseRightLan("确定")+'</button>'); 
		var button_cancel = $('<button type="button" class="btn btn-default" data-dismiss="modal">'+parseRightLan("取消")+'</button>');
		
		//通知类型浮层
		con_descDiv.attr('id','warnMess');
		
		con_buttonDiv.attr('id','changeSubmit');
		con_buttonDiv.append(button_confirm);con_buttonDiv.append(button_cancel);
	} else{
		var button_confirm = $('<button type="button" class="btn btn-primary" data-dismiss="modal">'+parseRightLan("确定")+'</button>'); 
		
		//结果类型浮层
		con_descDiv.attr('id','resultMess');
		
		con_buttonDiv.append(button_confirm);
	}
	
	conDiv.append(con_headDiv);
	conDiv.append(con_descDiv);
	conDiv.append(con_buttonDiv);

	docDiv.append(conDiv);
	outDiv.append(docDiv);
	
	$('#'+beforeDivId).after(outDiv);
}

	
function pageSort(url,formId,tableId,page){
	if(page == 'next' || page == 'prev')
		$('.pagination').children().each(function(){
			if($(this).attr('class') == 'active'){
				var selPage = page == 'next' ? 
						$(this).next().children().text() : 
						$(this).prev().children().text() ;
								
				pageChange(parseInt(selPage));
				return false;
			}
		});
	else
		pageChange(parseInt($(page).text()));
			
	var pageValue = parseInt($(page).text());
			
	postPageData(url+'?pageValue='+pageValue,formId,"table"+tableId,pageValue);
}
	
function createPageLi(pageValue,isSel){
	var a = $("<a onclick = 'postChange(this)' style='cursor:pointer'>"+pageValue+"</a>")
	var li = $("<li></li>");
			
	if(isSel){
		li.attr('class','active');
	}
		
	li.append(a);
	return li;
}
	
function pageChange(selPage){
	var pageNum = parseInt($('#pageNum').val());
		
	var firstLi = $('.pagination').children(":first");
	var endLi = $('.pagination').children(":last");
		
	$('.pagination').children().each(function(){
		var pageValue = $(this).children().text();

		if(pageValue != firstLi.children().text() 
				&& pageValue != endLi.children().text()){
			$(this).remove();
		}
	});

	var pageToSta = selPage - 1;
	var pageToEnd = pageNum - selPage;
		
	var isSel = false;
		
	var createStaPage = 1;
	var createEndPage = pageNum;
		
	var createSta = false;
	var createEnd = false;
		
	if(pageToSta < 7){
		if(pageNum > 10){
			createEndPage = 11;
			createEnd = true;
		}else{
			createEndPage = pageNum + 1;
		}
	}
		
	if(pageToSta > 6 && pageToEnd > 6){
		createStaPage = selPage - 4;
		createEndPage = selPage + 5;
		createSta = true;
		createEnd = true;
	}
		
	if(pageToEnd < 7){
		createEndPage = pageNum + 1;
			
		if(pageNum > 10){
			createStaPage = pageNum - 10;
			createSta = true;
		}else{
			createStaPage = 1;
		}
	}
		
	if(pageToSta == 0){
		firstLi.css('display','none');
	}else{
		firstLi.css('display','');
	}
		
	if(pageToEnd == 0){
		endLi.css('display','none');
	}else{
		endLi.css('display','');
	}

	for(var i = createStaPage ; i < createEndPage ; i++){
		if(i == selPage) isSel = true;
		endLi.before(createPageLi(i,isSel));
		isSel = false;
	}

	if(createSta){
		firstLi.after($('<li><a>...</a></li>'));
		firstLi.after(createPageLi(1,false));
	}
	
	if(createEnd){
		endLi.before($('<li><a>...</a></li>'));
		endLi.before(createPageLi(pageNum,false));
	}
}*/