<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>备付金账户管理</title>
<script type="text/javascript">	

	//获取复选框值    
	function chk(variable) {
		var retStr='';
		var split = ',';
		$('input[name="'+variable+'"]:checked').each(function() {
			retStr+=($(this).val());
			retStr+=split;
		});
		
		return retStr;
	}
	
	function add() {
		var childBankName = $("#childBankName").val();
		var provBranchName = $("#provBranchName").val();
		var acctName = $("#acctName").val();
		var acctNo = $("#acctNo").val();
		var bussinessType=chk('bussinessType');
		var form = chk('form');
		
		var bankCode = $('#bankCode').val();
		if (childBankName == null || childBankName == '') {
			alert("请输入分行名称");
			return false;
		}
		
		if (provBranchName == null || provBranchName == '') {
			alert("请输入授权分支机构名称");
			return false;
		}

		if (acctName == null || acctName == '') {
			alert("请输入账户户名");
			return false;
		}

		if (acctNo == null || acctNo == '') {
			alert("请输入账户账号");
			return false;
		}
		
		if (bussinessType == null || bussinessType == '') {
			alert("请选择业务类型");
			return false;
		}

		if (form == null || form == '') {
			alert("请选择报表种类");
			return false;
		}

		
		$.post("<%=request.getContextPath()%>/provisions/accountAdd.do",{
					bankCode:$('#bankCode').val(),
					bankName:$('#bankName').val(),
					acctType:$('#acctType').val(),
					childBankName:childBankName,
					provBranchName:provBranchName,
					acctName:acctName,
					acctNo:acctNo,
					bussinessType:bussinessType,
					form:form,
			    	merchantName:$("#merchantName").val(),
			    	form :form,
				},
				function (data){
					if(data=="success"){
						alert("新增成功");
						window.location.href="<%=request.getContextPath()%>/provisions/toAccountList.do?bankCode="+bankCode;
					}else{
						alert("新增失败!");
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
						<li>
							<i class="fa fa-home"></i>&nbsp;<a href="Organization_management.html">首页</a>&nbsp;&nbsp;
							<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li>系统管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li>备付金账户管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li class="active">新增账户</li>
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
									<h2 class="panel-title">${bank.bankName}-->新增账户</h2>
								</div>
								<div class="panel-body">
									<form method="post" enctype="multipart/form-data" class="form-horizontal">
										<input type="hidden" id="bankCode" name="bankCode" value="${bank.bankCode}"/>
										<input type="hidden" id="bankName" name="bankName" value="${bank.bankName}"/>
										<input type="hidden" id="acctType" name="acctType" value="${bank.bankType}"/>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">分行名称<span>*</span></td>
														<td width="200">
															<input type="text" id="childBankName" name="childBankName" value="" class="form-control"></td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">授权分支机构名称<span>*</span></td>
														<td width="200">
															<input type="text" id="provBranchName" name="provBranchName" value="" class="form-control"></td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">账户户名<span>*</span></td>
														<td width="200">
															<input type="text" id="acctName" name="acctName" value="" class="form-control"></td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">账户账号<span>*</span></td>
														<td width="200">
															<input type="text" id="acctNo" name="acctNo" value="" class="form-control"></td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row" style="padding-top: 5px;">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list" border="1">
													<tr>
														<td width="61" class="text-right">业务类型<span>*</span></td>
														<td width="200">
															<input type="checkbox" id="bussinessType" name="bussinessType" value="1" class="form-control">快捷1.0&nbsp;&nbsp;
															<input type="checkbox" id="bussinessType" name="bussinessType" value="2" class="form-control">快捷2.0&nbsp;&nbsp;
															<input type="checkbox" id="bussinessType" name="bussinessType" value="3" class="form-control">网关1.0&nbsp;&nbsp;
															<input type="checkbox" id="bussinessType" name="bussinessType" value="4" class="form-control">网关2.0&nbsp;&nbsp;
															<input type="checkbox" id="bussinessType" name="bussinessType" value="5" class="form-control">代付1.0&nbsp;&nbsp;
															<input type="checkbox" id="bussinessType" name="bussinessType" value="6" class="form-control">代付2.0<br></br>
															<input type="checkbox" id="bussinessType" name="bussinessType" value="7" class="form-control">代扣1.0&nbsp;&nbsp;
															<input type="checkbox" id="bussinessType" name="bussinessType" value="8" class="form-control">代扣2.0&nbsp;&nbsp;
															<input type="checkbox" id="bussinessType" name="bussinessType" value="9" class="form-control">跨境1.0&nbsp;&nbsp;
															<input type="checkbox" id="bussinessType" name="bussinessType" value="10" class="form-control">预付卡&nbsp;&nbsp;&nbsp;
															<input type="checkbox" id="bussinessType" name="bussinessType" value="11" class="form-control">其他&nbsp;&nbsp;
														</td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row" style="padding-top: 15px;">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list" border="1">
													<tr>
														<td width="61"  class="text-right">报表种类<span>*</span></td>
														<td width="200" >
															<c:forEach items="${formMap}" var="form">
																<input type="checkbox" id="form" name="form" value="${form.key}" class="form-control">${form.value }<br></br>
															</c:forEach>
														</td>
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
															<input type="button" value="注册" id="btn" onclick="add()" class="btn btn-primary margin30" /> 
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
