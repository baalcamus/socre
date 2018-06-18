<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>试算管理</title>
<style>
.red {
	color: #b30810;
}
</style>
<script type="text/javascript">	
	function resetAll(){
		document.getElementById("from").reset();
		$('#trialResultTab').css("display","none");
	}
	
    function trial() {
    	var merchantNo=$("#merchantNo").val();
    	var mctSettleType=$("#mctSettleType").val();
    	var gatherCurrency=$("#gatherCurrency").val();
    	var amount=$("#amount").val();

    	
    	if(merchantNo==null||merchantNo==''){
    		alert("请输入商户号");
    		return false;
    	}
    	
    	if(mctSettleType==null||mctSettleType==''){
    		alert("请选择商户试算模式");
    		return false;
    	}
    	
    	if(gatherCurrency==null||gatherCurrency==''){
    		alert("请选择收款币种");
    		return false;
    	}
    	
    	if(amount==null||amount==''){
    		alert("请输入交易金额");
    		return false;
    	}
	    	   
		$.post( "<%=request.getContextPath()%>/static/cbTrade/forex/remit/remitTrial",{
					merchantNo:$("#merchantNo").val(),
			        mctSettleType:$("#mctSettleType").val(),
			        gatherCurrency:$("#gatherCurrency").val(),	
					amount:$("#amount").val(),	
				},
				function (data){
					if(data.err == true){
						alert(data.msg);
					}else{
						//展示下其他的div
						var obj = data.res;
						if(obj.mctSettleType=='PAY_FIX_CNY'||obj.gatherCurrency=='CNY'){
							
							$('#trial_exchangeRate_tr').css("display",'none');
							$('#trial_forexFloatAmount_tr').css("display",'none');
						}else{
							$('#trial_exchangeRate').text(obj.exchangeRate);
							$('#trial_forexFloatAmount').text(obj.forexFloatAmount);
							$('#trial_forexFloatAmount_tr').css("display",'');
							$('#trial_exchangeRate_tr').css("display",'');
						}
						if(parseFloat(obj.needRechargeAmount)>0){
							$('#needRechargeTr').css("display","");
						}else{
							$('#needRechargeTr').css("display","none");
						}
						$('#trial_availableBalance').text(obj.availableBalance);
						$('#trial_forexCostAmount').text(obj.forexCostAmount);
						$('#trial_feeAmount').text(obj.feeAmount);
						$('#trial_totalNeedAmount').text(obj.totalNeedAmount);
						$('#trial_needRechargeAmount').text(obj.needRechargeAmount);
						
						$('#trialResultTab').css("display","");
					}

				}
				
			);

    }
</script>
</head>

<body class=" ">
	<jsp:include page="../include/top.jsp" />
		<div id="wrapper">
			<jsp:include page="../include/bottom.jsp" />
	     	<!-- 左侧内容 -->
		<jsp:include page="../include/left.jsp" />
			
			<!--右侧内容 start-->
			<div id="page-wrapper">
				<!--BEGIN TITLE & BREADCRUMB PAGE-->
				<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
					<ol class="breadcrumb page-breadcrumb">
						<li><i class="fa fa-home"></i>&nbsp;<a
							href="Organization_management.html">首页</a>&nbsp;&nbsp;<i
							class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li>系统管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li>跨境试算&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li class="active">付款试算</li>
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
									<h2 class="panel-title">付款试算</h2>
								</div>
								<div class="panel-body">
									<form method="post" enctype="multipart/form-data"
										class="form-horizontal" id="from">
																			<div class="row">
											<div
												class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-left">商户号<span>*</span></td>
														<td width="200"><input type="text" id="merchantNo"
															name="merchantNo" value="" class="form-control"></td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										
										<div class="row">
											<div
												class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-left">商户试算模式<span>*</span></td>
														<td width="200">															
													<select id="mctSettleType" name="mctSettleType">
							<option value="">请选择商户结算模式</option>
							<option value="PAY_FIX_CNY">定额人民币付</option>
							<option value="PAY_FIX_FOREX">定额外币付</option>
					</select></td>		
															
															
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div
												class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-left">交易金额<span>*</span></td>
														<td width="200"><input type="text" id="amount"
															name="amount" value="" class="form-control"> </td>
														<td><label><b class="red">
								定额人民币付填写人民币金额，定额外币付填写外币金额。</b></label></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div
												class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-left">收款币种<span>*</span></td>
														<td width="200">
														
														<select name=gatherCurrency id="gatherCurrency">
							<option value="">请选择收款币种</option>
							<option value="CNY">人民币</option>
							<option value="GBP">英镑</option>
							<option value="HKD">港币</option>
							<option value="USD">美元</option>
							<option value="CAD">加拿大元</option>
							<option value="AUD">澳大利亚元</option>
							<option value="EUR">欧元</option>
							<option value="JPY">日元</option>
							<option value="NZD">新西兰元</option>
							<option value="SGD">新加坡元</option>
							<option value="KRW">韩国元</option>
							<option value="MOP">澳门元</option>
							<option value="THB">泰国铢</option>
							<option value="CHF">瑞士法郎</option>
							<option value="SEK">瑞典克郎</option>
							<option value="DKK">丹麦克朗</option>
							<option value="NOK">挪威克朗</option>
					</select></td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										
									
										<div class="row">
											<div
												class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-left"></td>
													<td><input type="button" value="试算" id="btn"
														onclick="trial()" class="btn btn-primary margin30" /> 
														<input type="button" value="重置" id="btn2" onclick="resetAll()"
														class="btn btn-dark" /></td>
												</tr>
												</table>
												
			<table id="trialResultTab" style="display: none;">
					<tr>
						<td><span>账户币种:</span></td>
						<td><span>人民币(CNY)</span></td>
						<td><span>&nbsp;&nbsp;可用余额:</span></td>
						<td><span id="trial_availableBalance"></span></td>
					</tr>
					<tr>
						<td colspan="4"><hr style="border:1px dashed #000;"></td>
					</tr>
					<tr id="trial_exchangeRate_tr">
						<td><span>牌价:</span></td>
						<td><span id="trial_exchangeRate"></span></td>
					</tr>
					<tr>
						<td><span>成本:</span></td>
						<td><span id="trial_forexCostAmount"></span></td>
						<td><span>&nbsp;&nbsp;手续费:</span></td>
						<td><span id="trial_feeAmount"></span></td>
					</tr>
					<tr id="trial_forexFloatAmount_tr">
						<td><span>上浮资金:</span></td>
						<td><span id="trial_forexFloatAmount"></span></td>
						<td colspan="2">
						<span>&nbsp;&nbsp;[<b class='red'>为确保交易成功，上浮 0.5% 所需金额(成本+手续费)</b>]</span>
						</td>
					</tr>
					<tr>
						<td><span>付款总额:</span></td>
						<td><span id="trial_totalNeedAmount"></span></td>
					</tr>
				</table>
											</div>
										</div>
									</form>
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
