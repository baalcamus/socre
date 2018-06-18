<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>详情</title>
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
						<li>账务管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li>账务详情&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
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
									<h2 class="panel-title">账务详情</h2>
								</div>
								<div class="panel-body">
								  <div class="row">
                        <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
                          
                           <table border="1" width="100%" class="product_detail_list">
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">商户编号</td>
                             	<td width="200">${normalAccounting.merchantNo}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">服务商编号</td>
                             	<td width="200">${normalAccounting.spMerchantNo}</td>
                             </tr> 
							 <%-- <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">入账流水号</td>
                             	<td width="200">${normalAccounting.accountingSerialNo}</td>
                             </tr>  --%>
							<%--  <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">入账方向</td>
                             	<td width="200">${normalAccounting.direction}</td>
                             	<td width="200">
                             		<c:if test="${normalAccounting.direction=='PUBLIC'}">对公</c:if>
                             		<c:if test="${normalAccounting.direction=='PRIVATE'}">对私</c:if>
								</td>
                             </tr>  --%>
							 <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">支付方式</td>
                             	<td width="200">${normalAccounting.payMethod}</td>
                             </tr> 
							 <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">支付产品</td>
                             	<td width="200">${normalAccounting.payProduct}</td>
                             </tr> 
							 <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">账务类型</td>
                             	<%-- <td width="200">${normalAccounting.accountingType}</td> --%>
                             	<td width="200">
                             		<c:if test="${normalAccounting.accountingType=='NORMAL'}">标准</c:if>
                             		<c:if test="${normalAccounting.accountingType=='SPLIT'}">分账</c:if>
                             		<c:if test="${normalAccounting.accountingType=='OUT'}">外部</c:if>
                             		<c:if test="${normalAccounting.accountingType=='REFUND'}">退款</c:if>
                             		<c:if test="${normalAccounting.accountingType=='SETTLEMENT'}">结算</c:if>
                             		<c:if test="${normalAccounting.accountingType=='CORRECT'}">回冲</c:if>
                             		<c:if test="${normalAccounting.accountingType=='BALANCEPAY'}">余额支付</c:if>
								</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">入账状态</td>
                             	<%-- <td width="200">${normalAccounting.accountingStatus}</td> --%>
                             	<td width="200">
                             		<c:if test="${normalAccounting.accountingStatus=='WAIT'}">待入账</c:if>
                             		<c:if test="${normalAccounting.accountingStatus=='SUCCESS'}">入账成功</c:if>
                             		<c:if test="${normalAccounting.accountingStatus=='FAIL'}">入账失败</c:if>
								</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">入账模式</td>
                             	<%-- <td width="200">${normalAccounting.feePayType}</td> --%>
                             	<td width="200">
                             		<c:if test="${normalAccounting.feePayType=='AGENT_ACCOUNT'}">服务商入账</c:if>
                             		<c:if test="${normalAccounting.feePayType=='NORMAL_ACCOUNT'}">标准入账</c:if>
								</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">扣费方式</td>
                             	<%-- <td width="200">${normalAccounting.chargeType}</td> --%>
                             	<td width="200">
                             		<c:if test="${normalAccounting.chargeType=='INNER_DEDUCTION'}">内扣</c:if>
                             		<c:if test="${normalAccounting.chargeType=='OUTTER_DEDUCTION'}">外扣</c:if>
                             		<c:if test="${normalAccounting.chargeType=='ADVANCE_DEDUCTION'}">预收实扣</c:if>
								</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">计费方式</td>
                             	<%-- <td width="200">${normalAccounting.countFeeType}</td> --%>
                             	<td width="200">
                             		<c:if test="${normalAccounting.countFeeType=='AGENT_FEE'}">服务商计费</c:if>
                             		<c:if test="${normalAccounting.countFeeType=='NORMAL_FEE'}">平台计费</c:if>
								</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">入账金额</td>
                             	<td width="200">${normalAccounting.accountingAmount}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">币种</td>
                             	<td width="200">${normalAccounting.accountingCurrency}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">订单号</td>
                             	<td width="200">${normalAccounting.orderNo}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">商户订单号</td>
                             	<td width="200">${normalAccounting.merchantOrderNo}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">业务请求号</td>
                             	<td width="200">${normalAccounting.bizNo}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">交易金额</td>
                             	<td width="200">${normalAccounting.tradeAmount}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">交易手续费</td>
                             	<td width="200">${normalAccounting.tradeFee}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">服务商手续费</td>
                             	<td width="200">${normalAccounting.spFee}</td>
                             </tr>
                         <%--     <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">分账信息</td>
                             	<td width="200">${normalAccounting.splitData}</td>
                             </tr> --%>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">系统来源</td>
                             	<td width="200">${normalAccounting.systemFrom}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">创建日期</td>
                             	<td width="200">${normalAccounting.createTime}</td>
                             </tr> 
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">描述</td>
                             	<td width="200">${normalAccounting.description}</td>
                             </tr> 
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">账户系统返回码</td>
                             	<td width="200">${normalAccounting.accountingReturnCode}</td>
                             </tr> 
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">账户系统返回文本</td>
                             	<td width="200">${normalAccounting.accountingReturnMsg}</td>
                             </tr> 
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">通知调用方次数</td>
                             	<td width="200">${normalAccounting.callBackCount}</td>
                             </tr> 
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">通知调用方结果</td>
                             	<td width="200">${normalAccounting.callBackResult}</td>
                             </tr> 
                           </table>
                          </div>
                          </div>
								
								</div>
								
								<!-- *********************************************************************************************************************************** -->
								<c:if test="${normalAccounting.accountingType eq 'SPLIT'}">
								
								<div class="panel panel-default clearfix">
									<header class="panel-heading clearfix">
										<h2 class="panel-inner-title02">
											分账明细列表<a href="javascript:refresh()" class="pull-right"><i
												class="fa fa-refresh"></i> 刷新</a>
										</h2>
									</header>
									<div class=" panel-body clearfix">
										<div class="table-responsive border0">
											<table class="table table-hover">
											
												<thead>
													<tr align="center">
														<td><span>分账商户号</span></td>
														<td><span>分账商户订单号</span></td>
														<td><span>分账交易金额</span></td>
														<td><span>分账手续费</span></td>
														<td><span>创建时间</span></td>
														<td><span>描述</span></td>
														<td><span>分账入账金额</span></td>
														<td><span>分账状态</span></td>
														<td><span>扣费方式</span></td>
														<td><span>计费方式</span></td>
														<td><span>业务请求号</span></td>
														<td><span>系统来源</span></td>
														<td><span>入账流水号</span></td>
														<td><span>分账服务商商编</span></td>
														<td><span>分账服务商手续费</span></td>
													</tr>
												</thead>
												<tbody>
												<c:forEach items="${page.list}" var="ledger">
													<tr align="center">
														<td>${ledger.splitMerchantNo}</td>
														<td>${ledger.splitMerchantOrderNo}</td>
														<td>${ledger.splitAmount}</td>
														<td>${ledger.splitFee}</td>
														<td>
															<fmt:formatDate value="${ledger.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
														</td>
														<td>${ledger.description}</td>
														<td>${ledger.splitAccountingAmount}</td>
														<td>
															<c:if test="${ledger.splitStatus=='WAIT'}">
																标准
															</c:if>
															<c:if test="${ledger.splitStatus=='SUCCESS'}">
																成功
															</c:if>
															<c:if test="${ledger.splitStatus=='FAIL'}">
																失败
															</c:if>
														</td>
														<td>
															<c:if test="${ledger.chargeType=='INNER_DEDUCTION'}">
																内扣
															</c:if>
															<c:if test="${ledger.chargeType=='OUTTER_DEDUCTION'}">
																外扣
															</c:if>
															<c:if test="${ledger.chargeType=='ADVANCE_DEDUCTION'}">
																预收实扣
															</c:if>
														</td>
														<td>
															<c:if test="${ledger.countFeeType=='AGENT_FEE'}">
																服务商计费
															</c:if>
															<c:if test="${ledger.countFeeType=='NORMAL_FEE'}">
																平台计费
															</c:if>
														</td>
														<td>${ledger.bizNo}</td>
														<td>${ledger.systemFrom}</td>
														<td>${ledger.flowId}</td>
														<td>${ledger.splitSpMerchantNo}</td>
														<td>${ledger.splitSpFee}</td>
													</tr>
												</c:forEach>
			
											</tbody>
											</table>
										</div>
			
									</div>
								</div>
								<jsp:include page="../include/page.jsp" />
								</c:if>
								<!-- *********************************************************************************************************************************** -->
								
								<div class="row">
									<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="120" class="text-right"></td>
												<td>
													<input type="button" value="返回" id="btn3" style="float: right;" onclick="javascript:history.back(-1);" class="btn btn-primary margin30" />
												</td>
											</tr>
										</table>
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
