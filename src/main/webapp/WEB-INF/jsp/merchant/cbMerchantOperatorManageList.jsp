<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>商户操作员信息管理</title>
</head>
<script type="text/javascript">
	function query() {
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/cbMerchant/cbMerchantOperatorManageList");
		$("#queryForm").submit();
	}
	
	function freezeOperator(mufCstno,mufUserno,type) {
		$.post( "<%=request.getContextPath()%>/static/cbMerchant/freezeOperator",{
			mufCstno:mufCstno,
			mufUserno:mufUserno,
			type:type
			},
			function (res){
				if(res.err==true){
					alert("冻结成功!");
					query();
				}else{
					alert("冻结失败!失败原因"+res.msg);
				}
			} 
		);
	}
	
	function unfreezeOperator(mufCstno,mufUserno) {
		$.post( "<%=request.getContextPath()%>/static/cbMerchant/unfreezeOperator",{
			mufCstno:mufCstno,
			mufUserno:mufUserno
			},
			function (res){
				if(res.err==true){
					alert("解冻成功!");
					query();
				}else{
					alert("解冻失败!失败原因"+res.msg);
				}
			} 
		);
	}
	
	function resetPassword(mufCstno,mufUserno) {
		$.post( "<%=request.getContextPath()%>/static/cbMerchant/resetPassword",{
			mufCstno:mufCstno,
			mufUserno:mufUserno
			},
			function (res){
				if(res.err==true){
					alert("密码重置成功!");
					query();
				}else{
					alert("密码重置失败!失败原因"+res.msg);
				}
			} 
		);
	}
</script>
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
					<li>商户操作员信息管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li>商户操作员信息列表&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li class="active">查询</li>
				</ol>

				<div class="clearfix"></div>
			</div>
			<!--END TITLE & BREADCRUMB PAGE-->
			<!--BEGIN CONTENT-->
			<div class="page-content">
				<!--这是查询模块开始-->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title">查询</h2>
					</div>
					<div class="panel-body">
						<form action="" method="post"  id="queryForm" class="queryForm" enctype="multipart/form-data" class="form-horizontal ">
							<input type="hidden" name="pageNum" value="${page.pageNum }" />
							<input type="hidden" name="pageSize" value="${page.pageSize }" />
							<div class="row">
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">商户名称</td>
											<td width="200">
												<div >
													<input type="text" class="form-control" id="merchantName" name="merchantName" value="${cbMerchantOperator.merchantName}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
							    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">创建开始日期</td>
											<td width="200">
												<div data-date-format="yyyy-mm-dd" class="input-group date datepicker-filter mbs">
													<span class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</span>
													<input type="text" class="form-control" id="beginDate" name="beginDate" value="${cbMerchantOperator.beginDate}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">创建结束日期</td>
											<td width="200">
												<div data-date-format="yyyy-mm-dd" class="input-group date datepicker-filter mbs">
													<span class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</span>
													<input type="text" class="form-control" id="endDate" name="endDate" value="${cbMerchantOperator.endDate}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</div>
							<div class="row">
							    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">操作员名称</td>
											<td width="200">
												<div >
													<input type="text" class="form-control" id="operatorName" name="operatorName" value="${cbMerchantOperator.operatorName}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td></td>
											<td>
												<button  type="submit" class="btn btn-danger" onclick="query();">
													<i class="fa fa-search"></i> 查询
												</button>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</form>				
					</div>
				</div>
				<!--这是查询模块结束-->
				<!--这是列表模块开始-->
				<div class="panel panel-default clearfix">
					<header class="panel-heading clearfix">
						<h2 class="panel-inner-title02">
							列表
						</h2>
					</header>
					<div class=" panel-body clearfix">
						<div class="table-responsive border0">
							<table class="table table-hover">
								<thead>
									<tr>
										<th><span>登录名</span></th>
										<th><span>操作员姓名</span></th>
										<th><span>所属商户</span></th>
										<th><span>注册时间</span></th>
										<th><span>上次登录时间</span></th>
										<th><span>状态</span></th>
										<th><span>操作</span></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.list}" var="cbMerchantOperator">
										<tr>
										    <td >${cbMerchantOperator.logingName}</td>
										    <td >${cbMerchantOperator.operatorName}</td>
										    <td >${cbMerchantOperator.merchantName}</td>
										    <td >${cbMerchantOperator.registerTime}</td>
										    <td >${cbMerchantOperator.onceLogingTime}</td>
										    <td >
										    	<c:if test="${cbMerchantOperator.status == '0' }">正常</c:if>
										    	<c:if test="${cbMerchantOperator.status == '1' }">未激活</c:if>
										    	<c:if test="${cbMerchantOperator.status == '2' }">冻结</c:if>
										    	<c:if test="${cbMerchantOperator.status == '3' }">注销</c:if>
										    	<c:if test="${cbMerchantOperator.status == '4' }">待审核</c:if>
										    <td>
										    	<c:if test="${cbMerchantOperator.status == '0' }">
										    		<a href="javascript:freezeOperator('${cbMerchantOperator.mufCstno}','${cbMerchantOperator.mufUserno}');">冻结</a>
										    		<a href="javascript:resetPassword('${cbMerchantOperator.mufCstno}','${cbMerchantOperator.mufUserno}');">密码重置</a>
										    	</c:if>
										    	<c:if test="${cbMerchantOperator.status == '2' || cbMerchantOperator.status == '5'}">
										    		<a href="javascript:unfreezeOperator('${cbMerchantOperator.mufCstno}','${cbMerchantOperator.mufUserno}');">解冻</a>
										    	</c:if>
										    </td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<jsp:include page="../include/page.jsp" />
				<!--这是列表模块结束-->
			</div>
			<!--End CONTENT-->
		</div>
		<!--右侧内容 end-->
	</div>
</body>
</html>
