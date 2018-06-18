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
	
	function query() {
		
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/micropay/mpayRefund/queryMpayRefundList");
		$("#queryForm").submit();
	}
	
	function Info(id) {
		window.location.href="<%=request.getContextPath()%>/micropay/mpayRefund/queryMpayRefundDetail?id="+id;
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
					<li>退款查询&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
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
													<input type="text" class="form-control" id="merchantNo" name="merchantNo" value="${mpayRefund.merchantNo}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
							    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">退款开始日期</td>
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
											<td width="90" class="text-right">退款结束日期</td>
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
											<td width="90" class="text-right">原商户订单号</td>
											<td width="190">
												<div >
													<input type="text" class="form-control" id="orgMerchantOrderNo" name="orgMerchantOrderNo" value="${mpayRefund.orgMerchantOrderNo}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
							    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">原订单交易号</td>
											<td width="190">
												<div >
													<input type="text" class="form-control" id="orgTradeOrderNo" name="orgTradeOrderNo" value="${mpayRefund.orgTradeOrderNo}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">退款请求号</td>
											<td width="200">
												<div>
													<input type="text" class="form-control" id="refundReqNo" name="refundReqNo" value="${mpayRefund.refundReqNo}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
							    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" >
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">退款状态</td>
											<td width="200">
												<select class="form-control" tabindex="10" id="refundStatus" name="refundStatus">
													<option <c:if test="${mpayRefund.refundStatus=='' }">selected="selected"</c:if> value="">全部</option>
													<option <c:if test="${mpayRefund.refundStatus=='INIT' }">selected="selected"</c:if> value="INIT">初始化</option>
													<option <c:if test="${mpayRefund.refundStatus=='ACCEPT' }">selected="selected"</c:if> value="ACCEPT">已受理</option>
													<option <c:if test="${mpayRefund.refundStatus=='PROCESSING' }">selected="selected"</c:if> value="PROCESSING">处理中</option>
													<option <c:if test="${mpayRefund.refundStatus=='REFUNDED' }">selected="selected"</c:if> value="REFUNDED">成功</option>
													<option <c:if test="${mpayRefund.refundStatus=='FAIL' }">selected="selected"</c:if> value="FAIL">失败</option>
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
													<select class="form-control" tabindex="10" id="orgPayMethod" name="orgPayMethod">
														<option <c:if test="${mpayRefund.orgPayMethod=='' }">selected="selected"</c:if> value="">全部</option>
														<option <c:if test="${mpayRefund.orgPayMethod=='WEIXINPAY' }">selected="selected"</c:if> value="WEIXINPAY">微信支付</option>
														<option <c:if test="${mpayRefund.orgPayMethod=='ALIPAY' }">selected="selected"</c:if> value="ALIPAY">支付宝支付</option>
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
													<select class="form-control" tabindex="10" id="orgPayProduct" name="orgPayProduct">
														<option <c:if test="${mpayRefund.orgPayProduct=='' }">selected="selected"</c:if> value="">全部</option>
														<option <c:if test="${mpayRefund.orgPayProduct=='SCAN_CARD' }">selected="selected"</c:if> value="SCAN_CARD">刷卡支付</option>
														<option <c:if test="${mpayRefund.orgPayProduct=='CODE_SCAN' }">selected="selected"</c:if> value="CODE_SCAN">扫码支付</option>
														<option <c:if test="${mpayRefund.orgPayProduct=='PUB_NUM' }">selected="selected"</c:if> value="PUB_NUM">公众号支付</option>
														<option <c:if test="${mpayRefund.orgPayProduct=='APP' }">selected="selected"</c:if> value="APP">app支付</option>
														<option <c:if test="${mpayRefund.orgPayProduct=='QUICKPAY' }">selected="selected"</c:if> value="QUICKPAY">快捷支付</option>
													</select>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">支付通道</td>
											<td  width="200"><select class="form-control" id="channelNo" name="channelNo">
												<option <c:if test="${mpayRefund.channelNo==''}">selected='selected'</c:if> value="">全部
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
									<th><span>总笔数：${totalCount}&nbsp;笔</span></th>
									<th><span>
											总金额：
											<c:choose>
												<c:when test="${totalRefundAmount==null || totalRefundAmount==''}">
													<fmt:formatNumber value="0.00" pattern="0.00"></fmt:formatNumber>
												</c:when>
												<c:otherwise>
													${totalRefundAmount}
												</c:otherwise>
											</c:choose>
											&nbsp;元
										</span></th>
									<th><span>
											总手续费：
											<c:choose>
												<c:when test="${totalRefundFee==null ||totalPaytotalRefundFeeFee==''}">
													<fmt:formatNumber value="0.00" pattern="0.00"></fmt:formatNumber>
												</c:when>
												<c:otherwise>
													${totalRefundFee}
												</c:otherwise>
											</c:choose>
											&nbsp;元
										</span></th>
								</tr>
									<tr>
										<th><span>商户编号</span></th>
										<th><span>原商户订单号</span></th>
										<th><span>原订单交易号</span></th>
										<th><span>退款请求号</span></th>
										<th><span>退款请求时间</span></th>
										<th><span>原支付方式</span></th>
										<th><span>原支付产品</span></th>
										<th><span>支付通道</span></th>
										<th><span>币种</span></th>
										<th><span>金额</span></th>
										<th><span>退款状态</span></th>
										<th><span>操作</span></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${mpayRefundList}" var="mpayRefundList">
										<tr>
										    <td hidden= true>${mpayRefundList.id}</td>
										    <td >${mpayRefundList.merchantNo}</td>
										    <td >${mpayRefundList.orgMerchantOrderNo}</td>
										    <td >${mpayRefundList.orgTradeOrderNo}</td>
										    <td >${mpayRefundList.refundReqNo}</td>
											<td>
												<fmt:formatDate value="${mpayRefundList.refundReqTime}" type="both"/>
											</td>
											<td>
											    <c:if test="${mpayRefundList.orgPayMethod=='WEIXINPAY'}">
													微信支付
												</c:if>
											    <c:if test="${mpayRefundList.orgPayMethod=='ALIPAY'}">
													支付宝
												</c:if>
											</td>
											<td>
											    <c:if test="${mpayRefundList.orgPayMethod=='QUICKPAY'}">
													快捷支付
												</c:if>
												
	   										    <c:if test="${mpayRefundList.orgPayProduct=='SCAN_CARD'}">
													刷卡支付
												</c:if>
												<c:if test="${mpayRefundList.orgPayProduct=='CODE_SCAN'}">
													扫码支付
												</c:if>
												<c:if test="${mpayRefundList.orgPayProduct=='PUB_NUM'}">
													公众号支付
												</c:if>
												<c:if test="${mpayRefundList.orgPayProduct=='APP'}">
													app支付
												</c:if>
											</td>
											<td>${mpayRefundList.channelNo}</td>
											<td>
												<c:if test="${mpayRefundList.refundCurrency=='USD'}">
													美元
												</c:if>
												<c:if test="${mpayRefundList.refundCurrency=='CNY'}">
													人民币
												</c:if>
											</td>
										    <td >${mpayRefundList.refundAmount}</td>
										    <td>
											    <c:if test="${mpayRefundList.refundStatus=='INIT'}">
													初始化
												</c:if>
												<c:if test="${mpayRefundList.refundStatus=='WAIT_PAY'}">
													待付款
												</c:if>
												<c:if test="${mpayRefundList.refundStatus=='PROCESSING'}">
													处理中
												</c:if>
												<c:if test="${mpayRefundList.refundStatus=='SUCCESS'}">
													成功
												</c:if>
												<c:if test="${mpayRefundList.refundStatus=='REFUNDING'}">
													转入退款
												</c:if>
												<c:if test="${mpayRefundList.refundStatus=='REFUNDED'}">
													已退款
												</c:if>
												<c:if test="${mpayRefundList.refundStatus=='REVOKED'}">
													已撤销
												</c:if>
												<c:if test="${mpayRefundList.refundStatus=='CLOSED'}">
													已关闭
												</c:if>
												<c:if test="${mpayRefundList.refundStatus=='FAIL'}">
													失败
												</c:if>
											</td>
											<td>
												<form action=""  method="post" enctype="multipart/form-data" class="form-horizontal">
													<input type="hidden" name="id" value="${mpayRefundList.id}"/>
													<a href="javascript:Info('${mpayRefundList.id}');">查看</a>
												</form>
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
	<script type="text/javascript">
        function loadChannel(){
            var selectedChannelNo="${mpayRefund.channelNo}";
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
