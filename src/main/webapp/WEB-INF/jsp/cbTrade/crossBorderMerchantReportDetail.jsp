<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>跨境交易管理</title>
<script type="text/javascript">	

	function update() {
		var orgNo = $("#orgNo").val();
		var companyName = $("#companyName").val();
		var areaCode = $("#areaCode").val();
		var companyAddr = $("#companyAddr").val();
		var postCode = $("#postCode").val();
		var industryCode = $("#industryCode").val();
		var attrCode = $("#attrCode").val();
		var countryCode = $("#countryCode").val();
		var isTaxfree = $("#isTaxfree").val();
		var declareBankCode = $("#declareBankCode").val();
		var contactUna = $("#contactUna").val();
		var telUna = $("#telUna").val();

		if (orgNo == null || orgNo == '') {
			alert("请输入单位机构代码");
			return false;
		}

		if (companyName == null || companyName == '') {
			alert("请输入单位名称");
			return false;
		}

		if (areaCode == null || areaCode == '') {
			alert("请输入住所、营业场所名称及代码");
			return false;
		}

		if (companyAddr == null || companyAddr == '') {
			alert("请输入单位地址");
			return false;
		}

		if (postCode == null || postCode == '') {
			alert("请输入邮政编码");
			return false;
		}
		
		if (industryCode == null || industryCode == '') {
			alert("请输入行业属性代码");
			return false;
		}
		
		if (attrCode == null || attrCode == '') {
			alert("请输入经济类型代码");
			return false;
		}
		if (countryCode == null || countryCode == '') {
			alert("请输入常驻国家代码");
			return false;
		}
		if (isTaxfree == null || isTaxfree == '') {
			alert("请输入是否特殊经济区内企业");
			return false;
		}
		if (declareBankCode == null || declareBankCode == '') {
			alert("请输入申报金融机构代码");
			return false;
		}
		if (contactUna == null || contactUna == '') {
			alert("请输入单位联系人");
			return false;
		}
		if (telUna == null || telUna == '') {
			alert("请输入单位联系电话");
			return false;
		}
		$.ajax({
             cache: true,
             type: "POST",
             url:"<%=request.getContextPath()%>/static/cbTrade/forex/crossBorderMerchantReportUpdate",
             data:$('#subForm').serialize(),
             async: false,
             success: function(data) {
                 if(data=="success"){
					 alert("修改成功");
					 window.location.href="<%=request.getContextPath()%>/cbTrade/forex/crossBorderMerchantReportList";
				 }else if(data=="error"){
					 alert("修改异常");
				 }else{
					alert("修改失败!");
				 }
             },
	  		 error: function(request) {
           		 alert("连接异常");
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
						<li>
							<i class="fa fa-home"></i>&nbsp;<a href="Organization_management.html">首页</a>&nbsp;&nbsp;
							<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li>跨境交易管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li>跨境商户报备管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li class="active">商户报备</li>
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
									<h2 class="panel-title">商户报备</h2>
								</div>
								<div class="panel-body">
									<form method="post" enctype="multipart/form-data" class="form-horizontal" id="subForm">
										<input type="hidden" name="id" id="id" value="${tblBankCompanyInfoSend.id}" />
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">商户编号<span>*</span></td>
														<td width="200">
															<input type="text" id="merchantNo" name="merchantNo" value="${tblBankCompanyInfoSend.merchantNo}" class="form-control"></td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">银行编码<span>*</span></td>
														<td width="200">
															<select class="form-control" id="bankId" name="bankId" tabindex="10">
																<option value=""  <c:if test="${tblBankCompanyInfoSend.bankId=='' }">selected="selected"</c:if> >--请选择--</option>
																<c:forEach items="${tblForexConstantInfoList}" var="tblForexConstantInfo">
																	<option value="${tblForexConstantInfo.constantId}" <c:if test="${tblForexConstantInfo.constantId==tblBankCompanyInfoSend.bankId}">selected</c:if> >${tblForexConstantInfo.constantName}</option>
																</c:forEach>
															</select>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">单位机构代码<span>*</span></td>
														<td width="200">
															<input type="text" id="orgNo" name="orgNo" value="${tblBankCompanyInfoSend.orgNo}" class="form-control"></td>
														</td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">单位名称<span>*</span></td>
														<td width="200">
															<input type="text" id="companyName" name="companyName" value="${tblBankCompanyInfoSend.companyName}" class="form-control" ></td>
														</td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list" >
													<tr>
														<td width="120" class="text-right">住所、营业场所名称及代码<span>*</span></td>
														<td width="200">
															<input type="text" id="areaCode" name="areaCode" value="${tblBankCompanyInfoSend.areaCode}" class="form-control"></td>
														</td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list" >
													<tr>
														<td width="120" class="text-right">单位地址<span>*</span></td>
														<td width="200">
															<input type="text" id="companyAddr" name="companyAddr" value="${tblBankCompanyInfoSend.companyAddr}" class="form-control"></td>
														</td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list" >
													<tr>
														<td width="120" class="text-right">邮政编码<span>*</span></td>
														<td width="200">
															<input type="text" id="postCode" name="postCode" value="${tblBankCompanyInfoSend.postCode}" class="form-control"></td>
														</td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list" >
													<tr>
														<td width="120" class="text-right">行业属性代码<span>*</span></td>
														<td width="200">
															<input type="text" id="industryCode" name="industryCode" value="${tblBankCompanyInfoSend.industryCode}" class="form-control"></td>
														</td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list" >
													<tr>
														<td width="120" class="text-right">经济类型代码<span>*</span></td>
														<td width="200">
															<input type="text" id="attrCode" name="attrCode" value="${tblBankCompanyInfoSend.attrCode}" class="form-control"></td>
														</td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list" >
													<tr>
														<td width="120" class="text-right">常驻国家代码<span>*</span></td>
														<td width="200">
															<input type="text" id="countryCode" name="countryCode" value="${tblBankCompanyInfoSend.countryCode}" class="form-control"></td>
														</td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list" >
													<tr>
														<td width="120" class="text-right">是否特殊经济区内企业<span>*</span></td>
														<td width="200">
															<select class="form-control" id="isTaxfree" name="isTaxfree" tabindex="10">
																<option value=""  <c:if test="${tblBankCompanyInfoSend.isTaxfree==''}">selected</c:if> >--请选择--</option>
																<option value="Y" <c:if test="${tblBankCompanyInfoSend.isTaxfree=='Y'}">selected</c:if> >是</option>
																<option value="N" <c:if test="${tblBankCompanyInfoSend.isTaxfree=='N'}">selected</c:if> >否</option>
															</select>
														</td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list" >
													<tr>
														<td width="120" class="text-right">特殊经济区内企业类型代码<span>*</span></td>
														<td width="200">
															<input type="text" id="taxfreeCode" name="taxfreeCode" value="${tblBankCompanyInfoSend.taxfreeCode}" class="form-control"></td>
														</td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list" >
													<tr>
														<td width="120" class="text-right">申报方式<span>*</span></td>
														<td width="200">
															<input type="text" id="declareMethod" name="declareMethod" value="${tblBankCompanyInfoSend.declareMethod}" class="form-control"></td>
														</td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list" >
													<tr>
														<td width="120" class="text-right">申报金融机构代码<span>*</span></td>
														<td width="200">
															<input type="text" id="declareBankCode" name="declareBankCode" value="${tblBankCompanyInfoSend.declareBankCode}" class="form-control"></td>
														</td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list" >
													<tr>
														<td width="120" class="text-right">单位联系人<span>*</span></td>
														<td width="200">
															<input type="text" id="contactUna" name="contactUna" value="${tblBankCompanyInfoSend.contactUna}" class="form-control"></td>
														</td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list" >
													<tr>
														<td width="120" class="text-right">单位联系电话<span>*</span></td>
														<td width="200">
															<input type="text" id="telUna" name="telUna" value="${tblBankCompanyInfoSend.telUna}" class="form-control"></td>
														</td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list" >
													<tr>
														<td width="120" class="text-right">单位传真<span>*</span></td>
														<td width="200">
															<input type="text" id="faxUna" name="faxUna" value="${tblBankCompanyInfoSend.faxUna}" class="form-control"></td>
														</td>
														<td></td>
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
															<input type="button" value="修改" id="btn" onclick="update()" class="btn btn-primary margin30" /> 
															<input type="button" value="重置" id="btn2" onclick="reset()" class="btn btn-dark" />
														</td>
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
