<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>结算订单修改</title>
<script type="text/javascript">	

	function updateSettle(id){
		var remark = $("#settleAuditRemark").val();
		var ppFlag = $("[name=ppFlag]:checked").val();
		var certifyType = $("[name=certifyType]:checked").val();
		var certifyNo = $("#certifyNo").val();
		var accountNo = $("#accountNo").val();
		var accountName = $("#accountName").val();
		var phoneNo = $("#phoneNo").val();
		var bankId = $("#bankId").val();
		var bankFullName = $("#bankFullName").val();
		$.post("<%=request.getContextPath()%>/settle/updateSettle",{
			id:id,
			ppFlag:ppFlag,
			certifyType:certifyType,
			certifyNo:certifyNo,
			accountNo:accountNo,
			accountName:accountName,
			phoneNo:phoneNo,
			bankId:bankId,
			bankFullName:bankFullName,
			remark:remark
		},
		function(data){
			if(data=='success'){
				alert("修改成功");
				window.history.go(-1);
			}else{
				alert(data);
                window.location.reload();
			}
		});
	}

    function toApprove(id){
        window.location.href="<%=request.getContextPath()%>/settle/approveOrder?id="+id;
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
						<li>结算订单修改&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
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
									<h2 class="panel-title">结算订单修改</h2>
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
                             		<c:if test="${zpaySettleOrder.settleStatus=='PAY_PROCESSING'}">处理中</c:if>
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
                             		<input type="radio" name="ppFlag" <c:if test="${zpaySettleOrder.ppFlag=='PUBLIC'}">checked</c:if>  value="PUBLIC"/>对公
                             		<input type="radio" name="ppFlag" <c:if test="${zpaySettleOrder.ppFlag=='PRIVATE'}">checked</c:if> value="PRIVATE"/>对私
								</td>
                             </tr>
                             <tr>
                           		<td  bgcolor="#f2f2f0" width="159" class="text-left">证件类型</td>
                             	<td width="200">
                             		<%--<c:if test="${zpaySettleOrder.certifyType=='ID_CARD'}">身份证</c:if>--%>
                             		<%--<c:if test="${zpaySettleOrder.certifyType=='PASS_PORT'}">护照</c:if>--%>
									<input type="radio" name="certifyType" <c:if test="${zpaySettleOrder.certifyType=='ID_CARD'}">checked</c:if>  value="ID_CARD"/>身份证
									<%--<input type="radio" readonly name="certifyType" <c:if test="${zpaySettleOrder.certifyType=='PASS_PORT'}">checked</c:if> value="PASS_PORT"/>护照--%>
								</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">证件号码</td>
                             	<td width="200">
									<input id="certifyNo" value="${zpaySettleOrder.certifyNo}" style="background-color: cornsilk;" class="form-control" />
								</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">账户号码</td>
                             	<td width="200">
									<input id="accountNo" value="${zpaySettleOrder.accountNo}" style="background-color: cornsilk;" class="form-control" />
								</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">账户名称</td>
                             	<td width="200">
									<input id="accountName" value="${zpaySettleOrder.accountName}" style="background-color: cornsilk;" class="form-control" />
								</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">手机号</td>
                             	<td width="200">
									<input id="phoneNo" value="${zpaySettleOrder.phoneNo}" style="background-color: cornsilk;" class="form-control" />
								</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">银行ID</td>
                             	<td width="200">
									<input id="bankId" value="${zpaySettleOrder.bankId}" style="background-color: cornsilk;" class="form-control" />
								</td>
                             </tr>
							 <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">银行全称</td>
                             	<td width="200">
									<input id="bankFullName" value="${zpaySettleOrder.bankFullName}" style="background-color: cornsilk;" class="form-control" />
								</td>
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
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">审核备注</td>
                             	<td width="200">
                             	<input id="settleAuditRemark" value="${zpaySettleOrder.auditRemark}" style="background-color: cornsilk;" class="form-control" />
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
													<input type="button" value="保存"  onclick="updateSettle('${zpaySettleOrder.id}');" class="btn btn-success margin30" />
												</td>
												<%--<td>--%>
													<%--<input type="button" value="转到审核"  onclick="toApprove('${zpaySettleOrder.id}');" class="btn btn-blue margin30" />--%>
												<%--</td>--%>
												<td>
													<input type="button" value="返回"  onclick="javascript:history.back(-1);" class="btn btn-primary margin30" />
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
