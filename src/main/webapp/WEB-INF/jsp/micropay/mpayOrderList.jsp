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
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/micropay/mpayOrder/queryMpayOrderList");
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
	
	
	function orderNotify(merchantNo,merchantOrderNo) {
		$.post( "<%=request.getContextPath()%>/micropay/mpayOrder/merchantNotifyProcess",{
			merchantNo:merchantNo,merchantOrderNo:merchantOrderNo
			},
			 function (res){
				if(res.err==true){
					alert("通知商户成功!");
					 query();
				}else{
					alert("通知商户失败!失败原因"+res.msg);
				}
			} 
		); 
	}
	
	function orderRefund(id,orderAmount,refundSucAmount){
		document.refundForm.reset();
		$("#id").val(id);
		var ableRefundAmount = orderAmount-refundSucAmount;
		$("#refundAmount").val(ableRefundAmount);
		$("#refund_panel").dialog({
			title:"退款",
			autoOpen:true,
			modal:true,
			width:300,
			height:300,
			buttons:{
				"提交":function(){
					var refundAmount=$("#refundAmount").val();
					if(refundAmount==""||refundAmount==null||refundAmount==undefined){
						alert("请输入退款金额");
						return false;
					}else if(refundAmount>ableRefundAmount){
						alert("退款金额大于可退款金额,可退款金额为："+ableRefundAmount+"元");
						return false;
					}
					var refundReason=$("#refundReason").val();
					if(refundReason==""||refundReason==null||refundReason==undefined){
						alert("请填写退款原因");
						return false;
					}
					var url = "<%=request.getContextPath()%>/micropay/mpayOrder/orderRefund";
					var params = $(document.refundForm).serialize();
					$.post(url,params,function(obj){
						if(obj.err){
							alert(obj.msg);
						}else{
							var msg = obj.msg;
							if(msg==null||msg==''||msg==undefined){
								msg='退款完成';
							}
							alert(msg);
							window.location.reload();
						}
						$("#refund_panel").dialog("close");
					});
				},
				"取消":function(){
					$("#refund_panel").dialog("close");
				}
			}
		});
		return false;
	}
	
	function querOrderToBank(id){
		$.post( "<%=request.getContextPath()%>/micropay/mpayOrder/querOrderToBank",{
				id:id
			},
			function (data){
				alert("订单状态："+data);
				window.location.reload();
			} 
		); 
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
													<input type="text" class="form-control" id="merchantNo" name="merchantNo" value="${mpayOrder.merchantNo}"/>
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
													<input type="text" class="form-control" id="merchantOrderNo" name="merchantOrderNo" value="${mpayOrder.merchantOrderNo}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
							    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">订单交易号</td>
											<td width="200">
												<div >
													<input type="text" class="form-control" id="tradeOrderNo" name="tradeOrderNo" value="${mpayOrder.tradeOrderNo}"/>
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
												<select class="form-control" tabindex="10" id="orderStatus" name="orderStatus">
													<option <c:if test="${mpayOrder.orderStatus=='' }">selected="selected"</c:if> value="">全部</option>
													<option <c:if test="${mpayOrder.orderStatus=='INIT' }">selected="selected"</c:if> value="INIT">初始化</option>
													<option <c:if test="${mpayOrder.orderStatus=='PROCESSING' }">selected="selected"</c:if> value="PROCESSING">处理中</option>
													<option <c:if test="${mpayOrder.orderStatus=='SUCCESS' }">selected="selected"</c:if> value="SUCCESS">成功</option>
													<option <c:if test="${mpayOrder.orderStatus=='REFUNDING' }">selected="selected"</c:if> value="REFUNDING">转入退款</option>
													<option <c:if test="${mpayOrder.orderStatus=='PART_REFUNDED' }">selected="selected"</c:if> value="PART_REFUNDED">部分退款</option>
													<option <c:if test="${mpayOrder.orderStatus=='WHOLE_REFUNDED' }">selected="selected"</c:if> value="WHOLE_REFUNDED">全额退款</option>
													<option <c:if test="${mpayOrder.orderStatus=='REVOKED' }">selected="selected"</c:if> value="REVOKED">已撤销</option>
													<option <c:if test="${mpayOrder.orderStatus=='FAIL' }">selected="selected"</c:if> value="FAIL">失败</option>
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
													<select class="form-control" tabindex="10" id="payMethod" name="payMethod">
														<option <c:if test="${mpayOrder.payMethod=='' }">selected="selected"</c:if> value="">全部</option>
														<option <c:if test="${mpayOrder.payMethod=='WEIXINPAY' }">selected="selected"</c:if> value="WEIXINPAY">微信支付</option>
														<option <c:if test="${mpayOrder.payMethod=='ALIPAY' }">selected="selected"</c:if> value="ALIPAY">支付宝支付</option>
														<option <c:if test="${mpayOrder.payMethod=='QQ_WALLET' }">selected="selected"</c:if> value="QQ_WALLET">QQ钱包</option>
														<option <c:if test="${mpayOrder.payMethod=='BAIDU_WALLET' }">selected="selected"</c:if> value="BAIDU_WALLET">百度钱包</option>
														<option <c:if test="${mpayOrder.payMethod=='JD_WALLET' }">selected="selected"</c:if> value="JD_WALLET">京东钱包</option>

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
													<select class="form-control" tabindex="10" id="payProduct" name="payProduct">
														<option <c:if test="${mpayOrder.payProduct=='' }">selected="selected"</c:if> value="">全部</option>
														<option <c:if test="${mpayOrder.payProduct=='SCAN_CARD' }">selected="selected"</c:if> value="SCAN_CARD">刷卡支付</option>
														<option <c:if test="${mpayOrder.payProduct=='CODE_SCAN' }">selected="selected"</c:if> value="CODE_SCAN">扫码支付</option>
														<option <c:if test="${mpayOrder.payProduct=='PUB_NUM' }">selected="selected"</c:if> value="PUB_NUM">公众号支付</option>
														<option <c:if test="${mpayOrder.payProduct=='APP' }">selected="selected"</c:if> value="APP">app支付</option>
														<option <c:if test="${mpayOrder.payProduct=='QUICKPAY' }">selected="selected"</c:if> value="QUICKPAY">快捷支付</option>
													</select>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">企业ID</td>
											<td width="200">
												<div >
													<input type="text" class="form-control" id="companyId" name="companyId" value="${mpayOrder.companyId}"/>
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
											<td width="90" class="text-right">上海商户订单号</td>
											<td width="200">
												<div >
													<input type="text" class="form-control" id="description" name="description" value="${mpayOrder.description}"/>
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
												<button onclick="down();"class="btn btn-danger"><i class="fa fa-search"></i>下载</button>
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
										<th><span>总笔数：${mpayOrderCount.totalCount}&nbsp;笔</span></th>
										<th><span>
											总金额：
											<c:choose>
												<c:when test="${mpayOrderCount.totalOrderAmount==null || mpayOrderCount.totalOrderAmount==''}">
													<fmt:formatNumber value="0.00" pattern="0.00"></fmt:formatNumber>
												</c:when>
												<c:otherwise>
													${mpayOrderCount.totalOrderAmount}
												</c:otherwise>
											</c:choose>
											&nbsp;元
										</span></th>
										<th><span>
											总手续费：
											<c:choose>
												<c:when test="${mpayOrderCount.totalOrderFee==null || mpayOrderCount.totalOrderFee==''}">
													<fmt:formatNumber value="0.00" pattern="0.00"></fmt:formatNumber>
												</c:when>
												<c:otherwise>
													${mpayOrderCount.totalOrderFee}
												</c:otherwise>
											</c:choose>
											&nbsp;元
										</span></th>
									</tr>
									<tr>
										<th><span>商户编号</span></th>
										<th><span>企业ID</span></th>
										<th><span>商户简称</span></th>
										<th><span>商户订单号</span></th>
										<th><span>订单交易号</span></th>
										<th><span>上海商户订单号</span></th>
										<th><span>交易时间</span></th>
										<th><span>支付方式</span></th>
										<th><span>支付产品</span></th>
										<th><span>币种</span></th>
										<th><span>订单金额</span></th>
										<th><span>手续费</span></th>
										<th><span>订单状态</span></th>
										<th><span>操作</span></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${mpayOrderList}" var="mpayOrderList">
										<tr>
										    <td hidden= true>${mpayOrderList.id}</td>
										    <td >${mpayOrderList.merchantNo}</td>
										    <td >${mpayOrderList.companyId}</td>
										    <td >${mpayOrderList.merchantShortName}</td>
										    <td >${mpayOrderList.merchantOrderNo}</td>
										    <td >${mpayOrderList.tradeOrderNo}</td>
										    <td >${mpayOrderList.description}</td>
											<td>
												<fmt:formatDate value="${mpayOrderList.merchantReqTime}" type="both"/>
											</td>
											<td>
											    <c:if test="${mpayOrderList.payMethod=='WEIXINPAY'}">
													微信支付
												</c:if>
											    <c:if test="${mpayOrderList.payMethod=='ALIPAY'}">
													支付宝
												</c:if>
												<c:if test="${mpayOrderList.payMethod=='QQ_WALLET'}">
													QQ钱包
												</c:if>
												<c:if test="${mpayOrderList.payMethod=='BAIDU_WALLET'}">
													百度钱包
												</c:if>
												<c:if test="${mpayOrderList.payMethod=='JD_WALLET'}">
													京东钱包
												</c:if>
											</td>
											<td>
											    <c:if test="${mpayOrderList.payMethod=='QUICKPAY'}">
													快捷支付
												</c:if>
												
	   										    <c:if test="${mpayOrderList.payProduct=='SCAN_CARD'}">
													刷卡支付
												</c:if>
												<c:if test="${mpayOrderList.payProduct=='CODE_SCAN'}">
													扫码支付
												</c:if>
												<c:if test="${mpayOrderList.payProduct=='PUB_NUM'}">
													公众号支付
												</c:if>
												<c:if test="${mpayOrderList.payProduct=='APP'}">
													app支付
												</c:if>
											</td>
											<td>
												<c:if test="${mpayOrderList.orderCurrency=='USD'}">
													美元
												</c:if>
												<c:if test="${mpayOrderList.orderCurrency=='CNY'}">
													人民币
												</c:if>
											</td>
										    <td >${mpayOrderList.orderAmount}</td>
										    <td >${mpayOrderList.orderFee}</td>
										    <td >
											    <c:if test="${mpayOrderList.orderStatus=='INIT'}">
													初始化
												</c:if>
												<c:if test="${mpayOrderList.orderStatus=='PROCESSING'}">
													处理中
												</c:if>
												<c:if test="${mpayOrderList.orderStatus=='SUCCESS'}">
													成功
												</c:if>
												<c:if test="${mpayOrderList.orderStatus=='REFUNDING'}">
													转入退款
												</c:if>
												<c:if test="${mpayOrderList.orderStatus=='PART_REFUNDED'}">
													部分退款
												</c:if>
												<c:if test="${mpayOrderList.orderStatus=='WHOLE_REFUNDED'}">
													全额退款
												</c:if>
												<c:if test="${mpayOrderList.orderStatus=='REVOKED'}">
													已撤销
												</c:if>
												<c:if test="${mpayOrderList.orderStatus=='FAIL'}">
													失败
												</c:if>
											</td>
											<td>
												<c:if test="${mpayOrderList.orderStatus=='SUCCESS'}">
													<a href="javascript:orderNotify('${mpayOrderList.merchantNo}','${mpayOrderList.merchantOrderNo}');">通知商户</a>
												</c:if>
												<c:if test="${mpayOrderList.orderStatus=='SUCCESS' || mpayOrderList.orderStatus=='PART_REFUNDED'}">
													<a href="javascript:orderRefund('${mpayOrderList.id}','${mpayOrderList.orderAmount}','${mpayOrderList.refundSucAmount}');">退款</a>
												</c:if>
												<c:if test="${mpayOrderList.orderStatus!='SUCCESS'}">
													<a href="javascript:querOrderToBank('${mpayOrderList.id}');">通道查单</a>
												</c:if>
												<a href="javascript:Info('${mpayOrderList.id}');">详情</a>
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
	<div id="refund_panel" style="display: none">
		<form name="refundForm">
			  <input type="hidden" name="id" id="id" value=""/>
			  <div class="form-group" id="realAmount_div">
			    <label for="refundAmount">退款金额</label>
			    <input type="number" class="form-control" id="refundAmount" name="refundAmount" placeholder="请输入退款金额" onblur="checkAmount(this);"> <label style="color:red;" id="error"></label>
			  </div>
			  <div class="form-group">
			    <label for="refundReason">退款原因</label>
			    <textarea class="form-control" id="refundReason" name="refundReason" placeholder="请认真填写退款原因" rows="" cols=""></textarea>
			  </div>
		</form>
	</div>
</body>
</html>
