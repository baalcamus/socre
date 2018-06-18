<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<html lang="en">
<head>
<title>商户业务设置</title>
<style type="text/css">
.red {
	color: red;
}

#_form_table_ tr {
	white-space: nowrap;
	padding: 10px 0px 10px 0px;
	height: 35px;
}

#_form_table_ tr td:nth-child(1) {
	text-align: right;
	padding-right: 20px;
}
</style>
<style type="text/css">
	.overflow{
			max-height:256px;
		}
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
<script type="text/javascript">
function showCover(){$("#cover").css("display",'');}
function hideCover(){$("#cover").css("display",'none');}
</script>
</head>

<body class=" ">
<div id="cover" style="display: none;">
	 	<img src="<%=request.getContextPath() %>/statics/v2/images/wait_processing.gif">
	</div>
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
						href="${ctx}/main/toMain.do">首页</a>&nbsp;&nbsp;<i
						class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
					<li>商户管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li class="active">商户业务设置</li>
				</ol>
				<div class="clearfix"></div>
			</div>
			<!--END TITLE & BREADCRUMB PAGE-->
			<!--BEGIN CONTENT-->
			<div class="page-content">
				<form id="subform" name="_info_form_"
					action="<%=request.getContextPath()%>/merbizset/add"
					method="post">
					<input type="hidden" id="merchantNo" name="merchantNo" value="${merchantNo }">
					<div class="panel panel-default  withoutbottom clearfix">
						<header class="panel-heading clearfix">
							<h2 class="panel-title">商户业务设置</h2>
						</header>
						<div class="panel-body clearfix">
							<div class="panel-inner">
								<h2 class="panel-inner-title panel-inner-title-default">商户信息
								</h2>
								<div class="panel-inner-body">
									<div class="row">
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="130" class="text-left">商户编号&nbsp;&nbsp;<span>${merchantNo }</span></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
							
							<div class="panel-inner">
								<h2 class="panel-inner-title panel-inner-title-default">产品设置
								</h2>
								<div class="panel-inner-body">
									<div class="row">
										<table width="100%" class="product_detail_list">
											<c:forEach items="${products }" var="map">
												<c:if test="${map.key==null}">
													<c:forEach items="${map.value }" var="product_root">
														<tr class="text-left">
															<td><input type="Checkbox" id="${product_root.productCode }" value="${product_root.productCode }" name="openBiz">${product_root.productName }</td>
														</tr>
														<tr>
															<td style="padding-left: 40px">
																<c:forEach items="${products[product_root.productNo] }" var="child">
																	<input type="Checkbox" value="${child.productCode }" name="openProduct" pid="${product_root.productCode }">${child.productName }&nbsp;&nbsp;
																</c:forEach>
															</td>
														</tr>
													</c:forEach>
												</c:if>
											</c:forEach>
										</table>
									</div>
								</div>
							</div>
						




						<div class="panel-inner">
							<h2 class="panel-inner-title panel-inner-title-default">商户虚拟账户设置
							</h2>
							<div class="panel-inner-body">
								<div class="row">
									<table width="100%" class="product_detail_list">
										<tr>
											<td style="padding-left: 40px; width: 135px"><input  name="virtualAccountType" value="FUND"
												type="Checkbox">资金账户</td>
										</tr>
										<tr>
											<td style="padding-left: 40px; width: 135px"><input
												onclick="bailChange(this);" type="Checkbox" id="bailCheckBox" name="virtualAccountType" value="BAIL">保证金账户</td>
											<td id="_bailAmountTD" style="display: none;text-align: left;">金额:<input
												type="number" id="bailAmount" name="bailAmount" value="0.00"></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<!--  如果是代理商 -->
						<c:if test="${merchantFeature=='AGENT_MER'}">
							<div class="panel-inner">
							<h2 class="panel-inner-title panel-inner-title-default">代理商权限设置
							</h2>
							<div class="panel-inner-body">
								<div class="row">
									<table width="100%" class="product_detail_list">
										<tr>
											<td style="padding-left: 40px; width: 135px">
                                                	<input  name="agentChecked" value="1"
													type="Checkbox">自动审核
											</td>
										</tr>
										
									</table>
								</div>
							</div>
						</div>
						</c:if>
						



						<div class="panel-inner">
							<h2 class="panel-inner-title panel-inner-title-default">
								手续费设置&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</h2>
							<div class="panel-inner-body">
								<div class="row">
									<table width="100%" class="product_detail_list">
										<tr>
											<td>手续费收取方式</td>
										</tr>
										<tr>
											<td  style="padding-left: 40px; width: 135px">
												<input type="Radio" name="feeChargeType" value="ADVANCE">预付
												<input type="Radio" name="feeChargeType" value="REALTIME">实收
												<input type="Radio" name="feeChargeType" value="LATER">后收
											</td>
										</tr>
									</table>
								</div>
								<div class="row">
									<table width="98%">
										<tr>
											<td style="width: 135px">设置手续费</td>
											<td><button class="btn btn-info" style="padding: 0px 5px 0px 5px!important;"
									onclick="javascript:addFee();return false;">添加</button></td>
										</tr>
									</table>
								</div>
								<div class="row">
									
									<div id="feeList" style="display: none">
										<input type="hidden" name="feeData" id="feeData" value="" />
										<table width="98%" id="fee_items_table" border="1">
											<tr style="background-color: #efefef;" align="center">
												<td width="80">商户编号</td>
												<td width="100">计费产品</td>
												<td width="90">计费开始日期</td>
												<td width="90">计费结束日期</td>
												<td width="80">计费类型</td>
												<td width="90">额外加收金额</td>
												<td width="80">费率(小数)</td>
												<td width="80">最低手续费金额</td>
												<td width="80">最高手续费金额</td>
												<td width="80">固定金额</td>
												<td width="80">限额</td>
												<td width="90">不足补收手续费</td>
												<td width="90">计费表达式</td>
												<td width="90">操作</td>
											</tr>
										</table>
									</div>
									<div id="feeAddDetail" style="display: none">
										<hr></hr>
										<table width="98%" class="product_detail_list">
											<tr>
												<!-- 
                                                <td width="120" class="text-right">商户编号<span>*</span></td>
                                                <td width="100">
                                                	<input type="text" class="form-control" id="merchantNo">
                                                </td>
                                                 -->
												<td width="120" class="text-right">计费产品<span>*</span></td>
												<td width="100"><select id="feeProduct"
													class="form-control">
														<option value="">请选择</option>
														<c:forEach items="${products }" var="map">
													<c:if test="${map.key==null}">
													<c:forEach items="${map.value }" var="product_root">
														<c:forEach items="${products[product_root.productNo] }" var="child">
															<option value="${child.productCode }">${child.productName }
														</c:forEach>
													</c:forEach>
												</c:if>
											</c:forEach>
														<!-- 
														<option value="LOCAL_REMIT">跨境人民币汇款</option>
														<option value="LOCAL_GATHER">跨境人民币收款</option>
														<option value="FOREX_SALE">跨境购付汇</option>
														<option value="FOREX_SETTLE">跨境收结汇</option>
														<option value="RECHARGE">充值</option>
														<option value="IDENTITY">实名认证</option>
														 -->
												</select></td>

												<td width="120" class="text-right">计费开始日期<span>*</span></td>
												<td width="100">
													<div data-date-format="yyyy-mm-dd"
														class="input-group date datepicker-filter mbs">
														<span class="input-group-addon"> <i
															class="fa fa-calendar"></i>
														</span> <input type="text" class="form-control"
															id="ruleBeginDate" />
													</div>
												</td>

												<td width="120" class="text-right">计费结束日期<span>*</span></td>
												<td width="100">
													<div data-date-format="yyyy-mm-dd"
														class="input-group date datepicker-filter mbs">
														<span class="input-group-addon"> <i
															class="fa fa-calendar"></i>
														</span> <input type="text" class="form-control" id="ruleEndDate" />
													</div>
												</td>
											</tr>
											<tr>
												<td width="100" class="text-right">计费类型<span>*</span></td>
												<td width="100"><select class="form-control"
													id="feeType" onchange="changeType();">
														<option value="" selected="selected">请选择</option>
														<c:forEach var="_feeMethod_"
															items="${fns:getEnumValues(\"com.chinagpay.cb.merchant.facade.enumtype.MerchantConstant\",\"FeeTypeEnum\") }">
															<option value="${_feeMethod_.code }">${_feeMethod_.des }</option>
														</c:forEach>
												</select></td>

												<td width="100" class="text-right fixed">固定金额<span>*</span></td>
												<td width="100" class="fixed"><input type="text"
													value="0.00" id="fixedAmount" class="form-control"
													onblur="checkAmount(this);"> <em for="fixedAmount"
													class="invalid"></em></td>

												<td width="100" class="text-right remitDeduct">费率(小数)<span>*</span></td>
												<td width="100" class="remitDeduct"><input type="text"
													value="0.00" id="remitDeduct_percentage"
													class="form-control" onblur="checkPercentage(this);">
													<em for="remitDeduct_percentage" class="invalid"></em></td>
											</tr>
											<tr id="standard">
												<td width="100" class="text-right">额外加收金额<span>*</span></td>
												<td width="100"><input type="text" value="0.00"
													id="addGatherAmount" class="form-control"
													onblur="checkAmount(this);"> <em
													for="addGatherAmount" class="invalid"></em></td>

												<td width="100" class="text-right">费率(小数)<span>*</span></td>
												<td width="100"><input type="text" value="0.0000"
													id="standard_percentage" class="form-control"
													onblur="checkPercentage(this);"> <em
													for="percentage" class="invalid"></em></td>

												<td width="100" class="text-right">最低手续费金额<span>*</span></td>
												<td width="100"><input type="text" value="0.00"
													id="minAmount" class="form-control"
													onblur="checkAmount(this);"> <em for="minAmount"
													class="invalid"></em></td>

												<td width="100" class="text-right">最高手续费金额<span>*</span></td>
												<td width="100"><input type="text" value="0.00"
													id="maxAmount" class="form-control"
													onblur="checkAmount(this);"> <em for="maxAmount"
													class="invalid"></em></td>
											</tr>
											<tr id="lessLine">
												<td width="100" class="text-right">费率(小数)<span>*</span></td>
												<td width="100"><input type="text" value="0.00"
													id="lessLine_percentage" class="form-control"
													onblur="checkPercentage(this);"> <em
													for="lessLine_percentage" class="invalid"></em></td>

												<td width="100" class="text-right">限额<span>*</span></td>
												<td width="100"><input type="text" value="0.00"
													id="lessLineAmount" class="form-control"
													onblur="checkAmount(this);"> <em
													for="lessLineAmount" class="invalid"></em></td>

												<td width="100" class="text-right">不足补收手续费<span>*</span></td>
												<td width="100"><input type="text" value="0.00"
													id="lessLineGatherFee" class="form-control"
													onblur="checkAmount(this);"> <em
													for="lessLineGatherFee" class="invalid"></em></td>
											</tr>

											<tr id="ognlExp" class="ognlExp">
												<td class="text-right ">计费表达式</td>
												<td colspan="2"><Textarea rows="5" cols="200"
														id="dtl_ognlExp_feeRule" class="form-control"></textarea></td>
												<td class="red" id="error">“A”表示交易金额。填写规则为{条件?(条件符合表达式):(条件不符合表达式)}<br>
													A<=2000000?(200):(A<=4000000?(A*0.01+400):(A*2.00/100))
												</td>
											</tr>
											<tr>
												<td colspan="1"></td>
												<td><button class="btn btn-primary"
														onclick="javascript:add(this,'add');return false;">添加</button></td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					</div>
					<button  class="btn btn-primary">提交</button>
				</form>
			</div>
		</div>
	</div>
		

</body>
<style type="text/css">
.__list__view__ {
	height: 100%;
	width: 100%;
	position: absolute;
	z-index: 1000;
	background: red;
}
</style>
<script type="text/javascript">

	$("#subform").validate({
		rules : {
			merchantNo : "required",
			feeChargeType: "required",
			openBiz: "required",
			openProduct: "required"
		},
		messages : {
			
		},
		errorPlacement : function(error, element) {
			error.appendTo(element.parent());
		},
		submitHandler : function(form){
			
			//前面进行基本校验
			var items = [];
			$("#fee_items_table tr:not(:first)").map(function() {
				var values = [];
				var i = 0;
				$(this).find("td").map(function() {
					values[i++] = $(this).attr('_val_');
				});
				items[items.length] = values;
			});
			if(items.length!=0)
			{
				var jsonStr = "[";
				for (var i = 0; i < items.length; i++) {
					jsonStr+="{";
					var item = items[i];
					jsonStr+="\"merchantNo\":\""+item[0]+"\",";
					jsonStr+="\"feeProduct\":\""+item[1]+"\",";
					jsonStr+="\"ruleBeginDate\":\""+item[2]+"\",";
					jsonStr+="\"ruleEndDate\":\""+item[3]+"\",";
					jsonStr+="\"feeType\":\""+item[4]+"\",";
					jsonStr+="\"addGatherAmount\":\""+item[5]+"\",";
					jsonStr+="\"percentage\":\""+item[6]+"\",";
					jsonStr+="\"minAmount\":\""+item[7]+"\",";
					jsonStr+="\"maxAmount\":\""+item[8]+"\",";
					jsonStr+="\"fixedAmount\":\""+item[9]+"\",";
					jsonStr+="\"lessLineAmount\":\""+item[10]+"\",";
					jsonStr+="\"lessLineGatherFee\":\""+item[11]+"\",";
					jsonStr+="\"feeRuleOgnlExp\":\""+item[12]+"\"";
					jsonStr+="},";
				}
				jsonStr=jsonStr.substring(0,jsonStr.length-1);
				jsonStr+="]";
				$("#feeData").val(jsonStr);
			}
			
			
			if ($("#feeData").val() == null || $("#feeData").val()=="") {
				if(!confirm("未设置手续费,确定要提交吗?")){
					return false;
				}
			} 
			
			showCover();
			var url="<%=request.getContextPath()%>/merbizset/add";
			$.post(url,$("#subform").serialize(),function(res){
				if(res.err==false){
					alert("设置成功");
					//跳转到商户信息查询页面
					//location.href=;
					location.replace("<%=request.getContextPath()%>/cbMerchant/queryMerchant") ;
				}else{
					alert(res.msg);
				}
				hideCover();
			});
			//form.submit();
			
		}
	});
	function changeType() {
		$("#standard").hide();
		$(".fixed").hide();
		$("#lessLine").hide();
		$(".remitDeduct").hide();
		$("#ognlExp").hide();
		var feeType = $("#feeType").val();
		if (feeType == "STANDARD") {
			$("#standard").show();
		} else if (feeType == "SINGLE_FIXED") {
			$(".fixed").show();
		} else if (feeType == "REMIT_DEDUCT") {
			$(".remitDeduct").show();
		} else if (feeType == "LESS_ADD") {
			$("#lessLine").show();
		} else if (feeType == "OGNL_EXP") {
			$("#ognlExp").show();
		}
	}
	function addFee() {
		$("#standard").hide();
		$(".fixed").hide();
		$("#lessLine").hide();
		$(".remitDeduct").hide();
		$("#ognlExp").hide();
		if (isNull($("#merchantNo").val())) {
			alert("请填写商户编号!");
			return false;
		}
		$("#feeProduct").val("");
		$("#ruleBeginDate").val("");
		$("#ruleEndDate").val("");
		$("#feeType").val("");
		$("#fixedAmount").val("0.00");
		$("#remitDeduct_percentage").val("0.00");
		$("#addGatherAmount").val("0.00");
		$("#standard_percentage").val("0.00");
		$("#minAmount").val("0.00");
		$("#maxAmount").val("0.00");
		$("#lessLine_percentage").val("0.00");
		$("#lessLineAmount").val("0.00");
		$("#lessLineGatherFee").val("0.00");
		$("#dtl_ognlExp_feeRule").val("");
		$("#feeAddDetail").attr('style', 'display:block');
	}
	function isNull(value) {
		if (value == undefined || value == '') {
			return true;
		}
		return false;
	}
	function add(btn, method) {
		var merchantNo = $('#merchantNo').val();
		if (isNull(merchantNo)) {
			alert("请填写商户号");
			return false;
		}
		var feeProduct = $("#feeProduct").val();
		if (isNull(feeProduct)) {
			alert("请选择计费项目");
			return false;
		}
		var feeType = $("#feeType").val();
		var ruleBeginDate = $("#ruleBeginDate").val();
		var ruleEndDate = $("#ruleEndDate").val();
		if (isNull(feeType)) {
			alert("请选择计费方式!");
			return false;
		}
		if (isNull(ruleBeginDate) || isNull(ruleEndDate)) {
			alert("规则起止时间不能为空!");
			return false;
		}
		if (ruleBeginDate > ruleEndDate) {
			alert("规则开始日期不能大于结束日期!");
			return false;
		}
		var fixedAmount = "0";
		var percentage = "0";
		var minAmount = "0";
		var maxAmount = "0";
		var addGatherAmount = "0";
		var lessLineAmount = "0";
		var lessLineGatherFee = "0";
		var feeRule = "";
		if (feeType == "STANDARD") {
			addGatherAmount = $("#addGatherAmount").val();
			percentage = $("#standard_percentage").val();
			minAmount = $("#minAmount").val();
			maxAmount = $("#maxAmount").val();
		} else if (feeType == "SINGLE_FIXED") {
			fixedAmount = $("#fixedAmount").val();
		} else if (feeType == "REMIT_DEDUCT") {
			percentage = $("#remitDeduct_percentage").val();
		} else if (feeType == "LESS_ADD") {
			percentage = $("#lessLine_percentage").val();
			lessLineAmount = $("#lessLineAmount").val();
			lessLineGatherFee = $("#lessLineGatherFee").val();
		} else if (feeType == "OGNL_EXP") {
			feeRule = $("#dtl_ognlExp_feeRule").val();
		} else {
			alert("未知计费方式");
			return false;
		}
		if (confirm("所有金额如果没填将默认为0,是否确定提交?")) {
			//判断是否已经添加了
			//查出现在有的
			var items = [];
			$("#fee_items_table tr:not(:first)").map(function() {
				var values = [];
				var i = 0;
				$(this).find("td").map(function() {
					values[i++] = $(this).attr('_val_');
				});
				items[items.length] = values;
			});
			for (var i = 0; i < items.length; i++) {
				var item = items[i];
				//如果
				if (item[0] == merchantNo && item[1] == feeProduct) {
					alert("商户计费规则以存在!");
					return false;
				}
			}
			//添加到table中
			var tr = $("<tr align='center'></tr>");
			tr.append("<td _val_='"+merchantNo+"'>" + merchantNo + "</td>");
			tr
					.append("<td _val_='"+feeProduct+"'>"
							+ $("#feeProduct").find("option:selected").text()
							+ "</td>");
			tr.append("<td _val_='"+ruleBeginDate+"'>" + ruleBeginDate
					+ "</td>");
			tr.append("<td _val_='"+ruleEndDate+"'>" + ruleEndDate + "</td>");
			tr.append("<td _val_='"+feeType+"'>"
					+ $('#feeType').find("option:selected").text() + "</td>");
			tr.append("<td _val_='"+addGatherAmount+"'>" + addGatherAmount
					+ "</td>");
			tr.append("<td _val_='"+percentage+"'>" + percentage + "</td>");
			tr.append("<td _val_='"+minAmount+"'>" + minAmount + "</td>");
			tr.append("<td _val_='"+maxAmount+"'>" + maxAmount + "</td>");
			tr.append("<td _val_='"+fixedAmount+"'>" + fixedAmount + "</td>");
			tr.append("<td _val_='"+lessLineAmount+"'>" + lessLineAmount
					+ "</td>");
			tr.append("<td _val_='"+lessLineGatherFee+"'>" + lessLineGatherFee
					+ "</td>");
			tr.append("<td _val_='"+feeRule+"'>" + feeRule + "</td>");
			tr
					.append("<td><button onclick='javascript:del_tr(this);return false;'>删除</button></td>");
			$("#fee_items_table tr:last").after(tr);
			$("#feeList").attr('style', 'display:block');
			$("#feeAddDetail").attr('style', 'display:none');
		}
	}
	function del_tr(tdson) {
		if (confirm("是否确定删除?")) {
			$(tdson.parentNode.parentNode).remove();
		}
	}
	function isMoney(money) {
		var reg = /^[\d]+[\.]{0,1}[\d]{0,2}$/;
		return reg.test(money);
	}
	function isRate(rate) {
		var reg = /^[\d]+[\.]{0,1}[\d]{0,4}$/;
		return reg.test(rate);
	}
	function formatMoney(money) {
		if (isMoney(money)) {
			var index = money.indexOf(".");
			if (index == -1) {
				money = money + ".00";
				return money;
			}
			while (money.substring(index).length < 3) {
				money = money + "0";
			}
			return money;
		}
	}
	function checkAmount(form) {
		$(form).parent().removeClass("state-success");
		$(form).parent().children(".invalid").attr('style', 'display:block');
		var error = "";
		if (isMoney(form.value)) {
			$(form).parent().addClass("state-success");
			$(form).parent().children(".invalid").attr('style', 'display:none');
			form.value = formatMoney(form.value);
		} else {
			$(form).parent().addClass("state-error");
			$(form).parent().children(".form-control").addClass("invalid");
			error = "金额格式错误!";
			$(form).parent().children(".invalid").text(error);
		}
	}
	function checkPercentage(form) {
		$(form).parent().removeClass("state-success");
		$(form).parent().children(".invalid").attr('style', 'display:block');
		var error = "";
		if (!isRate(form.value)) {
			$(form).parent().addClass("state-error");
			$(form).parent().children(".form-control").addClass("invalid");
			error = "费率格式错误!";
			$(form).parent().children(".invalid").text(error);
		} else {
			$(form).parent().addClass("state-success");
			$(form).parent().children(".invalid").attr('style', 'display:none');
		}
	}
	$("#bailCheckBox").click(function(){
		$("#bailAmount").val("0");
		var s = $(this).is(":checked");
		if(s){
			$("#_bailAmountTD").show();
		}else{
			$("#_bailAmountTD").hide();
			
		}
	});
	
	$("input[name=openBiz]").click(function(){
		if($(this).is(":checked")){
			//选中所有子元素
			$("input[pid="+$(this).attr("id")+"]").attr("checked","checked");
		}else{
			//取消所有子元素
			$("input[pid="+$(this).attr("id")+"]").removeAttr("checked");
		}
	});
</script>

</html>