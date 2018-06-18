<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>跨境收款订单查询</title>
<style type="text/css">
#cover{
			position: fixed; 
			z-index: 1000; 
			width: 100%; 
			height: 100%; 
			top:0;
			left:0;
			background-color:#000000;
			filter:alpha(opacity=0.7); /*IE滤镜，透明度50%*/
			-moz-opacity:0.7; /*Firefox私有，透明度50%*/
			opacity:0.7;/*其他，透明度50%*/
			text-align: center;
		}
		#cover img{
			position:absolute;top:40%;left:40%;width:20%;height:10%;margin-top:-15px;margin-left:-15px;
		}
</style>
</head>
<script type="text/javascript">
	function formSubmit() {
		$("#queryForm").submit();
	}
	function showCover(){$("#cover").css("display",'');}
	function hideCover(){$("#cover").css("display",'none');}
	

	//加载收付款人信息页面
	function showCpCrInfo(cr,cp)
	{
	
	    var now=new Date().getTime();  
        var data1 = {cr:cr}; 
        var data2 = {cp:cp}; 
		$.getJSON('<%=request.getContextPath()%>/cbTrade/forex/remit/recDetail?now='+now,data1,function(result){
			$("#receiverName").val(result.receiverName);
			$("#receiverCountry").val(result.receiverCountry);
			$("#receiverAddress").val(result.receiverAddress);
			$("#receiverAccount").val(result.receiverAccount);
			$("#receiverBankAddress").val(result.receiverBankAddress);
			$("#receiverBankName").val(result.receiverBankName);
			$("#receiverBankSwiftCode").val(result.receiverBankSwiftCode);
			$("#agentBankAddress").val(result.agentBankAddress);
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
		$('#showCpCrInfoDiv').dialog({
			autoOpen:true,
			width:600,
			height:500
		});
		$(".payRecInfo").attr("disabled","disabled");
		initCon();
	}
	
	//设置收付款联系人页面控键禁用
	var cmd=true;
	function updateCpCrInfoActive()
	{
		if(cmd)
		{
			$(".payRecInfo").removeAttr("disabled");
			$("#editSave").html("保存");
			cmd=false;
		}else
		{
			cpCrInfoForm();
		}
	}
	
	//关闭收付款联系人页面
	function closeShowCpCrInfo(){
		initCon();
		$("#showCpCrInfoDiv").dialog("destroy");
	}
	//执行收付款人修改
	function cpCrInfoForm(){
		var data = $("#cpCrInfoForm").serialize();
		var crId = $("#crId").val();
		var cpId = $("#cpId").val();
		
		$.post("<%=request.getContextPath()%>/cbTrade/forex/remit/executePatRecUpdate.do?crId="+crId+"&cpId="+cpId,data,function(re){
			alert(re.msg);
			closeShowCpCrInfo();
		});
	}
	
	//初始化修改页面
	function initCon()
	{
		cmd=true;
		$("#editSave").html("修改");
	}
</script>

<body class=" ">
<div id="cover" style="display: none;">
	 	<img src="<%=request.getContextPath() %>/statics/v2/images/wait_processing.gif">
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
								action="<%=request.getContextPath()%>/cbTrade/forex/gather/query"
								method="post" enctype="multipart/form-data"
								class="form-horizontal ">
								<input type="hidden" name="map['exchangeType']" value="GATHER" />
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />
								<div class="form-inline">
									<label>商户编号</label> <input type="text" name="map['merchantNo']"
										value="${paramVo.map.merchantNo}" class="form-control" /> <label>商户订单号</label>
									<input type="text" name="map['merchantOrderNo']"
										value="${paramVo.map.merchantOrderNo}" class="form-control" />
									<label>平台订单号</label> <input type="text" name="map['orderNo']"
										value="${paramVo.map.orderNo}" class="form-control" /> <label>&nbsp;&nbsp;&nbsp;通知时间</label>
									<label>从</label> <input class="form-control" id="rateDate"
										name="map['beginDate']" value="${paramVo.map.beginDate}"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
									<label>到</label> <input class="form-control" id="endDate"
										name="map['endDate']" value="${paramVo.map.endDate}"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
									<button type="reset" class="btn btn-default">重置</button>
									<label>&nbsp;&nbsp;&nbsp;</label>
									<button type="submit" id="btnSubmit" class="btn btn-primary">
										<i class="fa fa-search"></i> 查询
									</button>

								</div>
							</form>
						</div>
					</div>
					<!--这是查询模块结束-->
					<!--这是列表模块开始-->
					<div class="panel panel-default clearfix">
						<header class="panel-heading clearfix">
							<h2 class="panel-inner-title02">
								列表 总订单笔数：${count==null?0:count} 总商户手续费：${merchant_fee==null?0:merchant_fee}
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
											<th>商户订单号</th>
											<th>商户结算模式</th>
											<th>汇款金额</th>
											<th>汇款币种</th>
											<th>收款金额</th>
											<th>明细笔数</th>
											<th>渠道</th>
											<th>订单状态</th>
											<th>业务处理状态</th>
											<th>系统信息</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${page.list}" var="order">
											<tr>
												<td>
													 <!-- 明细 -->
													 <a href="<%=request.getContextPath()%>/cbTrade/forex/gather/querydetail?forexOrderId=${order.forexOrderId}">明细</a>
													 <!-- 通道录入 -->
													 <a href="#1" onclick="doChannelEntry('${order.id}','${order.gatherCurrency}');return false;">通道录入</a>
													 <a href="#1" onclick="doTypeChange('${order.id}','${order.forexOrderId}','${order.businessRange}','${order.tradeType}','${order.channelNo}');return false;">业务类型调整</a>
													<!-- 导出 -->
													<%-- <a href="#1" onclick="exportExc('${order.forexOrderId}','${order.channelNo}');return false;">导出</a> --%>
													<c:choose>
														<c:when test="${order.channelFeature=='OFF_INDIRECT'}">
															<c:choose>
																<c:when test="${fn:startsWith(order.channelNo,'CMBC_OFF') }">
																	<a href="#1" onclick="exportExcMinSheng('${order.merchantOrderNo}','${order.channelNo}');return false;">民生线下导出</a>
																</c:when>
																<c:otherwise>
																	<a href="#1" onclick="exportExc('${order.forexOrderId}','${order.channelNo}');return false;">导出</a> 
																</c:otherwise>
															</c:choose>
														</c:when>
														<c:otherwise>
															<a href="#1" onclick="exportExc('${order.forexOrderId}','${order.channelNo}');return false;">导出</a>
														</c:otherwise>
													</c:choose>
													<!-- 结果录入 -->
													<a href="#1" onclick="doStatusEntry('${order.id}','${order.forexOrderId}','${order.channelName}','${order.merchantNo}','${order.merchantOrderNo}','${order.gatherCurrency}');return false;">结果录入</a>
    													<c:if test="${order.businessStatus =='FOREX_RECEIVE_SUCC' and order.remitCurrency != 'CNY'}">	
															<a href="#1" onclick="forexSettle('${order.id}');return false;">结汇</a>
														</c:if>
													<c:if test="${order.businessStatus=='WAIT_TO_BANK'}">	
														<a href="#1" onclick="forexExc('${order.id}');return false;">收汇</a>
													</c:if>
													
															<c:if test="${order.businessStatus=='FOREX_RECEIVE_FAIL'}">
																	<a href="#1"
																		onclick="resetOrderStatus('${order.forexOrderId}','重新收汇');return false;">重发</a>
																</c:if>
																<c:if test="${order.businessStatus=='FOREX_SETTLE_FAIL'}">
																	<a href="#1"
																		onclick="resetOrderStatus('${order.forexOrderId}','重新结汇');return false;">重发</a>
																</c:if>
																<c:if test="${order.channelFeature=='ONLINE_DIRECT'}">
																	<a href="#1" onclick="modifyDetailTranRemark('${order.forexOrderId}','${order.id}');return false;">申报附言</a>
																</c:if>
<%-- 											<a href="javascript:showCpCrInfo('${order.relateReceiverId}','${order.relatePayerId}')">收付款明细</a> --%>
																
													</td>
												<td>${order.merchantShortName }</td>
												<td>${order.merchantNo}</td>
												<td><a href="#"
													onclick='showForexOrderPanel(${fns:toJson(order)});return false;' style="text-decoration: underline;">
														${order.merchantOrderNo }</a></td>
												<td><c:choose>
														<c:when test="${order.mctSettleType=='PAY_FIX_CNY'}">固定人民币付</c:when>
														<c:when test="${order.mctSettleType=='PAY_FIX_FOREX'}">固定外币付</c:when>
														<c:when test="${order.mctSettleType=='GATHER_CNY_FOREX'}">定额人民币收</c:when>
														<c:when test="${order.mctSettleType=='GATHER_FIX_FOREX'}">定额外币收</c:when>
														<c:otherwise>${order.mctSettleType}</c:otherwise>
													</c:choose></td>
												<td><fmt:formatNumber value="${order.sumRemitAmount }"
														pattern="#,##0.00" /></td>
												<td>${fns:getCurrency(order.remitCurrency) }</td>
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
														<c:when test="${order.businessStatus=='FOREX_RECEIVE_PRO'}">收汇处理中</c:when>
														<c:when test="${order.businessStatus=='FOREX_RECEIVE_SUCC'}">收汇成功</c:when>
														<c:when test="${order.businessStatus=='FOREX_RECEIVE_FAIL'}">收汇失败</c:when>
														
														<c:when test="${order.businessStatus=='FOREX_SETTLE_PRO'}">结汇处理中</c:when>
														<c:when test="${order.businessStatus=='FOREX_SETTLE_SUCC'}">结汇成功</c:when>
														<c:when test="${order.businessStatus=='FOREX_SETTLE_FAIL'}">结汇失败</c:when>
																											
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
													<td>
														${order.sysErrorMsg}
													</td>
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
	<div id="showBankStatus" class="table-list" style="display: none;">

		<table width="700px;"  id="showBankStatusTable">
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
						<input type="radio" name="typeF" value="GATHER" checked="checked" />收款
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
<!-- 				<input type="radio" name="statusF" value="SUCCESS" />成功 -->
<!-- 				 <input type="radio" name="statusF" value="FAIL" />失败 -->
						<select id="statusF" name="statusF">
							<option value="SUCCESS">成功</option>
							<option value="FAIL">失败</option>
						</select> 
				 </td>
			</tr>
			<tr class="suc">
				<td align="right" height="35px" class="red">商户定价汇率：</td>

				<td height="40px"><input type="text" name="rate" id="rateF" />
				</td>
			</tr>
			<tr class="suc">
				<td align="right" height="35px" class="red">银行执行汇率：</td>
				<td height="40px"><input type="text" name="bankRate"
					id="bankRateF" /></td>
			</tr>
			<tr class="suc">

				<td align="right" height="35px">人民币金额：</td>

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

				<td height="40px">
				<select id="typeBank" name="typeBank">
						<option value="" selected="selected">请选择</option>
						<option value="GATHER">收款</option>
						<option value="FOREX_SETTLE">结汇</option>
						<option value="FOREX_RECEIVE">收汇</option>
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
						<option value="HUIRU">汇入</option>
						<!-- <option value="HUICHU">汇出</option> -->
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
					name="rateType" checked="checked" value="REFER_RATE" />境外参考汇率：<span
					id="referRateSpan"></span></td>

				<td height="40px"><input type="text" name="referRate"
					id="referRate" /></td>
			</tr>
			<tr>
				<td align="right" height="35px" class="red"><input type="radio"
					name="rateType" value="FIX_RATE" />境外固定汇率：<span id="fixRateSpan"></span>
				</td>

				<td height="40px"></td>
			</tr>

			<tr>
				<td align="right" height="35px" class="red">商户定价汇率：</td>

				<td height="40px"><input type="text" name="merchantRate"
					id="merchantRate" /></td>
			</tr>
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
	<div id="showBankConfirm" class="table-list" style="display:none;">
	<table>
		<tr>
		   	<td align="right" height="35px" class="red">
		   	<input type="hidden" id="orderIdConfirm"/>
		   		境外参考汇率:&nbsp;
		    </td>
		    <td  height="40px">
				<input type="text" name="referRateConfirm" id="referRateConfirm"/>
		    </td>
		 </tr>
		<tr>
		   	<td align="right" height="35px" class="red">
		   		商户定价汇率:&nbsp;
		    </td>
		    <td>
				<input type="text" name="merchantRateConfirm" id="merchantRateConfirm"/>
		    </td>
		 </tr>
		<tr>
			<td height="35px">&nbsp;</td>
			<td class="SubmitTd" >
				<div class="button_area">
					<input style="height:25px;margin:10px 0px 0px 0px;" type="button" value="确定" onclick="remitConfirmDir();"/>
					<input style="height:25px;margin:10px 0px 0px 0px;" type="button" value="取消" onclick="closeDialog();" />
				</div>
			</td>
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
		action="<%=request.getContextPath()%>/cbTrade/forex/gather/query?method=download">
	</form>
	<script type="text/javascript">
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
			var params = 'ID='+ id
			           + '&exchangeRate='+ merchantRateConfirm
			           + '&bankRate='+referRateConfirm;
			$.post(url, params, checkAjaxResponsest);
			showBank.dialog("close");
		}
		function checkAjaxResponsest(obj) {
			alert(obj.msg);
			if (!obj.err) {	
				formSubmit();
			}
		}
		function doChannelEntry(id,gatherCurrency){
		    $("#ID").val(id);
			var url = '<%=request.getContextPath()%>/cbTrade/forex/channel/query';
			var params ='exchangeType=GATHER';
			$.post(url,params,checkAjaxResponsetd);	
	} 
		function remitConfirm(id,bank,bankid,gatherCurrency){
			$("#orderIdConfirm").val(id);
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
		function doStatusEntry(id,forexOrderId,bankId,merchantNo,merchantOrderNo,gatherCurrency){
			$("#bankSpan1").html(bankId);
			 $("#forexOrderIdd").val(forexOrderId);
			 $("#idd").val(id);
			 $("#merchantNodd").val(merchantNo);
			 $("#merchantOrderNodd").val(merchantOrderNo);
			 $("#gatherCurrencydd").val(gatherCurrency);
			showBank =  $("#showBankStatus").dialog({
						autoOpen: false,
						title: "跨境结果录入",
						width:750,
						height: 450,
						modal: true,
						close: function(){
					    }
			});
			showBank.dialog("open");
			$(".fail").hide();
			$(".suc").show();
    		$("#showBankStatusTable").attr("width","700px");
    		$("#statusF").val("SUCCESS");
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
		//业务类型调整
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
					if(exchangeType=='FOREX_RECEIVE'){
						var t=channel.dataTemplateMap.FOREX_RECEIVE;
						if(t!=undefined){
							for(var j=0;j<t.length;j++){
								icoll.push(t[j]);
							}
						}
					}
					if(exchangeType=='FOREX_SETTLE'){
						var t=channel.dataTemplateMap.FOREX_SETTLE;
						if(t!=undefined){
						for(var j=0;j<t.length;j++){
							icoll1.push(t[j]);
						}
						}
					}
					if(exchangeType=='GATHER'){
						var t=channel.dataTemplateMap.GATHER;
						if(t!=undefined){
						for(var j=0;j<t.length;j++){
							icoll2.push(t[j]);
						}
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
					if(isNull(rate)){
						alert("收款币种为外币时牌价必填");
						return false;
						}
				}
			}
			else
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
			$.post(url, params, checkAjaxResponsess);
			showBank.dialog("close");
		}
		
		function forexExc(id){
			var url = '<%=request.getContextPath() %>/cbTrade/forex/order/send2bank';
			$.post(url, {id:id}, checkAjaxResponsess);
		}
		
		function forexSettle(id){
			var url = '<%=request.getContextPath() %>/cbTrade/forex/order/forexSettle';
			$.post(url, {id:id}, checkAjaxResponsess);
		}
		
		
		function sendBankConfirmType(){
			var id=$("#orderIdRate").val();
			var rateType=$("input[name='rateType']:checked").val();
			var referRate=$("#referRate").val();
			var merchantRate=$("#merchantRate").val();
			if(isNull(merchantRate)){
				alert("请输入商户定价汇率");
				return false;
				}
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
			    if(type=='FOREX_RECEIVE'){
				    $("#gh").css("display","block");
				    $("#fh").css("display","none");
				    $("#fk").css("display","none");
				 }else if(type=='FOREX_SETTLE'){
					 $("#fh").css("display","block");
					 $("#gh").css("display","none");
					 $("#fk").css("display","none");
				 }else if(type=='GATHER'){
					 $("#fk").css("display","block");
					 $("#gh").css("display","none");
					 $("#fh").css("display","none");
				}else{
					alert("暂不支持此通道");
					}
			   });
		});
		/*
		 * 
		 */
		function showForexOrderPanel(obj){
			$("#p_merchantShortName").text(format(obj.merchantShortName));
			$("#p_merchantNo").text(format(obj.merchantNo));
			$("#p_merchantOrderNo").text(format(obj.merchantOrderNo));
			$("#p_orderNo").text(format(obj.orderNo));
			$("#p_mctSettleType").text(format(obj.mctSettleType));
			$("#p_merchantRequestTime").text(format(obj.merchantRequestTime));
			$("#p_agentMerchantNo").text(format(obj.agentMerchantNo));
			$("#p_tradeType").text(format(obj.tradeType));
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
	</script>
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
				<div class="col-md-6">贸易类型</div>
				<div id="p_tradeType" class="col-md-6"></div>
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
				<div class="col-md-6">回单状态</div>
				<div class="col-md-6">
				 	<span id="backOrder"></span>
				</div>
			</div>
			
		</div>
	</div>
	<div id="showBankRate2" style="display:none;">

	<table width="400px;">
		<tr>
		   	<td align="right" height="35px">
		   		通道名称：
		    </td>
		    
		    <td  height="40px">
				<span id="bankNameType2"></span>
		    </td>
		<input type="hidden" id="orderIdRate2"/>
		      
		</tr>
		<tr>
			<td align="right" height="35px">
		   		商户名称：
		    </td>
		    
		    <td  height="40px">
				<span id="payerNameType2"></span>
		    </td>
		</tr>
		<tr>
			<td align="right" height="35px">
		   		结汇金额：
		    </td>
		    
		    <td  height="40px">
				<span id="exchangeAmountType2"></span>
		    </td>
		</tr>
		<tr>
		   	<td align="right" height="35px">
		   		参考汇率：
		    </td>
		    
		    <td  height="40px">
		    <span id="referRateSpan2"></span>
				<!-- <input type="text" name="referRate" id="referRate"/> -->
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

<!-- 
修改收付款联系人信息
 -->

	<div id="showCpCrInfoDiv" style="display: none">
		<input type="hidden" name="cpId" id="cpId"/>
		<input type="hidden" name="crId" id="crId" />
		<form id="cpCrInfoForm" method="post">
		<div class="container-fluid">
		<div class="panel panel-default">
				<div class="panel-heading"><label>付款人信息</label></div>
				<div class="panel-body">
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
				<div class="panel-body">
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
					<button class="btn btn-danger" type="button" id="editSave" onclick="updateCpCrInfoActive()">修改</button> 
					<button class="btn btn-danger"  type="button" onclick="closeShowCpCrInfo()">取消</button> 
			</div>
			</div>
		</div>
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
</html>
