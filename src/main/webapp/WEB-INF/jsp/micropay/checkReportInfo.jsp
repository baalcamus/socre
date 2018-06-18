<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>检查报备回执</title>
<script type="text/javascript">
	var contextpath = "${ctx}";
	
	function query() {
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/micropay/checkReportInfo");
		$("#queryForm").submit();
	}

	function down(){
		var params = $("#queryForm").serialize();
		var url ="<%=request.getContextPath()%>/micropay/mpayOrder/downMpayOrderList?"+params;
		window.open(url);
	}
	
	function Info(id) {
		window.location.href="<%=request.getContextPath()%>/micropay/mpayOrder/queryMpayOrderDetail?id="+id;
	}
	
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
					<li>检查报备回执&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
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
							<div class="row">
							    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">企业ID</td>
											<td width="200">
												<div >
													<input type="text" class="form-control" id="companyId" name="companyId" value="${companyId}"/>
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
							回执成功列表
						</h2>
					</header>
					<div class=" panel-body clearfix">
						<div class="table-responsive border0">
							<c:if test="${fn:length(checkedList)>0}">
								<table border="1">
									<tr>
										<td align="center">小商编</td>
										<td align="center">商户号</td>
									</tr>
									<tr>
										<td>
											<c:forEach items="${checkedList}" var="checkedList">
												${checkedList.thirdMerId},
											</c:forEach>
										</td>
										<td>
											<c:forEach items="${checkedList}" var="checkedList">
												${checkedList.bankMerchantCode},
											</c:forEach>
										</td>
									</tr>
								</table>
							</c:if>
						</div>
					</div>
				</div>
				<div class="panel panel-default clearfix">
					<header class="panel-heading clearfix">
						<h2 class="panel-inner-title02">
							回执失败列表
						</h2>
					</header>
					<div class=" panel-body clearfix">
						<div class="table-responsive border0">
							<c:if test="${fn:length(unCheckList)>0}">
								<table border="1">
									<tr>
										<td align="center">小商编</td>
										<td align="center">商户号</td>
									</tr>
									<tr>
										<td>
											<c:forEach items="${unCheckList}" var="unCheckList">
												${unCheckList.thirdMerId},
											</c:forEach>
										</td>
										<td>
											<c:forEach items="${unCheckList}" var="unCheckList">
												${unCheckList.bankMerchantCode},
											</c:forEach>
										</td>
									</tr>
								</table>
							</c:if>
						</div>
					</div>
				</div>
				<!--这是列表模块结束-->
			</div>
			<!--End CONTENT-->
		</div>
		<!--右侧内容 end-->
	</div>
</body>
</html>
