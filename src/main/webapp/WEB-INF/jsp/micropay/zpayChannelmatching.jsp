<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
.border0 {
	overflow: auto !important;
}

.border0 th, .border0 td {
	white-space: nowrap;
}
</style>
<title>微支付路由管理</title>

</head>

<body class=" ">
	<jsp:include page="../include/top.jsp" />
	<!--头部 end-->
	<div id="wrapper">
		<jsp:include page="../include/bottom.jsp" />
		<!-- 左侧内容 -->
		<jsp:include page="../include/left.jsp" />
		<div id="page-wrapper">
			<!--BEGIN TITLE & BREADCRUMB PAGE-->
			<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
				<ol class="breadcrumb page-breadcrumb">
					<li><i class="fa fa-home"></i>&nbsp;<a
						href="Organization_management.html">首页</a>&nbsp;&nbsp;<i
						class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
					<li>微支付管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<%--<li>支付记录查询&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;--%>
					<%--</li>--%>
					<li class="active">通道匹配</li>
				</ol>

				<div class="clearfix"></div>
			</div>
			<!--这是查询模块开始-->
			<div class="page-content">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title">通道匹配</h2>
					</div>
					<div class="panel-body">
					
						<div>
							<form id="queryForm" class="queryForm"
								enctype="multipart/form-data" class="form-horizontal">


								<div class="row">
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">

										
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="100%" class="text-left"><label>请选择通道:</label><select class="form-control" id="channelNo" name="channelNo"><option value="0">请选择</option></select></td>												
											</tr>
											<tr>
												<td width="100%" class="text-left"><label>请选择地区级别:</label><select class="form-control" id="level" name="level"><option value="0">请选择</option></select></td>														
											</tr>
											<tr>
												<td width="100%" class="text-left"><label>请选择地区:</label><select class="form-control" id="addressCode" name="platformAddressCode"><option value="0">请选择</option></select></td>														
											</tr>
											<tr>
												<td width="200" class="text-left"><label>请输入通道地区编码:</label><input id="channelAddressCode" name="channelAddressCode"  class="form-control"/></td>
											</tr>
											
											<tr>
												<td width="200" class="text-left"><button id="tj" class="btn btn-green"><i class="fa fa-search"></i>提交</button></td>
											</tr>	
										</table>
									</div>
								</div>									
							</form>
						</div>					
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	var contextpath = "${ctx}";	
	 var url="<%=request.getContextPath()%>/static/micropay/route/getchannelNoList";
		$.post(
			url,
			function(data){
				for(var i in data){					
					$("#channelNo").append($("<option value="+data[i].channelNo+">"+data[i].channelName+"</option>"));					
				}
			},
			"json"
		)
		
		
		 var url="<%=request.getContextPath()%>/static/micropay/route/getLevelList";
		$.post(
			url,
			function(data){
				for(var i in data){					
					$("#level").append($("<option value="+data[i].level+">"+data[i].level+"</option>"));				
				}
			},
			"json"
		)
						
		$(function(){
					
		$("#level").change(function(){
			$("#addressCode").empty();
			var level = $(this).val();
			
			 var url="<%=request.getContextPath()%>/static/micropay/route/getLastCityListByID";
			$.post(
				url,
				{level:level},
				function(data){
					for(var i in data){

						$("#addressCode").append($("<option value="+data[i].addressCode+">"+data[i].addressName+"</option>"));					
					}
				},
				"json"
			)
	
		})
				
			
			$("#tj").click(function(){
				
				var channelNo = $("#channelNo").val();
				var addressCode = $("#addressCode").val();
				var channelAddressCode = $("#channelAddressCode").val();

				if(channelNo != ""&&addressCode != ""&&channelAddressCode !=""){
					
					if(confirm("您 确定增加当前通道匹配吗？")){
						
					 var url="<%=request.getContextPath()%>/static/micropay/route/insertReportChannelAddress"; 
					$.post(
						url,
						$("form").serialize(),
						function(data){
							
							if(data > 0){
								alert("增加成功");
								
							}else{
								alert("增加失败");
							}
						},
						"json"				
					)
					}
				}else{
					
					alert("请填写全部内容");
				}
				
			})						
		});
	</script>
</body>
</html>
