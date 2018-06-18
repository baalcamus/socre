<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>支付记录查询</title>
<style type="text/css">
.border0 {
	overflow: auto !important;
}

.border0 th, .border0 td {
	white-space: nowrap;
}
</style>
<script type="text/javascript">
	var contextpath = "${ctx}";
	
	function query() {
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/static/micropay/mpayPayment/queryMpayPaymentList");
		$("#queryForm").submit();
	}

	function down(){
		var params = $("#queryForm").serialize();
		var url ="<%=request.getContextPath()%>/static/micropay/mpayPayment/downMpayPaymentList?"+params;
		window.open(url,'','height=-999,width=-999,top=-9999,left=-9999');
		return;
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
					<li>支付记录查询&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
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
						<form action="" method="post"  id="queryForm" class="queryForm" enctype="multipart/form-data" class="form-horizontal">
							<input type="hidden" name="pageNum" value="${page.pageNum }" />
							<input type="hidden" name="pageSize" value="${page.pageSize }" />
							<div class="row">
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">商户编号</td>
											<td width="200">
												<div >
													<input type="text" class="form-control" id="merchantNo" name="merchantNo" value="${mpayPayment.merchantNo}"/>
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
											<td width="90" class="text-right">商户订单号</td>
											<td width="200">
												<div >
													<input type="text" class="form-control" id="merchantOrderNo" name="merchantOrderNo" value="${mpayPayment.merchantOrderNo}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
							    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">平台流水号</td>
											<td width="200">
												<div >
													<input type="text" class="form-control" id="tradeOrderNo" name="tradeOrderNo" value="${mpayPayment.tradeOrderNo}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
							    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" >
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">支付流水号</td>
											<td width="200">
												<div >
													<input type="text" class="form-control" id="paymentSerialNo" name="paymentSerialNo" value="${mpayPayment.paymentSerialNo}"/>
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
												<td width="90" class="text-right">支付通道</td>
												<td  width="200"><select class="form-control" id="channelNo" name="channelNo">
													<option <c:if test="${mpayPayment.channelNo==''}">selected='selected'</c:if> value="">全部
													</select>
												</td>
											</tr>
										</table>
									</div>
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">支付方式</td>
											<td width="200">
												<div >
													<select class="form-control" tabindex="10" id="payMethod" name="payMethod">
														<option <c:if test="${mpayPayment.payMethod=='' }">selected="selected"</c:if> value="">全部</option>
														<option <c:if test="${mpayPayment.payMethod=='WEIXINPAY' }">selected="selected"</c:if> value="WEIXINPAY">微信支付</option>
														<option <c:if test="${mpayPayment.payMethod=='ALIPAY' }">selected="selected"</c:if> value="ALIPAY">支付宝支付</option>
														<option <c:if test="${mpayPayment.payMethod=='QQ_WALLET' }">selected="selected"</c:if> value="QQ_WALLET">QQ钱包</option>
														<option <c:if test="${mpayPayment.payMethod=='BAIDU_WALLET' }">selected="selected"</c:if> value="BAIDU_WALLET">百度钱包</option>
														<option <c:if test="${mpayPayment.payMethod=='JD_WALLET' }">selected="selected"</c:if> value="JD_WALLET">京东钱包</option>
														<option <c:if test="${mpayPayment.payMethod=='UNION_WALLET' }">selected="selected"</c:if> value="UNION_WALLET">银联钱包</option>
													</select>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">支付产品</td>
											<td width="200">
												<div >
													<select class="form-control" id="payProduct" name="payProduct">
														<option <c:if test="${mpayPayment.payProduct=='' }">selected="selected"</c:if> value="">全部</option>
														<option <c:if test="${mpayPayment.payProduct=='SCAN_CARD' }">selected="selected"</c:if> value="SCAN_CARD">刷卡支付</option>
														<option <c:if test="${mpayPayment.payProduct=='CODE_SCAN' }">selected="selected"</c:if> value="CODE_SCAN">扫码支付</option>
														<option <c:if test="${mpayPayment.payProduct=='PUB_NUM' }">selected="selected"</c:if> value="PUB_NUM">公众号支付</option>
														<option <c:if test="${mpayPayment.payProduct=='APP' }">selected="selected"</c:if> value="APP">app支付</option>
														<option <c:if test="${mpayPayment.payProduct=='QUICKPAY' }">selected="selected"</c:if> value="QUICKPAY">快捷支付</option>
													</select>
												</div>
											</td>
										</tr>
									</table>
								</div>
								
							</div>
							<div class="row">
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" >
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">订单状态</td>
											<td width="200">
												<select class="form-control" tabindex="10" id="paymentStatus" name="paymentStatus">
													<option <c:if test="${mpayPayment.paymentStatus=='' }">selected="selected"</c:if> value="">全部</option>
													<option <c:if test="${mpayPayment.paymentStatus=='INIT' }">selected="selected"</c:if> value="INIT">初始化</option>
													<option <c:if test="${mpayPayment.paymentStatus=='PROCESSING' }">selected="selected"</c:if> value="PROCESSING">处理中</option>
													<option <c:if test="${mpayPayment.paymentStatus=='SUCCESS' }">selected="selected"</c:if> value="SUCCESS">成功</option>
													<option <c:if test="${mpayPayment.paymentStatus=='FAIL' }">selected="selected"</c:if> value="FAIL">失败</option>
												</select>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td></td>
											<td>
												<button  class="btn btn-danger" onclick="javascript:query();return false;">
													<i class="fa fa-search"></i> 查询
												</button>
												<button onclick="javascript:down();return false;"class="btn btn-danger"><i class="fa fa-search"></i>下载</button>
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
										<th><span>总笔数：${totalCount}&nbsp;笔</span></th>
										<th><span>
											总金额：
											<c:choose>
												<c:when test="${totalPayAmount==null || totalPayAmount==''}">
													<fmt:formatNumber value="0.00" pattern="0.00"></fmt:formatNumber>
												</c:when>
												<c:otherwise>
													${totalPayAmount}
												</c:otherwise>
											</c:choose>
											&nbsp;元
										</span></th>
										<th><span>
											总手续费：
											<c:choose>
												<c:when test="${totalPayFee==null ||totalPayFee==''}">
													<fmt:formatNumber value="0.00" pattern="0.00"></fmt:formatNumber>
												</c:when>
												<c:otherwise>
													${totalPayFee}
												</c:otherwise>
											</c:choose>
											&nbsp;元
										</span></th>
									</tr>
									<tr>
										<th><span>商户编号</span></th>
										<th><span>商户订单号</span></th>
										<th><span>订单交易号</span></th>
										<th><span>支付流水号</span></th>
										<th><span>订单金额</span></th>
										<th><span>支付金额</span></th>
										<th><span>支付手续费</span></th>
										<th><span>交易时间</span></th>
										<th><span>支付通道</span></th>
										<th><span>支付方式</span></th>
										<th><span>支付产品</span></th>
										<th><span>支付状态</span></th>
										<th><span>订单支付成功时间</span></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.list }" var="payment">
										<tr>
											<td>${payment.merchantNo }</td>
											<td>${payment.merchantOrderNo }</td>
											<td>${payment.tradeOrderNo }</td>
											<td>${payment.paymentSerialNo}</td>
											<td>${payment.orderAmount }</td>
											<td>${payment.payAmount }</td>
											<td>${payment.payFee }</td>
											<td><fmt:formatDate value="${payment.merchantReqTime}" type="both"/></td>
											<td>${payment.d_channelNo }</td>
											<td>${payment.d_payMethod }</td>
											<td>${payment.d_payProduct }</td>
											<td>${payment.d_paymentStatus }</td>
											<td><fmt:formatDate value="${payment.bankSuccessTime}" type="both"/></td>
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
	<script type="text/javascript">
	function loadChannel(){
		var selectedChannelNo="${mpayPayment.channelNo}";
		var url="<%=request.getContextPath()%>/static/micropay/getZpayChannel";
		$.post(url,{},function(channels){
			$("#channelNo option:not(:first)").remove();
			for(var i in channels){
				var channel = channels[i];
				var val=channel.channelNo;
    			var name=channel.channelName;
    			var selected=(selectedChannelNo==channel.channelNo);
    			var disabled=(channel.status!='VALID');
                var stylel=disabled?'color:red':'';
    			$("#channelNo").append("<option style='"+stylel+"' value='"+val+"' "+(disabled?'disabled':'')+(selected?' selected':'')+">"+name);
			}
		});
	}
	$(document).ready(function(){
		loadChannel();
    });
	</script>
</body>
</html>
