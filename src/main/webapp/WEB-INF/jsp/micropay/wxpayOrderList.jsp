<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>微支付管理</title>
<script type="text/javascript">
	var contextpath = "${ctx}";
	
	function query() {
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/wxpay/queryWxPayOrderList");
		$("#queryForm").submit();
	}

	function down() {
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/wxpay/downWxPayOrderList");
		$("#queryForm").submit();
	}

	<%--function Info(id) {--%>
		<%--window.location.href="<%=request.getContextPath()%>/micropay/mpayOrder/queryMpayOrderDetail?id="+id;--%>
	<%--}--%>
	
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
					<li>订单查询&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
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
													<input type="text" class="form-control" id="subMchId" name="subMchId" value="${order.subMchId}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
							    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">交易开始日期</td>
											<td width="200">
												<div data-date-format="yyyy-mm-dd" class="input-group date datepicker-filter mbs">
													<span class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</span>
													<input type="text" class="form-control" id="beginDate" name="beginDate" value="${beginDate}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">交易结束日期</td>
											<td width="200">
												<div data-date-format="yyyy-mm-dd" class="input-group date datepicker-filter mbs">
													<span class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</span>
													<input type="text" class="form-control" id="endDate" name="endDate" value="${endDate}"/>
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
											<td width="90" class="text-right">订单号</td>
											<td width="200">
												<div >
													<input type="text" class="form-control" id="outTradeNo" name="outTradeNo" value="${order.outTradeNo}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
							    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" >
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">订单状态</td>
											<td width="200">
												<select class="form-control" tabindex="10" id="status" name="status">
													<option <c:if test="${order.status=='' }">selected="selected"</c:if> value="">全部</option>
													<option <c:if test="${order.status==0 }">selected="selected"</c:if> value=0>未处理</option>
													<option <c:if test="${order.status==1 }">selected="selected"</c:if> value=1>已支付</option>
													<option <c:if test="${order.status==2 }">selected="selected"</c:if> value=2>已撤销</option>
													<option <c:if test="${order.status==3 }">selected="selected"</c:if> value=3>部分退款</option>
													<option <c:if test="${order.status==4 }">selected="selected"</c:if> value=4>全额退款</option>
													<option <c:if test="${order.status==5 }">selected="selected"</c:if> value=5>退款审核中</option>
													<option <c:if test="${order.status==6 }">selected="selected"</c:if> value=6>订单已关闭 </option>
													<option <c:if test="${order.status==7 }">selected="selected"</c:if> value=7>支付失败</option>
													<option <c:if test="${order.status==8 }">selected="selected"</c:if> value=8>已预下单</option>
													<option <c:if test="${order.status==9 }">selected="selected"</c:if> value=9>支付中</option>
												</select>
											</td>
										</tr>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">支付方式</td>
											<td width="200">
												<div >
													<select class="form-control" tabindex="10" id="payType" name="payType">
														<option <c:if test="${order.payType=='' }">selected="selected"</c:if> value="">全部</option>
														<option <c:if test="${order.payType==1 }">selected="selected"</c:if> value=1>刷卡支付</option>
														<option <c:if test="${order.payType==2 }">selected="selected"</c:if> value=2>扫码支付</option>
														<option <c:if test="${order.payType==3 }">selected="selected"</c:if> value=3>app支付</option>
														<option <c:if test="${order.payType==4 }">selected="selected"</c:if> value=4>公众号支付</option>

													</select>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">通道名称</td>
											<td width="200">
												<div >
													<select class="form-control" tabindex="10" id="channelNo" name="channelNo">
														<option <c:if test="${order.channelNo=='' }">selected="selected"</c:if> value="">全部</option>
														<option <c:if test="${order.channelNo=='STJ' }">selected="selected"</c:if> value="STJ">深圳结算中心</option>
														<option <c:if test="${order.channelNo=='CMBC' }">selected="selected"</c:if> value="CMBC">民生</option>
													</select>
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
												<button  type="submit" class="btn btn-danger" onclick="down();">
													<i class="fa fa-search"></i> 下载
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
									<th><span>总笔数：${orderCount}&nbsp;笔</span></th>
									<th><span>
											总金额：${totalAmount}&nbsp;元
										</span></th>
									<tr>
										<th><span>商户编号</span></th>
										<th><span>商户简称</span></th>
										<th><span>订单号</span></th>
										<th><span>交易时间</span></th>
										<th><span>支付方式</span></th>
										<th><span>金额（元）</span></th>
										<th><span>订单状态</span></th>
										<th><span>渠道</span></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${wxPayOrderList}" var="wxPayOrder">
										<tr>
										    <td >${wxPayOrder.subMchId}</td>
										    <td >${wxPayOrder.name}</td>
										    <td >${wxPayOrder.outTradeNo}</td>
											<td>
												<fmt:formatDate value="${wxPayOrder.reqTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
											</td>
											<td>
											    <c:if test="${wxPayOrder.payType==1}">
													刷卡支付
												</c:if>
											    <c:if test="${wxPayOrder.payType==2}">
													扫码支付
												</c:if>
												<c:if test="${wxPayOrder.payType==3}">
													APP支付
												</c:if>
												<c:if test="${wxPayOrder.payType==4}">
													公众号支付
												</c:if>
											</td>
										    <td > <fmt:formatNumber type="number"
																	pattern="###.##" value="${wxPayOrder.totalFee}" /></td>
										    <td>
												<c:if test="${wxPayOrder.status==0}">
													未处理
												</c:if>
											    <c:if test="${wxPayOrder.status==1}">
													已支付
												</c:if>
												<c:if test="${wxPayOrder.status==2}">
													已撤销
												</c:if>
												<c:if test="${wxPayOrder.status==3}">
													部分退款
												</c:if>
												<c:if test="${wxPayOrder.status==4}">
													全额退款
												</c:if>
												<c:if test="${wxPayOrder.status==5}">
													退款审核中
												</c:if>
												<c:if test="${wxPayOrder.status==6}">
													订单已关闭
												</c:if>
												<c:if test="${wxPayOrder.status==7}">
													支付失败
												</c:if>
												<c:if test="${wxPayOrder.status==8}">
													已预下单
												</c:if>
												<c:if test="${wxPayOrder.status==9}">
													初始化
												</c:if>

											</td>
											<td>
												<c:if test="${wxPayOrder.channelNo =='CMBC'}">
													民生银行：
												</c:if>
												<c:if test="${wxPayOrder.channelNo == null or wxPayOrder.channelNo == '' }">
													深圳结算中心
												</c:if>
											</td>
											<td>
												<%--<form action=""  method="post" enctype="multipart/form-data" class="form-horizontal">--%>
													<%--<input type="hidden" name="id" value="${mpayOrderList.id}"/>--%>
													<%--<a href="javascript:Info('${mpayOrderList.id}');">查看</a>--%>
												<%--</form>--%>
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
