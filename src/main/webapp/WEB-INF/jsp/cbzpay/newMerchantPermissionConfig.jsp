<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/statics/v2/js/dtree.js"></script>
<title>跨境商户权限配置</title>
<link href="<%=request.getContextPath()%>/statics/v2/css/dtree.css"
	rel="stylesheet" />
<style type="text/css">
.red {
	color: red;
}

input[type='checkbox'] {
	clear: both;
}

.permission_config_form {
	clear: both !important;
}

#cover {
	position: fixed;
	z-index: 1000;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background-color: #000000;
	filter: alpha(opacity = 0.7); /*IE滤镜，透明度50%*/
	-moz-opacity: 0.7; /*Firefox私有，透明度50%*/
	opacity: 0.7; /*其他，透明度50%*/
	text-align: center;
}

#cover img {
	position: absolute;
	top: 40%;
	left: 40%;
	width: 20%;
	height: 10%;
	margin-top: -15px;
	margin-left: -15px;
}
</style>
<script type="text/javascript">
function showCover(){$("#cover").css("display",'');}
function hideCover(){$("#cover").css("display",'none');}

function checkAll() {
	var code_Values = document.getElementsByTagName("input");
	for (i = 0; i < code_Values.length; i++) {
		if (code_Values[i].type == "checkbox") {
			code_Values[i].checked = true;
		}
	}
}

function uncheckAll() {
	var code_Values = document.getElementsByTagName("input");
	for (i = 0; i < code_Values.length; i++) {
		if (code_Values[i].type == "checkbox") {
			code_Values[i].checked = false;
		}
	}
}

function checkStatus(no,chkBox) {
	checkPar(chkBox);//当子目录选中时,父目录也选中
	var chks = document.getElementsByTagName('input');//得到所有input
	for (var i = 0; i < chks.length; i++) {
		if (chks[i].name.toLowerCase() == 'rulearr') {//得到所名为check的input
			if (chks[i].className == no) {//ID等于传进父目录ID时
				chks[i].checked = chkBox.checked;//保持选中状态和父目录一致
				checkStatus(chks[i].value,chks[i]);//递归保持所有的子目录选中
			}
		}
	}
}
function checkPar(chkBox) {
	if (chkBox.name.toLowerCase() == 'rulearr' && chkBox.checked && chkBox.className != 0) {//判断本单击为选中,并且不是根目录,则选中父目录	                 			       
		var chkObject = document.getElementById(chkBox.className);//得到父目录对象
		chkObject.checked = true;
		checkPar(chkObject);
	}
}
</script>
</head>

<body class=" ">
	<div id="cover" style="display: none;">
		<img
			src="<%=request.getContextPath()%>/statics/v2/images/wait_processing.gif">
	</div>
	<!-- 头部 -->
	<jsp:include page="../include/top.jsp" />
	<div id="wrapper">
		<div>
			<jsp:include page="../include/bottom.jsp" />
			<!-- 左侧内容 -->
			<jsp:include page="../include/left.jsp" />
			<!--右侧内容 start-->
			<div id="page-wrapper">
				<!--BEGIN TITLE & BREADCRUMB PAGE-->
				<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
					<ol class="breadcrumb page-breadcrumb">
						<li><i class="fa fa-home"></i>&nbsp;<a
							href="<%=request.getContextPath()%>/main/toMain.do">首页</a>&nbsp;&nbsp;<i
							class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li>商户管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li>跨境商户[${merchantNo}]权限配置&nbsp;&nbsp;<i
							class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li><a href="${ctx}/merchant/queryMerchant.do">[返回]</a></li>
					</ol>
					<div class="clearfix"></div>
				</div>
				<!--END TITLE & BREADCRUMB PAGE-->
				<!--BEGIN CONTENT-->
				<div class="page-content">
					<div id="permission_config_div">
						<form id="authForm">
							<script type="text/javascript">
								d = new dTree('d');//new一个树对象	
								d.add(0,-1,'功能*'); //设置树的节点及其相关属性  d.add(id,父节点id,名称); 
								var str="${merRules}";//重新整理成数组
								str=str.replace("[","");
								str=str.replace("]","");
								str=str.replace(/\s+/g,"");
								var items=str.split(",");
								<c:forEach items="${dThreeList}" var="obj">
									if(items.indexOf("${obj.id}")==-1){
			                 			//alert("不选："+items+"::"+"${obj.id}"+"--"+items.indexOf("${obj.id}"));
	
		                 				d.add("${obj.id}","${obj.pid}","<input type='CheckBox' class='${obj.pid}'   id='${obj.id}' onclick='checkStatus(${obj.id},this);' name='ruleArr' value='${obj.id}'>${obj.name}");
				                 	}else{
			                 		//alert("选："+items+"::"+"${obj.id}"+"--"+items.indexOf("${obj.id}"));
				                 
		                 				d.add("${obj.id}","${obj.pid}","<input type='CheckBox' class='${obj.pid}'  checked='checked' id='${obj.id}' onclick='checkStatus(${obj.id},this);' name='ruleArr' value='${obj.id}'>${obj.name}");
				                 	}
								</c:forEach>
								document.write(d);
								d.openAll();
								
							
							</script>
							<table>
								<tr>
									<td width="120" class="text-right"></td>
									<td colspan="2"><a href="#" class="btn btn-default"
										onclick="checkAll();"> 全选 </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
										href="#" class="btn btn-default" onclick="uncheckAll();">全不选
									</a></td>
								</tr>
							</table>
							<input type="hidden" name="merchantNo" value="${merchantNo }">
							<input type="submit"
								onclick="javascript:submitForm();return false;" style="width: 60px;height: 34px" value="提交">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--End CONTENT-->
</body>
<script type="text/javascript">
function submitForm(){
	var url ='<%=request.getContextPath()%>/merchant/ecsauthmgr/update';
	var data = $("#authForm").serialize();
	showCover();
	$.post(url,data,function(obj){
		if(obj.err){
			alert(obj.msg);
		}else{
			alert("修改权限成功!");
			location.replace("<%=request.getContextPath()%>/merchant/queryMerchant");}
							hideCover();
						});
	}
</script>
</html>
