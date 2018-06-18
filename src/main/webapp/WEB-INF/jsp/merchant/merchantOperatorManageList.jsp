<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="en">
<head>
<title>商户操作员信息管理</title>
</head>
<script type="text/javascript">
	function query() {
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/merchant/cbMerchantOperatorManageList");
		$("#queryForm").submit();
	}
	
	function setDie(uid,ln) {
		$.post( "<%=request.getContextPath()%>/merchant/setDie",{
			id:uid,
			loginName:ln
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
	
	function setLife(uid,ln) {
		$.post( "<%=request.getContextPath()%>/merchant/setLife",{
			id:uid,
			loginName:ln
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
	
	function resetPassword(uid,ln) {
		$.post( "<%=request.getContextPath()%>/merchant/resetPassword",{
			id:uid,
			loginName:ln
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
											<td width="90" class="text-right">商户编号</td>
											<td width="200">
												<div >
													<input type="text" class="form-control" id="merId" name="merId" value="${user.merId}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
							    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">登陆用户名</td>
											<td width="200">
												<input type="text" class="form-control" id="loginName" name="loginName" value="${user.loginName}"/>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">管理员姓名</td>
											<td width="200">					
											<input type="text" class="form-control" id="realName" name="realName" value="${user.realName}"/>
											</td>
										</tr>
									</table>
								</div>
							</div>
							<div class="row">
<!-- 							    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12"> -->
<!-- 									<table width="100%" class="product_detail_list"> -->
<!-- 										<tr> -->
<!-- 											<td width="90" class="text-right">建立用户</td> -->
<!-- 											<td width="200"> -->
<!-- 												<div > -->
<%-- 													<input type="text" class="form-control" id="createLoginName" name="createLoginName" value="${user.createLoginName}"/> --%>
<!-- 												</div> -->
<!-- 											</td> -->
<!-- 										</tr> -->
<!-- 									</table> -->
<!-- 								</div> -->
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
										<th><span>登录用户名</span></th>
										<th><span>管理员姓名</span></th>
										<th><span>商户编码</span></th>
										<th><span>注册时间</span></th>
										<th><span>状态</span></th>
										<th><span>操作</span></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.list}" var="user">
										<tr>
										    <td >${user.loginName}</td>
										    <td >${user.realName}</td>
										    <td >${user.merId}</td>
										    <td >
											<fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
										    </td>
										    <td >
										    	<c:if test="${user.status == '0' }">正常</c:if>
										    	<c:if test="${user.status == '1' }">未激活</c:if>
										    	<c:if test="${user.status == '2' }">冻结</c:if>
<%-- 										    	<c:if test="${cbMerchantOperator.status == '3' }">注销</c:if> --%>
<%-- 										    	<c:if test="${cbMerchantOperator.status == '4' }">待审核</c:if> --%>
										    </td>
										    <td>
										    	<c:if test="${user.status == '0'}">
										    		<a href="javascript:setDie('${user.id}','${user.loginName}');">冻结</a>
										    		<a href="javascript:resetPassword('${user.id}','${user.loginName}');">密码重置</a>
										    	</c:if>
										    	<c:if test="${user.status == '2'}">
										    		<a href="javascript:setLife('${user.id}','${user.loginName}');">解冻</a>
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
