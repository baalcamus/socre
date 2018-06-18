<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>结算订单详情</title>
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
						<li>结算管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li>结算订单详情&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
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
									<h2 class="panel-title">结算订单详情</h2>
								</div>
								<div class="panel-body">
								  <div class="row">
                        <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
                          
                           <table border="1" width="100%" class="product_detail_list">
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">商户编号</td>
                             	<td width="200">${zpaySettleOrder.merchantNo}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">商户请求时间</td>
                             	<td width="200"><fmt:formatDate value="${zpaySettleOrder.merchantReqTime}" type="both"/></td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">商户简称</td>
                             	<td width="200">${zpaySettleOrder.merchantShortName}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">商户订单号</td>
                             	<td width="200">${zpaySettleOrder.merchantOrderNo}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">交易流水号</td>
                             	<td width="200">${zpaySettleOrder.tradeOrderNo}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">结算方式</td>
                             	<td width="200">
                             		<c:if test="${zpaySettleOrder.settleType=='SELF'}">自助结算</c:if>
                             		<c:if test="${zpaySettleOrder.settleType=='AUTO'}">定时结算</c:if>
                             		<c:if test="${zpaySettleOrder.settleType=='DEPENDENT'}">前置结算</c:if>
                             	</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">结算状态</td>
                             	<td width="200">
                             		<c:if test="${zpaySettleOrder.settleStatus=='INIT'}">初始化</c:if>
                             		<c:if test="${zpaySettleOrder.settleStatus=='WAIT_EXAM'}">待审核</c:if>
                             		<c:if test="${zpaySettleOrder.settleStatus=='WAIT_SETTLE'}">待结算</c:if>
                             		<c:if test="${zpaySettleOrder.settleStatus=='INTERIM_FAIL'}">结算挂起</c:if>
                             		<c:if test="${zpaySettleOrder.settleStatus=='PROCESSING'}">处理中</c:if>
                             		<c:if test="${zpaySettleOrder.settleStatus=='SUCCESS'}">结算成功</c:if>
                             		<c:if test="${zpaySettleOrder.settleStatus=='PART_SETTLE'}">部分结算成功</c:if>
                             		<c:if test="${zpaySettleOrder.settleStatus=='NO_NEED'}">无需结算</c:if>
                             		<c:if test="${zpaySettleOrder.settleStatus=='FAIL'}">结算失败</c:if>
                             	</td>
                             </tr>
                             
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">结算金额</td>
                             	<td width="200">${zpaySettleOrder.settleAmount}</td>
                             </tr>
  							 <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">结算币种</td>
                             	<td width="200">
                             		<c:if test="${zpaySettleOrder.settleCurrency=='USD'}">
										美元
									</c:if>
									<c:if test="${zpaySettleOrder.settleCurrency=='CNY'}">
										人民币
									</c:if>
								</td>
                             </tr>
                             <tr>
                           		<td  bgcolor="#f2f2f0" width="159" class="text-left">对公对私</td>
                             	<td width="200">
                             		<c:if test="${zpaySettleOrder.ppFlag=='PUBLIC'}">对公</c:if>
                             		<c:if test="${zpaySettleOrder.ppFlag=='PRIVATE'}">对私</c:if>
								</td>
                             </tr>
                             <tr>
                           		<td  bgcolor="#f2f2f0" width="159" class="text-left">证件类型</td>
                             	<td width="200">
                             		<c:if test="${zpaySettleOrder.certifyType=='ID_CARD'}">身份证</c:if>
                             		<c:if test="${zpaySettleOrder.certifyType=='PASS_PORT'}">护照</c:if>
								</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">证件号码</td>
                             	<td width="200">${zpaySettleOrder.certifyNo}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">账户号码</td>
                             	<td width="200">${zpaySettleOrder.accountNo}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">账户名称</td>
                             	<td width="200">${zpaySettleOrder.accountName}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">手机号</td>
                             	<td width="200">${zpaySettleOrder.phoneNo}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">银行全称</td>
                             	<td width="200">${zpaySettleOrder.bankFullName}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">系统错误码</td>
                             	<td width="200">${zpaySettleOrder.errorCode}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">系统错误信息</td>
                             	<td width="200">${zpaySettleOrder.errorMessage}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">银行错误码</td>
                             	<td width="200">${zpaySettleOrder.bankErrorCode}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">银行错误信息</td>
                             	<td width="200">${zpaySettleOrder.bankErrorMessage}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">银行流水号</td>
                             	<td width="200">${zpaySettleOrder.bankRespSerialNo}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">是否已通知商户结果</td>
                             	<td width="200">${zpaySettleOrder.notifyStatus}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">审核备注</td>
                             	<td width="200">
                             		${zpaySettleOrder.auditRemark}
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
