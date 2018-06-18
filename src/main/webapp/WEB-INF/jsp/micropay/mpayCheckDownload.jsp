<!-- lx -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>微支付管理</title>
<script type="text/javascript">

	 var contextpath = "${ctx}"; 
	
	function checkBill() {
		
		var channelNo = $("#channelNo").val();
		var settleDate = $("#settleDate").val();
		
		if(channelNo==null||channelNo==''){
    		alert("请选择银行对账渠道");
    		return false;
    	}
		
		if(settleDate==null||settleDate==''){
    		alert("请选择银行对账日期");
    		return false;
    	}
		
		
		$.post( "<%=request.getContextPath()%>/micropay/check/checkBill",{
			settleDate:$("#settleDate").val(),
			channelNo:$("#channelNo").val(),
			},
			function (data){
				if(data=="success"){
					alert("已做生成对账文件操作!");
				}else{
					alert("操作失败!");
					window.location.reload();
				}
			}
			
		); 
		
	}
	/*
	function PlatformCheck() {

		var checkDate = $("#checkDate").val();

		if(checkDate==null||checkDate==''){
    		alert("请选择商户对账日期");
    		return false;
    	}


		$.post( "<%=request.getContextPath()%>/micropay/check/PlatformCheck",{
			checkDate:$("#checkDate").val(),
			},
			function (data){
				if(data=="success"){
					alert("已做生成对账文件操作!");
				}else{
					alert("操作失败!");
					window.location.reload();
				}
			}

		);

	}
	*/
</script>
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
					<li>对账管理&nbsp;&nbsp;</i>&nbsp;&nbsp;
					</li>
				</ol>

				<div class="clearfix"></div>
			</div>
			<!--END TITLE & BREADCRUMB PAGE-->
			<!--BEGIN CONTENT-->
			 <div class="page-content"> 
			
				<!--这是银行对账模块开始-->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title">银行对账管理</h2>
					</div>
					<div class="panel-body">
						<div class="row">
							<form action="" method="post"  id="checkBill" class="queryForm" enctype="multipart/form-data" class="form-horizontal ">
							    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="80" class="text-right">银行对账文件</td>
										</tr>
									</table>
								</div>
							    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="80" class="text-right">渠道</td>
											<td width="190">
												<div >
													<select class="form-control" id="channelNo" name="channelNo" value=""/>
												    <option  value="">请选择银行渠道</option>  
													<option  value="4">民生</option>
													<option  value="3">中信</option>
													<option  value="2">深金结-微信</option>
													<option  value="1">深金结-支付宝</option>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<td width="80" class="text-right">日期</td>
											<td width="190">
												<div >
													<input class="form-control" id="settleDate"
														   name="settleDate" value="${settleDate}"
														   onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
												</div>
											</td>
										</tr>
									</table>
								</div>
								
							<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
								<table width="100%" class="product_detail_list">
									<tr>
										<td>
										<input type="button" class="btn btn-danger" onclick="checkBill();" value="下载">
										</td>
									</tr>
								</table>
							</div>	
						</form>   
						</div>				
					</div>
				</div>
				<!--这是银行对账模块结束-->
<%--
				<!--这是商户对账模块开始-->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title">商户对账管理</h2>
					</div>
					<div class="panel-body">
						<div class="row">
							<form action="" method="post"  id="PlatformCheck" class="queryForm" enctype="multipart/form-data" class="form-horizontal ">						
							    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="80" class="text-right">商户对账文件</td>
										</tr>
									</table>
								</div>
							    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="80" class="text-right">日期</td>
											<td width="190">
												<div >
 												<input class="form-control" id="checkDate"
													   name="checkDate" value="${checkDate}"
													   onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
 												</div>
											</td>
										</tr>
									</table>
								</div>
							<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
								<table width="100%" class="product_detail_list">
									<tr>
										<td>
										<input type="button" class="btn btn-danger" onclick="PlatformCheck();" value="重新生成">
										</td>
									</tr>
								</table>
							</div>	
						  </form>	
						</div>		
					</div>
				</div>
				<!--这是商户对账模块结束-->
				 --%>
			</div> 
			<!--End CONTENT-->
		</div> 
		<!--右侧内容 end-->
	</div>
</body>
</html>
