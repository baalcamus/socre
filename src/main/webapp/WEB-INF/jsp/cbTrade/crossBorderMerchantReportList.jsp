<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>跨境交易管理</title>
<script type="text/javascript">
	var contextpath = "${ctx}";

	function refresh() {
		$("#queryForm").submit();
	}
	function queyBank(){
		$("#queryForm").submit();
	}
	function addMerchant(){
		window.location.href ="<%=request.getContextPath()%>/static/cbTrade/forex/toCrossBorderMerchantReportAdd.do";
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
					<li>跨境交易管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li>跨境商户报备管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li class="active">跨境商户报备查询</li>
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
						<div class="row">
							<form action="<%=request.getContextPath()%>/cbTrade/forex/crossBorderMerchantReportList" method="post"  id="queryForm" class="queryForm" enctype="multipart/form-data" class="form-horizontal ">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="110" class="text-right">商户号</td>
											<td>
												<input type="text" maxlength="32" id="merchantNo" name="merchantNo" value="${tblBankCompanyInfoSend.merchantNo}" class="form-control">
											</td>
										</tr>
									</table>
								</div>
							</form>
							<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
								<table width="100%" class="product_detail_list">
									<tr>
										<td>
											<button type="submit" class="btn btn-danger" onclick="queyBank()">
												<i class="fa fa-search"></i> 查询
											</button>
										</td>
										<td>
											<button  class="btn btn-danger" onclick="addMerchant()">
												+商户报备
											</button>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!--这是查询模块结束-->
				<!--这是列表模块开始-->
				<div class="panel panel-default clearfix">
					<header class="panel-heading clearfix">
						<h2 class="panel-inner-title02">
							列表
							<a href="javascript:refresh()" class="pull-right"><i class="fa fa-refresh"></i>刷新</a>
						</h2>
					</header>
					<div class=" panel-body clearfix">
						<div class="table-responsive border0">
							<table class="table table-hover">
								<thead>
									<tr>
										<th><span>商户编号</span></th>
										<th><span>银行编码</span></th>
										<th><span>上送时间</span></th>
										<th><span>银行审核标志</span></th>
										<th><span>银行审核编码</span></th>
										<th><span>银行审核结果信息</span></th>
										<th><span>单位机构代码</span></th>
										<th><span>单位名称</span></th>
										<th><span>单位地址</span></th>
										<th><span>操作</span></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.list}" var="tblBankCompanyInfoSend">
										<tr>
											<td>${tblBankCompanyInfoSend.merchantNo}</td>
											<td>${tblBankCompanyInfoSend.bankId}</td>
											<td>
												<fmt:formatDate value="${tblBankCompanyInfoSend.sendTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
											</td>
											<td>${tblBankCompanyInfoSend.bankExamineFlag}</td>
											<td>${tblBankCompanyInfoSend.examineCode}</td>
											<td>${tblBankCompanyInfoSend.examineMsg}</td>
											<td>${tblBankCompanyInfoSend.orgNo}</td>
											<td>${tblBankCompanyInfoSend.companyName}</td>
											<td>${tblBankCompanyInfoSend.companyAddr}</td>
											<td><a href="<%=request.getContextPath()%>/static/cbTrade/forex/crossBorderMerchantReportDetail?id=${tblBankCompanyInfoSend.id}">详情</a></td>
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
