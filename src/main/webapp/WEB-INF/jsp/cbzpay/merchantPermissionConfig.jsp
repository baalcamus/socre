<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/statics/v2/js/dtree.js"></script>
<title>跨境商户权限配置</title>
<link href="<%=request.getContextPath()%>/statics/v2/css/dtree.css" rel="stylesheet" />
<style type="text/css">
.red {
	color: red;
}
input[type='checkbox']{
	clear: both;
}
.permission_config_form{
	clear: both!important;
}
#cover{
			position: fixed; 
			z-index: 1000; 
			width: 100%; 
			height: 100%; 
			top:0;
			left:0;
			background-color:#000000;
			filter:alpha(opacity=0.7); /*IE滤镜，透明度50%*/
			-moz-opacity:0.7; /*Firefox私有，透明度50%*/
			opacity:0.7;/*其他，透明度50%*/
			text-align: center;
		}
		#cover img{
			position:absolute;top:40%;left:40%;width:20%;height:10%;margin-top:-15px;margin-left:-15px;
		}
</style>
<script type="text/javascript">
function showCover(){$("#cover").css("display",'');}
function hideCover(){$("#cover").css("display",'none');}
</script>
</head>

<body class=" ">
	<div id="cover" style="display: none;">
	 	<img src="<%=request.getContextPath() %>/statics/v2/images/wait_processing.gif">
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
						<li>跨境商户[${merchantNo }]权限配置&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
					</ol>
					<div class="clearfix"></div>
				</div>
				<!--END TITLE & BREADCRUMB PAGE-->
				<!--BEGIN CONTENT-->
				<div class="page-content">
					<div id="permission_config_div">
						<form id="authForm">
							<script type="text/javascript">
							//mytree.add(1, 0, 'My node', 'node.html', 'node title', 'mainframe', 'img/musicfolder.gif');
								var d = new dTree('d');
								var i=0;
								d.add(i++,-1,'商户权限配置','','','');
								<c:forEach items="${menus}" var="menu" varStatus="status">
									var pid=i++;
									d.add(pid,0,"<input type='CheckBox' id='"+pid+"' onclick='checkStatus(this);'>${menu.key.mmName}");
									<c:forEach items="${menu.value}" var="item" varStatus="status">
										d.add(i++,pid,"<input type='CheckBox' name='item' value='${item.bdfBsncode}' <c:if test='${fn:contains(items,item.bdfBsncode)}'>checked='checked'</c:if>>${item.bdfName}");
									</c:forEach>
                                </c:forEach>
                                document.write(d);
                                d.openAll();
							</script>
							<input type="hidden" name="merchantNo" value="${merchantNo }">
							<input type="submit" onclick="javascript:submitForm();return false;" value="提交">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--End CONTENT-->
</body>
<script type="text/javascript">
function checkStatus(chkBox) {
    var status = chkBox.checked;
    	//将所有子元素设置为相同checked
    	var id=chkBox.id;
    	//获取所有'dd'+id下面的input:checkbox
    	$('#dd'+id).find(":checkbox").attr("checked",status);
}
function submitForm(){
	var url ='<%=request.getContextPath()%>/cbzpay/ecsauthmgr/update';
	var data = $("#authForm").serialize();
	showCover();
	$.post(url,data,function(obj){
		if(obj.err){
			alert(obj.msg);
		}else{
			alert("修改权限成功!");
			location.replace("<%=request.getContextPath()%>/cbMerchant/queryMerchant") ;
		}
		hideCover();
	});
}
</script>
</html>
