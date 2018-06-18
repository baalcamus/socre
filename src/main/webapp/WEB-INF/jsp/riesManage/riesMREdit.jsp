<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/statics/v2/css/easyzoom.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/statics/v2/css/bootstrap/bootstrap-select.min.css">


<html lang="en">
<head>
<title>商户风险信息上报</title>
<style type="text/css">
#fee table tr td {
	white-space: nowrap;
}
</style>

<script type="text/javascript">
	var contextpath = "${ctx}";
	function query() {
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/riesManage/riesEditPQList");
		$("#queryForm").submit();
	}
	function editMR(){
		
		$.post("<%=request.getContextPath()%>/riesManage/riesMRReport", $('#subform').serialize() ,
		function (data){
// 			alert(data);
			if(data=="success"){
				alert("上报成功");
			window.location.href="<%=request.getContextPath()%>/riesManage/riesMRGetList";
							} else {
								alert("上报失败!");
								//window.location.reload();
							}
						});
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
						href="${ctx}/main/toMain.do">首页</a>&nbsp;&nbsp;<i
						class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
					<li>支付风险信息管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
				</ol>
				<div class="clearfix"></div>
			</div>
			<!--END TITLE & BREADCRUMB PAGE-->
			<!--BEGIN CONTENT-->
			<div class="page-content">
				<div class="panel panel-default  withoutbottom clearfix">
					<header class="panel-heading clearfix">
						<h2 class="panel-title">商户风险信息上报</h2>
					</header>
				<input type='hidden' value ="${type}" id="type" name="type">
					<div class="panel-body clearfix">
						<form class="form-horizontal" role="form" method="post"
							enctype="multipart/form-data" id="subform"
							action="<%=request.getContextPath()%>/riesManage/riesMRReport">

							<div class="panel-inner">
								<h2 class="panel-inner-title panel-inner-title-default">商户类型、客户属性、风险类型、商户属性、商户名称、商户代码、法人证件类型、法人证件号、法人代表人名称、法人代表人证件类型、法定代表人（负责人）证件号码、银行结算账号、开户行、风险信息等级等16项要素不得全部为空
								</h2>
								<div class="panel-inner-body">
									<div class="row" id="agent1">
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">商户类型<span>*</span></td>
														<td><select name="CusType" id="CusType" class="form-control">
																<option
																	<c:if test="${mechantReport.cusType==''}">selected="selected"</c:if>
																	value="">请选择</option>
																<c:forEach var="_cusType"
																	items="${MERCHAN_TTYPE}">
																	<option
																		<c:if test="${mechantReport.cusType==_cusType.code }"> selected="selected"</c:if>
																		value="${_cusType.code }">${_cusType.name }</option>
																</c:forEach>
														</select></td>
														
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">客户属性<span>*</span></td>
														<td><select name="CusProperty" id="CusProperty" class="form-control">
																<option
																	<c:if test="${mechantReport.cusProperty==''}">selected="selected"</c:if>
																	value="">请选择</option>
																<c:forEach var="_cusProperty"
																	items="${CLIENT_PROPERTY}">
																	<option
																		<c:if test="${mechantReport.cusProperty==_cusProperty.code }"> selected="selected"</c:if>
																		value="${_cusProperty.code }">${_cusProperty.name }</option>
																</c:forEach>
														</select></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">风险类型<span>*</span></td>
														<td><select name="RiskType" id="RiskType" class="form-control">
																<option
																	<c:if test="${mechantReport.riskType==''}">selected="selected"</c:if>
																	value="">请选择</option>
																<c:forEach var="_riskType"
																	items="${RISKCUM_STATUS}">
																	<option
																		<c:if test="${mechantReport.riskType==_riskType.code }"> selected="selected"</c:if>
																		value="${_riskType.code }">${_riskType.name }</option>
																</c:forEach>
														</select></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">商户属性<span>*</span></td>
														<td><select name=CusNature id="CusNature" class="form-control">
																<option
																	<c:if test="${mechantReport.cusNature==''}">selected="selected"</c:if>
																	value="">请选择</option>
																<c:forEach var="_cusNature"
																	items="${MERCHANT_PROPERTY}">
																	<option
																		<c:if test="${mechantReport.cusNature==_cusNature.code }"> selected="selected"</c:if>
																		value="${_cusNature.code}">${_cusNature.name }</option>
																</c:forEach>
														</select></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
								<div class="panel-inner-body">
									<div class="row" id="agent1">
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">商户名称<span>*</span></td>
													<td><input type="text" class="form-control"
														id="RegName" name="RegName"
														value="${mechantReport.regName}">
													</td>	
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">商户简称</td>
													<td><input type="text" class="form-control"
														id="CusName" name="CusName"
														value="${mechantReport.cusName}">
													</td>	
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">商户代码<span>*</span></td>
													<td><input type="text" class="form-control"
														id="CusCode" name="CusCode"
														value="${mechantReport.cusCode}">
													</td>	
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">法人证件类型<span>*</span></td>
													<td>
													<select name="DocType" id="DocType" class="form-control">
														<option
															<c:if test="${mechantReport.docType==''}">selected="selected"</c:if>
															value="">请选择</option>
														<c:forEach var="_docType"
															items="${LEGALPERSONID_TYPE}">
															<option
																<c:if test="${mechantReport.docType==_docType.code }"> selected="selected"</c:if>
																value="${_docType.code}">${_docType.name }</option>
														</c:forEach>
														</select>
													</td>			
												</tr>
											</table>
										</div>
									</div>
								</div>

								<div class="panel-inner-body">
									<div class="row" id="agent1">
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">法人证件号码<span>*</span></td>
													<td><input type="text" class="form-control"
														id="DocCode" name="DocCode"
														value="${mechantReport.docCode}">
													</td>
														
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">法定代表人（负责人）姓名<span>*</span></td>
													<td><input type="text" class="form-control"
														id="LegRepName" name="LegRepName"
														value="${mechantReport.legRepName}"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">法定代表人(负责人)证件类型<span>*</span></td>
													<td>
														<select name="LegDocType" id="LegDocType" class="form-control">
															<option
																<c:if test="${mechantReport.legDocType==''}">selected="selected"</c:if>
																value="">请选择</option>
															<c:forEach var="_docType"
																items="${PERSONID_TYPE}">
																<option
																	<c:if test="${mechantReport.legDocType==_docType.code }"> selected="selected"</c:if>
																	value="${_docType.code}">${_docType.name }</option>
															</c:forEach>
														</select>																		
													</td>
														
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">法定代表人（负责人）证件号码<span>*</span></td>
													<td><input type="text" class="form-control"
														id="LegDocCode" name="LegDocCode"
														value="${mechantReport.legDocCode}"></td>
												</tr>
											</table>
										</div>
									</div>
								</div>

								<div class="panel-inner-body">
									<div class="row" id="agent1">
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">银行结算账号<span>*</span></td>
													<td><input type="text" class="form-control"
														id="BankNo" name="BankNo"
														value="${mechantReport.bankNo}"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">开户行<span>*</span></td>
													<td><input type="text" class="form-control"
														id="OpenBank" name="OpenBank"
														value="${mechantReport.openBank}"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">网址</td>
													<td><input type="text" class="form-control"
														id="Url" name="Url"
														value="${mechantReport.url}"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">服务器IP</td>
													<td><input type="text" class="form-control"
														id="ServerIp" name="ServerIp"
														value="${mechantReport.serverIp}"></td>
												</tr>
											</table>
										</div>
										
									</div>
								</div>
								<div class="panel-inner-body">
									<div class="row" id="agent1">
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">法定代表人(负责人)手机号</td>
													<td><input type="text" class="form-control"
														id="MobileNo" name="MobileNo"
														value="${mechantReport.mobileNo}"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">商户实际办公地</td>
													<td><input type="text" class="form-control"
														id="Address" name="Address"
														value="${mechantReport.address}"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">ICP备案编号</td>
													<td><input type="text" class="form-control" id="Icp"
														name="Icp" value="${mechantReport.icp}"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">风险信息等级<span>*</span></td>
													<td><select name="Level" id="Level"
														class="form-control">
															<option
																<c:if test="${mechantReport.level==''}">selected="selected"</c:if>
																value="">请选择</option>
															<c:forEach var="_level"
																items="${fns:getEnumValues(\"com.chinagpay.ries.enumtype.RiseEnum\",\"LevelEnum\")}">
																<option
																	<c:if test="${mechantReport.level==_level.code }"> selected="selected"</c:if>
																	value="${_level.code }">${_level.des }</option>
															</c:forEach>
													</select></td>
												</tr>
											</table>
										</div>
									</div>
								</div>

								<div class="panel-inner-body">
									<div class="row" id="agent1">
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">风险事件发生时间<span>*</span></td>
													<td><input class="form-control" id="Occurtimeb"
														name="Occurtimeb" value="${mechantReport.occurtimeb}"
														onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" /></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">风险事件结束时间<span>*</span></td>

													<td><input class="form-control" id="Occurtimee"
														name="Occurtimee" value="${mechantReport.occurtimee}"
														onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
													</td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">风险事件发生渠道</td>
													<td>
														<select name="Occurchan" id="Occurchan" class="form-control">
															<option
																<c:if test="${mechantReport.occurchan==''}">selected="selected"</c:if>
																value="">请选择</option>
															<c:forEach var="_occurchan"
																items="${OCCURRENCE_CHANNEL}">
																<option
																	<c:if test="${mechantReport.occurchan==_occurchan.code}"> selected="selected"</c:if>
																	value="${_occurchan.code}">${_occurchan.name }
																</option>
															</c:forEach>
														</select>
													</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
<!-- 								<div class="panel-inner-body"> -->
									<div class="row" id="agent1">
										<div class="col-lg-6 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">风险事件发生地域<span>*</span></td>
													<td width="420">
													<select  name="Occurarea" id="Occurarea"  data-size='5' class="selectpicker show-tick form-control" multiple data-live-search="false">
														<c:choose>
															<c:when test="${fn:contains(mechantReport.occurarea,',')==false}">
																<%-- <option
																	<c:if test="${mechantReport.occurarea==''}">selected="selected"</c:if>
																	value="">请选择</option> --%>
																<c:forEach var="_occurarea"
																	items="${ADMINISTRATIVEAREA_DICTIONARY}">
																	<c:if test="${_occurarea.pid==1 }">
																		<option  
																			<c:if test="${mechantReport.occurarea==_occurarea.code}"> selected="selected"</c:if>
																			value="${_occurarea.code}">${_occurarea.name }
																		</option>
																	</c:if>
																</c:forEach>
															</c:when>
															<c:otherwise>
															<%-- 	<option
																	<c:if test="${mechantReport.occurarea==''}">selected="selected"</c:if>
																	value="">请选择</option>	 --%>
																<c:set value="${ fn:split(mechantReport.occurarea, ',') }" var="str1" />
																<c:forEach  items="${str1}" var="_occurarea2">
																	<c:forEach var="_occurarea"
																	items="${ADMINISTRATIVEAREA_DICTIONARY}">
																		<c:if test="${_occurarea.pid==1 }">
																			<option
																				<c:if test="${_occurarea2==_occurarea.code}"> selected="selected"</c:if>
																				value="${_occurarea.code}">${_occurarea.name }
																			</option>
																		</c:if>
																	</c:forEach>
																</c:forEach>
															</c:otherwise>
														</c:choose>	
													</select>	
											
													</td>
												</tr>
											</table>
											</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">风险事件描述</td>
													<td><input type="text" class="form-control" id="Note"
														name="Note" value="${mechantReport.note}"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">有效期<span>*</span></td>

													<td><input class="form-control" id="ValidDate"
														name="ValidDate" value="${mechantReport.validDate}"
														onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
													</td>

												</tr>
											</table>
<!-- 										</div> -->
									</div>
								</div>
								</div>
							</div>



	<div id="btndiv" class="panel panel-default save-box-grey clearfix">
                            <center>
                               <button id ="butAdd" class="btn btn-primary margin30" type="submit"><i
                                        class="fa fa-check-square-o"></i> 提交
                                </button>
                                
                                 <button id="butCancel" class="btn btn-primary margin30" onclick="history.go(-1)">
                                	<i class="fa fa-check-square-o"></i> 取消
                                </button>
                            </center>
                        </div>
                    </form>
						<div id="pbutdiv" style="display: none" class="panel panel-default save-box-grey clearfix">
                            <center>
                                 <button id="butCancel" class="btn btn-primary margin30" onclick="history.go(-1)">
                                	<i class="fa fa-check-square-o"></i> 返回
                                </button>
                            </center>
                        </div>

						<!--End CONTENT-->
					</div>
				</div>
				<!--右侧内容 end-->
			</div>
		</div>
	</div>
	<!--附言弹窗 end-->
	<!--全局动态-->
	<script
		src="<%=request.getContextPath()%>/statics/v2/vendors/jquery-validate/messages_zh.js"></script>

<script src="<%=request.getContextPath()%>/statics/v2/js/bootstrap-select.min.js"></script>
<script src="<%=request.getContextPath()%>/statics/v2/js/i18n/defaults-*.min.js"></script>
<script type="text/javascript">
$(window).on('load', function () {
    $('#Occurarea').selectpicker({
        selectedText: 'cat',
        noneSelectedText:'请选择',
        size:6,
    });
});
</script>
	<script type="text/javascript">
	 $(function () {
		 var type = $("#type").val();
		 if(type != "preview"){
			 
		 }else{
			  $("#btndiv").hide();
			  $("#pbutdiv").show();
			  
			  $("input").attr("readonly","true");
			  $("select").attr("disabled","disabled");
		 }
	 });
	
		$().ready(
						function() {
							console.log("进入验证");
							$("form").validate({
								rules : {
									RiskType : {
										required : true,
									},
									CusProperty : {
										required : true,
									},
									CusCode : {
										required : true,
										maxlength : 32
									},
									CusType : {
										required: true,
									},
									CusNature : {
										required: true,
									},
									RegName : {
										required: true,
									},
									LegRepName : {
										required:true,
									},
									LegDocType : {
										required:true,
									},
									LegDocCode : {
										 required:true,
										checkDocCode : true
									},
									BankNo : {
										required:true,
									},
									OpenBank : {
										required:true,
									},
									ServerIp : {
										// required:true,
										checkIP : true
									},
									
									Occurtimeb : {
										// required:true,
										required : true
									},
									Occurtimee : {
										// required:true,
										required : true
									},
									Occurarea : {
										// required:true,
										required : true
									},
									ValidDate : {
										// required:true,
										required : true
									},
									Level : {
										// required:true,
										required : true
									},

								},
								submitHandler : function(form) {
									editMR();
								}

							});

							jQuery.validator
									.addMethod(
											'checkName',
											function(value, element) {
												var name = /([a-zA-Z0-9\u4e00-\u9fa5]+)(.jpg|.JPG|.png|.PNG)$/
												return this.optional(element)
														|| name.test(value);
											}, '格式不正确');

							jQuery.validator
									.addMethod(
											'checkDocCode',
											function(value, element) {
												var no = /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
												return this.optional(element)
														|| no.test(value);
											}, '请输入正确的身份证号码');
							jQuery.validator
									.addMethod(
											'checkIP',
											function(value, element) {
												var no = /^([1-9]?\d|1\d\d|2[0-4]\d|25[0-5])\.([1-9]?\d|1\d\d|2[0-4]\d|25[0-5])\.([1-9]?\d|1\d\d|2[0-4]\d|25[0-5])\.([1-9]?\d|1\d\d|2[0-4]\d|25[0-5])$/;
												return this.optional(element)
														|| no.test(value);
											},
											'IP格式不正确，应为xxx.xxx.xxx.xxx，xxx可为3位数字，也可为一位数字');

							jQuery.validator
									.addMethod(
											'checkMAC',
											function(value, element) {
												var no = /^[A-F0-9]{2}(-[A-F0-9]{2}){5}$/;
												return this.optional(element)
														|| no.test(value);
											},
											'XX-XX-XX-XX-XX-XX，其中X取值范围为0-9,A-F');

							jQuery.validator.addMethod('checkMobel', function(
									value, element) {
								var regex = /^1\d{10}$/;
								return this.optional(element)
										|| regex.test(value);
							}, '请输入正确的手机号');

							jQuery.validator
									.addMethod(
											'checkEmail',
											function(value, element) {
												var szReg = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
												return this.optional(element)
														|| szReg.test(value);
											}, '请输入正确的邮箱地址');

							jQuery.validator
									.addMethod(
											'checkPhone',
											function(value, element) {
												var szReg = /^(((0\d{3}[\-])?\d{7}|(0\d{2}[\-])?\d{8}))([\-]\d{2,4})?$/;
												return this.optional(element)
														|| szReg.test(value);
											},
											'必须输入三位或四位区号，七位或八位电话号码，区号为三位时电话号码必须为八位），区号与电话号码以-隔开');

							jQuery.validator
									.addMethod(
											'checkOrgCode',
											function(value, element) {
												var szReg = /^[a-zA-Z0-9]{8}-[a-zA-Z0-9]?$/;
												return this.optional(element)
														|| szReg.test(value);
											},
											'组织机构代码（组织机构代码，必须为10位字符，前8位为数字加“-”,最后一位为数字或字母）');

							jQuery.validator.addMethod('checkBusLicCode',
									function(value, element) {
										var szReg = /^\d{15}$/;
										return this.optional(element)
												|| szReg.test(value);
									}, '营业执照编码，必须为15位数字组成！');

							jQuery.validator.addMethod(
									'checkSocialUnityCreditCode', function(
											value, element) {
										var szReg = /^[a-zA-Z0-9]{18}$/;
										return this.optional(element)
												|| szReg.test(value);
									}, '统一社会信用代码，为18位（数字+字母)！');

						})

		$(function() {
			$.fn.serializeName = function() //获取form表单下全部的name 
			{
				var o = [];
				var a = this.serializeArray();
				$.each(a, function() {
					console.log("this.name");
					o.push(this.name);
				});
				return o;
			};
		});
	</script>
</body>
</html>

