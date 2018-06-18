<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<%-- <script type="text/JavaScript" src="<%=request.getContextPath()%>/statics/v2/js/My97DatePicker_1/WdatePicker.js"></script>  --%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>账务查询</title>
<script type="text/javascript">
	var contextpath = "${ctx}";

	function formSubmit() {
		$("#queryForm").submit();
	}
	
	function refresh() {
		$("#queryForm").submit();
	}
	
	function queryDetail(id) {
		window.location.href="<%=request.getContextPath()%>/ledger/queryLedgerDetail?id="+id;
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
						<li>账务管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li class="active">账务查询</li>
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
							<form action="<%=request.getContextPath()%>/ledger/selectLedgerList.do" method="post" id="queryForm" name="queryForm"
								enctype="multipart/form-data" class="form-horizontal ">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />
                                <div class="row">
									<div class="col-lg-4 col-md-4 ">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">商户号</td>
												<td>
													<input id="merchantNo" name ="merchantNo" value="${normalAccounting.merchantNo}"  class="form-control" /> 
												</td>
											</tr>
											<tr>
												<td width="110" class="text-right">商户订单号</td>
												<td>
													<input id="merchantOrderNo" name ="merchantOrderNo" value="${normalAccounting.merchantOrderNo}"  class="form-control"/> 
												</td>
											</tr>
										</table>
									</div>
									<div class="col-lg-4 col-md-4 ">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">业务请求号</td>
												<td>
													<input id="bizNo" name ="bizNo" value="${normalAccounting.bizNo}"  class="form-control"/> 
												</td>
											</tr>
											<tr>
												<td width="110" class="text-right">入账状态</td>
												<td>
													<select id="accountingStatus" name="accountingStatus" class="form-control">
														<option <c:if test="${normalAccounting.accountingStatus==''}">selected='seleceted'</c:if> value="">请选择</option>
														<option <c:if test="${normalAccounting.accountingStatus=='WAIT'}">selected='seleceted'</c:if> value="WAIT">待入账</option>
														<option <c:if test="${normalAccounting.accountingStatus=='SUCCESS'}">selected='seleceted'</c:if> value="SUCCESS">成功</option>
														<option <c:if test="${normalAccounting.accountingStatus=='FAIL'}">selected='seleceted'</c:if> value="FAIL">失败</option>
													</select>
												</td>
											</tr>
										</table>
									</div>
									
									<div class="col-lg-4 col-md-4 ">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">账务类型</td>
												<td>
													<select id="accountingType" name="accountingType" class="form-control">
														<option <c:if test="${normalAccounting.accountingType==''}">selected='seleceted'</c:if> value="">请选择</option>
														<option <c:if test="${normalAccounting.accountingType=='NORMAL'}">selected='seleceted'</c:if> value="NORMAL">标准</option>
														<option <c:if test="${normalAccounting.accountingType=='OUT'}">selected='seleceted'</c:if> value="OUT">外部</option>
														<option <c:if test="${normalAccounting.accountingType=='SPLIT'}">selected='seleceted'</c:if> value="SPLIT">分账</option>
														<option <c:if test="${normalAccounting.accountingType=='REFUND'}">selected='seleceted'</c:if> value="REFUND">退款</option>
														<option <c:if test="${normalAccounting.accountingType=='SETTLEMENT'}">selected='seleceted'</c:if> value="SETTLEMENT">结算</option>
														<option <c:if test="${normalAccounting.accountingType=='CORRECT'}">selected='seleceted'</c:if> value="CORRECT">回冲</option>
														<option <c:if test="${normalAccounting.accountingType=='BALANCEPAY'}">selected='seleceted'</c:if> value="BALANCEPAY">余额支付</option>
														<option <c:if test="${normalAccounting.accountingType=='BALANCECORRECT'}">selected='seleceted'</c:if> value="BALANCECORRECT">余额支付回冲</option>
													</select>
												</td>
											</tr>
											<tr>
												<td>
												</td>
												<td>
												<input type="button" onclick="formSubmit()" value="查询" class="btn btn-danger"/>
												</td>
											</tr>
										</table>
									</div>
								</div>
								
								<center></center>
							</form>
						</div>
					</div>
					<!--这是查询模块结束-->
					
					<div class="panel panel-default clearfix">
						<header class="panel-heading clearfix">
							<h2 class="panel-inner-title02">
								列表<a href="javascript:refresh()" class="pull-right"><i
									class="fa fa-refresh"></i> 刷新</a>
							</h2>
						</header>
						<div class=" panel-body clearfix">
							<div class="table-responsive border0">
								<table class="table table-hover">
								
									<thead>
										<tr align="center">
											<td><span>商户号</span></td>
											<td><span>商户订单号</span></td>
											<td><span>业务请求号</span></td>
											<td><span>账务类型</span></td>
											<td><span>入账状态</span></td>
											<td><span>交易金额</span></td>
											<td><span>手续费</span></td>
											<td><span>入账金额</span></td>
											<td><span>创建日期</span></td>
											<td><span>操作</span></td>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${page.list}" var="ledger">
										<tr align="center">
											<td>${ledger.merchantNo}</td>
											<td>${ledger.merchantOrderNo}</td>
											<td>${ledger.bizNo}</td>
											<td>
												<c:if test="${ledger.accountingType=='NORMAL'}">
													标准
												</c:if>
												<c:if test="${ledger.accountingType=='SPLIT'}">
													分账
												</c:if>
												<c:if test="${ledger.accountingType=='OUT'}">
													外部
												</c:if>
												<c:if test="${ledger.accountingType=='REFUND'}">
													退款
												</c:if>
												<c:if test="${ledger.accountingType=='SETTLEMENT'}">
													结算
												</c:if>
												<c:if test="${ledger.accountingType=='CORRECT'}">
													回冲
												</c:if>
												<c:if test="${ledger.accountingType=='BALANCEPAY'}">
													余额支付
												</c:if>
											</td>
											<td>
												<c:if test="${ledger.accountingStatus=='WAIT'}">
													待入账
												</c:if>
												<c:if test="${ledger.accountingStatus=='SUCCESS'}">
													成功
												</c:if>
												<c:if test="${ledger.accountingStatus=='FAIL'}">
													失败
												</c:if>
											</td>
											<td>${ledger.tradeAmount}</td>
											<td>${ledger.tradeFee}</td>
											<td>${ledger.accountingAmount}</td>
											<td>
												<fmt:formatDate value="${ledger.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
											</td>
											<td>
												<a href="javascript:void(0);" onclick="queryDetail('${ledger.id}')">详情</a>
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
	</div>
</body>
</html>
