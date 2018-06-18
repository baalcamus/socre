<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>支付清算协会黑名单查询</title>
<script type="text/javascript">
	var contextpath = "${ctx}";
	
	function query() {
		
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/riesManage/riesGetBlackList");
		$("#queryForm").submit();
	}
	
	<%-- function refresh() {
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/riesManage/riesGetBlackList");
		$("#queryForm").submit();
	} --%>
	
	
	function downLoadOrder(){

		$('#downLoadForm').empty();
		var v = $('#queryForm').serializeArray();
		for(var i=0;i<v.length;i++){
			$('#downLoadForm').append($('<input type="hidden" name="'+v[i].name+'" value="'+format(v[i].value)+'"/>'));
		}
		$('#downLoadForm').submit();
		return false;
		<%-- var params = $("#queryForm").serialize();
		var url ="<%=request.getContextPath()%>/riesManage/riesDownloadBlackList?"+params;
		window.open(url); --%>
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
					<li>支付清算协会黑名单查询&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
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
							<form action="" method="post" id="queryForm"
								enctype="multipart/form-data"
								class="form-horizontal">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />
								<div class="panel-inner">
									<div class="panel-inner-body">
										<div class="row" id="agent1">
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">开始日期</td>
														<td>
														<div data-date-format="yyyy-mm-dd"
														class="input-group date datepicker-filter mbs">
														<span class="input-group-addon"><i
															class="fa fa-calendar"></i></span> <input class="form-control"
															id="uptime" name="beginDate"
															value="${riesBlackVo.beginDate}" />
													</div></td>
													</tr>
												</table>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">结束日期</td>
														<td>
														<div data-date-format="yyyy-mm-dd"
														class="input-group date datepicker-filter mbs">
														<span class="input-group-addon"><i
															class="fa fa-calendar"></i></span> <input class="form-control"
															id="uptime" name="endDate"
															value="${riesBlackVo.endDate}" />
													</div></td>
													</tr>
												</table>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">信息类型</td>
														<td>
														<select name="type" id="type" class="form-control">
															<option
																<c:if test="${riesBlackVo.type==''}">selected="selected"</c:if>
																value="">请选择</option>
															<option
																<c:if test="${riesBlackVo.type=='BLACK'}">selected="selected"</c:if>
																value="BLACK">黑名单</option>
															<option
																<c:if test="${riesBlackVo.type=='RISEINFO'}">selected="selected"</c:if>
																value="RISEINFO">风险信息</option>
														</select>
													</tr>
												</table>
											</div>
											</div>
											<div class="row" id="agent1">
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">商户名称</td>
														<td><input type="text" class="form-control"
															id="regname" name="regname"
															value="${riesBlackVo.regname}"></td>
													</tr>
												</table>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">法人证件号码</td>
														<td><input type="text" class="form-control"
															id="doccode" name="doccode"
															value="${riesBlackVo.doccode}"></td>
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
						<h2 class="panel-inner-title02">列表
							<button onclick="downLoadOrder();"
								class="pull-right btn btn-primary">下载</button>
							<a href="javascript:refresh()" class="pull-right"><i
								class="fa fa-refresh"></i> <span class="pull-right">&nbsp;&nbsp;&nbsp;</span>刷新</a>
						</h2>
					</header>
					<div class=" panel-body clearfix">
						<div class="table-responsive border0">
							<table class="table table-hover">
								<thead>
									<tr>
										<th><span>信息类型</span></th>
										<th><span>商户名称</span></th>
										<th><span>商户简称</span></th>
										<th><span>法人证件类型</span></th>
										<th><span>法人证件号码</span></th>
										<th><span>法定代表人名称</span></th>
										<th><span>法定代表人证件类型</span></th>
										<th><span>法定代表人证件号</span></th>
										<th><span>风险信息等级</span></th>
										<th><span>风险类型</span></th>
										<th><span>有效期</span></th>
										<th><span>有效性</span></th>
										<th><span>推送日期</span></th>
									</tr>
								</thead>
								<tbody>
									<%-- <c:forEach items="${riesBlackList}" var="riesBlack"> --%>
									<c:forEach items="${page.list}" var="riesBlack">
										<tr>
											<td>
												<c:if test="${riesBlack.type=='BLACK' }">黑名单</c:if>
												<c:if test="${riesBlack.type=='RISEINFO' }">风险信息</c:if>
											</td>
											<td>${riesBlack.regname}</td>
											<td>${riesBlack.cusname}</td>
											<td>
												<c:forEach var="_docType"
													items="${LEGALPERSONID_TYPE}">
													<c:if test="${riesBlack.doctype==_docType.code }">${_docType.name }</c:if>
												</c:forEach>
											</td>
											<td>${riesBlack.doccode}</td>
											<td>${riesBlack.legdocname}</td>
											<td><c:forEach var="_docType"
													items="${PERSONID_TYPE}">
														<c:if test="${riesBlack.legdoctype==_docType.code }">${_docType.name }</c:if>
												</c:forEach>
											</td>
											<td>${riesBlack.legdoccode}</td>
											<td>
											<c:forEach var="_risklevel"
													items="${LEVEL_ENUM}">
														<c:if test="${riesBlack.risklevel==_risklevel.code }">${_risklevel.name }</c:if>
												</c:forEach>
											</td>
											<td>
											<c:forEach var="_risktype"
													items="${RISKCUM_STATUS}">
														<c:if test="${riesBlack.risktype==_risktype.code }">${_risktype.name }</c:if>
												</c:forEach>
											</td>
											<td>${riesBlack.validdate}</td>
											<td>
											<c:forEach var="_validstatus"
													items="${VALIDITY}">
														<c:if test="${riesBlack.validstatus==_validstatus.code }">${_validstatus.name }</c:if>
												</c:forEach>
											</td>
											<td>${riesBlack.uptime}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<jsp:include page="../include/page.jsp" />
				<!--这是列表模块结束-->
			</div>
			<!--End CONTENT-->
		</div>
		<!--右侧内容 end-->
	</div>
	
	
	
	<form id="downLoadForm" method="post" target="_blank"
		action="<%=request.getContextPath()%>/riesManage/riesDownloadBlackList">
	</form>
	
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
<!-- 		<div id="showPanel" style="display: none">
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
		</div> -->
</body>
</html>
