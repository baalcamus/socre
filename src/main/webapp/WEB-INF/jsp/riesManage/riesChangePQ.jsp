<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>个人风险信息变更</title>
<script type="text/javascript">
	var contextpath = "${ctx}";
	
	function query() {
		
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/riesManage/riesEditPQList");
		$("#queryForm").submit();
	}
	
	function editPE(){
		
		$.post("<%=request.getContextPath()%>/riesManage/riesEditPReport", $('#edit').serialize() ,
		function (data){
			if(data=="success"){
				alert("修改成功");
			}else{
				alert("修改失败!");
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
					<li>个人风险信息变更&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
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
														<td width="120" class="text-right">风险类型<span>*</span></td>
														<td><select name="RiskType" class="form-control">
																<option
																	<c:if test="${personChangeQueryReqDTO.riskType==''}">selected="selected"</c:if>
																	value="">请选择</option>
																<c:forEach var="_riskType"
																	items="${fns:getEnumValues(\"com.chinagpay.ries.enumtype.RiseEnum\",\"RiskStatusEnum\")}">
																	<option
																		<c:if test="${personChangeQueryReqDTO.riskType==_riskType.code }"> selected="selected"</c:if>
																		value="${_riskType.code }">${_riskType.des }</option>
																</c:forEach>
														</select></td>
										</tr>
									</table>
								</div>
																<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="55" class="text-right">手机号</td>
											<td width="200">
												<div >
													<input type="text" class="form-control" id="R_MobileNo" name="MobileNo" value="${personChangeQueryReqDTO.mobileNo}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
																<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="55" class="text-right">MAC地址</td>
											<td width="200">
												<div >
													<input type="text" class="form-control" id="R_Mac" name="Mac" value="${personChangeQueryReqDTO.mac}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
																<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="55" class="text-right">Imei</td>
											<td width="200">
												<div >
													<input type="text" class="form-control" id="R_Imei" name="Imei" value="${personChangeQueryReqDTO.imei}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
								
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="55" class="text-right">银行帐/卡号</td>
											<td width="200">
												<div >
													<input type="text" class="form-control" id="R_BankNo" name="BankNo" value="${personChangeQueryReqDTO.bankNo}"/>
												</div>
											</td>
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
										<th><span>手机号</span></th>
										<th><span>银行帐/卡号</span></th>
										<th><span>开户行</span></th>
										<th><span>客户姓名</span></th>
										<th><span>身份证件号码</span></th>
										<th><span>风险事件发生时间</span></th>
										<th><span>风险事件结束时间</span></th>
										<th><span>操作</span></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${personEditQueryDTOList}" var="query">
										<tr>
										    <td>${fns:getEnumField("com.chinagpay.ries.enumtype.RiseEnum","RiskStatusEnum",query.riskType,"getCode","getDes")}</td>
											<td>${query.mobileNo}</td>
											<td>${query.bankNo}</td>
											<td>${query.openBank}</td>
											<td>${query.cusName}</td>
											<td>${query.docCode}</td>
											<td>${query.occurtimeb}</td>
											<td>${query.occurtimee}</td>
												<td><a href="#" onclick='showForexOrderPanel(${fns:toJson(query)});return false;'>
														修改</a></td>
											
<%-- 											<td>
												<form action="" id="${bank.bankCode}" method="post" enctype="multipart/form-data" class="form-horizontal">
													<input type="hidden" name="BlackId" value="${Person.id}"/>
													<a href="showForexOrderPanel(${fns:toJson(order)});return false;">修改</a>
													&nbsp;&nbsp;
												</form>
											</td> --%>
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
		$("#CusProperty").val(format(obj.cusProperty));
		$("#RiskType").val(format(obj.riskType));
		$("#MobileNo").val(format(obj.mobileNo));
		$("#Mac").val(format(obj.mac));
		$("#Imei").val(format(obj.imei));
		$("#BankNo").val(format(obj.bankNo));
		$("#OpenBank").val(format(obj.openBank));
		$("#CusName").val(format(obj.cusName));
		$("#DocCode").val(format(obj.docCode));
		$("#Ip").val(format(obj.ip));
		$("#Address").val(format(obj.address));
		$("#Telephone").val(format(obj.telephone));
		$("#RecBankNo").val(format(obj.recBankNo));
		$("#RecOpenBank").val(format(obj.recOpenBank));
		$("#Email").val(format(obj.email));
		$("#ValidDate").val(format(obj.validDate));
		$("#Level").val(format(obj.level));
		$("#Occurtimeb").val(format(obj.occurtimeb));
		$("#Occurtimee").val(format(obj.occurtimee));
		$("#Occurchan").val(format(obj.occurchan));
		$("#Occurarea").val(format(obj.occurarea));
		$("#Note").val(format(obj.note));
		$("#OrgId").val(format(obj.orgId));
		$("#RepDate").val(format(obj.repDate));
		$("#RepType").val(format(obj.repType));
		$("#RepPerson").val(format(obj.repPerson));
		
		$("#edit").attr("action", "<%=request.getContextPath()%>/riesManage/toRiesChange");
		$("#edit").submit();
// 		$('#showEditPanel').dialog({
// 			autoOpen:true,
// 			width:500,
// 			height:500
// 		});
	}
	</script>
		<div id="showEditPanel" style="display: none">
		<form action="" method="post"  id="edit" class="queryForm" enctype="multipart/form-data" class="form-horizontal ">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6">Id</div>
				<input id="Id" name="Id"  class="col-md-6"></input>
			</div>
			<div class="row">
				<div class="col-md-6">客户属性</div>
						<input id="CusProperty" name="CusProperty"   class="col-md-6"></input>
			</div>
						<div class="row">
				<div class="col-md-6">风险类型</div>
				<input id="RiskType" name="RiskType" class="col-md-6"></input>
				
			</div>
						<div class="row">
				<div class="col-md-6">手机号</div>
				<input id="MobileNo" name="MobileNo"  class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">MAC地址</div>
				<input id="Mac" name="Mac" class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">Imei</div>
				<input id="Imei" name="Imei" class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">银行帐/卡号</div>
				<input id="BankNo" name="BankNo"   class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">开户行</div>
				<input id="OpenBank"  name="OpenBank"  class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">客户姓名</div>
				<input id="CusName" name="CusName"  class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">证件号码</div>
				<input id="DocCode"  name="DocCode"  class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">IP地址</div>
				<input id="Ip" name="Ip" class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">收货地址</div>
				<input id="Address" name="Address"  class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">固定电话</div>
				<input id="Telephone" name="Telephone"  class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">收款银行帐/卡号</div>
				<input id="RecBankNo" name="RecBankNo"  class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">收款账/卡号开户行</div>
				<input id="RecOpenBank" name="RecOpenBank" class="col-md-6"></input>
				
			</div>
									<div class="row">
				<div class="col-md-6">邮箱</div>
				<input id="Email" name="Email"  class="col-md-6"></input>
				
			</div>
			
												<div class="row">
				<div class="col-md-6">有效期</div>
				<input id="ValidDate" name="ValidDate"  class="col-md-6"></input>
				
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
				<input id="Occurtimee" name="Occurtimee"   class="col-md-6"></input>
				
			</div>
															<div class="row">
				<div class="col-md-6">风险事件发生渠道</div>
				<input id="Occurchan"  name="Occurchan" class="col-md-6"></input>
				
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
                                <button class="btn btn-primary margin30" onclick="javascript:editPE();">
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
