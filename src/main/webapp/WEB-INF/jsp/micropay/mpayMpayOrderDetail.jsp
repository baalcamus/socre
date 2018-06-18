<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>微支付管理</title>
<script type="text/javascript">	

</script>
</head>

<body class=" ">
	<jsp:include page="../include/top.jsp" />
	<!--头部 end-->
	<div id="wrapper">
		<jsp:include page="../include/bottom.jsp" />
		<!-- 左侧内容 -->
		<jsp:include page="../include/left.jsp" />
			<!--右侧内容 start-->
			<div id="page-wrapper">
				<!--BEGIN TITLE & BREADCRUMB PAGE-->
				<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
					<ol class="breadcrumb page-breadcrumb">
						<li>
							<i class="fa fa-home"></i>&nbsp;<a href="Organization_management.html">首页</a>&nbsp;&nbsp;
							<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li>微支付管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li>订单详情&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
					</ol>
					<div class="clearfix"></div>
				</div>
				<!--END TITLE & BREADCRUMB PAGE-->
				<!--BEGIN CONTENT-->
				<div class="page-content">
					<div class="row clearfix">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h2 class="panel-title">订单详情</h2>
								</div>
								<div class="panel-body">
								  <div class="row">
                        <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
                          
                           <table border="1" width="100%" class="product_detail_list">
                           	 <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">商户编号</td>
                             	<td width="200">${mpayOrder.merchantNo}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">商户简称</td>
                             	<td width="200">${mpayOrder.merchantShortName}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">所属代理商</td>
                             	<td width="200">${mpayOrder.agentMerchantNo}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">商户门店号</td>
                             	<td width="200">${mpayOrder.merchantStoreNo}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">商户终端号</td>
                             	<td width="200">${mpayOrder.merchantTerminalNo}</td>
                             </tr>
                             
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">商户业务码</td>
                             	<td width="200">${mpayOrder.merchantBusinessCode}</td>
                             </tr><tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">商户订单号</td>
                             	<td width="200">${mpayOrder.merchantOrderNo}</td>
                             </tr>
  							 <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">订单交易号</td>
                             	<td width="200">${mpayOrder.tradeOrderNo}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">商户请求时间</td>
                             	<td width="200"><fmt:formatDate value="${mpayOrder.merchantReqTime}" type="both"/></td>
                             </tr>
                             <tr>
                           		<td  bgcolor="#f2f2f0" width="159" class="text-left">支付方式</td>
                             	<td width="200">
     								<c:if test="${mpayOrder.payMethod=='WEIXINPAY'}">
										微信支付
									</c:if>
								    <c:if test="${mpayOrder.payMethod=='ALIPAY'}">
										支付宝
									</c:if>
								    <c:if test="${mpayOrder.payMethod=='QUICKPAY'}">
										快捷支付
									</c:if>
								</td>
                             </tr>
                             <tr>
                           		<td  bgcolor="#f2f2f0" width="159" class="text-left">支付产品</td>
                             	<td width="200">
     								<c:if test="${mpayOrder.payProduct=='SCAN_CARD'}">
										刷卡支付
									</c:if>
								    <c:if test="${mpayOrder.payProduct=='CODE_SCAN'}">
										扫码支付
									</c:if>
								    <c:if test="${mpayOrder.payProduct=='PUB_NUM'}">
										公众号支付
									</c:if>
									<c:if test="${mpayOrder.payProduct=='APP'}">
										APP支付
									</c:if>
									<c:if test="${mpayOrder.payProduct=='QUICKPAY'}">
										快捷支付
									</c:if>
								</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">二维码</td>
                             	<td width="200">${mpayOrder.graphicCode}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">授权码</td>
                             	<td width="200">${mpayOrder.authCode}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">订单币种</td>
                             	<td width="200">
                             		<c:if test="${mpayOrder.orderCurrency=='CNY'}">人民币</c:if>
                             		<c:if test="${mpayOrder.orderCurrency=='USD'}">美元</c:if>
                             	</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">订单金额</td>
                             	<td width="200">${mpayOrder.orderAmount}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">订单手续费</td>
                             	<td width="200">${mpayOrder.orderFee}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">退款手续费</td>
                             	<td width="200">${mpayOrder.refundFee}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">撤销手续费</td>
                             	<td width="200">${mpayOrder.revokeFee}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">退款退回手续费</td>
                             	<td width="200">${mpayOrder.sumRefundRetFee}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">撤销退回手续费</td>
                             	<td width="200">${mpayOrder.sumRevokeRetFee}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">入账金额</td>
                             	<td width="200">${mpayOrder.accountedAmount}</td>
                             </tr>
                             <tr>
                           		<td  bgcolor="#f2f2f0" width="159" class="text-left">交易时间</td>
                             	<td width="200"><fmt:formatDate value="${mpayOrder.createTime}" type="both"/>
								</td>
                             </tr>
                             <tr>
                           		<td  bgcolor="#f2f2f0" width="159" class="text-left">订单状态</td>
                             	<td width="200">
									<c:if test="${mpayOrder.orderStatus=='INIT'}">
										初始化
									</c:if>
									<c:if test="${mpayOrder.orderStatus=='WAIT_PAY'}">
										待付款
									</c:if>
									<c:if test="${mpayOrder.orderStatus=='PROCESSING'}">
										处理中
									</c:if>
									<c:if test="${mpayOrder.orderStatus=='SUCCESS'}">
										成功
									</c:if>
									<c:if test="${mpayOrder.orderStatus=='REFUNDED'}">
										已退款
									</c:if>
									<c:if test="${mpayOrder.orderStatus=='REVOKED'}">
										已撤销
									</c:if>
									<c:if test="${mpayOrder.orderStatus=='FAIL'}">
										失败
									</c:if>
								</td>
                             </tr>
                           </table>
                          </div>
                          </div>
								<div class="row">
									<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="120" class="text-right"></td>
												<td>
													<input type="button" value="返回" id="btn3" onclick="javascript:history.back(-1);" class="btn btn-primary margin30" />
												</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
				<!--End CONTENT-->
		</div>
			<!--右侧内容 end-->
	</div>
</div>
	
	


</body>
</html>
