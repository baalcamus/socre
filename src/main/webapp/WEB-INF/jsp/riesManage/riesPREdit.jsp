<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<html lang="en">
<head>
<title>个人风险信息上报</title>
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
	function editPR(){
		console.log("进入提交方法");
		$.post("<%=request.getContextPath()%>/riesManage/riesPRReport", $('#subform').serialize() ,
		function (data){
			if(data=="success"){
				alert("上报成功");
			window.location.href="<%=request.getContextPath()%>/riesManage/riesPRGetList";
			}else{
				alert("上报失败!");
				//window.location.reload();
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
						href="${ctx}/main/toMain.do">首页</a>&nbsp;&nbsp;
					<li>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					个人风险信息上报
					</li>
				</ol>
				<div class="clearfix"></div>
			</div>
			<!--END TITLE & BREADCRUMB PAGE-->
			<!--BEGIN CONTENT-->
			<div class="page-content">
				<div class="panel panel-default  withoutbottom clearfix">
					<header class="panel-heading clearfix">
						<h2 class="panel-title">个人信息上报</h2>
					</header>
					<input type='hidden' value ="${type}" id="type" name="type">
					<div class="panel-body clearfix">
						<form class="form-horizontal"  method="post"  role="form" enctype="multipart/form-data"
						 id="subform" action="">
							<div class="panel-inner">
								<h2 class="panel-inner-title panel-inner-title-default">手机号、MAC、Imei、银行账/卡号、（客户姓名）身份证证件号码、IP地址、收款银行账/卡号7项要素不得全部为空。
								</h2>
								<div class="panel-inner-body">
									<div class="row" id="agent1">
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">风险类型<span>*</span></td>
														<td><select name="RiskType" id="RiskType" class="form-control">
																<option
																	<c:if test="${personReport.riskType==''}">selected="selected"</c:if>
																	value="">请选择</option>
																<c:forEach var="_riskType"
																	items="${fns:getEnumValues(\"com.chinagpay.ries.enumtype.RiseEnum\",\"RiskStatusEnum\")}">
																	<option
																		<c:if test="${personReport.riskType==_riskType.code }"> selected="selected"</c:if>
																		value="${_riskType.code }">${_riskType.des }</option>
																</c:forEach>
														</select></td>
														
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">手机号<span>*</span></td>
													<td><input type="text" class="form-control"
														id="MobileNo" name="MobileNo"
														value="${personReport.mobileNo}"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">MAC地址<span>*</span></td>
													<td><input type="text" class="form-control"
														id="Mac" name="Mac"
														value="${personReport.mac}"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">Imei<span>*</span></td>
													<td><input type="text" class="form-control"
														id="Imei" name="Imei"
														value="${personReport.imei}"></td>
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
													<td width="120" class="text-right">银行帐/卡号<span>*</span></td>
													<td><input type="text" class="form-control"
														id="BankNo" name="BankNo"
														value="${personReport.bankNo}"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">开户行<span>*</span></td>
													<td><input type="text" class="form-control"
														id="OpenBank" name="OpenBank"
														value="${personReport.openBank}"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">客户姓名<span>*</span></td>
													<td><input type="text" class="form-control"
														id="CusName" name="CusName"
														value="${personReport.cusName}"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">身份证件号码<span>*</span></td>
													<td><input type="text" class="form-control"
														id="DocCode" name="DocCode"
														value="${personReport.docCode}"></td>
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
													<td width="120" class="text-right">IP地址<span>*</span></td>
													<td><input type="text" class="form-control"
														id="Ip" name="Ip"
														value="${personReport.ip}"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">收货地址<span>*</span></td>
													<td><input type="text" class="form-control"
														id="Address" name="Address"
														value="${personReport.address}"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">固定电话<span>*</span></td>
													<td><input type="text" class="form-control"
														id="Telephone" name="Telephone"
														value="${personReport.telephone}"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">收款银行帐/卡号<span>*</span></td>
													<td><input type="text" class="form-control"
														id="RecBankNo" name="RecBankNo"
														value="${personReport.recBankNo}"></td>
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
													<td width="120" class="text-right">邮箱<span>*</span></td>
													<td><input type="text" class="form-control"
														id="Email" name="Email"
														value="${personReport.email}"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">有效期<span>*</span></td>
											<td><input class="form-control" id="ValidDate"
										name="ValidDate" value="${personReport.occurtimeb}"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" /></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">信息级别<span>*</span></td>
																											<td><select name="Level" id="Level" class="form-control">
													<option
																	<c:if test="${personReport.level==''}">selected="selected"</c:if>
																	value="">请选择</option>
																<c:forEach var="_level"
																	items="${fns:getEnumValues(\"com.chinagpay.ries.enumtype.RiseEnum\",\"LevelEnum\")}">
																	<option
																		<c:if test="${personReport.level==_level.code }"> selected="selected"</c:if>
																		value="${_level.code }">${_level.des }</option>
																</c:forEach>
														</select></td>	
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">风险事件发生时间<span>*</span></td>
														
								<td><input class="form-control" id="Occurtimeb"
										name="Occurtimeb" value="${personReport.occurtimeb}"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" /></td>
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
													<td width="120" class="text-right">风险事件结束时间<span>*</span></td>
														
																				<td><input class="form-control" id="Occurtimee"
										name="Occurtimee" value="${personReport.occurtimee}"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />		</td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">风险事件发生渠道<span>*</span></td>
													
									<td>	
													   <select name="Occurchan" id="Occurchan" class="form-control">
																<option
																	<c:if test="${personReport.occurchan==''}">selected="selected"</c:if>
																	value="">请选择</option>
																<c:forEach var="_occurchan"
																	items="${fns:getEnumValues(\"com.chinagpay.ries.enumtype.RiseEnum\",\"OccurrenceChannelEnum\")}">
																	<option
																		<c:if test="${personReport.occurchan==_occurchan.code }"> selected="selected"</c:if>
																		value="${_occurchan.code }">${_occurchan.des }</option>
																</c:forEach>
														</select>
														</td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">风险事件发生地域<span>*</span></td>
													<td><input type="text" readonly="readonly" class="form-control"
														id="Occurarea" name="Occurarea"
														value="1">
<%-- 														value="${personReport.occurarea}"> --%>
														
														</td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">风险事件描述<span>*</span></td>
													<td><input type="text" class="form-control"
														id="Note" name="Note"
														value="${personReport.note}"></td>
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
													<td width="120" class="text-right">收款账/卡号开户行<span>*</span></td>
													<td><input type="text" class="form-control"
														id="RecOpenBank" name="RecOpenBank"
														value="${personReport.recOpenBank}"></td>
												</tr>
											</table>
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
	<script  src="<%=request.getContextPath()%>/statics/v2/vendors/jquery-validate/messages_zh.js"></script>
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
	
    $().ready(function () {
    	console.log("进入验证");
        	$("form").validate({
                rules: {
                	RiskType: {
                        required:true,
                    },
                    Imei: {
                    	maxlength:32                	
                    },
                	MobileNo: {
                      //  required: true,
                        checkMobel: true
                    },
                    DocCode:{
                    	// required:true,
                    	checkDocCode: true
                    },
                    Ip:{
                    	// required:true,
                       checkIP: true
                    },
                    Mac:{
                    	// required:true,
                    	checkMAC: true
                    },
                    Email:{
                    	// required:true,
                    	checkEmail: true
                    },
                    Telephone:{
                    	// required:true,
                    	checkPhone: true
                    },
                    Occurtimeb :{
                    	// required:true,
                    	required:true
                    },
                    Occurtimee :{
                    	// required:true,
                    	required: true
                    },
                    ValidDate :{
                    	// required:true,
                    	required: true
                    },
                    Level :{
                    	// required:true,
                    	required: true
                    },
                },
                messages: {
                     legalPerCtfFile: {
                         required: "请选择图片"
                     }
                },
                submitHandler: function (form) {
                	//console.log("123");
                	editPR();
                }
                
            });
    
        jQuery.validator.addMethod('checkName', function (value, element) {
            var name = /([a-zA-Z0-9\u4e00-\u9fa5]+)(.jpg|.JPG|.png|.PNG)$/
            return this.optional(element) || name.test(value);
        }, '格式不正确');
        
        jQuery.validator.addMethod('checkDocCode', function (value, element) {
            var no = /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
            return this.optional(element) || no.test(value);
        }, '请输入正确的身份证号码');
        jQuery.validator.addMethod('checkIP', function (value, element) {
            var no = /^([1-9]?\d|1\d\d|2[0-4]\d|25[0-5])\.([1-9]?\d|1\d\d|2[0-4]\d|25[0-5])\.([1-9]?\d|1\d\d|2[0-4]\d|25[0-5])\.([1-9]?\d|1\d\d|2[0-4]\d|25[0-5])$/;
            return this.optional(element) || no.test(value);
        }, 'IP格式不正确，应为xxx.xxx.xxx.xxx，xxx可为3位数字，也可为一位数字');
        
        jQuery.validator.addMethod('checkMAC', function (value, element) {
            var no = /^[A-F0-9]{2}(-[A-F0-9]{2}){5}$/;
            return this.optional(element) || no.test(value);
        }, 'XX-XX-XX-XX-XX-XX，其中X取值范围为0-9,A-F');
        
        jQuery.validator.addMethod('checkMobel', function (value, element) {
        	var regex = /^1\d{10}$/;           
        	return this.optional(element) || regex.test(value);
        }, '请输入正确的手机号');
        
        jQuery.validator.addMethod('checkEmail', function (value, element) {
        	var szReg=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;          
        	return this.optional(element) || szReg.test(value);
        }, '请输入正确的邮箱地址');
        
        jQuery.validator.addMethod('checkPhone', function (value, element) {
        	var szReg=/^(((0\d{3}[\-])?\d{7}|(0\d{2}[\-])?\d{8}))([\-]\d{2,4})?$/;          
        	return this.optional(element) || szReg.test(value);
        }, '必须输入三位或四位区号，七位或八位电话号码，区号为三位时电话号码必须为八位），区号与电话号码以-隔开');
        
    })

    $(function () {
        $.fn.serializeName = function ()  //获取form表单下全部的name 
        {
            var o = [];
            var a = this.serializeArray();
            $.each(a, function () {
            	console.log("this.name");
                o.push(this.name);
            });
            return o;
        };
    });

</script>

</body>
</html>
