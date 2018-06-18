<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>商户风险信息变更</title>
<script type="text/javascript">
	var contextpath = "${ctx}";
	
	function query() {
		
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/riesManage/riesEditMQList");
		$("#queryForm").submit();
	}
	
	function editME(){
		$.post("<%=request.getContextPath()%>/riesManage/riesEditMReport", $('#edit').serialize() ,
		function (data){
			if(data=="success"){
				alert("修改成功");
				
			}else{
				alert("修改失败!");
				//window.location.reload();
			}
		}
		);
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
					<li>商户风险信息变更&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
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
							<form action="" method="post"  id="queryForm" class="queryForm" enctype="multipart/form-data" class="form-horizontal ">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />
	
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="120" class="text-right">风险类型</td>
											<td><select name="RiskType" class="form-control">
													<option
														<c:if test="${mechantChangeQueryReqDTO.riskType==''}">selected="selected"</c:if>
														value="">请选择</option>
													<c:forEach var="_riskType"
															items="${RISKCUM_STATUS}">
															<option
																<c:if test="${mechantChangeQueryReqDTO.riskType==_riskType.code }"> selected="selected"</c:if>
																value="${_riskType.code }">${_riskType.name }</option>
														</c:forEach>
											</select></td>
										</tr>
									</table>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="55" class="text-right">商户简称</td>
											<td width="200">
												<div >
													<input type="text" class="form-control" id="R_CusName" name="CusName" value="${mechantChangeQueryReqDTO.cusName}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="120" class="text-right">法人证件类型</td>
											<td>
											<select name="DocType" id="R_DocType" class="form-control">
												<option
													<c:if test="${mechantChangeQueryReqDTO.docType==''}">selected="selected"</c:if>
													value="">请选择</option>
												<c:forEach var="_docType"
													items="${LEGALPERSONID_TYPE}">
													<option
														<c:if test="${mechantChangeQueryReqDTO.docType==_docType.code }"> selected="selected"</c:if>
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
											<td width="120" class="text-right">法人证件号码</td>
											<td><input type="text" class="form-control"
												id="R_DocCode" name="DocCode"
												value="${mechantChangeQueryReqDTO.docCode}">
											</td>
												
										</tr>
									</table>
								</div>
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="120" class="text-right">法定代表人姓名/负责人姓名</td>
												<td><input type="text" class="form-control"
													id="R_LegRepName" name="LegRepName"
													value="${mechantChangeQueryReqDTO.legRepName}"></td>
											</tr>
										</table>
									</div>
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="120" class="text-right">法定代表人证件号码</td>
												<td><input type="text" class="form-control"
													id="R_LegDocCode" name="LegDocCode"
													value="${mechantQueryDTO.legDocCode}"></td>
											</tr>
										</table>
									</div>
							</form>
							<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
								<table width="100%" class="product_detail_list">
									<tr>
										<td></td>
										<td >
											<button  type="submit" class="btn btn-danger" onclick="query();">
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
						<h2 class="panel-inner-title02">
							列表
						</h2>
					</header>
					<div class=" panel-body clearfix">
						<div class="table-responsive border0">
							<table class="table table-hover">
								<thead>
									<tr>
										<th><span>风险类型</span></th>
										<th><span>商户简称</span></th>
										<th><span>商户属性</span></th>
										<th><span>商户类型</span></th>
										<th><span>银行账号</span></th>
										<th><span>开户行</span></th>
										<th><span>服务器ip</span></th>
										<th><span>法定代表人姓名</span></th>
										<th><span>法定代表人证件号码</span></th>
										<th><span>法定代表人手机号</span></th>
										<th><span>风险事件发生时间</span></th>
										<th><span>风险事件结束时间</span></th>
										<!-- <th><span>有效性</span></th>  -->
										<th><span>操作</span></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${mechantEditQueryDTOList}" var="query">
										<tr>
											<td>
												<c:forEach var="_riskType"
													items="${RISKCUM_STATUS}">
														<c:if test="${query.riskType==_riskType.code }">${_riskType.name }</c:if>
												</c:forEach>
											</td>
											<td>${query.cusName}</td>
											<td>
												<c:forEach var="_cusNature"
													items="${MERCHANT_PROPERTY}">
														<c:if test="${query.cusNature==_cusNature.code }"> ${_cusNature.name }</c:if>
												</c:forEach>
											</td>
											<td>
												<c:forEach var="_cusType"
													items="${MERCHAN_TTYPE}">
														<c:if test="${query.cusType==_cusType.code }">${_cusType.name }</c:if>
												</c:forEach>
											</td>
											<td>${query.bankNo}</td>
											<td>${query.openBank}</td>
											<td>${query.serverIp}</td>
											<td>${query.legRepName}</td>
											<td>${query.legDocCode}</td>
											<td>${query.mobileNo}</td>
											<td>${query.occurtimeb}</td>
											<td>${query.occurtimee}</td>
										
<%-- 											<td><a href="#" id="bulu" onclick='showForexOrderPanel(${fns:toJson(query)},"bulu");return false;'> --%>
											<td><a href="#" id="bulu" onclick='showForexOrderPanel(${fns:toJson(query)});return false;'>
														补录</a>|
											<%-- 	<a href="#" id="shixiao" onclick='showForexOrderPanel(${fns:toJson(query)} ,"shixiao");return false;'>
														失效</a>	|	
														
												<a href="#" id="jiangji" onclick='showForexOrderPanel(${fns:toJson(query)},"jiangji");return false;'>
														降级</a>	 --%>	
														</td>
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
		$("#Id").val(format(obj.id));
	/* 	if(type=="shixiao"){
			$("#UpdateType").val("02");
		}else if(type=="jiangji"){
			$("#UpdateType").val("03");
		}else{
			$("#UpdateType").val("01");
		}
		alert(type); */
		$("#CusType").val(format(obj.cusType));
		$("#CusProperty").val(format(obj.cusProperty));
		$("#RiskType").val(format(obj.riskType));
		$("#CusNature").val(format(obj.cusNature));
		$("#CusName").val(format(obj.cusName));
		$("#RegName").val(format(obj.regName));
		$("#CusCode").val(format(obj.cusCode));
		$("#DocType").val(format(obj.docType));
		$("#DocCode").val(format(obj.docCode));
	/* 	$("#OrgCode").val(format(obj.orgCode));
		$("#BusLicCode").val(format(obj.busLicCode));
		$("#SocialUnityCreditCode").val(format(obj.socialUnityCreditCode));
		$("#TaxRegCer").val(format(obj.taxRegCer)); */
		$("#LegRepName").val(format(obj.legRepName));
		$("#LegDocType").val(format(obj.legDocType));
		$("#LegDocCode").val(format(obj.legDocCode));
		$("#BankNo").val(format(obj.bankNo));
		$("#OpenBank").val(format(obj.openBank));
		$("#Url").val(format(obj.url));
		$("#ServerIp").val(format(obj.serverIp));
		$("#MobileNo").val(format(obj.mobileNo));
		$("#Address").val(format(obj.address));
		$("#Icp").val(format(obj.icp));		
		$("#Level").val(format(obj.level));				
		$("#Occurtimeb").val(format(obj.occurtimeb));
		$("#Occurtimee").val(format(obj.occurtimee));
		$("#Occurchan").val(format(obj.occurchan));
		$("#Occurarea").val(format(obj.occurarea));
		$("#Note").val(format(obj.note));
		$("#ValidDate").val(format(obj.validDate));
		$("#OrgId").val(format(obj.orgId));
		$("#RepDate").val(format(obj.repDate));
		$("#RepType").val(format(obj.repType));
		$("#RepPerson").val(format(obj.repPerson));
		
		$("#edit").attr("action", "<%=request.getContextPath()%>/riesManage/toRiesMChange");
		$("#edit").submit();
 		/* $('#showEditPanel').dialog({
 			autoOpen:true,
 			width:500,
 			height:500
 		}); */
	}
	</script>
		<div id="showEditPanel" style="display: none">
		<form action="" method="post"  id="edit" class="queryForm" enctype="multipart/form-data" class="form-horizontal ">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6">Id</div>
				<input id="Id" name="Id"  readonly="readonly" class="col-md-6"></input>
			</div>
			<!-- <div class="row">
				<div class="col-md-6">Id</div>
				<input id="UpdateType" name="UpdateType"  readonly="readonly" class="col-md-6"></input>
			</div> -->
			
			<div class="row">
				<div class="col-md-6">商户类型</div>
						<input id="CusType" name="CusType"   class="col-md-6"></input>
			</div>
			<div class="row">
				<div class="col-md-6">法人证件类型</div>
				<input id="DocType" name="DocType"  class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">法人证件号码</div>
				<input id="DocCode" name="DocCode"  class="col-md-6"></input>
				
			</div>
			<div class="row">
				<div class="col-md-6">客户属性</div>
						<input id="CusProperty" name="CusProperty"   class="col-md-6"></input>
			</div>
						<div class="row">
				<div class="col-md-6">风险类型</div>
				<input id="RiskType" name="RiskType" class="col-md-6"></input>
<!-- 																		<div class="col-md-6"><select name="RiskType" id="" class="form-control"> -->
<%-- 																<c:forEach var="_riskType" --%>
<%-- 																	items="${fns:getEnumValues(\"com.chinagpay.ries.enumtype.RiseEnum\",\"RiskStatusEnum\")}"> --%>
<!-- 																	<option -->
						
<%-- 																		value="${_riskType.code }">${_riskType.des }</option> --%>
<%-- 																</c:forEach> --%>
<!-- 					</select></div> -->
			</div>
						<div class="row">
				<div class="col-md-6">商户属性</div>
				<input id="CusNature" name="CusNature"  class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">商户简称</div>
				<input id="CusName" name="CusName" class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">商户营业注册名称</div>
				<input id="RegName" name="RegName" class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">商户编码</div>
				<input id="CusCode" name="CusCode"   class="col-md-6"></input>
				
			</div>
				<div class="row">
				<div class="col-md-6">法定代表人姓名</div>
				<input id="LegRepName" name="LegRepName"  class="col-md-6"></input>
				
			</div>
			<div class="row">
				<div class="col-md-6">法定代表人证件类型</div>
				<input id="LegDocType" name="LegDocType"  class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">法定代表人证件号码</div>
				<input id="LegDocCode" name="LegDocCode"  class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">银行账号</div>
				<input id="BankNo" name="BankNo" class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">开户行</div>
				<input id="OpenBank" name="OpenBank"  class="col-md-6"></input>
				
			</div>
			
												<div class="row">
				<div class="col-md-6">网址</div>
				<input id="Url" name="Url"  class="col-md-6"></input>
				
			</div>
						
												<div class="row">
				<div class="col-md-6">服务器IP</div>
				<input id="ServerIp" name="ServerIp"  class="col-md-6"></input>
				
			</div>
			
															<div class="row">
				<div class="col-md-6">手机号</div>
				<input id="MobileNo" name="MobileNo"   class="col-md-6"></input>
				
			</div>
															<div class="row">
				<div class="col-md-6">地域</div>
				<input id="Address"  name="Address" class="col-md-6"></input>
				
			</div>
															<div class="row">
				<div class="col-md-6">ICP编号</div>
				<input id="Icp" name="Icp"  class="col-md-6"></input>
				
			</div>
															<div class="row">
				<div class="col-md-6">信息级别</div>
				<input id="Level" name="Level"  class="col-md-6"></input>
				
			</div>
			
			<div class="row">
				<div class="col-md-6">风险事件发生时间</div>
				<input id="Occurtimeb" name="Occurtimeb"  class="col-md-6"></input>
				
			</div>
			
			<div class="row">
				<div class="col-md-6">风险事件结束时间</div>
				<input id="Occurtimee" name="Occurtimee"  class="col-md-6"></input>
				
			</div>
			
			<div class="row">
				<div class="col-md-6">风险事件发生渠道</div>
				<input id="Occurchan" name="Occurchan"  class="col-md-6"></input>
				
			</div>
			
			<div class="row">
				<div class="col-md-6">风险事件发生地域</div>
				<input id="Occurarea" name="Occurarea"  class="col-md-6"></input>
				
			</div>
			
			<div class="row">
				<div class="col-md-6">备注</div>
				<input id="Note" name="Note"  class="col-md-6"></input>
				
			</div>
			
			<div class="row">
				<div class="col-md-6">有效期</div>
				<input id="ValidDate" name="ValidDate"  class="col-md-6"></input>
				
			</div>
			<div class="row">
				<div class="col-md-6">上报机构</div>
				<input id="OrgId" name="OrgId"  class="col-md-6"></input>
				
			</div>
			
			<div class="row">
				<div class="col-md-6">上报日期</div>
				<input id="RepDate" name="RepDate"  class="col-md-6"></input>
				
			</div>
			
			<div class="row">
				<div class="col-md-6">上传方式</div>
				<input id="RepType"  name="RepType"  class="col-md-6"></input>
				
			</div>
			
			<div class="row">
				<div class="col-md-6">上传人</div>
				<input id="RepPerson"  name="RepPerson" class="col-md-6"></input>
				
			</div>
		</div>
		</form>
		
										<div class="panel panel-default save-box-grey clearfix">
                            <center>
                                <button class="btn btn-primary margin30" onclick="javascript:editME();">
                                	<i class="fa fa-check-square-o"></i> 提交
                                </button>
<!--                                  <button class="btn btn-primary margin30" onclick="history.go(-1)"> -->
<!--                                 	<i class="fa fa-check-square-o"></i> 取消 -->
<!--                                 </button> -->
                            </center>
                        </div>
		</div>
</body>
</html>
