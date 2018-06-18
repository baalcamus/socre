<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>个人风险信息查询</title>
<script type="text/javascript">
	var contextpath = "${ctx}";
	
	function query() {
		
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/riesManage/riesPQList");
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
					<li>个人风险信息查询&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
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
														<td width="120" class="text-right">风险类型<span>*</span></td>
														<td><select name="RiskType" class="form-control">
																<option
																	<c:if test="${personQueryDTO.riskType==''}">selected="selected"</c:if>
																	value="">请选择</option>
																<c:forEach var="_riskType"
																	items="${fns:getEnumValues(\"com.chinagpay.ries.enumtype.RiseEnum\",\"RiskStatusEnum\")}">
																	<option
																		<c:if test="${personQueryDTO.riskType==_riskType.code }"> selected="selected"</c:if>
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
															value="${personQueryDTO.mobileNo}"></td>
													</tr>
												</table>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">MAC地址<span>*</span></td>
														<td><input type="text" class="form-control" id="Mac"
															name="Mac" value="${personQueryDTO.mac}"></td>
													</tr>
												</table>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">Imei<span>*</span></td>
														<td><input type="text" class="form-control" id="Imei"
															name="Imei" value="${personQueryDTO.imei}"></td>
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
															id="BankNo" name="BankNo" value="${personQueryDTO.bankNo}"></td>
													</tr>
												</table>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">开户行<span>*</span></td>
														<td><input type="text" class="form-control"
															id="OpenBank" name="OpenBank"
															value="${personQueryDTO.openBank}"></td>
													</tr>
												</table>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">客户姓名<span>*</span></td>
														<td><input type="text" class="form-control"
															id="CusName" name="CusName"
															value="${personQueryDTO.cusName}"></td>
													</tr>
												</table>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">身份证件号码<span>*</span></td>
														<td><input type="text" class="form-control"
															id="DocCode" name="DocCode"
															value="${personQueryDTO.docCode}"></td>
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
														<td><input type="text" class="form-control" id="Ip"
															name="Ip" value="${personQueryDTO.ip}"></td>
													</tr>
												</table>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">收货地址<span>*</span></td>
														<td><input type="text" class="form-control"
															id="Address" name="Address"
															value="${personQueryDTO.address}"></td>
													</tr>
												</table>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">固定电话<span>*</span></td>
														<td><input type="text" class="form-control"
															id="Telephone" name="Telephone"
															value="${personQueryDTO.telephone}"></td>
													</tr>
												</table>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">收款银行帐/卡号<span>*</span></td>
														<td><input type="text" class="form-control"
															id="RecBankNo" name="RecBankNo"
															value="${personQueryDTO.recBankNo}"></td>
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
															id="RecOpenBank" name="RecOpenBank" value="${personQueryDTO.recOpenBank}"></td>
													</tr>
												</table>
											</div>
										
										
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">邮箱<span>*</span></td>
														<td><input type="text" class="form-control"
															id="Email" name="Email" value="${personQueryDTO.email}"></td>
													</tr>
												</table>
											</div>
											
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">风险事件发生时间<span>*</span></td>
														<td>
														<input class="form-control" id="Occurtimeb"
										name="Occurtimeb" value="${personQueryDTO.occurtimeb}"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
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
														<td width="120" class="text-right">风险事件结束时间<span>*</span></td>
														
																												<td>
														<input class="form-control" id="Occurtimee"
										name="Occurtimee" value="${personQueryDTO.occurtimee}"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
														</td>

													</tr>
												</table>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">风险事件发生渠道<span>*</span></td>

													   <td>	
													   <select name="Occurchan" class="form-control">
																<option
																	<c:if test="${personQueryDTO.occurchan==''}">selected="selected"</c:if>
																	value="">请选择</option>
																<c:forEach var="_occurchan"
																	items="${fns:getEnumValues(\"com.chinagpay.ries.enumtype.RiseEnum\",\"OccurrenceChannelEnum\")}">
																	<option
																		<c:if test="${personQueryDTO.occurchan==_occurchan.code }"> selected="selected"</c:if>
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
														<td><input type="text" class="form-control"
															id="Occurarea" name="Occurarea"
															value="${personQueryDTO.occurarea}"></td>
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
													<td width="120" class="text-right">有效性<span>*</span></td>
													<td>
													<select name="ValidStatus" class="form-control">
																<option
																	<c:if test="${personQueryDTO.validStatus==''}">selected="selected"</c:if>
																	value="">请选择</option>
																<c:forEach var="_validStatus"
																	items="${fns:getEnumValues(\"com.chinagpay.ries.enumtype.RiseEnum\",\"ValidityEnum\")}">
																	<option
																		<c:if test="${personQueryDTO.validStatus==_validStatus.code }"> selected="selected"</c:if>
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
										<th><span>手机号</span></th>
										<th><span>银行帐/卡号</span></th>
										<th><span>开户行</span></th>
										<th><span>客户姓名</span></th>
										<th><span>身份证件号码</span></th>
										<th><span>风险事件发生时间</span></th>
										<th><span>风险事件结束时间</span></th>
										<th><span>有效性</span></th>
										<th><span>操作</span></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${PersonRespDTOList}" var="Person">
										<tr>
										    <td>${fns:getEnumField("com.chinagpay.ries.enumtype.RiseEnum","RiskStatusEnum",Person.riskType,"getCode","getDes")}</td>
											<td>${Person.mobileNo}</td>
											<td>${Person.bankNo}</td>
											<td>${Person.openBank}</td>
											<td>${Person.cusName}</td>
											<td>${Person.docCode}</td>
											<td>${Person.occurtimeb}</td>
											<td>${Person.occurtimee}</td>
											
										    <td>${fns:getEnumField("com.chinagpay.ries.enumtype.RiseEnum","ValidityEnum",Person.validStatus,"getCode","getDes")}</td>
										
											<td><a href="#" onclick='showForexOrderPanel(${fns:toJson(Person)});return false;'>
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
		$("#S_MobileNo").val(format(obj.mobileNo));
		$("#S_Mac").val(format(obj.mac));
		$("#S_Imei").val(format(obj.imei));
		$("#S_BankNo").val(format(obj.bankNo));
		$("#S_OpenBank").val(format(obj.openBank));
		$("#S_CusName").val(format(obj.cusName));
		$("#S_DocCode").val(format(obj.docCode));
		$("#S_Ip").val(format(obj.ip));
		$("#S_Address").val(format(obj.address));
		$("#S_Telephone").val(format(obj.telephone));
		$("#S_RecBankNo").val(format(obj.recBankNo));
		$("#S_RecOpenBank").val(format(obj.recOpenBank));
		$("#S_Email").val(format(obj.email));
		$("#S_ValidDate").val(format(obj.validDate));
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
						<input id="S_CusProperty" name="CusProperty"   class="col-md-6"></input>
			</div>
						<div class="row">
				<div class="col-md-6">风险类型</div>
				<input id="S_RiskType" name="RiskType" class="col-md-6"></input>
				
			</div>
						<div class="row">
				<div class="col-md-6">手机号</div>
				<input id="S_MobileNo" name="MobileNo"  class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">MAC地址</div>
				<input id="S_Mac" name="Mac" class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">Imei</div>
				<input id="S_Imei" name="Imei" class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">银行帐/卡号</div>
				<input id="S_BankNo" name="BankNo"   class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">开户行</div>
				<input id="S_OpenBank"  name="OpenBank"  class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">客户姓名</div>
				<input id="S_CusName" name="CusName"  class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">证件号码</div>
				<input id="S_DocCode"  name="DocCode"  class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">IP地址</div>
				<input id="S_Ip" name="Ip" class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">收货地址</div>
				<input id="S_Address" name="Address"  class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">固定电话</div>
				<input id="S_Telephone" name="Telephone"  class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">收款银行帐/卡号</div>
				<input id="S_RecBankNo" name="RecBankNo"  class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">收款账/卡号开户行</div>
				<input id="S_RecOpenBank" name="RecOpenBank" class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">邮箱</div>
				<input id="S_Email" name="Email"  class="col-md-6"></input>
				
			</div>
			
												<div class="row">
				<div class="col-md-6">有效期</div>
				<input id="S_ValidDate" name="ValidDate"  class="col-md-6"></input>
				
			</div>
			
												<div class="row">
				<div class="col-md-6">信息级别</div>
				<input id="S_Level" name="Level"  class="col-md-6"></input>
				
			</div>
			
												<div class="row">
				<div class="col-md-6">风险事件发生时间</div>
				<input id="S_Occurtimeb" name="Occurtimeb"  class="col-md-6"></input>
				
			</div>
			
															<div class="row">
				<div class="col-md-6">风险事件结束时间</div>
				<input id="S_Occurtimee" name="Occurtimee"   class="col-md-6"></input>
				
			</div>
															<div class="row">
				<div class="col-md-6">风险事件发生渠道</div>
				<input id="S_Occurchan"  name="Occurchan" class="col-md-6"></input>
				
			</div>
															<div class="row">
				<div class="col-md-6">风险事件发生地域</div>
				<input id="S_Occurarea" name="Occurarea"  class="col-md-6"></input>
				
			</div>
															<div class="row">
				<div class="col-md-6">风险事件描述</div>
				<input id="S_Note" name="Note"  class="col-md-6"></input>
				
			</div>
															<div class="row">
				<div class="col-md-6">有效性</div>
				<input id="S_ValidStatus" name="ValidStatus"  class="col-md-6"></input>
				
			</div>
			

		</div>
		</div>
</body>
</html>
