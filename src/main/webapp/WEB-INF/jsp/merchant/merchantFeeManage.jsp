<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<html lang="en">
<head>
<title>商户计费管理</title>
<style type="text/css">
.red {
	color: red;
}

#matte_layer {
	position: absolute;
	z-index: 100;
	width: 100%;
	height: 100%;
	background-color: #ddedfa;
	filter: alpha(opacity = 0.5); /*IE滤镜，透明度50%*/
	-moz-opacity: 0.5; /*Firefox私有，透明度50%*/
	opacity: 0.5; /*其他，透明度50%*/
	text-align: center;
	display: none;
}

#matte_layer img {
	margin-left: auto;
	margin-right: auto;
	margin-top: 100px;
}
#fee_items_form table th,table td{
	padding: 13px;
	white-space: nowrap;
}
</style>
</head>
<body class=" ">
	<jsp:include page="../include/top.jsp" />
	<div id="wrapper">
		<jsp:include page="../include/bottom.jsp" />
		<!-- 左侧内容 -->
		<jsp:include page="../include/left.jsp" />
		<!--右侧内容 start-->
		<div id="page-wrapper">
			<div id="matte_layer" class="matte_layer">
					<img alt=""
						src="<%=request.getContextPath()%>/statics/v2/images/wait_processing.gif">
			</div>
			<!--BEGIN TITLE & BREADCRUMB PAGE-->
			<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
				<ol class="breadcrumb page-breadcrumb">
					<li><i class="fa fa-home"></i>&nbsp;<a
						href="${ctx}/main/toMain.do">首页</a>&nbsp;&nbsp;<i
						class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
					<li>商户管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li class="active">商户计费管理</li>
				</ol>
				<div class="clearfix"></div>
			</div>
			<!--END TITLE & BREADCRUMB PAGE-->
			<!--BEGIN CONTENT-->
			<div class="page-content">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title">商户计费管理</h2>
					</div>
					<div class="panel-body">
						<form id="queryForm"
							action="<%=request.getContextPath()%>/cbMerchant/merchantFeeRule/query"
							method="post" enctype="multipart/form-data"
							class="form-horizontal ">
							<input type="hidden" name="pageNum" value="${page.pageNum }" />
							<input type="hidden" name="pageSize" value="${page.pageSize }" />
							<div class="row">
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table class="product_detail_list">
										<tr>
											<td width="110" class="text-right">商户编号</td>
											<td><input type="text" maxlength="32" id="merchantNo"
												name="map['merchantNo']" value="${paramVo.map.merchantNo}"
												class="form-control"></td>
										</tr>
									</table>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table class="product_detail_list">
										<tr>
											<td width="110" class="text-right">产品</td>
											<td><select id="feeProduct" name="map['feeProduct']"
												class="form-control">
													<option
														<c:if test="${paramVo.map.feeProduct==''}">selected="selected"</c:if>
														value="">全部</option>
													<c:forEach items="${products }" var="map">
													<c:if test="${map.key==null}">
													<c:forEach items="${map.value }" var="product_root">
														<c:forEach items="${products[product_root.productNo] }" var="child">
															<option 
															<c:if test="${paramVo.map.feeProduct==child.productCode}">selected="selected"</c:if>
															value="${child.productCode }">${child.productName }
														</c:forEach>
													</c:forEach>
												</c:if>
											</c:forEach>
											</select></td>
										</tr>
									</table>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table class="product_detail_list">
										<tr>
											<td width="110" class="text-right">状态</td>
											<td><select id="feeRuleStatus"
												name="map['feeRuleStatus']" class="form-control">
													<option
														<c:if test="${paramVo.map.feeRuleStatus==''}">selected="selected"</c:if>
														value="">全部</option>
													<option
														<c:if test="${paramVo.map.feeRuleStatus=='0'}">selected="selected"</c:if>
														value="0">使用中</option>
													<option
														<c:if test="${paramVo.map.feeRuleStatus=='-1'}">selected="selected"</c:if>
														value="-1">已过期</option>
													<option
														<c:if test="${paramVo.map.feeRuleStatus=='1'}">selected="selected"</c:if>
														value="1">未开始</option>
											</select></td>
										</tr>
									</table>
								</div>
								<div class="col-lg-1 col-md-3 col-sm-6 col-xs-12">
									<table class="product_detail_list">
										<tr>
											<td>
												<button type="submit" id="btnSubmit" class="btn btn-primary">
													<i class="fa fa-search"></i> 查询
												</button>
											</td>
											<td></td>
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
								<button onclick="newFeeRule();"
									class="pull-right btn btn-primary">新增</button>
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
										<th>商户编号</th>
										<th>计费产品</th>
										<th>手续费类型</th>
										<th>状态</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.list}" var="feeRule"
										varStatus="status">
										<tr>
											<td><a href="#"
												onclick='showDetail(${fns:toJson(feeRule)});return false;'>查看明细</a></td>
											<td>${feeRule.merchantNo}</td>
											<td>
												<c:forEach items="${products }" var="map">
													<c:if test="${map.key==null}">
													<c:forEach items="${map.value }" var="product_root">
														<c:forEach items="${products[product_root.productNo] }" var="child">
															<c:if test="${child.productCode==feeRule.feeProduct}">${child.productName }</c:if>
														</c:forEach>
													</c:forEach>
												</c:if>
											</c:forEach>
											</td>
											<!-- <td>${fns:getEnumFieldValue("com.chinagpay.cb.merchant.facade.enumtype.MerchantConstant","FeeProductEnum",feeRule.feeProduct,"des")}</td> -->
											<td>${fns:getEnumFieldValue("com.chinagpay.cb.merchant.facade.enumtype.MerchantConstant","FeeTypeEnum",feeRule.feeType,"des")}</td>
											<c:set var="currencyTime"
												value="<%=com.chinagpay.utils.common.DateUtils.getShortDateStr()%>"></c:set>
											<td>${feeRule.ruleBeginDate>currencyTime?"未开始":(feeRule.ruleEndDate>=currencyTime?"使用中":"已过期")}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!--End CONTENT-->
				<jsp:include page="../include/page.jsp" />
			</div>
			<!--右侧内容 end-->
			<!--全局动态-->
		</div>
		<!-- 明细弹层 -->
		<div id="dtl_layer" style="display: none;">
			<!-- 列表层 -->
			<form id="fee_items_form" name="fee_items_form"  class="form-horizontal" style="display: display;">
				<table id="fee_items_table">
					<tr>
						<th>商户编号</th>
						<th>计费产品</th>
						<th>计费开始日期</th>
						<th>计费结束日期</th>
						<th>计费类型</th>
						<th>额外加收金额</th>
						<th>费率(小数)</th>
						<th>最低手续费金额</th>
						<th>最高手续费金额</th>
						<th>固定金额</th>
						<th>限额</th>
						<th>不足补收手续费</th>
						<th>阶梯表达式</th>
						<th><button class="btn btn-primary" onclick="javascript:addFee();return false;">新增</button></th>
					</tr>
					<tr>
						<td colspan="12">123123</td>
						<td><button onclick="javascript:del_tr(this);return false;">删除</button></td>
					</tr>
					<tr>
						<td colspan="6"></td>
						<td><button class="btn btn-primary" onclick="javascript:fees_submit();return false;">提交</button></td>
						<td colspan="6"></td>
						
					</tr>
				</table>
			</form>
			<form id="dtl_form" name="dtl_form" class="form-horizontal" style="display:display; ">
				<input type="hidden" id="dtl_id" value="">
				<div class="form-inline">
					<label class="col-sm-4 control-label" for="dtl_merchantNo">商户编号</label>
					<input type="text" id="dtl_merchantNo" class="form-control">
				</div>
				<div class="form-inline">
					<label class="col-sm-4 control-label" for="dtl_feeProduct">计费产品</label>
					<select id="dtl_feeProduct" class="form-control">
						<option value="">请选择</option>
						<c:forEach items="${products }" var="map">
													<c:if test="${map.key==null}">
													<c:forEach items="${map.value }" var="product_root">
														<c:forEach items="${products[product_root.productNo] }" var="child">
															<option 
															<c:if test="${paramVo.map.feeProduct==child.productCode}">selected="selected"</c:if>
															value="${child.productCode }">${child.productName }
														</c:forEach>
													</c:forEach>
												</c:if>
											</c:forEach>
					</select>
				</div>
				<div class="form-inline">
					<label class="control-label col-sm-4">计费开始日期</label> <input
						type="text" id="dtl_ruleBeginDate" class="form-control"
						placeholder="YYYY-MM-DD"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:false})">
				</div>
				<div class="form-inline">
					<label class="control-label col-sm-4">计费结束日期</label> <input
						type="text" id="dtl_ruleEndDate" class="form-control"
						placeholder="YYYY-MM-DD"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:false})">
				</div>
				<div class="form-inline">
					<label class="control-label col-sm-4" for="dtl_feeType">计费类型</label>
					<select class="form-control" name="feeType" id="dtl_feeType">
						<option value="" selected="selected">请选择</option>
						<c:forEach var="_feeMethod_" items="${fns:getEnumValues(\"com.chinagpay.cb.merchant.facade.enumtype.MerchantConstant\",\"FeeTypeEnum\") }">
							<option value="${_feeMethod_.code }">${_feeMethod_.des }</option>
						</c:forEach>
					</select>
				</div>
				<div id="dtl_standard" class="form-horizontal">
					<div class="form-inline">
						<label for="dtl_standard_addGatherAmount"
							class="col-sm-4 control-label">额外加收金额</label> <input type="text"
							value="0.00" id="dtl_standard_addGatherAmount"
							class="form-control" onblur="checkAmount(this);"> <label
							class="red" id="error"></label>
					</div>
					<div class="form-inline">
						<label for="dtl_standard_percentage"
							class="col-sm-4 control-label">费率(小数)</label> <input type="text"
							value="0.0000" id="dtl_standard_percentage" class="form-control"
							onblur="checkPercentage(this);"> <label class="red"
							id="error"></label>
					</div>
					<div class="form-inline">
						<label for="dtl_standard_minAmount" class="col-sm-4 control-label">最低手续费金额</label>
						<input type="text" value="0.00" id="dtl_standard_minAmount"
							class="form-control" onblur="checkAmount(this);"> <label
							class="red" id="error"></label>
					</div>
					<div class="form-inline">
						<label for="dtl_standard_maxAmount" class="col-sm-4 control-label">最高手续费金额</label>
						<input type="text" value="0.00" id="dtl_standard_maxAmount"
							class="form-control" onblur="checkAmount(this);"> <label
							class="red" id="error"></label>
					</div>
				</div>
				<div id="dtl_fixed" class="form-horizontal">
					<div class="form-inline">
						<label for="dtl_fixed_fixedAmount" class="col-sm-4 control-label">固定金额</label>
						<input type="text" value="0.00" id="dtl_fixed_fixedAmount"
							class="form-control" onblur="checkAmount(this);"> <label
							class="red" id="error"></label>
					</div>
				</div>
				<div id="dtl_lessLine" class="form-horizontal">
					<div class="form-inline">
						<label for="dtl_lessLine_percentage"
							class="col-sm-4 control-label">费率(小数)</label> <input type="text"
							value="0.00" id="dtl_lessLine_percentage" class="form-control"
							onblur="checkPercentage(this);"> <label class="red"
							id="error"></label>
					</div>
					<div class="form-inline">
						<label for="dtl_lessLine_lessLineAmount"
							class="col-sm-4 control-label">限额</label> <input type="text"
							value="0.00" id="dtl_lessLine_lessLineAmount"
							class="form-control" onblur="checkAmount(this);"> <label
							class="red" id="error"></label>
					</div>
					<div class="form-inline">
						<label for="dtl_lessLine_lessLineGatherFee"
							class="col-sm-4 control-label">不足补收手续费</label> <input type="text"
							value="0.00" id="dtl_lessLine_lessLineGatherFee"
							class="form-control" onblur="checkAmount(this);"> <label
							class="red" id="error"></label>
					</div>
				</div>
				<div id="dtl_remitDeduct" class="form-horizontal">
					<div class="form-inline">
						<label for="dtl_remitDeduct_percentage"
							class="col-sm-4 control-label">费率(小数)</label> <input type="text"
							value="0.00" id="dtl_remitDeduct_percentage" class="form-control"
							onblur="checkPercentage(this);"> <label class="red"
							id="error"></label>
					</div>
					<div class="form-inline">
						<label for="dtl_remitDeduct_minAmount" class="col-sm-4 control-label">最低手续费金额</label>
						<input type="text" value="0.00" id="dtl_remitDeduct_minAmount"
							class="form-control" onblur="checkAmount(this);"> <label
							class="red" id="error"></label>
					</div>
					<div class="form-inline">
						<label for="dtl_remitDeduct_maxAmount" class="col-sm-4 control-label">最高手续费金额</label>
						<input type="text" value="0.00" id="dtl_remitDeduct_maxAmount"
							class="form-control" onblur="checkAmount(this);"> <label
							class="red" id="error"></label>
					</div>
				</div>
				<div id="dtl_ognlExp" class="form-horizontal">
					<div class="form-inline">
						<label for="dtl_ognlExp_feeRule"
							class="col-sm-4 control-label">计费表达式</label> 
						<textarea rows="5" cols="100" id="dtl_ognlExp_feeRule" class="form-control"></textarea>
						<label class="red" id="error">“A”表示交易金额。填写规则为{条件?(条件符合表达式):(条件不符合表达式)}<br>
						A<=2000000?(200):(A<=4000000?(A*0.01+400):(A*2.00/100))
						</label>
					</div>
				</div>
			</form>
			<div class="form-inline" id="biz_update" style="display: none;">
					<button id="btn_change" class="btn btn-warning col-sm-6" onclick="dtl_change();">修改</button>
					<button id="btn_submit" class="btn btn-danger col-sm-6" onclick="update(this,'update');">提交</button>
			</div>
			<div class="form-inline" id="biz_add" style="display: none;">
					<button id="btn_submit" class="btn btn-danger col-sm-6" onclick="add(this,'add');">确定</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
				function init(){
					$("#dtl_feeType").change(function(){
						$("#dtl_standard").hide();
						$("#dtl_fixed").hide();
						$("#dtl_lessLine").hide();
						$("#dtl_remitDeduct").hide();
						$("#dtl_ognlExp").hide();
						var feeType=$(this).val();
						if(feeType=="STANDARD"){
							$("#dtl_standard").show();
						}else if(feeType=="SINGLE_FIXED"){
							$("#dtl_fixed").show();
						}else if(feeType=="REMIT_DEDUCT"){
							$("#dtl_remitDeduct").show();
						}else if(feeType=="LESS_ADD"){
							$("#dtl_lessLine").show();
						}else if(feeType=="OGNL_EXP"){
							$("#dtl_ognlExp").show();
						}else{
						}
					});
				}
				//新增计费
				function newFeeRule(){
					$('#dtl_form').css('display','none');
					$('#fee_items_form').css("display",'block');
					document.dtl_form.reset();
					$("#fee_items_table tr:not(:first,:last)").map(function(){
						$(this).remove();
					});
					$('#biz_add').css('display','none');
					$('#biz_update').css('display','none');
					//启用
					$("#dtl_form :input").each(function(){
						$(this).attr("disabled",false);
					});
					$("#dtl_layer").dialog({
						minWidth:1150,
						minHeight:200,
						modal:true,
						autoOpen:true
					});
				}
				function addFee(){
					document.dtl_form.reset();
					$('#dtl_form').css('display','block');
					$('#biz_add').css('display','block');
					$('#biz_update').css('display','none');
				}
				$(function(){
					init();
				});
				function formatNullValue(value){
					if(!value){
						return "";
					}
					return value;
				}
				function isNull(value){
					if(value==undefined||value==''){
						return true;
					}
					return false;
				}
				function fillDetail(obj){
					var id=formatNullValue(obj.id);
					var merchantNo=formatNullValue(obj.merchantNo);
					var productNo=formatNullValue(obj.productNo);
					var feeProduct=formatNullValue(obj.feeProduct);
					var feeType=formatNullValue(obj.feeType);
					var ruleBeginDate=formatNullValue(obj.ruleBeginDate);
					var ruleEndDate=formatNullValue(obj.ruleEndDate);
					var fixedAmount=formatNullValue(obj.fixedAmount);
					var percentage=formatNullValue(obj.percentage);
					var minAmount=formatNullValue(obj.minAmount);
					var maxAmount=formatNullValue(obj.maxAmount);
					var addGatherAmount=formatNullValue(obj.addGatherAmount);
					var lessLineAmount=formatNullValue(obj.lessLineAmount);
					var lessLineGatherFee=formatNullValue(obj.lessLineGatherFee);
					var createDate=formatNullValue(obj.createDate);
					var createOperator=formatNullValue(obj.createOperator);
					var updateDate=formatNullValue(obj.updateDate);
					var updateOperator=formatNullValue(obj.updateOperator);
					var feeRuleOgnlExp=formatNullValue(obj.feeRule);
					$("#dtl_id").val(obj.id);
					$("#dtl_merchantNo").val(merchantNo);
					$("#dtl_productNo").text(productNo);
					$("#dtl_feeProduct").val(feeProduct).trigger("change");
					$("#dtl_ruleBeginDate").val(ruleBeginDate);
					$("#dtl_ruleEndDate").val(ruleEndDate);
					//隐藏
					if(feeType=="STANDARD"){
						$("#dtl_standard_addGatherAmount").val(addGatherAmount);
						$("#dtl_standard_percentage").val(percentage);
						$("#dtl_standard_minAmount").val(minAmount);
						$("#dtl_standard_maxAmount").val(maxAmount);
					}else if(feeType=="SINGLE_FIXED"){
						$("#dtl_fixed_fixedAmount").val(fixedAmount);
					}else if(feeType=="REMIT_DEDUCT"){
						$("#dtl_remitDeduct_percentage").val(percentage);
						$("#dtl_remitDeduct_minAmount").val(minAmount);
						$("#dtl_remitDeduct_maxAmount").val(maxAmount);
					}else if(feeType=="LESS_ADD"){
						$("#dtl_lessLine_percentage").val(percentage);
						$("#dtl_lessLine_lessLineAmount").val(lessLineAmount);
						$("#dtl_lessLine_lessLineGatherFee").val(lessLineGatherFee);
					}else if(feeType=="OGNL_EXP"){
						$("#dtl_ognlExp_feeRule").val(feeRuleOgnlExp);
					}else{
					}
					$("#dtl_layer #dtl_feeType").val(feeType);
					$("#dtl_layer #dtl_feeType").trigger("change");
				}
				function showDetail(obj){
					$('#fee_items_form').css("display",'none');
					$('#dtl_form').css('display','block');
					document.dtl_form.reset();
					$('#biz_add').css('display','none');
					$('#biz_update').css('display','block');
					if(obj!=null){
						//禁用表单
						$("#dtl_form :input").each(function(){
							$(this).attr("disabled","disabled");
						});
						fillDetail(obj);
					}
					$("#dtl_layer").dialog({
						width:"530",
						height:"450",
						autoOpen:true
					});
				}
				function dtl_change(){
					$("#dtl_form :input").each(function(){
						$(this).attr("disabled",false);
					});
					$('#dtl_merchantNo').attr("disabled","disabled");
					$('#dtl_feeProduct').attr("disabled","disabled");
				}
				
				function isMoney(money){
					var reg = /^[\d]+[\.]{0,1}[\d]{0,2}$/;
					return reg.test(money);
				}
				function isRate(rate){
					var reg = /^[\d]+[\.]{0,1}[\d]{0,4}$/;
					return reg.test(rate);
				}
				function formatMoney(money){
					if(isMoney(money)){
						var index = money.indexOf(".");
						if(index==-1){
							money=money+".00";
							return money;
						}
						while(money.substring(index).length<3){
							money=money+"0";
						}
						return money;
					}
				}
				function checkAmount(form){
					var error="";
					if(isMoney(form.value)){
						form.value=formatMoney(form.value);
					}else{
						error="金额格式错误!";
					}
					$(form).parent().children("#error").text(error);
				}
				function checkPercentage(form){
					var error="";
					if(!isRate(form.value)){
						error="费率格式错误!"
					}
					$(form).parent().children("#error").text(error);
				}
				function update(btn){
					var url = "<%=request.getContextPath()%>/cbMerchant/merchantFeeRule/update";
					var id=$("#dtl_id").val();
					if(isNull(id)){
						alert("业务异常,请重新查询手续费信息!");
						return false;
					}
					var feeType=$("#dtl_feeType").val();
					var ruleBeginDate=$("#dtl_ruleBeginDate").val();
					var ruleEndDate=$("#dtl_ruleEndDate").val();
					if(isNull(feeType)){
						alert("请选择计费方式!");
						return false;
					}
					if(isNull(ruleBeginDate)||isNull(ruleEndDate)){
						alert("规则起止时间不能为空!");
						return false;
					}
					if(ruleBeginDate>ruleEndDate){
						alert("规则开始日期不能大于结束日期!");
						return false;
					}
					var fixedAmount="0";
					var percentage="0";
					var minAmount="0";
					var maxAmount="0";
					var addGatherAmount="0";
					var lessLineAmount="0";
					var lessLineGatherFee="0";
					var feeRule="";
					if(feeType=="STANDARD"){
						addGatherAmount=$("#dtl_standard_addGatherAmount").val();
						percentage=$("#dtl_standard_percentage").val();
						minAmount=$("#dtl_standard_minAmount").val();
						maxAmount=$("#dtl_standard_maxAmount").val();
					}else if(feeType=="SINGLE_FIXED"){
						fixedAmount=$("#dtl_fixed_fixedAmount").val();
					}else if(feeType=="REMIT_DEDUCT"){
						percentage=$("#dtl_remitDeduct_percentage").val();
						minAmount=$("#dtl_remitDeduct_minAmount").val();
						maxAmount=$("#dtl_remitDeduct_maxAmount").val();
					}else if(feeType=="LESS_ADD"){
						percentage=$("#dtl_lessLine_percentage").val();
						lessLineAmount=$("#dtl_lessLine_lessLineAmount").val();
						lessLineGatherFee=$("#dtl_lessLine_lessLineGatherFee").val();
					}else if(feeType=="OGNL_EXP"){
						feeRule=$("#dtl_ognlExp_feeRule").val();
					}else{
						alert("未知计费方式");
						return false;
					}
					if(confirm("所有金额如果没填将默认为0,是否确定提交?")){
						$(btn).attr("disable","disable");
						//提交
						var params={id:id,feeType:feeType,ruleBeginDate:ruleBeginDate,ruleEndDate:ruleEndDate,fixedAmount:fixedAmount
								,percentage:percentage,minAmount:minAmount,maxAmount:maxAmount,addGatherAmount:addGatherAmount,
								lessLineAmount:lessLineAmount,lessLineGatherFee:lessLineGatherFee,feeRule:feeRule};
						$.post(url,params,function(data){
							$(btn).attr("disable",false);
							if(data.err){
								alert(data.msg);
							}else{
								alert(data.msg);
								$('#queryForm').submit();
							}
						});
					}
				}
				function add(btn,method){
					var	merchantNo=$('#dtl_merchantNo').val();
					if(isNull(merchantNo)){
						alert("请填写商户号");
						return false;
					}
					var feeProduct=$("#dtl_feeProduct").val();
					if(isNull(feeProduct)){
						alert("请选择计费项目");
						return false;
					}
					var feeType=$("#dtl_feeType").val();
					var ruleBeginDate=$("#dtl_ruleBeginDate").val();
					var ruleEndDate=$("#dtl_ruleEndDate").val();
					if(isNull(feeType)){
						alert("请选择计费方式!");
						return false;
					}
					if(isNull(ruleBeginDate)||isNull(ruleEndDate)){
						alert("规则起止时间不能为空!");
						return false;
					}
					if(ruleBeginDate>ruleEndDate){
						alert("规则开始日期不能大于结束日期!");
						return false;
					}
					var fixedAmount="0";
					var percentage="0";
					var minAmount="0";
					var maxAmount="0";
					var addGatherAmount="0";
					var lessLineAmount="0";
					var lessLineGatherFee="0";
					var feeRule="";
					if(feeType=="STANDARD"){
						addGatherAmount=$("#dtl_standard_addGatherAmount").val();
						percentage=$("#dtl_standard_percentage").val();
						minAmount=$("#dtl_standard_minAmount").val();
						maxAmount=$("#dtl_standard_maxAmount").val();
					}else if(feeType=="SINGLE_FIXED"){
						fixedAmount=$("#dtl_fixed_fixedAmount").val();
					}else if(feeType=="REMIT_DEDUCT"){
						percentage=$("#dtl_remitDeduct_percentage").val();
						minAmount=$("#dtl_remitDeduct_minAmount").val();
						maxAmount=$("#dtl_remitDeduct_maxAmount").val();
					}else if(feeType=="LESS_ADD"){
						percentage=$("#dtl_lessLine_percentage").val();
						lessLineAmount=$("#dtl_lessLine_lessLineAmount").val();
						lessLineGatherFee=$("#dtl_lessLine_lessLineGatherFee").val();
					}else if(feeType=="OGNL_EXP"){
						feeRule=$("#dtl_ognlExp_feeRule").val();
					}else{
						alert("未知计费方式");
						return false;
					}
					if(confirm("所有金额如果没填将默认为0,是否确定提交?")){
						//判断是否已经添加了
						//查出现在有的
						var items=[]; 
						$("#fee_items_table tr:not(:first)").map(function(){
							var values=[];
							var i=0;
							$(this).find("td").map(function(){
								values[i++]=$(this).attr('_val_');
							});
							items[items.length]=values;
						});
						for(var i=0;i<items.length;i++){
							var item = items[i];
							//如果
							if(item[0]==merchantNo&&item[1]==feeProduct){
								alert("商户计费规则以存在!");
								return false;
							}
						}
						//添加到table中
						var tr = $("<tr></tr>");
						tr.append("<td _val_='"+merchantNo+"'>"+merchantNo+"</td>");//<th>商户编号</th>
						tr.append("<td _val_='"+feeProduct+"'>"+$("#dtl_feeProduct").find("option:selected").text()+"</td>");
						tr.append("<td _val_='"+ruleBeginDate+"'>"+ruleBeginDate+"</td>");
						tr.append("<td _val_='"+ruleEndDate+"'>"+ruleEndDate+"</td>");
						tr.append("<td _val_='"+feeType+"'>"+$('#dtl_feeType').find("option:selected").text()+"</td>");
						tr.append("<td _val_='"+addGatherAmount+"'>"+addGatherAmount+"</td>");
						tr.append("<td _val_='"+percentage+"'>"+percentage+"</td>");
						tr.append("<td _val_='"+minAmount+"'>"+minAmount+"</td>");
						tr.append("<td _val_='"+maxAmount+"'>"+maxAmount+"</td>");
						tr.append("<td _val_='"+fixedAmount+"'>"+fixedAmount+"</td>");
						tr.append("<td _val_='"+lessLineAmount+"'>"+lessLineAmount+"</td>");
						tr.append("<td _val_='"+lessLineGatherFee+"'>"+lessLineGatherFee+"</td>");
						tr.append("<td _val_='"+feeRule+"'>"+feeRule+"</td>");
						tr.append("<td><button onclick='javascript:del_tr(this);return false;'>删除</button></td>");
						$("#fee_items_table tr:last").before(tr);
						$('#dtl_form').css('display','none');
						$('#biz_add').css('display','none');
					}
				}
				function fees_submit(){
					var url = "<%=request.getContextPath()%>/cbMerchant/merchantFeeRule/add";
					if(confirm("是否确定提交?")){
						//判断是否已经添加了
						//查出现在有的
						var items=[];
						$("#fee_items_table tr:not(:first,:last)").map(function(){
							var values=[];
							var i=0;
							$(this).find("td").map(function(){
								values[i++]=$(this).attr('_val_');
							});
							items[items.length]=values;
						});
						var rules=[];
						for(var i=0;i<items.length;i++){
							var fee=new Object();
							var item = items[i];
							fee.merchantNo=item[0];
							fee.feeProduct=item[1];
							fee.ruleBeginDate=item[2];
							fee.ruleEndDate=item[3];
							fee.feeType=item[4];
							fee.addGatherAmount=item[5];
							fee.percentage=item[6];
							fee.minAmount=item[7];
							fee.maxAmount=item[8];
							fee.fixedAmount=item[9];
							fee.lessLineAmount=item[10];
							fee.lessLineGatherFee=item[11];
							fee.feeRule=item[12];
							rules.push(fee);
						}
						
						var param = JSON.stringify(rules);
						 $.ajax({
				                url: url,
				                type: "POST",
				                contentType : 'application/json;charset=utf-8', //设置请求头信息
				                dataType:"json",
				                data: param,
				                success: function(data){
				                	if(data.err){
										alert(data.msg);
									}else{
										alert(data.msg);
										$('#queryForm').submit();
									}
				                },
				                error: function(res){
				                    alert(res.responseText);
				                }
				            });
					}
				}
				function del_tr(tdson){
					if(confirm("是否确定删除?")){
						$(tdson.parentNode.parentNode).remove();
					}
				}
			</script>
</body>
</html>
