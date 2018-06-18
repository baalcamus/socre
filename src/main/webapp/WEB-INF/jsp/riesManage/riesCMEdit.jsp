<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/statics/v2/css/bootstrap/bootstrap-select.min.css">
<html lang="en">
<head>
<title>添加特约商户信息</title>
<style type="text/css">
#fee table tr td {
	white-space: nowrap;
}
</style>

<script type="text/javascript">
	var contextpath = "${ctx}";
	function editPR(){
		console.log("进入提交方法");
		$.post("<%=request.getContextPath()%>/riesManage/riesCMReport?type=addMessage", $('#subform').serialize() ,
		function (data){
			if(data=="success"){
				alert("添加成功");
				window.location.href="<%=request.getContextPath()%>/riesManage/riesEMIReportPage";
			}else{
				alert("添加失败!");
				alert(data);
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
					特约商户信息添加
					</li>
				</ol>
				<div class="clearfix"></div>
			</div>
			<!--END TITLE & BREADCRUMB PAGE-->
			<!--BEGIN CONTENT-->
			<div class="page-content">
				<div class="panel panel-default  withoutbottom clearfix">
					<header class="panel-heading clearfix">
						<h2 class="panel-title">特约商户信息添加</h2>
					</header>
					<input type='hidden' value ="${type}" id="type" name="type">
					<div class="panel-body clearfix">
						<form class="form-horizontal"  method="post"  role="form" enctype="multipart/form-data"
						 id="subform" action="">
							<div class="panel-inner">
								<h2 class="panel-inner-title panel-inner-title-default">商户类型、商户属性、商户名称、法人证件类型、法人证件号、法定代表人姓名、法定代表人证件类型、法定代表人证件号、商户代码、商户行业类别、收款卡号、收款卡号开户行、商户联系人、联系电话、清算网络、商户状态
								服务起始时间、合规风险状况、支持账户类型、拓展方式、上报日期、上传方式、上传人等 要素不得全部为空；其他要素根据条件来填写。
								</h2>
								<div class="panel-inner-body">
									<div class="row" id="agent1">
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">商户类型<span>*</span></td>
														<td><select name="CusType" id="CusType" class="form-control">
																<option
																	<c:if test="${companyMerchantReport.cusType==''}">selected="selected"</c:if>
																	value="">请选择</option>
																<c:forEach var="_cusType"
																	items="${MERCHAN_TTYPE}">
																	<option
																		<c:if test="${companyMerchantReport.cusType==_cusType.code }"> selected="selected"</c:if>
																		value="${_cusType.code }">${_cusType.name }</option>
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
																	<c:if test="${companyMerchantReport.cusNature==''}">selected="selected"</c:if>
																	value="">请选择</option>
																<c:forEach var="_cusNature"
																	items="${MERCHANT_PROPERTY}">
																	<option
																		<c:if test="${companyMerchantReport.cusNature==_cusNature.code }"> selected="selected"</c:if>
																		value="${_cusNature.code}">${_cusNature.name }</option>
																</c:forEach>
														</select></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">商户名称<span>*</span></td>
													<td><input type="text" class="form-control"
														id="RegName" name="RegName"
														value="${companyMerchantReport.regName}">
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
														value="${companyMerchantReport.cusName}">
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
													<td width="120" class="text-right">商户英文名称</td>
													<td><input type="text" class="form-control"
														id="CusNameEn" name="CusNameEn"
														value="${companyMerchantReport.cusNameEn}">
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
															<c:if test="${companyMerchantReport.docType==''}">selected="selected"</c:if>
															value="">请选择</option>
														<c:forEach var="_docType"
															items="${LEGALPERSONID_TYPE}">
															<option
																<c:if test="${companyMerchantReport.docType==_docType.code }"> selected="selected"</c:if>
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
													<td width="120" class="text-right">法人证件号码<span>*</span></td>
													<td><input type="text" class="form-control"
														id="DocCode" name="DocCode"
														value="${companyMerchantReport.docCode}">
													</td>
														
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">法定代表人名称<span>*</span></td>
													<td><input type="text" class="form-control"
														id="LegDocName" name="LegDocName"
														value="${companyMerchantReport.legDocName}">
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
													<td width="120" class="text-right">法定代表人证件类型<span>*</span></td>
													<td>
														<select name="LegDocType" id="LegDocType" class="form-control">
															<option
																<c:if test="${companyMerchantReport.legDocType==''}">selected="selected"</c:if>
																value="">请选择</option>
															<c:forEach var="_docType"
																items="${PERSONID_TYPE}">
																<option
																	<c:if test="${companyMerchantReport.legDocType==_docType.code }"> selected="selected"</c:if>
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
													<td width="120" class="text-right">法定代表人(负责人)证件号<span>*</span></td>
													<td><input type="text" class="form-control"
														id="LegDocCode" name="LegDocCode"
														value="${companyMerchantReport.legDocCode}">
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
														value="${companyMerchantReport.cusCode}">
													</td>	
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">商户行业类别<span>*</span></td>
													<td><input type="text" class="form-control"
														id="InduType" name="InduType"
														value="${companyMerchantReport.induType}">
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
													<td width="120" class="text-right">收款账\卡号<span>*</span></td>
													<td><input type="text" class="form-control"
														id="BankNo" name="BankNo"
														value="${companyMerchantReport.bankNo}">
													</td>	
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">收款账\卡开户行<span>*</span></td>
													<td><input type="text" class="form-control"
														id="OpenBank" name="OpenBank"
														value="${companyMerchantReport.openBank}">
													</td>	
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">商户注册地址(省)<span>*</span></td>	
													<td>
														<select name="RegAddrProv" id="RegAddrProv" class="form-control">
															<option
																<c:if test="${companyMerchantReport.regAddrProv==''}">selected="selected"</c:if>
																value="">请选择</option>
															<c:forEach var="_regAddrProv"
																items="${ADMINISTRATIVEAREA_DICTIONARY}">
																<c:if test="${_regAddrProv.pid==1 }">
																	<option
																		<c:if test="${companyMerchantReport.regAddrProv==_regAddrProv.code}"> selected="selected"</c:if>
																		value="${_regAddrProv.code}">${_regAddrProv.name }
																	</option>
																</c:if>
															</c:forEach>
														</select>																		
													</td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">商户注册地址<span>*</span></td>
													<td><input type="text" class="form-control"
														id="RegAddrDetail" name="RegAddrDetail"
														value="${companyMerchantReport.regAddrDetail}">
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
													<td width="120" class="text-right">商户经营地址(省)<span>*</span></td>	
													<td>
														<select name="AddrProv" id="AddrProv" class="form-control">
															<option
																<c:if test="${companyMerchantReport.addrProv==''}">selected="selected"</c:if>
																value="">请选择</option>
															<c:forEach var="_addrProv"
																items="${ADMINISTRATIVEAREA_DICTIONARY}">
																<c:if test="${_addrProv.pid==1 }">
																	<option
																		<c:if test="${companyMerchantReport.addrProv==_addrProv.code}"> selected="selected"</c:if>
																		value="${_addrProv.code}">${_addrProv.name }
																	</option>
																</c:if>
															</c:forEach>
														</select>																		
													</td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">商户经营地址<span>*</span></td>
													<td><input type="text" class="form-control"
														id="AddrDetail" name="AddrDetail"
														value="${companyMerchantReport.addrDetail}">
													</td>	
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">网址<span>*</span></td>
													<td><input type="text" class="form-control"
														id="Url" name="Url"
														value="${companyMerchantReport.url}">
													</td>	
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">服务器ip<span>*</span></td>
													<td><input type="text" class="form-control"
														id="ServerIp" name="ServerIp"
														value="${companyMerchantReport.serverIp}">
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
													<td width="120" class="text-right">icp备案编号<span>*</span></td>
													<td><input type="text" class="form-control"
														id="Icp" name="Icp"
														value="${companyMerchantReport.icp}">
													</td>	
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">商户联系人<span>*</span></td>
													<td><input type="text" class="form-control"
														id="ContName" name="ContName"
														value="${companyMerchantReport.contName}">
													</td>	
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">商户联系电话<span>*</span></td>
													<td><input type="text" class="form-control"
														id="ContPhone" name="ContPhone"
														value="${companyMerchantReport.contPhone}">
													</td>	
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">商户email</td>
													<td><input type="text" class="form-control"
														id="CusEmail" name="CusEmail"
														value="${companyMerchantReport.cusEmail}">
													</td>	
												</tr>
											</table>
										</div>
									</div>
								</div>
							<!-- 	<div class="panel-inner-body"> -->
									<div class="row" id="agent1">
										<div class="col-lg-6 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">商户经营地区范围,省级<span>*</span></td>
													<td width="420">
													<select  name="Occurarea" id="Occurarea"  class="selectpicker show-tick form-control" multiple data-live-search="false">
														<c:choose>
															<c:when test="${fn:contains(companyMerchantReport.occurarea,',')==false}">
																<%-- <option
																	<c:if test="${mechantReport.occurarea==''}">selected="selected"</c:if>
																	value="">请选择</option> --%>
																<c:forEach var="_occurarea"
																	items="${ADMINISTRATIVEAREA_DICTIONARY}">
																	<c:if test="${_occurarea.pid==1 }">
																		<option  
																			<c:if test="${companyMerchantReport.occurarea==_occurarea.code}"> selected="selected"</c:if>
																			value="${_occurarea.code}">${_occurarea.name }
																		</option>
																	</c:if>
																</c:forEach>
															</c:when>
															<c:otherwise>
															<%-- 	<option
																	<c:if test="${mechantReport.occurarea==''}">selected="selected"</c:if>
																	value="">请选择</option>	 --%>
																<c:set value="${ fn:split(mechantChangeQueryDTO.occurarea, ',') }" var="str1" />
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
										<div class="col-lg-6 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">清算网络<span>*</span></td>
													<td width="420">
													<select  name="NetworkType" id="NetworkType"   class="selectpicker show-tick form-control" multiple data-live-search="false">
														<c:choose>
															<c:when test="${fn:contains(companyMerchantReport.networkType,',')==false}">
																<%-- <option
																	<c:if test="${companyMerchantReport.networkType==''}">selected="selected"</c:if>
																	value="">请选择</option> --%>
																<c:forEach var="_networkType"
																	items="${CLEARINGNET_WORK}">
																		<option
																			<c:if test="${companyMerchantReport.networkType==_networkType.code}"> selected="selected"</c:if>
																			value="${_networkType.code}">${_networkType.name }
																		</option>
																</c:forEach>
																
															</c:when>
															<c:otherwise>
															<%-- 	<option
																	<c:if test="${mechantReport.occurarea==''}">selected="selected"</c:if>
																	value="">请选择</option>	 --%>
																<c:set value="${ fn:split(companyMerchantReport.networkType, ',') }" var="str1" />
																<c:forEach  items="${str1}" var="_networkType2">
																	<c:forEach var="_networkType"
																	items="${CLEARINGNET_WORK}">
																		<option
																			<c:if test="${_networkType2==_networkType.code}"> selected="selected"</c:if>
																			value="${_networkType.code}">${_networkType.name }
																		</option>
																	</c:forEach>
																</c:forEach>
															</c:otherwise>
														</c:choose>	
													</select>	
											
													</td>
												</tr>
											</table>
											</div>
									</div>
								<!-- </div> -->
								<div class="panel-inner-body">
									<div class="row" id="agent1">
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">商户状态<span>*</span></td>
													<td>
														<select name="Status" id="Status" class="form-control">
															<option
																<c:if test="${companyMerchantReport.status==''}">selected="selected"</c:if>
																value="">请选择</option>
															<c:forEach var="_status"
																items="${MERCHANT_STATUS}">
																	<option
																		<c:if test="${companyMerchantReport.status==_status.code}"> selected="selected"</c:if>
																		value="${_status.code}">${_status.name }
																	</option>
															</c:forEach>
														</select>																		
													</td>	
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">服务起始时间<span>*</span></td>
													<td>
													<div data-date-format="yyyy-mm-dd"
														class="input-group date datepicker-filter mbs">
														<span class="input-group-addon"><i
															class="fa fa-calendar"></i></span> <input class="form-control"
															id="StartTime" name="StartTime"
															value="${companyMerchantReport.startTime}" />
													</div>
												</td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">服务终止时间 <span>*</span></td>
													<td>
													<div data-date-format="yyyy-mm-dd"
														class="input-group date datepicker-filter mbs">
														<span class="input-group-addon"><i
															class="fa fa-calendar"></i></span> <input class="form-control"
															id="EndTime" name="EndTime"
															value="${companyMerchantReport.endTime}" />
													</div>
												</td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">合规风险状况<span>*</span></td>
													<td>
														<select name="RiskStatus" id="RiskStatus" class="form-control">
															<option
																<c:if test="${companyMerchantReport.riskStatus==''}">selected="selected"</c:if>
																value="">请选择</option>
															<c:forEach var="_riskStatus"
																items="${COMPLIANCERISK_STATUS}">
																	<option
																		<c:if test="${companyMerchantReport.riskStatus==_riskStatus.code}"> selected="selected"</c:if>
																		value="${_riskStatus.code}">${_riskStatus.name }
																	</option>
															</c:forEach>
														</select>																		
													</td>	
												</tr>
											</table>
										</div>
										
									</div>
								</div>
								<div class="row" id="agent1">
									<div class="col-lg-6 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">开通业务种类<span>*</span></td>
													<td width="420">
													<select  name="OpenType" id="OpenType" class="selectpicker show-tick form-control" multiple data-live-search="false">
														<c:choose>
															<c:when test="${fn:contains(companyMerchantReport.openType,',')==false}">
																<option
																<c:if test="${companyMerchantReport.openType==''}">selected="selected"</c:if>
																value="">请选择</option>
															<c:forEach var="_openType"
																items="${OPENSERVICE_CATEGORIES}">
																	<option
																		<c:if test="${companyMerchantReport.openType==_openType.code}"> selected="selected"</c:if>
																		value="${_openType.code}">${_openType.name }
																	</option>
															</c:forEach>
															</c:when>
															<c:otherwise>
															<%-- 	<option
																	<c:if test="${mechantReport.occurarea==''}">selected="selected"</c:if>
																	value="">请选择</option>	 --%>
																<c:set value="${ fn:split(companyMerchantReport.openType, ',') }" var="str1" />
																<c:forEach  items="${str1}" var="_opentype2">
																	<c:forEach var="_openType"
																	items="${OPENSERVICE_CATEGORIES}">
																	<option
																		<c:if test="${_opentype2 ==_openType.code}"> selected="selected"</c:if>
																		value="${_openType.code}">${_openType.name }
																	</option>
															</c:forEach>
																</c:forEach>
															</c:otherwise>
														</c:choose>	
													</select>	
											
													</td>
												</tr>
											</table>
											</div>
											<div class="col-lg-6 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">支持账户类型<span>*</span></td>
													<td width="420">
													<select  name="AccountType" id="AccountType" class="selectpicker show-tick form-control" multiple data-live-search="false">
														<c:choose>
															<c:when test="${fn:contains(companyMerchantReport.accountType,',')==false}">
																<%-- <option
																<c:if test="${companyMerchantReport.accountType==''}">selected="selected"</c:if>
																value="">请选择</option> --%>
															<c:forEach var="_accountType"
																items="${SUPPORTACCOUNT_TYPE}">
																	<option
																		<c:if test="${companyMerchantReport.accountType==_accountType.code}"> selected="selected"</c:if>
																		value="${_accountType.code}">${_accountType.name }
																	</option>
															</c:forEach>
															</c:when>
															<c:otherwise>
															<%-- 	<option
																	<c:if test="${mechantReport.occurarea==''}">selected="selected"</c:if>
																	value="">请选择</option>	 --%>
																<c:set value="${ fn:split(companyMerchantReport.accountType, ',') }" var="str1" />
																<c:forEach  items="${str1}" var="_accountType2">
																	<c:forEach var="_accountType"
																		items="${SUPPORTACCOUNT_TYPE}">
																	<option
																		<c:if test="${_accountType2==_accountType.code}"> selected="selected"</c:if>
																		value="${_accountType.code}">${_accountType.name }
																	</option>
															
																	</c:forEach>
																</c:forEach>
															</c:otherwise>
														</c:choose>	
													</select>	
											
													</td>
												</tr>
											</table>
										</div>
									</div>	
										
								<div class="panel-inner-body">
									<div class="row" id="agent1">
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">股东信息</td>
													<td><input type="text" class="form-control"
														id="ShareHolder" name="ShareHolder"
														value="${companyMerchantReport.shareHolder}">																
													</td>	
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">计费类型<span>*</span></td>
													<td>
														<select name="ChageType" id="ChageType" class="form-control">
															<option
																<c:if test="${companyMerchantReport.chageType==''}">selected="selected"</c:if>
																value="">请选择</option>
															<c:forEach var="_chageType"
																items="${CHARGE_TYPE}">
																	<option
																		<c:if test="${companyMerchantReport.chageType==_chageType.code}"> selected="selected"</c:if>
																		value="${_chageType.code}">${_chageType.name }
																	</option>
															</c:forEach>
														</select>																		
													</td>		
												</tr>
											</table>
										</div>
										
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">拓展方式<span>*</span></td>
													<td>
														<select name="ExpandType" id="ExpandType" class="form-control">
															<option
																<c:if test="${companyMerchantReport.expandType==''}">selected="selected"</c:if>
																value="">请选择</option>
															<c:forEach var="_expandType"
																items="${EXPANSION_MODE}">
																	<option
																		<c:if test="${companyMerchantReport.expandType==_expandType.code}"> selected="selected"</c:if>
																		value="${_expandType.code}">${_expandType.name }
																	</option>
															</c:forEach>
														</select>																		
													</td>		
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">外包服务机构名称<span>*</span></td>
													<td><input type="text" class="form-control"
														id="OutServiceName" name="OutServiceName"
														value="${companyMerchantReport.outServiceName}">																
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
													<td width="120" class="text-right">外包服务机构法人证件类型<span>*</span></td>
													<td>
													<select name="OutServiceCardType" id="OutServiceCardType" class="form-control">
														<option
															<c:if test="${companyMerchantReport.outServiceCardType==''}">selected="selected"</c:if>
															value="">请选择</option>
														<c:forEach var="_outServiceCardType"
															items="${LEGALPERSONID_TYPE}">
															<option
																<c:if test="${companyMerchantReport.outServiceCardType==_outServiceCardType.code }"> selected="selected"</c:if>
																value="${_outServiceCardType.code}">${_outServiceCardType.name }</option>
														</c:forEach>
														</select>
													</td>			
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">外包服务机构法人证件号<span>*</span></td>
													<td><input type="text" class="form-control"
														id="OutServiceCardCode" name="OutServiceCardCode"
														value="${companyMerchantReport.outServiceCardCode}">																
													</td>	
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">外包服务机构法定代表人证件类型<span>*</span></td>
													<td>
														<select name="OutServiceLegCardType" id="OutServiceLegCardType" class="form-control">
															<option
																<c:if test="${companyMerchantReport.outServiceLegCardType==''}">selected="selected"</c:if>
																value="">请选择</option>
															<c:forEach var="_outServiceLegCardType"
																items="${PERSONID_TYPE}">
																<option
																	<c:if test="${companyMerchantReport.outServiceLegCardType==_outServiceLegCardType.code }"> selected="selected"</c:if>
																	value="${_outServiceLegCardType.code}">${_outServiceLegCardType.name }</option>
															</c:forEach>
														</select>																		
													</td>
														
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">外包服务机构法定代表人证件号<span>*</span></td>
													<td><input type="text" class="form-control"
														id="OutServiceLegCardCode" name="OutServiceLegCardCode"
														value="${companyMerchantReport.outServiceLegCardCode}">																
													</td>	
												</tr>
											</table>
										</div>
										</div>
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
			
<script src="<%=request.getContextPath()%>/statics/v2/js/bootstrap-select.min.js"></script>
<script src="<%=request.getContextPath()%>/statics/v2/js/i18n/defaults-*.min.js"></script>
<script type="text/javascript">
$(window).on('load', function () {
    $('#Occurarea').selectpicker({
        selectedText: 'cat',
        noneSelectedText:'请选择',
        size:6,
    });
    $('#NetworkType').selectpicker({
        selectedText: 'cat',
        noneSelectedText:'请选择',
        size:6,
    });
    $('#AccountType').selectpicker({
        selectedText: 'cat',
        noneSelectedText:'请选择',
        size:6,
    });
    $('#OpenType').selectpicker({
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
	
    $().ready(function () {
    	console.log("进入验证");
        	$("form").validate({
                rules: {
                	CusType: {
                        required:true,
                    },
                    CusNature: {
                        required:true,
                    },
                    RegName: {
                        required:true,
                    },
                    DocType: {
                        required:true,
                    },
                    DocCode: {
                        required:true,
                    },
                    LegDocName: {
                        required:true,
                    },
                    LegDocType: {
                        required:true,
                    },
                    LegDocCode: {
                        required:true,
                    },
                    CusCode: {
                        required:true,
                       
                    },
                    InduType: {
                        required:true,
                    },
                    BankNo: {
                        required:true,
                    },
                    OpenBank: {
                        required:true,
                    },
                    ContName: {
                        required:true,
                    },
                    ContPhone: {
                        required:true,
                    },
                    NetworkType: {
                        required:true,
                    },
                    Status: {
                        required:true,
                    },
                    StartTime: {
                        required:true,
                    },
                    RiskStatus: {
                        required:true,
                    },
                    AccountType: {
                        required:true,
                    },
                    ExpandType: {
                        required:true,
                    },
                    RepDate: {
                        required:true,
                    },
                    RepType: {
                        required:true,
                    },
            
                    Url: {
                    	url:true,
                    },
                 /* 	RegAddrProv:{
                    	checkRegAddrProv:true,
                    }, */
                     
                    
                    ServerIp: {
                    	checkServerIp:true,
                    },
                },
       		
                submitHandler: function (form) {
                	//console.log("123");
                	editPR();
                }
                
            });
         	
            jQuery.validator.addMethod('checkRegAddrProv', function (value, element) {
            	var regaddrprov = $('#RegAddrProv').val();
            	alert(regaddrprov.length);
            	
                var name = /([a-zA-Z0-9\u4e00-\u9fa5]+)(.jpg|.JPG|.png|.PNG)$/
                return this.optional(element) || name.test(value);
            }, '格式不正确');
            
        	
        	
        	
        jQuery.validator.addMethod('checkName', function (value, element) {
            var name = /([a-zA-Z0-9\u4e00-\u9fa5]+)(.jpg|.JPG|.png|.PNG)$/
            return this.optional(element) || name.test(value);
        }, '格式不正确');
        
        jQuery.validator.addMethod('checkDocCode', function (value, element) {
            var no = /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
            return this.optional(element) || no.test(value);
        }, '请输入正确的身份证号码');
  
       jQuery.validator.addMethod('checkServerIp', function (value, element) { 
       		 var ip = /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/; 
        	return this.optional(element) || (ip.test(value) && (RegExp.$1 < 256 && RegExp.$2 < 256 && RegExp.$3 < 256 && RegExp.$4 < 256)); 
        }, "Ip地址格式错误");
       
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
