<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>跨境付款订单查询</title>
</head>
<style>
.listMain {
	padding: 14px;
}

.listMain {
	padding-left: 14px;
}

.listBox ul {
	border-bottom: 1px #eee solid;
	line-height: 40px;
}

.listBox ul li {
	width: 200px;
	float: left;
}

.listBox ul li:first-child {
	width: 100px
}

.listBox ul li:nth-child(2) {
	width: 564px
}

.listBox ul li:nth-child(3) {
	width: 100px
}

.detail {
	display: none;
}

.red {
	color: red;
}

.overflow {
	max-height: 256px;
}

#cover {
	position: fixed;
	z-index: 1000;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background-color: #000000;
	filter: alpha(opacity = 0.7); /*IE滤镜，透明度50%*/
	-moz-opacity: 0.7; /*Firefox私有，透明度50%*/
	opacity: 0.7; /*其他，透明度50%*/
	text-align: center;
}

#cover img {
	position: absolute;
	top: 40%;
	left: 40%;
	width: 20%;
	height: 10%;
	margin-top: -15px;
	margin-left: -15px;
}
</style>
<style type="text/css">
.border0 {
	overflow: auto !important;
}

.border0 th, .border0 td {
	white-space: nowrap;
}
</style>
<script type="text/javascript">

	function formSubmit() {
		$("#queryForm").submit();
	}
	function riskReview(id){

 		$.post("<%=request.getContextPath()%>/cbTrade/riskOrderCheck",{ 
 			id:id
 		},
 		function (data){
 			alert(data.msg);
 			formSubmit();
 		}
		);
	}
	
	
	function riskReviewUpdate(type){
		var merchantNo = $("#reCheckMerchantNo").val();
		var merchantOrderNo = $("#reCheckMerchantOrderNo").val();
 		$.post("<%=request.getContextPath()%>/cbTrade/riskOrderUpdate",{ 
 			merchantNo:merchantNo,
			merchantOrderNo:merchantOrderNo,
			type:type
 		},
 		function (data){
			
			alert(data.msg);
 			formSubmit();
 		}
		);
	}
	
	function riskReviewUpdateEXC(type){
		var merchantNo = $("#reCheckMerchantNoEXC").val();
		var merchantOrderNo = $("#reCheckMerchantOrderNoEXC").val();
 		$.post("<%=request.getContextPath()%>/cbTrade/riskOrderUpdate",{ 
 			merchantNo:merchantNo,
			merchantOrderNo:merchantOrderNo,
			type:type
 		},
 		function (data){
			
			alert(data.msg);
 			formSubmit();
 		}
		);
	}
	
	function riskExcption(merchantNo,merchantOrderNo){
		$("#reCheckMerchantNoEXC").val(merchantNo);
		$("#reCheckMerchantOrderNoEXC").val(merchantOrderNo);
		showDetailLoadEXC();
	}
	
	function recheckRealname(){
		var merchantNo = $("#reCheckMerchantNo").val();
		var merchantOrderNo = $("#reCheckMerchantOrderNo").val();
		//alert("重新校验身份信息"+merchantNo+"--"+merchantOrderNo);
		$.post("<%=request.getContextPath()%>/static/cbTrade/reCheckRealnameInspect",{ 
			merchantNo:merchantNo,merchantOrderNo:merchantOrderNo
 		});
		$("#orderReCheck").dialog("close");
		formSubmit();
	}
	
	function riskReCheck(merchantNo,merchantOrderNo){
		$("#r_c_singleResult_detail tbody").html('');
	    $("#r_c_unitPriceResult_detail tbody").html('');
	    $("#r_c_maximumMounthResult_detail tbody").html('');
	    $("#r_c_realNameResult_detail tbody").html('');
	    $("#r_c_waybillResult_detail tbody").html('');
	    	
		//alert("查看风控结果");
		$.post("<%=request.getContextPath()%>/cbTrade/riskOrderCheckQuery",{ 
			merchantNo:merchantNo,
			merchantOrderNo:merchantOrderNo
 		},
 		function (data){
 			if(data.err){
 				alert(data.msg);
 				return;
 			}
 			if(data.m==null){
 				alert("订单正在查询,请稍后复核!");
 			}else{
 				var order = data.m;
 				var status ="";
 				if(order.riskStatus=='INIT'){
 					status="初始化";
					alert("审核中，请稍后查看!")
					return
 				}else if(order.riskStatus=='LOAD'){
 					status="待人工";
 				}else if(order.riskStatus=='SUCCESS'){
 					status="成功";
 				}else if(order.riskStatus=='FAIL'){
 					status="失败";
 				}
 				
			$("#reCheckMerchantNo").val(order.merchantNo);
			$("#reCheckMerchantOrderNo").val(order.merchantOrderNo);
				var orderDetailsingle = data.singleList;
				var orderDetailunitPrice = data.unitPriceList;
				var orderDetailmaximumMounth = data.maximumMounthList;
				var orderDetailrealName= data.realNameList;
				var orderDetailwaybill = data.waybillList;
				
				if(orderDetailsingle != null){

				for (var i=0;i<orderDetailsingle.length;i++)
				{
					 var tr=$("<tr></tr>");
					 var td1=$("<td>"+orderDetailsingle[i].forexDetailId+"</td>");
					 var td2=$("<td>"+orderDetailsingle[i].single+"</td>");
					 var td3=$("<td>"+orderDetailsingle[i].errorReason+"</td>");
					 tr.append(td1);
					 tr.append(td2);
					 tr.append(td3);
					 $("#r_c_singleResult_detail tbody").append(tr);

				}
				}
				if(orderDetailunitPrice != null){
					

				for (var i=0;i<orderDetailunitPrice.length;i++)
				{
					 var tr=$("<tr></tr>");
					 var td1=$("<td>"+orderDetailunitPrice[i].forexDetailId+"</td>");
					 var td2=$("<td>"+orderDetailunitPrice[i].unitPrice+"</td>");
					 var td3=$("<td>"+orderDetailunitPrice[i].errorReason+"</td>");
					 tr.append(td1);
					 tr.append(td2);
					 tr.append(td3);
					 $("#r_c_unitPriceResult_detail tbody").append(tr);
										
				}
				}
				if(orderDetailmaximumMounth != null){
				for (var i=0;i<orderDetailmaximumMounth.length;i++)
				{
					
					 var tr=$("<tr></tr>");
					 var td1=$("<td>"+orderDetailmaximumMounth[i].forexDetailId+"</td>");
					 var td2=$("<td>"+orderDetailmaximumMounth[i].singleMonthForexCount+"</td>");
					 var td3=$("<td>"+orderDetailmaximumMounth[i].errorReason+"</td>");
					 tr.append(td1);
					 tr.append(td2);
					 tr.append(td3);
					 $("#r_c_maximumMounthResult_detail tbody").append(tr);

				}
				}
				if(orderDetailrealName != null && orderDetailrealName!=""){
					if(order.riskStatus=='SUCCESS'&&order.realNameCode=='SUCCESS'){
						$("#r_c_realnameBtn").hide();
						$("#r_c_realNameResult_detail").hide();
					}else{
						$("#r_c_realnameBtn").show();
						$("#r_c_realNameResult_detail").show();
					}
					for (var i=0;i<orderDetailrealName.length;i++)
					{
					   	 var tr=$("<tr></tr>");
						 var td1=$("<td>"+orderDetailrealName[i].forexDetailId+"</td>");
						 var td2=$("<td>"+orderDetailrealName[i].name+"</td>");
						 var td3=$("<td>"+orderDetailrealName[i].identityCard+"</td>");
						 var td4=$("<td>"+orderDetailrealName[i].errorReason+"</td>");
						 tr.append(td1);
						 tr.append(td2);
						 tr.append(td3);
						 tr.append(td4);
						 $("#r_c_realNameResult_detail tbody").append(tr);
	
					}
				} else{
					$("#r_c_realnameBtn").hide();
					$("#r_c_realNameResult_detail").hide();
				}
				if(orderDetailwaybill != null){
				for (var i=0;i<orderDetailwaybill.length;i++)
				{
				   	 var tr=$("<tr></tr>");
					 var td1=$("<td>"+orderDetailwaybill[i].forexDetailId+"</td>");
					 var td2=$("<td>"+orderDetailwaybill[i].waybillNo+"</td>");
					 var td3=$("<td>"+orderDetailwaybill[i].errorReason+"</td>");
					 tr.append(td1);
					 tr.append(td2);
					 tr.append(td3);
					 $("#r_c_waybillResult_detail tbody").append(tr);

				}				
				}
				var mctBlackResult=order.merchantListResult;
				var singleResult=order.singleResult;
 				var unitPriceResult=order.unitPriceResult;
 				var maximumMounthResult=order.maximumMounthResult;
 				var realNameResult=order.realNameResult;
 				var waybillResult=order.waybillResult;
 				if(status=='FAIL'){
					$("#r_c_result").addClass("red");
				}else{
					$("#r_c_result").removeClass("red");
				}
				$("#r_c_result").html(status);
				if(order.merchantListCode=='FAIL'){
					$("#r_c_mctBlackResult").addClass("red");
				}else{
					$("#r_c_mctBlackResult").removeClass("red");
				}
				$("#r_c_mctBlackResult").html(mctBlackResult);
				
				
				if(order.singleCode=='FAIL'){
					$("#r_c_singleResult").addClass("red");
				}else{
					$("#r_c_singleResult").removeClass("red");
				}
				$("#r_c_singleResult").html(singleResult);
				
				if(order.unitPriceCode=='FAIL'){
					$("#r_c_unitPriceResult").addClass("red");
				}else{
					$("#r_c_unitPriceResult").removeClass("red");
				}
				$("#r_c_unitPriceResult").html(unitPriceResult);
				
				
				if(order.maximumMounthCode=='FAIL'){
					$("#r_c_maximumMounthResult").addClass("red");
				}else{
					$("#r_c_maximumMounthResult").removeClass("red");
				}
				$("#r_c_maximumMounthResult").html(maximumMounthResult);
				
				if(order.realNameCode=='FAIL'){
					$("#r_c_realNameResult").addClass("red");
				}else{
					$("#r_c_realNameResult").removeClass("red");
				}
				$("#r_c_realNameResult").html(realNameResult);
				
				if(order.waybillCode=='FAIL'){
					$("#r_c_waybillResult").addClass("red");
				}else{
					$("#r_c_waybillResult").removeClass("red");
				}
				$("#r_c_waybillResult").html(waybillResult);
				if(status == "待人工"){
					showDetailLoad(data);
				}else{
					showDetail(data);
				}
 			}
 		}
		);
		
	}
	
	function showDetail(data){
		$("#orderReCheck").dialog({
			autoOpen:true,
			width:1000,
			height:550,
			modal:true,
			buttons:{
				"取消":function(){
					
					$("#orderReCheck").dialog("close");
				}
			}
		});
	}
	function showDetailLoad(data){
		$("#orderReCheck").dialog({
			autoOpen:true,
			width:1000,
			height:620,
			modal:true,
			buttons:{
				"审核通过":function(){
					riskReviewUpdate("success");
				},
				"审核失败":function(){
					riskReviewUpdate("fail");
				},
				"取消":function(){
					
					$("#orderReCheck").dialog("close");
				}
			}
		});
	}
	function showDetailLoadEXC(){
		$("#orderReEXC").dialog({
			autoOpen:true,
			width:300,
			height:150,
			modal:true,
			buttons:{
				"审核通过":function(){
					riskReviewUpdateEXC("success");
				},
				"审核失败":function(){
					riskReviewUpdateEXC("fail");
				},
				"取消":function(){
					
					$("#orderReEXC").dialog("close");
				}
			}
		});
	}
	
	//ljs
	function showForOrderDetail(obj,cr,cp)
	{
		$("#showCmdBtn").hide();
		var status = format(obj.businessStatus);
		if(status=="FOREX_SALE_FAIL"||status=="FOREX_PAY_FAIL")
		{
			$("#showCmdBtn").show();
		}
		var cid = $("#"+format(obj.merchantOrderNo));
		$("#n_merchantOrderNo").val(format(obj.merchantOrderNo));
		$("#n_merchantRequestTime").val(cid.val());
		$("#n_mctSettleType").val(format(obj.mctSettleType));
		$("#n_tradeType").val(getbusinessRange(format(obj.businessRange)));
		$("#n_sumRemitAmount").val(format(obj.sumRemitAmount));
		$("#n_gatherCurrency").val(format(obj.gatherCurrency));
		$("#n_exchangeRate").val(format(obj.exchangeRate));
		$("#n_bankRate").val(format(obj.bankRate));
		$("#n_bankRealAmount").val(format(obj.bankGatherAmount));
		$("#n_merchantFee").val(format(obj.merchantFee));
		$("#n_frozenAmount").val(format(obj.frozenAmount));
		$("#n_remitComment").val(format(obj.remitComment));
		
		if(obj.fileName2!=null)
		{
			$("#downBackOrder").html(format(obj.fileName2));
			var url ="<%=request.getContextPath()%>/static/cbTrade/forex/order/downReceipt?id="+format(obj.id)+"&merchantNo="+format(obj.merchantNo)+"&merchantOrderNo="+format(obj.merchantOrderNo);
			$("#downBackOrder").attr("href",url);
			$("#downBackOrder").attr("style","color:red;text-decoration: underline;");
			
		}else{
			$("#downBackOrder").attr("style","color:black");
			$("#downBackOrder").html("未生成回单 ");

		}
		
		var now=new Date().getTime();  
        var data1 = {cr:cr}; 
        var data2 = {cp:cp}; 
		$.getJSON('<%=request.getContextPath()%>/cbTrade/forex/remit/recDetail?now='+now,data1,function(result){
			$("#receiverName").val(result.receiverName);
			$("#receiverCountry").val(result.receiverCountry);
			$("#receiverAddr").val(result.receiverAddr);
			$("#receiverAccountNo").val(result.receiverAccountNo);
			$("#receiverBankAddr").val(result.receiverBankAddr);
			$("#receiverBankName").val(result.receiverBankName);
			$("#revBankSwiftCode").val(result.revBankSwiftCode);
			$("#agentBankAddr").val(result.agentBankAddr);
			$("#agentBankName").val(result.agentBankName);
			$("#agentBankSwiftCode").val(result.agentBankSwiftCode);
			$("#crId").val(result.id);
			
			
		});
		$.getJSON('<%=request.getContextPath()%>/cbTrade/forex/remit/payDetail?now='+now,data2,function(result){
			$("#payerType").val(result.payerType);
			$("#payerIdNo").val(result.payerIdNo);
			$("#payerPhoneNo").val(result.payerPhoneNo);
			$("#payerName").val(result.payerName);
			$("#payerCountry").val(result.payerCountry);
			$("#payerAddr").val(result.payerAddr);
			$("#payerAccountNo").val(result.payerAccountNo);
			$("#payerBankAddr").val(result.payerBankAddr);
			$("#payerBankName").val(result.payerBankName);
			$("#cpId").val(result.id);
			
		});
		var payMethod=format(obj.payMethod);
		if(payMethod==null || payMethod == ''){
			$("#n_payMethod").val("");
		}else if(payMethod=='OUR'){
			$("#n_payMethod").val('付款人全部承担');
		}else if(payMethod=='BEN'){
			$("#n_payMethod").val('收款人全部承担');
		}else if(payMethod=='SHA'){
			$("#n_payMethod").val('付款人收款人共同承担');
		}
		
		$('#showForexOrderPanelNew').dialog({
			autoOpen:true,
			width:600,
			height:500
		});
		initControll();
	}
	//初始化
	function initControll()
	{
		
		$(".info input").attr("readonly","readonly");
		$(".payInfo input").attr("readonly","readonly");
		$(".payInfo select").attr("disabled","disabled");		
		$(".recInfo input").attr("readonly","readonly");
		$(".recInfo select").attr("disabled","disabled");
		$(".otherInfo input").attr("readonly","readonly");
		
	}
	//修改
	function setControll()
	{
		$(".info input").attr("readonly","readonly");
		$(".payInfo input").removeAttr("readonly");
		$(".payInfo select").removeAttr("disabled");		
		$(".recInfo input").removeAttr("readonly");
		$(".recInfo select").removeAttr("disabled");
		$(".otherInfo input").attr("readonly","readonly");
		$("#payerType").attr("disabled","disabled");//主体类型不修改
	}
	var cmd =true;
	function updateSaveBtn(t)
	{
		var th = $(t);
		if(cmd==true)
		{
			cmd=false;
			th.html("保存");
			setControll();
		}else
		{
			cmd=true;
			var data = $("#cpCrInfoForm").serialize();
			var crId = $("#crId").val();
			var cpId = $("#cpId").val();
			$.post("<%=request.getContextPath()%>/cbTrade/forex/remit/executePatRecUpdate.do?crId="+crId+"&cpId="+cpId,data,function(re){
				alert(re.msg);
				closeShowCpCrInfo();
				th.html("修改");
			});
		}
	}
	
// 	//关闭收付款联系人页面
	function closeShowCpCrInfo(){
		$("#editSave").html("修改");
		var cmd =true;
		$("#showForexOrderPanelNew").dialog("destroy");
	}
	
	//下载身份证风控失败的信息
	function reportRiskErrorDate(str){
		var merchantNo = $("#reCheckMerchantNo").val();
		var merchantOrderNo = $("#reCheckMerchantOrderNo").val();
		var riskType = str;
		
		var form=$("<form>");//定义一个form表单
		form.attr("style","display:none");
		form.attr("target","");
		form.attr("method","post");
		form.attr("action","<%=request.getContextPath()%>/static/cbTrade/riskOrderDetail/export");
		var input1=$("<input>");
		input1.attr("type","hidden");
		input1.attr("name","merchantNo");
		input1.attr("value",merchantNo);
		var input2=$("<input>");
		input2.attr("type","hidden");
		input2.attr("name","merchantOrderNo");
		input2.attr("value",merchantOrderNo);
		var input3=$("<input>");
		input3.attr("type","hidden");
		input3.attr("name","riskType");
		input3.attr("value",riskType);
		$("body").append(form);//将表单放置在web中
		form.append(input1);
		form.append(input2);
		form.append(input3);

		form.submit();//表单提交 
		form.remove();
		
	}
</script>

<body class=" ">
	<div id="cover" style="display: none;">
		<img
			src="<%=request.getContextPath() %>/statics/v2/images/wait_processing.gif">
	</div>
	<!-- 头部 -->
	<jsp:include page="../include/top.jsp" />
	<div id="wrapper">
		<div>
			<jsp:include page="../include/bottom.jsp" />
			<!-- 左侧内容 -->
			<jsp:include page="../include/left.jsp" />
			<!--右侧内容 start-->
			<div id="page-wrapper">
				<!--BEGIN TITLE & BREADCRUMB PAGE-->
				<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
					<ol class="breadcrumb page-breadcrumb">
						<li><i class="fa fa-home"></i>&nbsp;<a
							href="<%=request.getContextPath()%>/main/toMain.do">首页</a>&nbsp;&nbsp;<i
							class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li>跨境交易管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li>付款管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li>付款订单查询&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
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
							<form id="queryForm"
								action="<%=request.getContextPath()%>/cbTrade/forex/remit/query"
								method="post" enctype="multipart/form-data"
								class="form-horizontal ">
								<input type="hidden" name="map['exchangeType']" value="REMIT" />
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />
								<div class="row">
									<div class="col-lg-4 col-md-4 ">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">开始日期</td>
												<td>
													<div data-date-format="yyyy-mm-dd"
														class="input-group date datepicker-filter mbs">
														<span class="input-group-addon"><i
															class="fa fa-calendar"></i></span> <input class="form-control"
															id="rateDate" name="map['beginDate']"
															value="${paramVo.map.beginDate}" />
													</div>
												</td>
											</tr>
										</table>
									</div>
									<div class="col-lg-4 col-md-4 ">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">结束日期</td>
												<td>
													<div data-date-format="yyyy-mm-dd"
														class="input-group date datepicker-filter mbs">
														<span class="input-group-addon"><i
															class="fa fa-calendar"></i></span> <input class="form-control"
															id="endDate" name="map['endDate']"
															value="${paramVo.map.endDate}" />
													</div>
												</td>
											</tr>
										</table>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-4 col-md-4 ">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">商户编号</td>
												<td><input type="text" name="map['merchantNo']"
													value="${paramVo.map.merchantNo}" class="form-control" />
												</td>
											</tr>
										</table>
									</div>
									<div class="col-lg-4 col-md-4 ">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">销售名称</td>
												<td><input type="text" name="map['salesman']"
													value="${paramVo.map.salesman}" class="form-control" /></td>
											</tr>
										</table>
									</div>

								</div>
								<div class="row">
									<div class="col-lg-4 col-md-4 ">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">商户订单号</td>
												<td><input type="text" name="map['merchantOrderNo']"
													value="${paramVo.map.merchantOrderNo}" class="form-control" />
		
													</td>
											</tr>
										</table>
									</div>
									<div class="col-lg-4 col-md-4 ">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">订单状态</td>
												<td><select class="form-control" tabindex="10"
													id="map['orderStatus']" name=map['orderStatus']>
														<option selected="selected" value="">全部</option>
														<option
															<c:if test="${paramVo.map.orderStatus eq 'WAIT_DETAIL' }">selected="selected"</c:if>
															value="WAIT_DETAIL">等待上传明细</option>
														<option
															<c:if test="${paramVo.map.orderStatus eq 'DETAIL_ERROR' }">selected="selected"</c:if>
															value="DETAIL_ERROR">上送明细失败</option>
														<option
															<c:if test="${paramVo.map.orderStatus eq 'DETAIL_SUCC' }">selected="selected"</c:if>
															value="DETAIL_SUCC">上送明细成功</option>
														<option
															<c:if test="${paramVo.map.orderStatus eq 'WAIT_PAY' }">selected="selected"</c:if>
															value="WAIT_PAY">待付款</option>
														<option
															<c:if test="${paramVo.map.orderStatus eq 'PROCESSING' }">selected="selected"</c:if>
															value="PROCESSING">处理中</option>
														<option
															<c:if test="${paramVo.map.orderStatus eq 'PART_SUCCESS' }">selected="selected"</c:if>
															value="PART_SUCCESS">部分成功</option>
														<option
															<c:if test="${paramVo.map.orderStatus eq 'SUCCESS' }">selected="selected"</c:if>
															value="SUCCESS">交易成功</option>
														<option
															<c:if test="${paramVo.map.orderStatus eq 'FAIL' }">selected="selected"</c:if>
															value="FAIL">交易失败</option>
												</select></td>
											</tr>
										</table>
									</div>

								</div>
								<div class="row">
									<div class="col-lg-4 col-md-4 ">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">平台订单号</td>
												<td><input type="text" name="map['orderNo']"
													value="${paramVo.map.orderNo}" class="form-control" /></td>
											</tr>
										</table>
									</div>
									<div class="col-lg-4 col-md-4 ">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">银行通道</td>
												<td><select class="form-control" tabindex="10"
													id="channelSe" name=map['channelNo']>
														<option selected="selected" value="">无</option>
												</select></td>
											</tr>
										</table>
									</div>

								</div>
								<div class="row">
									<div class="col-lg-4 col-md-4 ">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">&nbsp;</td>
												<td><button type="reset" class="btn btn-default">重置</button></td>
											</tr>
										</table>
									</div>
									<div class="col-lg-4 col-md-4 ">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">&nbsp;</td>
												<td><button type="submit" id="btnSubmit"
														class="btn btn-danger">
														<i class="fa fa-search"></i>查询
													</button></td>
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
								列表 总订单笔数：${count==null?0:count} 总订单汇款金额：${amount==null?0:amount}￥ 总商户手续费：${merchant_fee==null?0:merchant_fee}
								<button onclick="downLoadOrder();"
									class="pull-right btn btn-primary">下载</button>
								<span class="pull-right">&nbsp;&nbsp;&nbsp;</span> <a
									href="javascript:formSubmit()" class="pull-right"><i
									class="fa fa-refresh"></i>刷新</a>
							</h2>
						</header>
						<div class="panel-body clearfix">
							<div class="table-responsive border0">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>操作</th>
											<th>商户简称</th>
											<th>商户编号</th>
											<th>销售名称</th>
											<th>商户订单号</th>
											<th>商户结算模式</th>
											<th>汇款金额</th>
											<th>收款币种</th>
											<th>收款金额</th>
											<th>明细笔数</th>
											<th>渠道</th>
											<th>订单状态</th>
											<th>业务处理状态</th>
											<th>系统信息</th>
											<th>银行信息</th>
											
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${page.list}" var="order">
											<tr>
												<td>
												<!-- 得到商户订单请求时间，进行格式化，赋值给隐藏域 -->
													<fmt:formatDate var="merchantRequestTimeFormat" value="${order.merchantRequestTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
													<input type="hidden" id="${order.merchantOrderNo}" value="${merchantRequestTimeFormat}">
													<c:if test="${order.orderStatus!='WAIT_DETAIL'}">
														<a href="<%=request.getContextPath()%>/cbTrade/forex/remit/querydetail?forexOrderId=${order.forexOrderId}">明细</a>
														<a href="javascript:showRepeatCheck('${order.forexOrderId}');">单号重复校验</a>
<%-- 														<a href="javascript:showRepeatCheck('${order.forexOrderId}');">运单重复校验</a> --%>
														<!--申请书管理  -->
														<c:if test="${order.fileName1!=null }">
															<a target="_blank" href="<%=request.getContextPath()%>/static/cbTrade/forex/remit/downPetition?fileName1=${order.fileName1}">下载附件</a>
														</c:if>

														<!-- 上传明细成功后，等待付款 -->
														<c:if test="${order.orderStatus!='WAIT_PAY' and order.orderStatus!='PAY_FAIL'}">
															<!-- 如果付款成功，等待审核 -->
															<c:if test="${order.orderStatus=='PROCESSING' and  order.businessStatus =='RISK_WAIT_CHECK'}">
																<a href="#1" onclick="riskReview('${order.id}');return false;">风险审核</a>
															</c:if>
															<c:if test="${ order.businessStatus=='RISK_RECHECK'}">
																<a href="#1" onclick="riskReCheck('${order.merchantNo}','${order.merchantOrderNo}');return false;">复核风控审核结果</a>
															</c:if>
															<c:if test="${ order.businessStatus=='RISK_EXCPTION'}">
																<a href="#1" onclick="riskExcption('${order.merchantNo}','${order.merchantOrderNo}');return false;">复核风控审核结果</a>
															</c:if>
															<c:if test="${ order.businessStatus=='RISK_CHECK_FAIL' or order.businessStatus=='RISK_CHECK_SUCC' or  order.businessStatus=='RISK_CHECK_PRO' or  order.businessStatus=='WAIT_TO_BANK' or  order.businessStatus=='SUCCESS' or  order.businessStatus=='FAIL'}">
																<a href="#1" onclick="riskReCheck('${order.merchantNo}','${order.merchantOrderNo}');return false;">风控审核结果</a>
															</c:if>

															<!-- 如果审核通过 -->

															<c:if test="${order.businessStatus !='RISK_WAIT_CHECK' and order.businessStatus!='RISK_CHECK_FAIL' and order.businessStatus!='RISK_CHECK_PRO' and order.businessStatus!='RISK_RECHECK'}">
																<c:if test="${order.businessStatus=='WAIT_TO_BANK'}">
																	<a href="#1" onclick="doChannelEntry('${order.id}','${order.gatherCurrency}');return false;">通道录入</a>
																	<a href="#1" onclick="doTypeChange('${order.id}','${order.forexOrderId}','${order.businessRange}','${order.tradeType}','${order.channelNo}');return false;">业务类型调整</a>
																</c:if>
																<c:if test="${order.businessStatus=='FOREX_SALE_FAIL'}">
																	<a href="#1" onclick="resetOrderStatus('${order.forexOrderId}','重新购汇');return false;">重发</a>
																</c:if>
																<c:if test="${order.businessStatus=='FOREX_PAY_FAIL'}">
																	<a href="#1" onclick="resetOrderStatus('${order.forexOrderId}','重新付汇');return false;">重发</a>
																</c:if>
																<c:if test="${order.businessStatus=='FOREX_SALE_FAIL' || order.businessStatus=='FOREX_PAY_FAIL'}">
																	<a href="<%=request.getContextPath()%>/static/cbTrade/forex/exporterrordetail?forexOrderId=${order.forexOrderId}" target="_blank">获取错误文件</a>
																</c:if>
																<c:if test="${order.channelFeature=='ONLINE_DIRECT'}">
																	<a href="#1" onclick="modifyDetailTranRemark('${order.forexOrderId}','${order.id}');return false;">申报附言</a>
																	<!-- 工行 -->
																	<c:choose>
																		<c:when test="${fn:startsWith(order.channelNo,'ICBC') }">
																			<c:choose>
																				<c:when test="${'13'==order.bankReturnCode && (order.detailCount==order.checkCount)}">
																					<a href="#1" onclick="remitConfirm('${order.id}','${order.channelName}','${order.channelNo}','${order.gatherCurrency}','${order.bankRemitAmount}','${order.bankGatherAmount}');return false;">付款</a>
																				</c:when>
																				<c:otherwise>
																					<a href="#1" onclick="confirmType('${order.id}','${order.channelName}','${order.channelNo}','${order.gatherCurrency}');return false;">登记</a>
																				</c:otherwise>
																			</c:choose>
																		</c:when>
																		<c:otherwise>
																			<!-- 如果录入后，如果不是工行 。购汇，付汇。。。。。 -->
																			<c:if test="${order.businessStatus=='WAIT_TO_BANK' and 'ONLINE_DIRECT'==order.channelFeature}">
																				<a href="#1" onclick="forexSale('${order.id}','${order.channelName}','${order.channelNo}','${order.gatherCurrency}','${order.merchantShortName}','${order.mctSettleType=='PAY_FIX_FOREX'?order.sumGatherAmount:order.sumRemitAmount}','${order.mctSettleType=='PAY_FIX_FOREX'?order.gatherCurrency:order.remitCurrency}');return false;">购汇</a>
																			</c:if>
																			<c:if test="${'FOREX_SALE_SUCC'==order.businessStatus and 'ONLINE_DIRECT'==order.channelFeature}">
																				<a href="#1" onclick="forexPay('${order.id}','${order.merchantShortName}','${order.bankRemitAmount}','${order.bankGatherAmount}');return false;">付汇</a>
																			</c:if>
																		</c:otherwise>
																	</c:choose>
																</c:if>
																<c:if test="${order.channelFeature=='OFF_INDIRECT'}">
																	<%-- <a href="#1" onclick="exportExc('${order.forexOrderId}','${order.channelNo}');return false;">导出</a> --%>
																	<c:choose>
																		<c:when test="${fn:startsWith(order.channelNo,'CMBC_OFF') }">
																			<a href="#1" onclick="exportExcMinSheng('${order.merchantOrderNo}','${order.channelNo}');return false;">民生线下导出</a>
																		</c:when>
																		<c:otherwise>
																			<a href="#1" onclick="exportExc('${order.forexOrderId}','${order.channelNo}');return false;">导出</a> 
																		</c:otherwise>
																	</c:choose>
																</c:if>
				
																<c:if test="${order.orderStatus =='SUCCESS'}">
																	<%--<a href="#1" onclick="doStatusEntry('${order.id}','${order.merchantNo}','${order.merchantOrderNo}');return false;">结果录入</a> --%>
																	<a target="_blank" href="<%=request.getContextPath()%>/static/cbTrade/forex/order/downReceipt?id=${order.id}&merchantNo=${order.merchantNo}&merchantOrderNo=${order.merchantOrderNo}">下载回单</a>
																	<a href="#1" onclick="upPetition('${order.merchantNo}','${order.merchantOrderNo}');return false;">上传附件</a>
																</c:if>
															</c:if>
														</c:if>
													</c:if>
														<!-- 结果录入显示规则（业务状态不是：失败、成功、风控审核中、购汇处理中、购汇成功、付汇处理中） -->
														<c:if test="${order.businessStatus!='FAIL' and order.businessStatus!='SUCCESS' and order.businessStatus!='RISK_CHECK_PRO' and order.businessStatus!='FOREX_SALE_PRO' and order.businessStatus!='FOREX_SALE_SUCC' and order.businessStatus!='FOREX_PAY_PRO'}">
															<a href="#1" onclick="doStatusEntry('${order.mctSettleType }','${order.id}','${order.forexOrderId}','${order.channelName}','${order.merchantNo}','${order.merchantOrderNo}','${order.gatherCurrency}','${order.bankRate}','${order.bankGatherAmount}');return false;">结果录入</a>
														</c:if>
<%-- 													<a href="javascript:changePayMethod('${order.id}','${order.payMethod}');">更改支付方式</a> --%>
<%-- 														<a href="javascript:showCpCrInfo('${order.relateReceiverId}','${order.relatePayerId}')">收付款明细</a> --%>
												</td>
												<td>${order.merchantShortName}</td>
												<td>${order.merchantNo}</td>
												<td>${order.salesman}
<%-- 												<c:set var="string1" value="${order.receiverName}" /> --%>
												</td>
												<td>
<!-- 													<a href="#" -->
<%-- 													onclick='showForexOrderPanel(${fns:toJson(order)});return false;' --%>
<!-- 													style="text-decoration: underline;"> -->
<%-- 														${order.merchantOrderNo }</a> --%>
													<a href="#"
													onclick='showForOrderDetail(${fns:toJson(order)},${order.relateReceiverId},${order.relatePayerId});return false;'
													style="text-decoration: underline;">
														${order.merchantOrderNo }</a>
													</td>
												<td><c:choose>
														<c:when test="${order.mctSettleType=='PAY_FIX_CNY'}">固定人民币付</c:when>
														<c:when test="${order.mctSettleType=='PAY_FIX_FOREX'}">固定外币付</c:when>
														<c:when test="${order.mctSettleType=='GATHER_CNY_FOREX'}">定额人民币收</c:when>
														<c:when test="${order.mctSettleType=='GATHER_FIX_FOREX'}">定额外币收</c:when>
														<c:otherwise>${order.mctSettleType}</c:otherwise>
													</c:choose></td>
												<td><fmt:formatNumber value="${order.sumRemitAmount }"
														pattern="#,##0.00" /></td>
												<td>${fns:getCurrency(order.gatherCurrency) }</td>
												<td><fmt:formatNumber value="${order.sumGatherAmount }"
														pattern="#,##0.00" /></td>
												<td>${order.detailCount }</td>
												<td>${order.channelName }</td>
												<td><c:choose>
														<c:when test="${order.orderStatus=='INIT'}">初始化</c:when>
														<c:when test="${order.orderStatus=='ACCEPT'}">接收成功</c:when>
														<c:when test="${order.orderStatus=='WAIT_PAY'}">待付款</c:when>
														<c:when test="${order.orderStatus=='PROCESSING'}">处理中</c:when>
														<c:when test="${order.orderStatus=='PART_SUCCESS'}">部分成功</c:when>
														<c:when test="${order.orderStatus=='COMPLETE'}">交易完成</c:when>
														<c:when test="${order.orderStatus=='SUCCESS'}">交易成功</c:when>
														<c:when test="${order.orderStatus=='FAIL'}">交易失败</c:when>
														<c:when test="${order.orderStatus=='WAIT_DETAIL'}">待上传明细</c:when>
														<c:when test="${order.orderStatus=='DETAIL_ERROR'}">明细上传失败</c:when>
														<c:when test="${order.orderStatus=='DETAIL_SUCC'}">明细上传成功</c:when>
														<c:when test="${order.orderStatus=='DETAIL_PRO'}">明细处理中</c:when>
														<c:otherwise>${order.orderStatus}</c:otherwise>
													</c:choose></td>
												<td><c:choose>
														<c:when test="${order.businessStatus=='INIT'}">初始化</c:when>
														<c:when test="${order.businessStatus=='WAIT_ACCEPT'}">待接收</c:when>
														<c:when test="${order.businessStatus=='ACCEPT_SUCC'}">接收成功</c:when>
														<c:when test="${order.businessStatus=='ACCEPT_FAIL'}">接收失败</c:when>
														<c:when test="${order.businessStatus=='WAIT_DEBIT'}">待扣款</c:when>
														<c:when test="${order.businessStatus=='DEBIT_SUCC'}">扣款成功</c:when>
														<c:when test="${order.businessStatus=='DEBIT_FAIL'}">扣款失败</c:when>
														<c:when test="${order.businessStatus=='WAIT_TO_BANK'}">待发往银行</c:when>
														<c:when test="${order.businessStatus=='FOREX_SALE_PRO'}">购汇处理中</c:when>
														<c:when test="${order.businessStatus=='FOREX_SALE_SUCC'}">购汇成功</c:when>
														<c:when test="${order.businessStatus=='FOREX_SALE_FAIL'}">购汇失败</c:when>
														<c:when test="${order.businessStatus=='FOREX_PAY_PRO'}">付汇处理中</c:when>
														<c:when test="${order.businessStatus=='FOREX_PAY_SUCC'}">付汇成功</c:when>
														<c:when test="${order.businessStatus=='FOREX_PAY_FAIL'}">付汇失败</c:when>
														<c:when test="${order.businessStatus=='BANK_PRO_SUCC'}">银行处理成功</c:when>
														<c:when test="${order.businessStatus=='BANK_PRO_FAIL'}">银行处理失败</c:when>
														<c:when test="${order.businessStatus=='SUCCESS'}">交易成功</c:when>
														<c:when test="${order.businessStatus=='FAIL'}">交易失败</c:when>
														<c:when test="${order.businessStatus=='PART_SUCCESS'}">部分交易成功</c:when>
														<c:when test="${order.businessStatus=='RISK_WAIT_CHECK'}">待风控审核</c:when>
														<c:when test="${order.businessStatus=='RISK_CHECK_PRO'}">风控审核中</c:when>
														<c:when test="${order.businessStatus=='RISK_CHECK_FAIL'}">风控审核失败</c:when>
														<c:when test="${order.businessStatus=='RISK_RECHECK'}">风控审核待复核</c:when>
														<c:when test="${order.businessStatus=='RISK_CHECK_SUCC'}">风控审核成功</c:when>
														
														<c:otherwise>${order.businessStatus}</c:otherwise>
													</c:choose></td>
												<td>${order.sysErrorMsg }</td>
												<td>${order.bankReturnMsg }</td>
												
												<td>
												<input type="hidden" value="${order.fileName2}" /> 
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>


					<jsp:include page="../include/page.jsp" />
				</div>
				<!--这是列表模块结束-->
			</div>
			<!--End CONTENT-->
		</div>
		<!--右侧内容 end-->
	</div>

	<div id="showType" class="table-list" style="display: none;">
		<input id='idChange' vaule='' type="hidden" />
		<input id='forexIdChange' vaule='' type="hidden" />
		<input id='tradeType' vaule='' type="hidden" />
		<table width="300px;">
			<tr>
				<td align="right" height="35px">业务类型：</td>
				<td>
					<select class="form-control" tabindex="10" id="businessRangeChange" name="businessRangeChange">
						<option value="">无</option>
						<option value="GOODS_TRADE">货物贸易</option>
						<option value="ABROAD_EDU">留学教育</option>
						<option value="HOTEL">酒店住宿</option>
						<option value="AIR_TICKETS">航空机票</option>
						<option value="TOURISM_SERVICE">旅游服务</option>
						<option value="INTER_TRANSPORT">国际运输</option>
						<option value="INTER_CONFERENCE">国际会议</option>
						<option value="INTER_EXHIBITION">国际展览</option>
						<option value="SOFTWARE_SERVICE">软件服务</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="right" height="35px">业务类型分类</td>
				<td>
					<select class="form-control" tabindex="10" id="tradeTypeChange" name="tradeTypeChange">
					</select>
				</td>
			</tr>
			<tr>
				<td height="35px">&nbsp;</td>
				<td class="SubmitTd">
					<div class="button_area">
						<input style="height: 25px; margin: 10px 0px 0px 0px;"
							type="button" value="确定" onclick="typeChange();" /> <input
							type="hidden" id="ID" /> <input
							style="height: 25px; margin: 10px 0px 0px 0px;" type="button"
							value="取消" onclick="closeDialog();" />
					</div>
				</td>
			</tr>

		</table>
	</div>
	
	<div id="showPayMethod" class="table-list" style="display: none;">
		<table width="300px;">
			<tr>
				<td align="right" height="35px">支付方式：</td>
				<td>
					<select class="form-control" tabindex="10" id="payMethod" name="payMethod">
						
					</select>
				</td>
			</tr>
			<tr>
				<td height="35px">&nbsp;</td>
				<td class="SubmitTd">
					<div class="button_area">
						<input style="height: 25px; margin: 10px 0px 0px 0px;" type="button" value="确定" onclick="payMethodChange();" /> 
						<input type="hidden" id="payMethodId" /> 
						<input style="height: 25px; margin: 10px 0px 0px 0px;" type="button" value="取消" onclick="closeDialog();" />
					</div>
				</td>
			</tr>

		</table>
	</div>
	
	<div id="showRepeatCheck" class="table-list" style="display: none;">
		<table width="300px;">
			<tr>
				<td align="right" height="35px" id="repeatCheckResult" style="color:red;"></td>
			</tr>
			<tr>
				<td height="35px">&nbsp;</td>
				<td class="SubmitTd">
					<div class="button_area">
						<input type="hidden" id="repeatCheckForexOrderId" value=""/>
						<input  type="button" id="repeatButton" value="运单验重" onclick="repeatCheck('cfyd');" style="display:none;"/>
						<input  type="button" id="repeatDownloadButton" value="下载" onclick="downloadRepeatRecord('cfyd');" style="display:none;"/> 
					</div>
				</td>
			</tr>
			<tr>
				<td align="right" height="35px" id="repeatCheckResult2" style="color:red;"></td>
			</tr>
			<tr>
				<td height="35px">&nbsp;</td>
				<td class="SubmitTd">
					<div class="button_area">
						<input type="hidden" id="repeatCheckForexOrderId2" value=""/>
						<input  type="button" id="repeatButton2" value="订单验重" onclick="repeatCheck('cfdd');" style="display:none;"/>
						<input  type="button" id="repeatDownloadButton2" value="下载" onclick="downloadRepeatRecord('cfdd');" style="display:none;"/> 
					</div>
				</td>
			</tr>

		</table>
	</div>


	<div id="showBankStatus" class="table-list" style="display: none;">
		<input type="hidden" id="_shjsms_" value="">
		<table width="700px;" id="showBankStatusTable">
			<tr>
				<td align="right" height="35px">通道名称：</td>

				<td height="40px" colspan="31"><span id="bankSpan1"></span></td>


			</tr>
			<tr>

				<td align="right" height="35px">

					<div>
						业务类型：<span style="color: red">*</span>
					</div>
					<div>
						<input type="hidden" id="forexOrderIdd" /> <input type="hidden"
							id="idd" /> <input type="hidden" id="merchantNodd" /> <input
							type="hidden" id="merchantOrderNodd" /> <input type="hidden"
							id="gatherCurrencydd" />
					</div>
				</td>

				<td height="40px" colspan="3">
					<div>
						<!--    <input type="radio" name="typeF" value="FOREX_SALE" />购汇
		    <input type="radio" name="typeF"  value="FOREX_PAY"/>付汇 -->
						<input type="radio" name="typeF" value="REMIT" checked="checked" onclick="aaa()"/>付款
					</div> <!--  <div>
		    <input type="radio" name="typeF" value="1sd"/>收汇
		    <input type="radio" name="typeF" value="1sd"/>结汇
		    <input type="radio" name="typeF" value="1sd"/>收款
		    </div> -->

				</td>

			</tr>
			<tr>
				<td align="right" height="35px">状态：<span style="color: red">*</span>
				</td>

				<td height="40px" colspan="3">
<!-- 			<input type="radio" name="statusF" value="SUCCESS"/>成功  -->
<!-- 			<input type="radio" name="statusF" value="FAIL"/>失败</td> -->

				<select id="statusF" name="statusF">
					<option value="SUCCESS">成功</option>
					<option value="FAIL">失败</option>
				</select>
			</tr>
			<tr class="suc">
				<td align="right" height="35px" class="red"><span
					style="color: red">*</span>商户定价汇率：</td>

				<td height="40px"><input type="text" name="rate" id="rateF" />
				</td>
			</tr>
			<tr class="suc">
				<td align="right" height="35px" class="red"><span
					style="color: red">*</span>银行执行汇率：</td>
				<td height="40px"><input type="text" name="bankRate"
					id="bankRateF" /></td>
			</tr>
			<tr class="suc">

				<td align="right" height="35px">外币金额：</td>

				<td height="40px"><input type="text" name="forexAmount"
					id="forexAmountF" /></td>


			</tr>
			<tr class="suc">
				<td align="right" height="35px">渠道手续费：</td>

				<td height="40px"><input type="text" name="channelFee"
					id="channelFeeF" /></td>
				<td align="right" height="35px">代理行手续费：</td>

				<td height="40px"><input type="text" name="agentBankFee"
					id="agentBankFeeF" /></td>
			</tr>

			<tr class="suc">
				<td align="right" height="35px">电汇汇款编号：</td>

				<td height="40px"><input type="text" name="teleNo" id="teleNoF"
					value="" /></td>
				<td align="right" height="35px">电汇手续费：</td>

				<td height="40px"><input type="text" name="teleFee"
					id="teleFeeF" /></td>
			</tr>
			<tr class="suc">
				<td align="right" height="35px">备注：</td>

				<td height="40px"><input type="text" name="comments"
					id="commentsF" value="" /></td>


			</tr>
			<tr class="fail">
				<td align="right" height="35px">失败原因：</td>

				<td height="40px">
					<select id="failContext">
						<option value="">---请选择---</option>
						<option value="oCancel">订单取消</option>
						<option value="oFail">风控失败</option>
					</select>
				</td>
			</tr>
			<tr>
				<td height="35px">&nbsp;</td>
				<td class="SubmitTd">
					<div class="button_area">
						<input style="height: 25px; margin: 10px 0px 0px 0px;"
							type="button" value="确定" onclick="bankStatus();" /> <input
							style="height: 25px; margin: 10px 0px 0px 0px;" type="button"
							value="取消" onclick="closeDialog();" />
					</div>
				</td>
			</tr>
			
		</table>

	</div>

	<div id="showBank" class="table-list" style="display: none;">
		<table width="450px;">
			<tr>
				<td align="right" height="35px">渠道名称：</td>

				<td height="40px"><span id="bankSpan"></span></td>

			</tr>
			<tr>
				<td align="right" height="35px">业务类型：</td>

				<td height="40px"><select id="typeBank" name="typeBank">
						<option value="" selected="selected">请选择</option>
						<option value="REMIT">付款</option>
						<option value="FOREX_SALE">购汇</option>
						<option value="FOREX_PAY">付汇</option>
				</select> <!--  <input type="radio" name="typeBank" value="FOREX_SALE"/>购汇
		    <input type="radio" name="typeBank"  value="FOREX_PAY"/>付汇 --> <!--  <input type="radio" name="typeBank" value="REMIT"/>付款
		   <!--  <div>
		    <input type="radio" name="typeBank" value="1sd"/>收汇
		    <input type="radio" name="typeBank" value="1sd"/>结汇
		    <input type="radio" name="typeBank" value="1sd"/>收款
		    </div> --></td>

			</tr>
			<tr>
				<td align="right" height="35px">&nbsp;</td>
				<td class="SubmitTd">
					<div class="button_area" id="gh"
						style="display: none; margin-top: 10px;"></div>
					<div class="button_area" id="fh"
						style="display: none; margin-top: 10px;"></div>
					<div class="button_area" id="fk"
						style="display: none; margin-top: 10px;"></div>
				</td>
			</tr>

		</table>
	</div>
	<!-- 民生线下模板导出数据 dialog-->
	<div id="showMinShengBank" class="table-list" style="display: none;">
		<table width="450px;">
			<tr>
				<td align="right" height="35px">渠道名称：</td>

				<td height="40px"><span id="MinShengbankSpan"></span></td>

			</tr>
			<tr>
				<td align="right" height="35px">业务类型：</td>

				<td height="40px"><select id="MinShengtypeBank" name="MinShengtypeBank">
						<option value="" selected="selected">请选择</option>
						<!-- <option value="HUIRU">汇入</option> -->
						<option value="HUICHU">汇出</option>
				</select>
				</td>

			</tr>
			<tr>
				<td align="right" height="35px">&nbsp;</td>
				<td class="SubmitTd">
					<div class="button_area" id="jp"
						style="display: none; margin-top: 10px;"></div>
					<div class="button_area" id="jd"
						style="display: none; margin-top: 10px;"></div>
					<div class="button_area" id="hz"
						style="display: none; margin-top: 10px;"></div>
					<div class="button_area" id="gg"
						style="display: none; margin-top: 10px;"></div>
					<div class="button_area" id="xf"
						style="display: none; margin-top: 10px;"></div>
					<div class="button_area" id="ds"
						style="display: none; margin-top: 10px;"></div>
				</td>
			</tr>

		</table>
	</div>
	
	<div id="showBankChannel" class="table-list" style="display: none;">
		<table>
			<tr>
				<td align="right" height="35px">银行：</td>

				<td height="40px"><select id="bankChannel" name="bankChannel">
						<!--  <option value="CMBC001" selected>厦门民生</option>
						    <option value="ECITIC001">北京中信</option>
						    <option value="ICBC001">深圳工行</option>
						    <option value="CMBCHINA001">北京招行</option>
						    <option value="EVERBRIGHT001">光大银行</option> -->
				</select></td>

			</tr>
			<tr>
				<td height="35px">&nbsp;</td>
				<td class="SubmitTd">
					<div class="button_area">
						<input style="height: 25px; margin: 10px 0px 0px 0px;"
							type="button" value="确定" onclick="bankChannel();" /> <input
							type="hidden" id="ID" /> <input
							style="height: 25px; margin: 10px 0px 0px 0px;" type="button"
							value="取消" onclick="closeDialog();" />
					</div>
				</td>
			</tr>
		</table>
	</div>

	<div id="showBankRate" class="table-list" style="display: none;">

		<table width="400px;">
			<tr>
				<td align="right" height="35px">通道名称：</td>

				<td height="40px"><span id="bankNameType"></span></td>
				<input type="hidden" id="orderIdRate" />

			</tr>
			<tr>
				<td align="right" height="35px" class="red"><input type="radio"
					name="rateType" checked="checked" value="REFER_RATE" />境外参考汇率：</td>

				<td height="40px"><span id="referRateSpan"></span> <!-- <input type="text" name="referRate" id="referRate"/> -->
				</td>
			</tr>
			<tr>
				<td align="right" height="35px" class="red"><input type="radio"
					name="rateType" value="FIX_RATE" />境外固定汇率：</td>

				<td height="40px"><span id="fixRateSpan"></span></td>
			</tr>

			<!-- 		<tr>
		   	<td align="right" height="35px">
		   		商户定价汇率：
		    </td>
		    
		    <td  height="40px">
				<input type="text" name="merchantRate" id="merchantRate"/>
		    </td>
		 </tr> -->
			<tr>
				<td height="35px">&nbsp;</td>
				<td class="SubmitTd">
					<div class="button_area">
						<input style="height: 25px; margin: 10px 0px 0px 0px;"
							type="button" value="确定" onclick="sendBankConfirmType();" /> <input
							style="height: 25px; margin: 10px 0px 0px 0px;" type="button"
							value="取消" onclick="closeDialog();" />
					</div>
				</td>
			</tr>
		</table>

	</div>
	<div id="showBankConfirm" class="table-list" style="display: none;">
		<table>
			<tr>
				<td align="right" height="35px" class="red"><input
					type="hidden" id="orderIdConfirm" /> 境外参考汇率:&nbsp;</td>
				<td height="40px"><input type="text" name="referRateConfirm"
					id="referRateConfirm" /></td>
			</tr>
			<tr>
				<td align="right" height="35px" class="red">商户定价汇率:&nbsp;</td>
				<td><input type="text" name="merchantRateConfirm"
					id="merchantRateConfirm" /></td>
			</tr>
			<tr>
				<td height="35px">&nbsp;</td>
				<td class="SubmitTd">
					<div class="button_area">
						<input style="height: 25px; margin: 10px 0px 0px 0px;"
							type="button" value="确定" onclick="remitConfirmDir();" /> <input
							style="height: 25px; margin: 10px 0px 0px 0px;" type="button"
							value="取消" onclick="closeDialog();" />
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div id="forexPayMessageBox1" class="table-list" style="display: none;">

		<table width="400px;">
			<tr>
				<td align="right" height="35px">商户名称：</td>

				<td height="40px"><span id="BX1_payerName"></span></td>
			</tr>
			<tr>
				<td align="right" height="35px">付汇金额：</td>

				<td height="40px"><span id="BX1_amount"></span></td>
			</tr>
		</table>

	</div>
	<form name="exportForm" id="exportForm" target="_black" method="post"
		action="<%=request.getContextPath() %>/cbTrade/forex/order/export">
		<input type="hidden" name="forexOrderId" id="forexOrderId" /> <input
			type="hidden" name="templateFile" id="templateFile" /> <input
			type="hidden" name="type" id="type" />
	</form>
	
	<form name="exportFormMinSheng" id="exportFormMinSheng" target="_black" method="post"
		action="<%=request.getContextPath() %>/static/cbTrade/forex/order/export/minShengBank">
		<input type="hidden" name="merchantOrderNo" id="merchantOrderNo" /> <input
			type="hidden" name="MinShengtemplateFile" id="MinShengtemplateFile" /> <input
			type="hidden" name="MinShengtype" id="MinShengtype" />
	</form>
	
	<form id="downLoadForm" method="post" target="_blank"
		action="<%=request.getContextPath()%>/cbTrade/forex/remit/query?method=download">
	</form>

	<div id="showForexOrderPanel" style="display: none">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6">商户简称</div>
				<div id="p_merchantShortName" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">商户编号</div>
				<div id="p_merchantNo" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">付款人姓名</div>
				<div id="p_payerName" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">付款人账号</div>
				<div id="p_payerAccountNo" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">收款人姓名</div>
				<div id="p_receiverName" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">收款人账号</div>
				<div id="p_receiverAccountNo" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">商户订单号</div>
				<div id="p_merchantOrderNo" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">平台订单号</div>
				<div id="p_orderNo" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">商户结算模式</div>
				<div id="p_mctSettleType" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">商户订单请求时间</div>
				<div id="p_merchantRequestTime" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">所属代理商</div>
				<div id="p_agentMerchantNo" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">业务类型</div>
				<div id="p_tradeType" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">业务类型分类</div>
				<div id="p_tradeTypeKind" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">汇款金额</div>
				<div id="p_sumRemitAmount" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">收款币种</div>
				<div id="p_gatherCurrency" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">收款金额</div>
				<div id="p_sumGatherAmount" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">明细笔数</div>
				<div id="p_detailCount" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">渠道编码</div>
				<div id="p_channelNo" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">商户定价汇率</div>
				<div id="p_exchangeRate" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">银行执行汇率</div>
				<div id="p_bankRate" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">银行购汇金额</div>
				<div id="p_bankRealAmount" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">订单状态</div>
				<div id="p_orderStatus" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">业务处理状态</div>
				<div id="p_businessStatus" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">商户手续费</div>
				<div id="p_merchantFee" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">渠道特征</div>
				<div id="p_channelFeature" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">渠道手续费</div>
				<div id="p_channelFee" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">冻结金额</div>
				<div id="p_frozenAmount" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">银行返回信息</div>
				<div id="p_bankReturnMsg" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">银行流水号</div>
				<div id="p_bankTraceNo" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">平台返回信息</div>
				<div id="p_sysErrorMsg" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">订单来源</div>
				<div id="p_orderSource" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">支付方式</div>
				<div id="p_payMethod" class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-6">回单状态</div>
				<div class="col-md-6">
				 	<span id="backOrder"></span>
				</div>
			</div>
			
		</div>
	</div>
	
	<!-- ljs添加新订单详情页 -->
	
	<div id="showForexOrderPanelNew" style="display: none">
	<input type="hidden" name="cpId" id="cpId"/>
		<input type="hidden" name="crId" id="crId" />
		<div class="container-fluid">
			<div class="panel panel-default">
				<div class="panel-heading"><label>付款信息</label></div>
				<div class="panel-body info">
					<div class="row">
						<div class="col-md-4">商户订单号</div>
						<div class="col-md-8"><input type="text" id="n_merchantOrderNo" name="merchantOrderNo" class="form-control" ></div>
					</div>
					<div class="row">
						<div class="col-md-4">订单请求时间</div>
						<div class="col-md-8"><input type="text" id="n_merchantRequestTime" name="merchantRequestTime" class="form-control" ></div>
					</div>
					<div class="row">
						<div class="col-md-4">结算模式</div>
						<div class="col-md-8"><input type="text" id="n_mctSettleType" name="mctSettleType" class="form-control" ></div>
					</div>
					<div class="row">
						<div class="col-md-4">业务类型</div>
						<div class="col-md-8"><input type="text" id="n_tradeType" name="tradeType" class="form-control" ></div>
					</div>
					<div class="row">
						<div class="col-md-4">汇款金额</div>
						<div class="col-md-8"><input type="text" id="n_sumRemitAmount" name="sumRemitAmount" class="form-control" ></div>
					</div>
					<div class="row">
						<div class="col-md-4">收款币种</div>
						<div class="col-md-8"><input type="text" id="n_gatherCurrency" name="gatherCurrency" class="form-control" ></div>
					</div>
					<div class="row">
						<div class="col-md-4">汇款附言</div>
						<div class="col-md-8"><input type="text" id="n_remitComment" name="remitComment " class="form-control" ></div>
					</div>
				</div>
			</div>
			<form id="cpCrInfoForm">
			<div class="panel panel-default">
				<div class="panel-heading"><label>付款人信息</label></div>
				<div class="panel-body payInfo">
					<div class="row">
						<div class="col-md-4">付款人主体类型</div>
						<div class="col-md-8">
<!-- 							<input type="text" name="payerType" id="payerType" class="form-control" /> -->
							<select id="payerType" name="payerType" class="form-control" disabled="disabled">
								<option value="">付款人主题类型</option>
								<option value="C">企业</option>
								<option value="D">个人</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">付款人身份证号</div>
						<div class="col-md-8">
							<input type="text" name="payerIdNo" id="payerIdNo" class="form-control payRecInfo" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">付款人联系方式</div>
						<div class="col-md-8">
							<input type="text" name="payerPhoneNo" id="payerPhoneNo"  class="form-control payRecInfo" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">付款人名称</div>
						<div class="col-md-8">
							<input type="text" name="payerName" id="payerName"  class="form-control payRecInfo" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">付款人国家</div>
						<div class="col-md-8">
<!-- 							<input type="text" name="payerCountry" id="payerCountry" class="form-control" /> -->
							<select id="payerCountry" name="payerCountry"
																	class="form-control payRecInfo" tabindex="10">
																	<option value="">请选择国家</option>
																		<c:forEach items="${countrys}" var="con">
																			<option value="${con.constantId}">${con.constantName}</option>
																		</c:forEach>		
																	</select>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">付款人地址</div>
						<div class="col-md-8">
							<input type="text" name="payerAddr" id="payerAddr"  class="form-control payRecInfo" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">付款人账号</div>
						<div class="col-md-8">
							<input type="text" name="payerAccountNo" id="payerAccountNo" class="form-control payRecInfo" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">付款行地址</div>
						<div class="col-md-8">
							<input type="text" name="payerBankAddr" id="payerBankAddr" class="form-control payRecInfo" />
						
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">付款行名称</div>
						<div class="col-md-8">
							<input type="text" name="payerBankName" id="payerBankName" class="form-control payRecInfo" />
						</div>
					</div>
				</div>
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading"><label>收款人信息</label></div>
				<div class="panel-body recInfo">
					<div class="row">
						<div class="col-md-4">收款人姓名</div>
						<div class="col-md-8">
							<input type="text" name="receiverName" id="receiverName" class="form-control payRecInfo" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">收款人国家</div>
						<div class="col-md-8">
	<!-- 						<input type="text" name="receiverCountry" id="receiverCountry" class="form-control" /> -->
							<select id="receiverCountry" name="receiverCountry"
																		class="form-control payRecInfo" tabindex="10">
																		<option value="">请选择国家</option>
																		<c:forEach items="${countrys}" var="con">
																				<option value="${con.constantId}">${con.constantName}</option>
																			</c:forEach>	
																	</select>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">收款人地址</div>
						<div class="col-md-8">
							<input type="text" name="receiverAddr" id="receiverAddr" class="form-control payRecInfo" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">收款人账号</div>
						<div class="col-md-8">
							<input type="text" name="receiverAccountNo" id="receiverAccountNo" class="form-control payRecInfo" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">收款行地址</div>
						<div class="col-md-8">
							<input type="text" name="receiverBankAddr" id="receiverBankAddr" class="form-control payRecInfo" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">收款行名称</div>
						<div class="col-md-8">
							<input type="text" name="receiverBankName" id="receiverBankName" class="form-control payRecInfo" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">收款行swift代码</div>
						<div class="col-md-8">
							<input type="text" name="revBankSwiftCode" id="revBankSwiftCode"  class="form-control payRecInfo" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">代理行地址</div>
						<div class="col-md-8">
							<input type="text" name="agentBankAddr" id="agentBankAddr" class="form-control payRecInfo" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">代理行名称</div>
						<div class="col-md-8">
							<input type="text" name="agentBankName" id="agentBankName" class="form-control payRecInfo"/>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">代理行swift代码</div>
						<div class="col-md-8">
							<input type="text" name="agentBankSwiftCode" id="agentBankSwiftCode"  class="form-control payRecInfo" />
						</div>
					</div>
				</div>
			</div>
			</form>
			<div class="panel panel-default">
				<div class="panel-heading"><label>其他信息</label></div>
				<div class="panel-body otherInfo">
					<div class="row">
						<div class="col-md-4">商户定价汇率</div>
						<div class="col-md-8">
							<input type="text" name="exchangeRate" id="n_exchangeRate" class="form-control" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">银行执行汇率</div>
						<div class="col-md-8">
							<input type="text" name="bankRate" id="n_bankRate" class="form-control" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">银行购汇金额</div>
						<div class="col-md-8">
							<input type="text" name="bankRealAmount" id="n_bankRealAmount" class="form-control" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">商户手续费</div>
						<div class="col-md-8">
							<input type="text" name="merchantFee" id="n_merchantFee" class="form-control" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">冻结金额</div>
						<div class="col-md-8">
							<input type="text" name="frozenAmount" id="n_frozenAmount" class="form-control" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">支付方式</div>
						<div class="col-md-8">
							<input type="text" name="payMethod" id="n_payMethod" class="form-control" />
						</div>
					</div>
<!-- 					<div class="row"> -->
<!-- 						<div class="col-md-4">银行回单</div> -->
<!-- 						<div class="col-md-8"> -->
<!-- 							<a href="#" style="color: red">xxxxx.xls</a> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<div class="row">
						<div class="col-md-4">商户回单</div>
						<div class="col-md-8">
								<a target="_blank" href="" id="downBackOrder"></a>
						</div>
					</div>
				</div>
			</div>
			<div style="width: 200px;margin: auto;text-align: center;" id="showCmdBtn">
				<button class="btn btn-danger" type="button" id="editSave" onclick="updateSaveBtn(this)">修改</button> 
				<button class="btn btn-danger" style="margin-left: 50px" type="button" onclick="closeShowCpCrInfo()">取消</button> 
			</div>
		</div>
	</div>
	
	

	<div id="orderReEXC" style="display: none;">
		<input id="reCheckMerchantNoEXC" value="" name="reCheckMerchantNo"
			hidden="true" /> <input id="reCheckMerchantOrderNoEXC" value=""
			name="reCheckMerchantOrderNo" hidden="true" />
		<div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h2 class="panel-title">
						<span id="r_c_result"> 系统异常，请手工审核！</span>
					</h2>
				</div>
			</div>
		</div>
	</div>

	<div id="orderReCheck" style="display: none;">
		<input id="reCheckMerchantNo" value="" name="reCheckMerchantNo"
			hidden="true" /> <input id="reCheckMerchantOrderNo" value=""
			name="reCheckMerchantOrderNo" hidden="true" />
		<div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h2 class="panel-title">
						核查结果：<span id="r_c_result"></span>
					</h2>
				</div>
				<div class="listMain">
					<div class="listBox">
						<ul class="list clearfix">
							<li>商户黑白名单</li>
							<li id="r_c_mctBlackResult"></li>
						</ul>
					</div>
				</div>
				<div class="listMain">
					<div class="listBox">
						<ul class="list clearfix">
							<li>单笔限额</li>
							<li id="r_c_singleResult"></li>
							<li><a class="detailBtn" href="javascript:;">详细</a></li>
						</ul>
						<div class="clearfix detail">
							<div id="r_c_singleResult_detail"
								class="table-responsive border0 overflow"
								style="overflow-y: auto;">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>明细ID</th>
											<th>订单单笔金额（美元）</th>
											<th>错误原因</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="listMain">
					<div class="listBox">
						<ul class="list clearfix">
							<li>单价限额</li>
							<li id="r_c_unitPriceResult"></li>
							<li><a class="detailBtn" href="javascript:;">详细</a></li>
						</ul>
						<div class="clearfix detail">
							<div id="r_c_unitPriceResult_detail"
								class="table-responsive border0 overflow"
								style="overflow-y: auto;">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>明细ID</th>
											<th>订单单价（人民币）</th>
											<th>错误原因</th>
										</tr>
									</thead>
									<tbody id="r_c_unitPriceResult_detail_tbody">
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="listMain">
					<div class="listBox">
						<ul class="list clearfix">
							<li>个人频率/月</li>
							<li id="r_c_maximumMounthResult"></li>
							<li><a class="detailBtn" href="javascript:;">详细</a></li>
						</ul>
						<div class="clearfix detail">
							<div id="r_c_maximumMounthResult_detail"
								class="table-responsive border0 overflow"
								style="overflow-y: auto;">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>明细ID</th>
											<th>个人频率/月</th>
											<th>错误原因</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="listMain">
					<div class="listBox">
						<ul class="list clearfix">
							<li>实名认证</li>
							<li id="r_c_realNameResult"></li>
							<li id="r_c_realnameBtn"><a class="detailBtn" href="javascript:;">详细</a>&nbsp;|
							<a href="#0" onclick="reportRiskErrorDate('REALNAME');return false;" >下载</a>&nbsp;|
							<a id="recheckRealnameBtn" href="#0" onclick="recheckRealname();return false;" >重验</a>
							</li>
						</ul>
						<div class="clearfix detail">
							<div id="r_c_realNameResult_detail"
								class="table-responsive border0 overflow"
								style="overflow-y: auto;">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>明细ID</th>
											<th>用户名</th>
											<th>身份证号</th>
											<th>错误原因</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="listMain">
					<div class="listBox">
						<ul class="list clearfix">
							<li>运单核查</li>
							<li id="r_c_waybillResult"></li>
							<li><a class="detailBtn" href="javascript:;">详细</a></li>
						</ul>
						<div class="clearfix detail">
							<div id="r_c_waybillResult_detail"
								class="table-responsive border0 overflow"
								style="overflow-y: auto;">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>明细ID</th>
											<th>订单号</th>
											<th>错误原因</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div id="showBankRate2" style="display: none;">

		<table width="400px;">
			<tr>
				<td align="right" height="35px">通道名称：</td>

				<td height="40px"><span id="bankNameType2"></span></td>
				<input type="hidden" id="orderIdRate2" />

			</tr>
			<tr>
				<td align="right" height="35px">商户名称：</td>

				<td height="40px"><span id="payerNameType2"></span></td>
			</tr>
			<tr>
				<td align="right" height="35px">购汇金额：</td>

				<td height="40px"><span id="exchangeAmountType2"></span></td>
			</tr>
			<tr>
				<td align="right" height="35px">参考汇率：</td>

				<td height="40px"><span id="referRateSpan2"></span> <!-- <input type="text" name="referRate" id="referRate"/> -->
				</td>
			</tr>
			<!-- 
		<tr>
		   	<td align="right" height="35px">
		   		商户定价汇率：
		    </td>
		    
		    <td  height="40px">
				<input type="text" name="merchantRate" id="merchantRate2"/>
		    </td>
		 </tr>
		  -->
		</table>

	</div>
	<div id="upPetition" style="display: none;">
		<form name="upPetitionForm"
			action="<%=request.getContextPath()%>/static/cbTrade/forex/remit/upPetition"
			enctype="multipart/form-data">
			<input type="file" name="petition">
		</form>
	</div>
	<div id='_remark_dialog_' style="display: none;">
		<p>
			申报附言为银行申报使用,根据<b>不同产品申报附言不同</b>,填写申报附言时如不确认填写内容请咨询银行相关业务人员。
		</p>
		<br>
		<input type='text' class="form-control"
			id='_remark_dialog_transactionRemark' name='transactionRemark' value="">
	</div>

</body>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/statics/v2/js/jquery.acronymword.js"></script>
<script type="text/javascript">

    function ContractWord(){
		$('#result_tab tr td,:nth-of-type(13),:nth-of-type(14)').each(function(){
			$(this).AcronymWord({
				delay:1500,
				acronymChar:'...',
				len:15
			});
		});
	}
	$(document).ready(function(){
		ContractWord();
	});
	function upPetition(merchantNo,merchantOrderNo){
		$("#upPetition").dialog({
			autoOpen:true,
			width:300,
			height:150,
			modal:true,
			buttons:{
				"确定":function(){
					$("#upPetition").dialog("close");
		            var url = document.upPetitionForm.action; 
		            // FormData 对象
		            var form = new FormData(document.upPetitionForm);
		            form.append("merchantNo",merchantNo);
		            form.append("merchantOrderNo",merchantOrderNo);
		            $.ajax({
		            	url:url,
		            	data:form,
		            	type:"POST",
		            	processData:false,
		            	contentType:false,
		            	success:function(data){
		            		alert(data.msg);
		            	},
		            	error:function(e){
		            		alert(e);
		            	}
		            });
					//document.upPetitionForm.merchantNo=merchantNo;
					//document.upPetitionForm.merchantOrderNo=merchantOrderNo;
					//document.upPetitionForm.submit();
				},
				"取消":function(){
					$("#upPetition").dialog("close");
				}
			}
		});
		
	}
</script>
<script type="text/javascript">
	
	$(function(){

        var num = 0;

        $('.detailBtn').each(function(index){
            $(this).attr('data-index',index)
        });

        $('.detailBtn').click(function(){

            var isThis = true;

            if(num == $(this).attr('data-index')){
                isThis = false;
            }else{
                num = $(this).attr('data-index')
            }

            $('.detailBtn').each(function(index){
                $('.detail').eq(index).hide();

                if(isThis){
                    $(this).attr('data-open','false');
                }

            });

            if($(this).attr('data-open') != 'true'){
                $(this).attr('data-open','true');
            }else{
                $(this).attr('data-open','false');
            }

            if($(this).attr('data-open') != 'true'){
                $('.detail').eq($(this).attr('data-index')).hide();
            }else{
                $('.detail').eq($(this).attr('data-index')).show();
            }

        });
        
       
        //页面加载判断结果录入选择状态
        $("#statusF").change(function(){
        	var va = $(this).val();
        	if(va=='SUCCESS')
        	{
        		insertResult = "SUCCESS";
        		$(".suc").show();
        		$(".fail").hide();
        		$("#showBankStatus").dialog({
					title: "跨境结果录入",
					width:750,
					height: 450,
        		});
        		$("#showBankStatusTable").attr("width","700px");
        	}else
        	{
        		insertResult = "FAIL";
        		$(".suc").hide();
        		$(".fail").show();	
        		$("#showBankStatus").dialog({
					title: "跨境结果录入",
					width:300,
					height: 280,
        		});
        		$("#showBankStatusTable").attr("width","280px");

        	}
        });
        
    });
		var insertResult = "SUCCESS";
	
		var showBank;
		
		function downLoadOrder(){
			$('#downLoadForm').empty();
			var v = $('#queryForm').serializeArray();
			for(var i=0;i<v.length;i++){
				$('#downLoadForm').append($('<input type="hidden" name="'+v[i].name+'" value="'+format(v[i].value)+'"/>'));
			}
			$('#downLoadForm').submit();
			return false;
		}
		function isNull(value){
			if(value==undefined||value==null||value=='')return true;
		}
		function format(value){
			if(isNull(value))
				value="";
			return value
		}
		function remitConfirmDir(){
			var id=$("#orderIdConfirm").val();
		    var referRateConfirm=$("#referRateConfirm").val();
			var merchantRateConfirm=$("#merchantRateConfirm").val();
			if(isNull(merchantRateConfirm)){
				alert("请输入商户定价汇率");
				return false;
			}
			if(isNull(referRateConfirm)){
				alert("请输入参考汇率");
				return false;
			}
			closeDialog();
			var url = '<%=request.getContextPath()%>/cbTrade/forex/order/remitconfirm';
			var params = 'id='+ id
			           + '&exchangeRate='+ merchantRateConfirm
			           + '&bankRate='+referRateConfirm;
			$.post(url, params, checkAjaxResponsest);
			showBank.dialog("close");
		}
		function checkAjaxResponsest(obj) {
			hideCover();
			alert(obj.msg);
			if (!obj.err) {	
				formSubmit();
			}
		}
		function doChannelEntry(id,gatherCurrency){
		    $("#ID").val(id);
			var url = '<%=request.getContextPath()%>/cbTrade/forex/channel/query';
			var params ='exchangeType=REMIT'+
						'&gatherCurrency='+gatherCurrency;
			$.post(url,params,checkAjaxResponsetd);	
	   } 
		
	  function checkAjaxResponsetd(obj) {
		    if (obj.err) {	
		    	alert(obj.msg);
			} else {
				var icoll = obj.channels;
				var str="";
				for (var i = 0;i < icoll.length;i ++) {
					var kcoll = icoll[i];
					var file=kcoll.channelNo;
					var name=kcoll.channelName;
					str+='<option value=\''+  file  +'\'>'+name+'</option>';
		    	}
		    	$("#bankChannel").html(str);
				showBank =  $("#showBankChannel").dialog({
						autoOpen: false,
						title: "选择银行通道",
						width: 400,
						height: 200,
						modal: true,
						close: function(){
					    }
					});
				showBank.dialog("open");
			}
		}	
		function remitConfirm(id,bank,bankid,gatherCurrency,cnyAmt,foreAmt){
			if(confirm("    银行交易信息\n付款人民币金额: "+cnyAmt+"\n    付款外币金额:"+foreAmt+"\n  确定要付款吗?")){
				$("#orderIdConfirm").val(id);
				
				if("CNY"==gatherCurrency){
					var url = '<%=request.getContextPath()%>/cbTrade/forex/order/remitconfirm';
					var params = 'id='+ id;
					$.post(url, params, checkAjaxResponsest);
					showBank.dialog("close");
				}else{
					showBank =  $("#showBankConfirm").dialog({
						autoOpen: false,
						title: "汇款确认",
						width:300,
						height: 200,
						modal: true,
						close: function(){
					    }
					});
					showBank.dialog("open");
				}
			}
		}
	
	 function bankChannel(){
			closeDialog();
			var id=$("#ID").val();
			var bankId=$("#bankChannel").val();
			var url = '<%=request.getContextPath()%>/cbTrade/forex/order/choosechannel';
			var params = 'id=' + id + '&bankId=' + bankId;
			$.post(url, params, checkAjaxResponsess);
			showBank.dialog("close");
		}
	 function closeDialog(){
			showBank.dialog("close");
		}

		function checkAjaxResponsess(obj) {
		    if (obj.err) {	
		    	alert(obj.msg);
			} else {
				formSubmit();
			}
		}
		
		function doTypeChange(id,forexOrderId,businessRange,tradeType,channelNo){
			$('#businessRangeChange').val(businessRange);
			$('#tradeType').val(tradeType);
			$('#idChange').val(id);
			$('#forexIdChange').val(forexOrderId);
			var url = '<%=request.getContextPath()%>/static/cbTrade/forex/tradeType/query';
			var params ='channelNo='+channelNo;
			$.post(url,params,checkAjaxResponsetd2);	
		}
		
		function checkAjaxResponsetd2(obj) {
		    if (obj.err) {	
		    	alert(obj.msg);
			} else {
				var icoll = obj.tradeTypes;
				var str="";
				var tradeType = $('#tradeType').val();
				for (var i = 0;i < icoll.length;i ++) {
					var kcoll = icoll[i];
					var file=kcoll.des;
					var name=kcoll.comment;
					if(tradeType==file){
						str+='<option value=\''+  file  +'\' selected="selected">'+name+'</option>';
					}else{
						str+='<option value=\''+  file  +'\'>'+name+'</option>';
					}
					
		    	}
		    	$("#tradeTypeChange").html(str);
		    	showBank =  $("#showType").dialog({
					autoOpen: false,
					title: "跨境业务类型调整",
					width:400,
					height: 200,
					modal: true,
					close: function(){
				    }
				});
				showBank.dialog("open");
			}
		}	
		
		function doStatusEntry(mctSettleType,id,forexOrderId,bankId,merchantNo,merchantOrderNo,gatherCurrency,bankRate,bankGatherAmount){
			$("#bankSpan1").html(bankId);
			$("#_shjsms_").val(mctSettleType);
			if("PAY_FIX_CNY"==mctSettleType){
				$("#rateF").val("");
				$("#rateF").attr("readonly","readonly");
			}else{
				$("#rateF").val("");
				$("#rateF").removeAttr("readonly");
			}
			 $("#forexOrderIdd").val(forexOrderId);
			 $("#idd").val(id);
			 $("#merchantNodd").val(merchantNo);
			 $("#merchantOrderNodd").val(merchantOrderNo);
			 $("#gatherCurrencydd").val(gatherCurrency);
			 $("#bankRateF").val(bankRate);
			 $("#forexAmountF").val(bankGatherAmount);
			showBank =  $("#showBankStatus").dialog({
						autoOpen: false,
						title: "跨境结果录入",
						width:750,
						height: 450,
						modal: true,
						close: function(){
					    }
			});
			$(".fail").hide();
			showBank.dialog("open");
			$(".suc").show();
    		$(".fail").hide();
    		$("#showBankStatusTable").attr("width","700px");
    		$("#statusF").val("SUCCESS");
		}
		
		function showRepeatCheck(forexOrderId){
			$("#repeatButton").hide();
			$("#repeatDownloadButton").hide();
			$("#repeatButton").val("校验运单号");
			var result="运单校验结果:";
			$("#repeatCheckForexOrderId").val(forexOrderId);
			$.post( "<%=request.getContextPath()%>/static/cbTrade/forex/remit/queryRepeatCheckResult",{
				forexOrderId:forexOrderId,
				type:"cfyd",
				},
				function (data){
					if(data=="SUCCESS"){
						$("#repeatCheckResult").text(result+"校验成功,没有重复运单号");
					}else if(data=="FAIL"){
						$("#repeatCheckResult").text(result+"校验失败,存在重复运单号");
						$("#repeatButton").val("重新校验");
						$("#repeatButton").show();
						$("#repeatDownloadButton").show();
					}else{
						$("#repeatCheckResult").text(result+"未校验");
						$("#repeatButton").show();
					}
				}
			);
			$("#repeatButton2").hide();
			$("#repeatDownloadButton2").hide();
			$("#repeatButton2").val("校验订单号");
			var result2="订单校验结果:";
			$("#repeatCheckForexOrderId2").val(forexOrderId);
			$.post( "<%=request.getContextPath()%>/static/cbTrade/forex/remit/queryRepeatCheckResult",{
				forexOrderId:forexOrderId,
				type:"cfdd",
				},
				function (data){
					if(data=="SUCCESS"){
						$("#repeatCheckResult2").text(result2+"校验成功,没有重复订单号");
					}else if(data=="FAIL"){
						$("#repeatCheckResult2").text(result2+"校验失败,存在重复订单号");
						$("#repeatButton2").val("重新校验");
						$("#repeatButton2").show();
						$("#repeatDownloadButton2").show();
					}else{
						$("#repeatCheckResult2").text(result2+"未校验");
						$("#repeatButton2").show();
					}
				}
			);
			showBank =  $("#showRepeatCheck").dialog({
				autoOpen: false,
				title: "单号重复校验",
				width: 400,
				height: 200,
				modal: true,
				close: function(){
			    }
			});
			showBank.dialog("open");
		}
		
		function repeatCheck(checktype){
			if(checktype=="cfyd"){//重复运单
				$("#repeatButton").hide();
				$("#repeatDownloadButton").hide();
				var result="运单校验结果:";
				var forexOrderId = $("#repeatCheckForexOrderId").val();
				$.post( "<%=request.getContextPath()%>/static/cbTrade/forex/remit/repeatCheck",{
						forexOrderId:forexOrderId,
						type:checktype,
					},
					function (data){
						if(data=="SUCCESS"){
							$("#repeatCheckResult").text(result+"校验成功,没有重复运单号");
						}else if(data=="FAIL"){
							$("#repeatCheckResult").text(result+"校验失败,存在重复运单号");
							$("#repeatDownloadButton").show();
						}
					}
				);
			}else{//重复订单
				$("#repeatButton2").hide();
				$("#repeatDownloadButton2").hide();
				var result="订单校验结果:";
				var forexOrderId = $("#repeatCheckForexOrderId2").val();
				$.post( "<%=request.getContextPath()%>/static/cbTrade/forex/remit/repeatCheck",{
						forexOrderId:forexOrderId,
						type:checktype
					},
					function (data){
						if(data=="SUCCESS"){
							$("#repeatCheckResult2").text(result+"校验成功,没有重复订单号");
						}else if(data=="FAIL"){
							$("#repeatCheckResult2").text(result+"校验失败,存在重复订单号");
							$("#repeatDownloadButton2").show();
						}
					}
				);
			}
		}
		
		function downloadRepeatRecord(checktype){
			if(checktype=="cfyd"){
				var forexOrderId = $("#repeatCheckForexOrderId").val();
				window.location.href="<%=request.getContextPath()%>/static/cbTrade/forex/remit/downloadRepeatCheckRecord?forexOrderId="+forexOrderId+"&checkType="+checktype;	
			}else{
				var forexOrderId = $("#repeatCheckForexOrderId2").val();
				window.location.href="<%=request.getContextPath()%>/static/cbTrade/forex/remit/downloadRepeatCheckRecord?forexOrderId="+forexOrderId+"&checkType="+checktype;		
			}
		}
		
		function changePayMethod(id,payMethod){
			$("#payMethodId").val(id);
			$("#payMethod").empty();
			if(payMethod==null || payMethod == ''){
				$("<option value='' selected>无</option>").appendTo("#payMethod");
				$("<option value='OUR'>付款人全部承担</option>").appendTo("#payMethod");
				$("<option value='BEN'>收款人全部承担</option>").appendTo("#payMethod");
				$("<option value='SHA'>付款人收款人共同承担</option>").appendTo("#payMethod");
			}else if(payMethod=='OUR'){
				$("<option value=''>无</option>").appendTo("#payMethod");
				$("<option value='OUR' selected>付款人全部承担</option>").appendTo("#payMethod");
				$("<option value='BEN'>收款人全部承担</option>").appendTo("#payMethod");
				$("<option value='SHA'>付款人收款人共同承担</option>").appendTo("#payMethod");
			}else if(payMethod=='BEN'){
				$("<option value=''>无</option>").appendTo("#payMethod");
				$("<option value='OUR' >付款人全部承担</option>").appendTo("#payMethod");
				$("<option value='BEN' selected >收款人全部承担</option>").appendTo("#payMethod");
				$("<option value='SHA'>付款人收款人共同承担</option>").appendTo("#payMethod");
			}else if(payMethod=='SHA'){
				$("<option value=''>无</option>").appendTo("#payMethod");
				$("<option value='OUR'>付款人全部承担</option>").appendTo("#payMethod");
				$("<option value='BEN'>收款人全部承担</option>").appendTo("#payMethod");
				$("<option value='SHA' selected >付款人收款人共同承担</option>").appendTo("#payMethod");
			}
			 
			showBank =  $("#showPayMethod").dialog({
				autoOpen: false,
				title: "选择支付方式",
				width: 400,
				height: 300,
				modal: true,
				close: function(){
			    }
			});
			showBank.dialog("open");
		}
		
		function payMethodChange(){
			var id = $("#payMethodId").val();
			var payMethod = $("#payMethod").val();
			if(isNull(payMethod)){
				alert("请选择支付方式");
				return false;
			}
			closeDialog();
			var url = '<%=request.getContextPath()%>/static/cbTrade/forex/remit/updatePayMethod';
			var params = 'id='+ id + '&payMethod='+ payMethod;
			$.post(url, params, checkAjaxResponsest);
			showBank.dialog("close");
		}
		
	
//-------------------------------民生线下模板导出   点击事件开始----------------------------------------
		function exportExcMinSheng(id,bankChannel){ 
			$("#merchantOrderNo").val(id);
			var url = '<%=request.getContextPath()%>/cbTrade/forex/channel/query';
			var params = 'channelNo=' + bankChannel;
			
			$.post(url, params, processResponsefgMinSheng);	
		}
		function processResponsefgMinSheng(obj) {
			if (obj.err) {	
		    	alert(obj.msg);
			} else {
				var channel = obj.channels[0];
				$("#MinShengbankSpan").html(channel.channelName);
				var jp_str = '<div style="margin-top:5px;"><a href="#1" onclick = "exportInfMinSheng(\'jp\');return false;">机票</a></div>';
				var gg_str = '<div style="margin-top:5px;"><a href="#1" onclick = "exportInfMinSheng(\'gg\');return false;">广告</a></div>';
				var hz_str = '<div style="margin-top:5px;"><a href="#1" onclick = "exportInfMinSheng(\'hz\');return false;">会展</a></div>';
				var xf_str = '<div style="margin-top:5px;"><a href="#1" onclick = "exportInfMinSheng(\'xf\');return false;">学费</a></div>';
				var jd_str = '<div style="margin-top:5px;"><a href="#1" onclick = "exportInfMinSheng(\'jd\');return false;">酒店</a></div>';
				var ds_str = '<div style="margin-top:5px;"><a href="#1" onclick = "exportInfMinSheng(\'ds\');return false;">电商</a></div>';
				
				$("#jp").html(jp_str);
				$("#gg").html(gg_str);
				$("#hz").html(hz_str);
				$("#xf").html(xf_str);
				$("#jd").html(jd_str);
				$("#ds").html(ds_str);
				
				
				showBank =  $("#showMinShengBank").dialog({
					autoOpen: false,
					title: "选择银行模板",
					width: 400,
					height: 300,
					modal: true,
					close: function(){
					}
				});
				showBank.dialog("open");	
			}
		}
		
		function exportInfMinSheng(file){
			$("#MinShengtemplateFile").val(file);
			var type=$('#MinShengtypeBank').val();
			$("#MinShengtype").val(type);
			$("#exportFormMinSheng").submit();
			closeDialog();
		}
		
		$(function(){
			$('#MinShengtypeBank').change(function(){
			    var type= $(this).val();
			    if(type=='HUIRU'){  
				    $("#ds").css("display","block");
				    $("#gg").css("display","none");
				    $("#jp").css("display","none");
				    $("#hz").css("display","none");
				    $("#jd").css("display","none");
				    $("#xf").css("display","none");
				 }else if(type=='HUICHU'){
					$("#ds").css("display","none");
				    $("#gg").css("display","block");
				    $("#jp").css("display","block");
				    $("#hz").css("display","block");
				    $("#jd").css("display","block");
				    $("#xf").css("display","block");
				 }else{
					alert("暂不支持此通道");
					}
			   });
		});
//---------------------------------------民生线下模板导出   点击事件结束----------------------------------

		function exportExc(id,bankChannel){ 
			$("#forexOrderId").val(id);
			var url = '<%=request.getContextPath()%>/cbTrade/forex/channel/query';
			var params = 'channelNo=' + bankChannel;
			
			$.post(url, params, processResponsefg);	
		}

		function processResponsefg(obj) {
		    if (obj.err) {	
		    	alert(obj.msg);
			} else {
				var channel = obj.channels[0];
				$("#bankSpan").html(channel.channelName);
				var icoll = [];
				var icoll1 = [];
				var icoll2 =  [];
				var bizModeList = channel.bizModeList;
				for(var i=0;i<bizModeList.length;i++){
					var exchangeType = bizModeList[i];
					if(exchangeType=='FOREX_SALE'){
						var t=channel.dataTemplateMap.FOREX_SALE;
						for(var j=0;j<t.length;j++){
							icoll.push(t[j]);
						}
					}
					if(exchangeType=='FOREX_PAY'){
						var t=channel.dataTemplateMap.FOREX_PAY;
						for(var j=0;j<t.length;j++){
							icoll1.push(t[j]);
						}
					}
					if(exchangeType=='REMIT'){
						var t=channel.dataTemplateMap.REMIT;
						for(var j=0;j<t.length;j++){
							icoll2.push(t[j]);
						}
					}
				}
				
				var str="";
				for (var i = 0;i < icoll.length;i ++) {
					
					var kcoll = icoll[i];
					var file=kcoll.tempFile;
					var name=kcoll.tempName;
				
					str+='<div style="margin-top:5px;"><a href="#1" onclick = "exportInf(\''+  file  +'\');return false;">'+name+'</a></div>';
					
		    	}
				$("#gh").html(str);
				var str1="";
				for (var i = 0;i < icoll1.length;i ++) {
					var kcoll = icoll1[i];
					var file=kcoll.tempFile;
					var name=kcoll.tempName;
				str1+='<div style="margin-top:5px;"><a href="#1" onclick = "exportInf(\''+  file  +'\');return false;">'+name+'</a></div>';
				
				}
				$("#fh").html(str1);
				var str2="";
				for (var i = 0;i < icoll2.length;i ++) {
					var kcoll = icoll2[i];
					var file=kcoll.tempFile;
					var name=kcoll.tempName;
					str2+='<div style="margin-top:5px;"><a href="#1" onclick = "exportInf(\''+  file  +'\');return false;">'+name+'</a></div>';
				}
				$("#fk").html(str2);
				showBank =  $("#showBank").dialog({
						autoOpen: false,
						title: "选择银行模板",
						width: 400,
						height: 300,
						modal: true,
						close: function(){
					    }
					});
				showBank.dialog("open");
			}
		}
		//购汇
		function forexSale(id,bank,bankid,gatherCurrency,name,amount,currency){
			showCover();
			$("#orderIdRate2").val(id);
			$("#payerNameType2").html(name);
			$("#exchangeAmountType2").html(amount+"   ("+currency+")");
			$("#bankNameType2").html(bank);
			var url = '<%=request.getContextPath() %>/cbTrade/forex/order/querybankrate';
			var params = 'channelNo='+ bankid
			           + '&currency='+ gatherCurrency;
			$.post( url, params, checkAjaxResponseRate2);
			
		}
		function checkAjaxResponseRate2(obj){
			hideCover();
			if (obj.err) {	
		    	alert(obj.msg);
			} else {
				var kcoll = obj.res;
				var referRate=kcoll.referRate;
				var fixRate=kcoll.fixRate;
				$("#referRateSpan2").html(referRate);
				$("#showBankRate2").dialog({
						autoOpen: true,
						title: "确定要购汇吗?",
						width:450,
						height: 300,
						modal: true,
						buttons:{
							"确定":function(){
								$("#showBankRate2").dialog("close");
								var url = '<%=request.getContextPath() %>/cbTrade/forex/order/send2bank';
								var id=$("#orderIdRate2").val();
								$.post(url, {id:id}, checkAjaxResponsess);
							},
							"取消":function(){
								$("#showBankRate2").dialog("close");
							}
						}
					});
				}
		}
		function exportInf(file){
			$("#templateFile").val(file);
			var type=$('#typeBank').val();
			$("#type").val(type);
			$("#exportForm").submit();
			closeDialog();
		}
		function exportDetail(id){
			var bankId=$(id).val();
			$("#bankId").val(bankId);
			$("#currentStep").val("2");
			$("#exportForm").submit();
			closeDialog();
		}

		//ljs
		function bankStatus(){
			var id=$("#idd").val();
			var forexOrderId=$("#forexOrderIdd").val();
			var merchantNo=$("#merchantNodd").val();
			var merchantOrderNo=$("#merchantOrderNodd").val();
			var type=$('input[name="typeF"]:checked').val();
			var status=$('#statusF').val();
			var rate=$("#rateF").val();
			var forexAmount=$("#forexAmountF").val();
			var channelFeeF=$("#channelFeeF").val();
			var agentBankFee=$("#agentBankFeeF").val();
			var teleNo=$("#teleNoF").val();
			var teleFee=$("#teleFeeF").val();
			var comments=$("#commentsF").val();
			var bankRate=$("#bankRateF").val();
			var gatherCurrency=$("#gatherCurrencydd").val();
			var shjsms=$("#_shjsms_").val();

			if(insertResult=="SUCCESS")
			{
				if(isNull(type)){
					alert("请选择业务类型");
					return false;
				}
				if(isNull(status)){
					alert("请选择状态");
					return false;
				}
				if(gatherCurrency!='CNY' && (type=='FOREX_SALE' || type=='REMIT')){
					if(isNull(bankRate)){
						alert("请输入银行执行汇率");
						return false;
						}
					if(isNull(rate)&&!(shjsms=="PAY_FIX_CNY")){
						alert("收款币种为外币时牌价必填");
						return false;
						}else if(shjsms=="PAY_FIX_CNY"){
							rate=bankRate;
						}
				}
				
			}else
			{
				var failContext = $("#failContext").val();
				if(failContext==""||failContext==null)
				{
					alert("请选择失败原因");
					return false;
				}
				comments = failContext;
			}
			closeDialog();
			var url = '<%=request.getContextPath()%>/cbTrade/forex/order/resultinput';
			var params = 'id='+ id
			           + '&forexOrderId='+ forexOrderId
			           + '&merchantNo='+ merchantNo
			           + '&merchantOrderNo='+ merchantOrderNo
			           + '&businessType='+ type
			           + '&status='+ status
			           + '&exchangeRate='+ rate
			           + '&forexAmount='+ forexAmount
			           + '&channelFee='+ channelFeeF
			           + '&agentBankFee='+ agentBankFee
			           + '&teleNo='+ teleNo
			           + '&teleFee='+ teleFee
			           + '&comments='+ comments
			           + '&bankRate='+bankRate;
			$.post(url, params,function(obj){
				 if (obj.err) {	
				    alert(obj.msg);
				 } else {
					formSubmit();
				 }
			});
			showBank.dialog("close");
			
		}

		function confirmType(id,bank,bankid,gatherCurrency){
			$("#orderIdRate").val(id);
			$("#bankNameType").html(bank);
			if("CNY"==gatherCurrency){
				var url = '<%=request.getContextPath() %>/cbTrade/forex/order/send2bank';
				var params = 'id='+ id
				           + '&rateType=SPOT_EXCHANGE';
				$.post(url, params, checkAjaxResponsess);
			}else{
				var url = '<%=request.getContextPath() %>/cbTrade/forex/order/querybankrate';
				var params = 'channelNo='+ bankid
				           + '&currency='+ gatherCurrency;
				$.post( url, params, checkAjaxResponseRate);
			}
		}
		function checkAjaxResponseRate(obj){
		    if (obj.err) {	
		    	alert(obj.msg);
			} else {
					var kcoll = obj.res;
					kcoll=new Object();
					var referRate=kcoll.referRate;
					var fixRate=kcoll.fixRate;
					$("#referRateSpan").html(referRate);
					$("#fixRateSpan").html(fixRate);
					showBank =  $("#showBankRate").dialog({
						autoOpen: false,
						title: "确定购汇类型",
						width:400,
						height: 300,
						modal: true,
						close: function(){
					    }
					});
				showBank.dialog("open");
			}
			
		}
		function sendBankConfirmType(){
			var id=$("#orderIdRate").val();
			var rateType=$("input[name='rateType']:checked").val();
			var referRate=$("#referRate").val();
			
				if(isNull(rateType)){
					alert("请选择购汇类型");
					return false;
				}else{
					if("REFER_RATE"==rateType && isNull(referRate)){
						alert("购汇类型为境外参考汇率时，请输入参考汇率");
						return false;
						}
					}
			closeDialog();

			
			var url = '<%=request.getContextPath() %>/cbTrade/forex/order/send2bank';
			var params = 'id='+ id
			           + '&exchangeRate='+ merchantRate
			           + '&bankRate='+referRate
			           + '&rateType='+rateType;
			$.post(url, params, checkAjaxResponsess);
			showBank.dialog("close");
		}
		$(function(){
			$('#typeBank').change(function(){
			    var type= $(this).val();
			    if(type=='FOREX_SALE'){
				    $("#gh").css("display","block");
				    $("#fh").css("display","none");
				    $("#fk").css("display","none");
				 }else if(type=='FOREX_PAY'){
					 $("#fh").css("display","block");
					 $("#gh").css("display","none");
					 $("#fk").css("display","none");
				 }else if(type=='REMIT'){
					 $("#fk").css("display","block");
					 $("#gh").css("display","none");
					 $("#fh").css("display","none");
				}else{
					alert("暂不支持此通道");
					}
			   });
		});
		
		function forexPay(id,name,bankRemitAmount,bankGatherAmount){
			$("#BX1_payerName").html(name);
			$("#BX1_amount").html(bankGatherAmount);
			$("#forexPayMessageBox1").dialog({
				autoOpen:true,
				modal:true,
				width:450,
				height: 300,
				title:"确定要付汇吗?",
				buttons:{
					"确定":function(){
						showCover();
						$("#forexPayMessageBox1").dialog("close");
						var url = '<%=request.getContextPath() %>/cbTrade/forex/order/forexpay';
						$.post(url,{id:id},checkAjaxResponsest);
					},
					"取消":function(){
						$("#forexPayMessageBox1").dialog("close");
					}
				}
				
			});
			return false;
		}
		function getbusinessRange(value){
			
			if(value == 'GOODS_TRADE'){
				return '货物贸易';
			}else if(value == 'ABROAD_EDU'){
				return '留学教育';
			}
			else if(value == 'HOTEL'){
				return '酒店住宿';
			}
			else if(value == 'AIR_TICKETS'){
				return '航空机票';
			}
			else if(value == 'TOURISM_SERVICE'){
				return '旅游服务';
			}
			else if(value == 'INTER_TRANSPORT'){
				return '国际运输';
			}
			else if(value == 'INTER_CONFERENCE'){
				return '国际会议';
			}
			else if(value == 'INTER_EXHIBITION'){
				return '国际展览';
			}
			else if(value == 'SOFTWARE_SERVICE'){
				return '软件服务';
			}
			else if(value == 'OTHER'){
				return '其他';
			}else{
				return ' ';
			}
		}
		/*
		 * 
		 */
		function showForexOrderPanel(obj){
			var tradeTypeKindName = "";
			$.post("<%=request.getContextPath()%>/static/cbTrade/forex/tradeTypeKind/query",{
				tradeTypeKind:obj.tradeType
			},
			function (data){
				tradeTypeKindName = data;
				$("#p_tradeTypeKind").text(tradeTypeKindName);
			});
			$("#p_merchantShortName").text(format(obj.merchantShortName));
			$("#p_merchantNo").text(format(obj.merchantNo));
			$("#p_merchantOrderNo").text(format(obj.merchantOrderNo));
			$("#p_orderNo").text(format(obj.orderNo));
			$("#p_mctSettleType").text(format(obj.mctSettleType));
			$("#p_merchantRequestTime").text(format(obj.merchantRequestTime));
			$("#p_agentMerchantNo").text(format(obj.agentMerchantNo));
			$("#p_tradeType").text(getbusinessRange(format(obj.businessRange)));
			$("#p_sumRemitAmount").text(format(obj.sumRemitAmount));
			$("#p_gatherCurrency").text(format(obj.gatherCurrency));
			$("#p_sumGatherAmount").text(format(obj.sumGatherAmount));
			$("#p_detailCount").text(format(obj.detailCount));
			$("#p_channelNo").text(format(obj.channelNo));
			$("#p_exchangeRate").text(format(obj.exchangeRate));
			$("#p_bankRate").text(format(obj.bankRate));
			$("#p_orderStatus").text(format(obj.orderStatus));
			$("#p_businessStatus").text(format(obj.businessStatus));
			$("#p_merchantFee").text(format(obj.merchantFee));
			$("#p_channelFeature").text(format(obj.p_channelFeature));
			$("#p_channelFee").text(format(obj.channelFee));
			$("#p_frozenAmount").text(format(obj.frozenAmount));
			$("#p_bankReturnMsg").text(format(obj.bankReturnMsg));
			$("#p_sysErrorMsg").text(format(obj.sysErrorMsg));
			$("#p_orderSource").text(format(obj.orderSource));
			$("#p_bankTraceNo").text(format(obj.bankTraceNo));
			$("#p_payerName").text(format(obj.payerName));
			$("#p_payerAccountNo").text(format(obj.payerAccountNo));
			$("#p_receiverName").text(format(obj.receiverName));
			$("#p_receiverAccountNo").text(format(obj.receiverAccountNo));
			$("#p_bankRealAmount").text(format(obj.bankGatherAmount));
			var payMethod=format(obj.payMethod);
			if(payMethod==null || payMethod == ''){
				$("#p_payMethod").text('');
			}else if(payMethod=='OUR'){
				$("#p_payMethod").text('付款人全部承担');
			}else if(payMethod=='BEN'){
				$("#p_payMethod").text('收款人全部承担');
			}else if(payMethod=='SHA'){
				$("#p_payMethod").text('付款人收款人共同承担');
			}
			
			$('#showForexOrderPanel').dialog({
				autoOpen:true,
				width:500,
				height:500
			});
			$("#backOrder").html("未生成");
			if(obj.fileName2!=null)
			{
				$("#backOrder").html("已生成");
			}
		}
		//设置申报附言
		function modifyDetailTranRemark(forexOrderId,id){
			$.post("<%=request.getContextPath()%>/static/cbTrade/forex/queryForexBizOrder",{
				forexOrderId:forexOrderId
			},
			function (data){
				$("#_remark_dialog_transactionRemark").val(data.remitPostscript);
			});
			
			$('#_remark_dialog_transactionRemark').focus();
			$("#_remark_dialog_").dialog({
				autoOpen:true,
				modal:true,
				title:'填写申报附言',
				buttons:{
					"取消":function(){
						$('#_remark_dialog_').dialog("close");
					},
					"确定":function(){
						var remark=$('#_remark_dialog_transactionRemark').val();
						$('#_remark_dialog_transactionRemark').val("")
						if(remark==null||remark==''){
							alert("申报附言不能为空!");
							return false;
						}
						var url = "<%=request.getContextPath() %>/static/cbTrade/forex/transremark";
						$.post(url,{forexOrderId:forexOrderId,transactionRemark:remark,id:id},function(obj){
							if(obj.err==false){
								alert("申报附言填写完成!");
							}else{
								alert(obj.msg);
							}
							$('#_remark_dialog_').dialog("close");
						});
					}
				}
			});
		}
		function showCover(){$("#cover").css("display",'');}
		function hideCover(){$("#cover").css("display",'none');}
		
		
		function loadChannel(){
			var url = '<%=request.getContextPath()%>/cbTrade/forex/channel/query';
			var params ='exchangeType=REMIT';
			$.post(url,params,checkAjaxResponsetdChannel);	
	   } 
		
	  loadChannel();
	  function checkAjaxResponsetdChannel(obj) {
			    if (obj.err) {	
				} else {
					var icoll = obj.channels;
					var content="";
					content += "<option value=''>"+'全部'+"</option>";
					for (var i = 0;i < icoll.length;i ++) {
						var kcoll = icoll[i];
						var file=kcoll.channelNo;
						var name=kcoll.channelName;
						content += "<option value='" + file +"'>" + name + "</option>";
			    	}
					$("#channelSe").html(content);
				}
			}	
	  
	  function resetOrderStatus(id,type){
		  if(confirm("确定要重发吗?")){
		  $.post("<%=request.getContextPath()%>/static/cbTrade/forex/resetOrderStatus",{id:id},function(res){
			  if(res.err){
				  alert("修改异常");
			  }else{
				  alert("修改完成,请进行业务重发。");
				  formSubmit();
			  }
		  });
		  }
	  }
     
		function typeChange(){
			var id = $("#idChange").val();
			var forexOrderId=$("#forexIdChange").val();
			var businessRange=$("#businessRangeChange").val();
			var tradeType=$("#tradeTypeChange").val();
			closeDialog();
	 		$.post("<%=request.getContextPath()%>/static/cbTrade/forex/order/changeType",{ 
	 			id:id,
 	 			forexOrderId:forexOrderId,
	 			businessRange:businessRange,
	 			tradeType:tradeType
	 		},
	 		function (data){
	 			if(data.err){
	 				alert(data.msg);
	 			}else{
	 				alert(data.msg);
	 			}
	 			formSubmit();
	 		}
			);
		}
	</script>
</html>
