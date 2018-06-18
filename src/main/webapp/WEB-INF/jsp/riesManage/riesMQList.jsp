<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>商户风险信息查询</title>
<script type="text/javascript">
	var contextpath = "${ctx}";
	
	function query() {
<%-- 		$("#queryForm").attr("action", "<%=request.getContextPath()%>/riesManage/riseMQList"); --%>
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/riesManage/riesMQList");
		$("#queryForm").submit();
	}
	
	function add() {
		window.location.href="<%=request.getContextPath()%>/riesManage/toRisePRAdd?type=add";
	}
	
	function update(id) {
		window.location.href="<%=request.getContextPath()%>/riskManage/toRiskUserBlackListAdd?type=update&id="+id;
	}
	
	function deleteList(id){
		$.post("<%=request.getContextPath()%>/riskManage/riskUserBlackListDelete",
		{
			id:id,
		},
		function (data){
			if(data=="success"){
				alert("删除成功");
				window.location.href="<%=request.getContextPath()%>/riskManage/riskUserBlackList";
							} else {
								alert("删除失败!");
								window.location.reload();
							}
						});
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
		<div id="page-wrapper">
			<!--BEGIN TITLE & BREADCRUMB PAGE-->
			<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
				<ol class="breadcrumb page-breadcrumb">
					<li><i class="fa fa-home"></i>&nbsp;<a
						href="Organization_management.html">首页</a>&nbsp;&nbsp;<i
						class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
					<li>商户风险信息查询&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
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
						<h2 class="panel-title">商户简称、商户名称、法人证件号码、法定代表人证件号码、银行账号、开户行、网址、服务器 IP、手机、 ICP 编号查询条件不能全部为空</h2>				
					</div>
					<div class="panel-body">
						<div class="row">
							<form action="" method="post" id="queryForm" class="queryForm"
								enctype="multipart/form-data" class="form-horizontal ">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />
								<div class="panel-inner">
									<div class="panel-inner-body">
										<div class="row" id="agent1">
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">风险类型</td>
														<td><select name="RiskType" class="form-control">
																<option
																	<c:if test="${mechantQueryDTO.riskType==''}">selected="selected"</c:if>
																	value="">请选择</option>	
																<c:forEach var="_riskType"
																	items="${RISKCUM_STATUS}">
																	<option
																		<c:if test="${mechantQueryDTO.riskType==_riskType.code }"> selected="selected"</c:if>
																		value="${_riskType.code }">${_riskType.name }</option>
																</c:forEach>
														</select></td>
													</tr>
												</table>
											</div>
										
												<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">法人证件号码</td>
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
														<td width="120" class="text-right">商户简称<span>*</span></td>
														<td><input type="text" class="form-control" id="CusName"
															name="CusName" value="${mechantQueryDTO.cusName}"></td>
													</tr>
												</table>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">商户名称</td>
														<td><input type="text" class="form-control" id="RegName"
															name="RegName" value="${mechantQueryDTO.regName}"></td>
													</tr>
												</table>
											</div>
										</div>
									</div>
									<div class="panel-inner-body" hidden>
										<div class="row" id="agent1">
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12"  hidden>
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">商户属性</td>
														<td><select name="CusNature" class="form-control">
																<option
																	<c:if test="${mechantQueryDTO.cusNature==''}">selected="selected"</c:if>
																	value="">请选择</option>
																<c:forEach var="_cusNature"
																	items="${MERCHANT_PROPERTY}">
																	<option
																		<c:if test="${mechantQueryDTO.cusNature==_cusNature.code }"> selected="selected"</c:if>
																		value="${_cusNature.code}">${_cusNature.name }</option>
																</c:forEach>
														</select></td>
													</tr>
												</table>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" hidden>
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">商户编码</td>
														<td><input type="text" class="form-control"
															id="CusCode" name="CusCode" value="${mechantQueryDTO.cusCode}"></td>
													</tr>
												</table>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" hidden>
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">法人证件类型</td>
													<td>
													<select name="DocType" id="DocType" class="form-control">
														<option
															<c:if test="${mechantQueryDTO.docType==''}">selected="selected"</c:if>
															value="">请选择</option>
														<c:forEach var="_docType"
															items="${LEGALPERSONID_TYPE}">
															<option
																<c:if test="${mechantQueryDTO.docType==_docType.code }"> selected="selected"</c:if>
																value="${_docType.code}">${_docType.name }</option>
														</c:forEach>
														</select>
													</td>			
												</tr>
											</table>
										</div>
									
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" hidden>
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">法定代表人姓名/负责人姓名</td>
														<td><input type="text" class="form-control"
															id="LegRepName" name="LegRepName"
															value="${mechantQueryDTO.legRepName}"></td>
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
														<td width="120" class="text-right">法定代表人证件号码</td>
														<td><input type="text" class="form-control"
															id="LegDocCode" name="LegDocCode"
															value="${mechantQueryDTO.legDocCode}"></td>
													</tr>
												</table>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">银行账号</td>
														<td><input type="text" class="form-control"
															id="BankNo" name="BankNo"
															value="${mechantQueryDTO.bankNo}"></td>
													</tr>
												</table>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" hidden>
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">开户行</td>
														<td><input type="text" class="form-control" id="OpenBank"
															name="OpenBank" value="${mechantQueryDTO.openBank}"></td>
													</tr>
												</table>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">网址</td>
														<td><input type="text" class="form-control"
															id="Url" name=Url
															value="${mechantQueryDTO.url}"></td>
													</tr>
												</table>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">服务器IP</td>
														<td><input type="text" class="form-control"
															id="ServerIp" name="ServerIp"
															value="${mechantQueryDTO.serverIp}"></td>
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
														<td width="120" class="text-right">手机</td>
														<td><input type="text" class="form-control"
															id="MobileNo" name="MobileNo"
															value="${mechantQueryDTO.mobileNo}"></td>
													</tr>
												</table>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" hidden>
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">商户实际办公地</td>
														<td><input type="text" class="form-control"
															id="Address" name="Address" value="${mechantQueryDTO.address}"></td>
													</tr>
												</table>
											</div>
										
										
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">ICP备案编号</td>
														<td><input type="text" class="form-control"
															id="ICP" name="ICP" value="${mechantQueryDTO.icp}"></td>
													</tr>
												</table>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">风险事件发生时间</td>
														<td>
														<input class="form-control" id="Occurtimeb"
															name="Occurtimeb" value="${mechantQueryDTO.occurtimeb}"
															onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
														</td>
													</tr>
												</table>
											</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">风险事件结束时间</td>
														<td>
														<input class="form-control" id="Occurtimee"
															name="Occurtimee" value="${mechantQueryDTO.occurtimee}"
															onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
														</td>

													</tr>
												</table>
											</div>
											
										</div>
									</div>

									<div class="panel-inner-body" hidden>
										<div class="row" id="agent1">
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">风险事件等级</td>
															<td><select name="Level" class="form-control">
															<option
																	<c:if test="${mechantQueryDTO.level==''}">selected="selected"</c:if>
																	value="">请选择</option>
																<c:forEach var="_level"
																	items="${fns:getEnumValues(\"com.chinagpay.ries.enumtype.RiseEnum\",\"LevelEnum\")}">
																	<option
																		<c:if test="${mechantQueryDTO.level==_level.code }"> selected="selected"</c:if>
																		value="${_level.code }">${_level.des }</option>
																</c:forEach>
															</select></td>
													</tr>
												</table>
											</div>
											
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">风险事件发生渠道</td>

													   <td>	
													   <select name="Occurchan" class="form-control">
																<option
																	<c:if test="${mechantQueryDTO.occurchan==''}">selected="selected"</c:if>
																	value="">请选择</option>
																<c:forEach var="_occurchan"
																	items="${fns:getEnumValues(\"com.chinagpay.ries.enumtype.RiseEnum\",\"OccurrenceChannelEnum\")}">
																	<option
																		<c:if test="${mechantQueryDTO.occurchan==_occurchan.code }"> selected="selected"</c:if>
																		value="${_occurchan.code }">${_occurchan.des }</option>
																</c:forEach>
														</select>
														</td>
													</tr>
												</table>
											</div>
											

										</div>
									</div>
																	
								  <div class="panel-inner-body" hidden>
									<div class="row" id="agent1">

										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">风险事件发生地域</td>
														<td><input type="text" class="form-control"
															id="Occurarea" name="Occurarea"
															value="${mechantQueryDTO.occurarea}"></td>
													</tr>
												</table>
											</div>
										
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">查询范围<span>*</span></td>
													<td>全部</td>
														
														<input type="hidden" class="form-control"
														id="Scope" name="Scope"
														value="01">
												</tr>
											</table>
										</div>
										
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">有效性</td>
													<td>
													<select name="ValidStatus" class="form-control">
																<option
																	<c:if test="${mechantQueryDTO.validStatus==''}">selected="selected"</c:if>
																	value="">请选择</option>
																<c:forEach var="_validStatus"
																	items="${fns:getEnumValues(\"com.chinagpay.ries.enumtype.RiseEnum\",\"ValidityEnum\")}">
																	<option
																		<c:if test="${mechantQueryDTO.validStatus==_validStatus.code }"> selected="selected"</c:if>
																		value="${_validStatus.code }">${_validStatus.des }</option>
																</c:forEach>
														</select>
													</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
								</div>



							</form>
							<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
								<table width="100%" class="product_detail_list">
									<tr>
										<td></td>
										<td>
											<button type="submit" class="btn btn-danger"
												onclick="query();">
												<i class="fa fa-search"></i> 查询
											</button>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!--这是查询模块结束-->
				<!--这是列表模块开始-->
				<div class="panel panel-default clearfix">
					<header class="panel-heading clearfix">
						<h2 class="panel-inner-title02">列表</h2>
					</header>
					<div class=" panel-body clearfix">
						<div class="table-responsive border0">
							<table class="table table-hover">
								<thead>
									<tr>
										<th><span>风险类型</span></th>
										<th><span>商户简称</span></th>
										<th><span>商户名称</span></th>
										<th><span>商户编码</span></th>
										<!-- <th><span>组织机构代码</span></th> -->
										<th><span>法定代表人姓名</span></th>
										<th><span>法定代表人证件号码</span></th>
										<th><span>风险事件发生时间</span></th>
										<th><span>风险事件结束时间</span></th>
										<th><span>有效性</span></th>
										<th><span>操作</span></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${MerchantRespDTOList}" var="Merchant">
										<tr>
										    <td>
										    	<c:forEach var="_riskType"
													items="${RISKCUM_STATUS}">
														<c:if test="${Merchant.riskType==_riskType.code }"> ${_riskType.name }</c:if>
												</c:forEach>
										   </td>
											<td>${Merchant.cusName}</td>
											<td>${Merchant.regName}</td>
											<td>${Merchant.cusCode}</td>
											<%-- <td>${Merchant.orgCode}</td> --%>
											<td>${Merchant.legRepName}</td>
											<td>${Merchant.legDocCode}</td>
											<td>${Merchant.occurtimeb}</td>
											<td>${Merchant.occurtimee}</td>
											
										    <td>${fns:getEnumField("com.chinagpay.ries.enumtype.RiseEnum","ValidityEnum",Merchant.validStatus,"getCode","getDes")}</td>
											<td><a href="#" onclick='showForexOrderPanel(${fns:toJson(Merchant)});return false;'>
														明细</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
<%-- 				<jsp:include page="../include/page.jsp" /> --%>
				<!--这是列表模块结束-->
			</div>
			<!--End CONTENT-->
		</div>
		<!--右侧内容 end-->
	</div>
	
	<script type="text/javascript">
	function format(value){
		if(isNull(value))
			value="";
		return value
	}
	
	function isNull(value){
		if(value==undefined||value==null||value=='')return true;
	}
	function showForexOrderPanel(obj){
		
		$("#S_CusProperty").val(format(obj.cusProperty));
		$("#S_RiskType").val(format(obj.riskType));
		$("#S_CusNature").val(format(obj.cusNature));
		$("#S_CusName").val(format(obj.cusName));
		$("#S_RegName").val(format(obj.regName));
		$("#S_CusCode").val(format(obj.cusCode));
		$("#S_OpenBank").val(format(obj.openBank));
		$("#S_CusName").val(format(obj.cusName));
		$("#S_RegName").val(format(obj.regName));
		$("#S_CusCode").val(format(obj.cusCode));
		//$("#S_OrgCode").val(format(obj.orgCode));
		//$("#S_BusLicCode").val(format(obj.busLicCode));
		//$("#S_SocialUnityCreditCode").val(format(obj.socialUnityCreditCode));
		//$("#S_TaxRegCer").val(format(obj.taxRegCer));
		$("#S_LegRepName").val(format(obj.legRepName));
		$("#S_LegDocCode").val(format(obj.legDocCode));
		$("#S_BankNo").val(format(obj.bankNo));
		$("#S_OpenBank").val(format(obj.openBank));
		$("#S_Url").val(format(obj.url));
		$("#S_ServerIp").val(format(obj.serverIp));
		$("#S_MobileNo").val(format(obj.mobileNo));
		$("#S_Address").val(format(obj.address));
		$("#S_Icp").val(format(obj.icp));		
		$("#S_Level").val(format(obj.level));				
		$("#S_Occurtimeb").val(format(obj.occurtimeb));
		$("#S_Occurtimee").val(format(obj.occurtimee));
		$("#S_Occurchan").val(format(obj.occurchan));
		$("#S_Occurarea").val(format(obj.occurarea));
		$("#S_Note").val(format(obj.note));
		$("#S_ValidStatus").val(format(obj.validStatus));

		$('#showPanel').dialog({
			autoOpen:true,
			width:500,
			height:500
		});
	}
	</script>
		<div id="showPanel" style="display: none">
		<div class="container-fluid">

			<div class="row">
				<div class="col-md-6">客户属性</div>
						<input id="S_CusProperty"   class="col-md-6"></input>
			</div>
						<div class="row">
				<div class="col-md-6">风险类型</div>
				<input id="S_RiskType"  class="col-md-6"></input>
				
			</div>
						<div class="row">
				<div class="col-md-6">商户属性</div>
				<input id="S_CusNature"  class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">商户简称</div>
				<input id="S_CusName" class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">商户名称</div>
				<input id="S_RegName" class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">商户编码</div>
				<input id="S_CusCode"   class="col-md-6"></input>
				
			</div>
									<!-- <div class="row">
				<div class="col-md-6">组织机构代码</div>
				<input id="S_OrgCode"   class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">营业执照编码</div>
				<input id="S_BusLicCode"   class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">统一社会信用代码</div>
				<input id="S_SocialUnityCreditCode"    class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">税务登记证</div>
				<input id="S_TaxRegCer"  class="col-md-6"></input>
				
			</div> -->
									<div class="row">
				<div class="col-md-6">法定代表人姓名</div>
				<input id="S_LegRepName"   class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">法定代表人证件号码</div>
				<input id="S_LegDocCode"  class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">银行账号</div>
				<input id="S_BankNo"  class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">开户行</div>
				<input id="S_OpenBank" class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">网址</div>
				<input id="S_Url"  class="col-md-6"></input>
				
			</div>
			
												<div class="row">
				<div class="col-md-6">服务器IP</div>
				<input id="S_ServerIp"  class="col-md-6"></input>
				
			</div>
			
												<div class="row">
				<div class="col-md-6">手机</div>
				<input id="S_MobileNo"  class="col-md-6"></input>
				
			</div>
			<div class="row">
				<div class="col-md-6">地域</div>
				<input id="S_Address"  class="col-md-6"></input>
				
			</div>
			<div class="row">
				<div class="col-md-6">ICP编号</div>
				<input id="S_Icp"  class="col-md-6"></input>
				
			</div>
			<div class="row">
				<div class="col-md-6">风险事件等级</div>
				<input id="S_Level"  class="col-md-6"></input>
				
			</div>
												<div class="row">
				<div class="col-md-6">风险事件发生时间</div>
				<input id="S_Occurtimeb"  class="col-md-6"></input>
				
			</div>
			
															<div class="row">
				<div class="col-md-6">风险事件结束时间</div>
				<input id="S_Occurtimee"    class="col-md-6"></input>
				
			</div>
															<div class="row">
				<div class="col-md-6">风险事件发生渠道</div>
				<input id="S_Occurchan"   class="col-md-6"></input>
				
			</div>
															<div class="row">
				<div class="col-md-6">风险事件发生地域</div>
				<input id="S_Occurarea"  class="col-md-6"></input>
				
			</div>
															<div class="row">
				<div class="col-md-6">风险事件描述</div>
				<input id="S_Note"   class="col-md-6"></input>
				
			</div>
															<div class="row">
				<div class="col-md-6">有效性</div>
				<input id="S_ValidStatus"   class="col-md-6"></input>
				
			</div>
			

		</div>
		</div>
</body>
</html>
