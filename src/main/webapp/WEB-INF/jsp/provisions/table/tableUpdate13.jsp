<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>备付金报备文件管理</title>
<script type="text/javascript">	

	function updateTable() {
		var id = $("#id").val();
		var merchantId = $("#merchantId").val();
		var merchantName = $("#merchantName").val();
		var bankCode = $("#bankCode").val();
		var bankName = $("#bankName").val();
		var provBranchName=$("#provBranchName").val();
		var tranDate = $("#tranDate").val();
		var openingBankName = $("#openingBankName").val();
		var acctName = $("#acctName").val();
		var acctNo = $("#acctNo").val();
		var fillDate = $("#fillDate").val();
		var filler = $("#filler").val();
		var checker = $("#checker").val();
		var tradeDate = $("#tradeDate").val();
		var taskId = $("#taskId").val();
		var form = $("#form").val();
		var N01 = $("#N01").val();
		var N02 = $("#N02").val();
		var N03 = $("#N03").val();
		var N04 = $("#N04").val();
		var N05 = $("#N05").val();
		var N06 = $("#N06").val();
		
		if (provBranchName == null || provBranchName == '') {
			alert("请输入备付金银行授权分支机构名称");
			return false;
		}

		if (tranDate == null || tranDate == '') {
			alert("请输入交易时期");
			return false;
		}

		if (openingBankName == null || openingBankName == '') {
			alert("请输入备付金银行账户开户银行名称");
			return false;
		}
		
		if (acctName == null || acctName == '') {
			alert("请输入 备付金银行账户户名");
			return false;
		}

		if (acctNo == null || acctNo == '') {
			alert("请输入备付金银行账户账号");
			return false;
		}
		
		if (fillDate == null || fillDate == '') {
			alert("请输入填报日期");
			return false;
		}
		
		if (filler == null || filler == '') {
			alert("请输入填报人");
			return false;
		}
		
		if (checker == null || checker == '') {
			alert("请输入复核人");
			return false;
		}
		
		if (tradeDate == null || tradeDate == '') {
			alert("请输入交易日期");
			return false;
		}
		
		if (N01 == null || N01 == '') {
			alert("请输入N01");
			return false;
		}
		
		if (N02 == null || N02 == '') {
			alert("请输入N02");
			return false;
		}
		
		if (N03 == null || N03 == '') {
			alert("请输入N03");
			return false;
		}
		
		if (N04 == null || N04 == '') {
			alert("请输入N04");
			return false;
		}
		
		if (N05 == null || N05 == '') {
			alert("请输入N05");
			return false;
		}
		
		if (N06 == null || N06 == '') {
			alert("请输入N06");
			return false;
		}
		
		$.post("<%=request.getContextPath()%>/provisions/modifyTable.do",{
					id:id,
					merchantId:merchantId,
					merchantName:merchantName,
					bankCode:bankCode,
					bankName:bankName,
					provBranchName:provBranchName,
					tranDate:tranDate,
					openingBankName:openingBankName,
					acctName:acctName,
					acctNo:acctNo,
					fillDate:fillDate,
					filler :filler,
					checker :checker,
					tradeDate :tradeDate,
					taskId :taskId,
					form:form,
					N01 :N01,
					N02 :N02,
					N03 :N03,
					N04 :N04,
					N05 :N05,
					N06 :N06,
				},
				function (data){
					if(data=="success"){
						alert("修改成功！");
						window.location.href="<%=request.getContextPath()%>/provisions/queryTableDetail.do?taskId="+${table.taskId};
					}else{
						alert("修改失败！");
					}
				}
				);
    }
</script>
</head>

<body class=" ">
	<jsp:include page="../../include/top.jsp" />
		<div id="wrapper">
			<jsp:include page="../../include/bottom.jsp" />
	     	<!-- 左侧内容 -->
		<jsp:include page="../../include/left.jsp" />
			
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
						<li>备付金文件管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li class="active">文件明细修改</li>
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
									<h2 class="panel-title">${tableName}<span style="color:#d9534f;padding-left: 50px;">(单位：万元)</span></h2>
								</div>
								<div class="panel-body">
									<form method="post" enctype="multipart/form-data" class="form-horizontal">
										<input type="hidden" id="form" name="form" value="${form}"/>
										<input type="hidden" name="taskId" id="taskId" value="${table.taskId}"/>
										<input type="hidden" name="id" id="id" value="${table.id}"/>
										<table>
											<tr>
												<td width="250" class="text-right">商户号<span>*</span></td>
												<td width="200"><input type="text" id="merchantId" name="merchantId" value="${table.merchantId}"  class="form-control" disabled="disabled" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">支付机构名称<span>*</span></td>
												<td width="200"><input type="text" id="merchantName" name="merchantName" value="${table.merchantName}" class="form-control" disabled="disabled" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">备付金银行（法人）名称<span>*</span></td>
												<td width="200"><input type="text" id="bankName" name="bankName" value="${table.bankName}" class="form-control" disabled="disabled" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">备付金银行授权分支机构名称<span>*</span></td>
												<td width="200"><input type="text" id="provBranchName" name="provBranchName" value="${table.provBranchName}" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">交易时期<span>*</span></td>
												<td width="200">
													<div data-date-format="yyyy-mm-dd" class="input-group date datepicker-filter mbs">
														<span class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</span>
														<input type="text" id="tranDate" name="tranDate" value="${table.tranDate}" class="form-control" style="color:#d9534f">
													</div>
												</td>
												<td width="150"></td>
												<td width="250" class="text-right">备付金银行账户开户银行名称<span>*</span></td>
												<td width="200"><input type="text" id="openingBankName" name="openingBankName" value="${table.openingBankName}" class="form-control" style="color:#d9534f" disabled="disabled"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">备付金银行账户账号<span>*</span></td>
												<td width="200">	
													<select class="form-control" id="acctNo" name="acctNo" style="color:#d9534f" disabled="disabled">
														<option <c:if test="${table.acctNo=='' }">selected="selected"</c:if> value="">--请选择--</option>
														<c:forEach items="${accounts}" var="account">
															<option <c:if test="${account.acctNo==table.acctNo}">selected="selected"</c:if> value="${account.acctNo}">${account.acctNo}</option>
														</c:forEach>	
													</select>
												</td>
												<td width="150"></td>
												<td width="250" class="text-right">备付金银行账户户名<span>*</span></td>
												<td width="200"><input type="text" id="acctName" name="acctName" value="${table.acctName}" class="form-control" style="color:#d9534f" disabled="disabled"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">填报日期<span>*</span></td>
												<td width="200">
													<div data-date-format="yyyy-mm-dd" class="input-group date datepicker-filter mbs">
														<span class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</span>
														<input type="text" id="fillDate" name="fillDate" value="${table.fillDate}" class="form-control" style="color:#d9534f" disabled="disabled">
													</div>
												</td>
												<td width="150"></td>
												<td width="250" class="text-right">填表人<span>*</span></td>
												<td width="200"><input type="text" id="filler" name="filler" value="${table.filler}" class="form-control"  style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">复核人<span>*</span></td>
												<td width="200"><input type="text" id="checker" name="checker" value="${table.checker}" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">交易日期<span>*</span></td>
												<td width="200">
													<div data-date-format="yyyy-mm-dd" class="input-group date datepicker-filter mbs">
														<span class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</span>
														<input type="text" id="tradeDate" name="tradeDate" value="${table.tradeDate}" class="form-control" style="color:#d9534f">
													</div>
												</td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">期初备付金账户中押金余额N01<span>*</span></td>
												<td width="200"><input type="text" id="N01" name="N01" value="${table.n01}" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">转账方式收到N02<span>*</span></td>
												<td width="200"><input type="text" id="N02" name="N02" value="${table.n02}" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">现金形式缴存N03<span>*</span></td>
												<td width="200"><input type="text" id="N03" name="N03" value="${table.n03}" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">转账方式直接付出N04<span>*</span></td>
												<td width="200"><input type="text" id="N04" name="N04" value="${table.n04}" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">现金形式先行赎回业务中申请结转金额N05<span>*</span></td>
												<td width="200"><input type="text" id="N05" name="N05" value="${table.n05}" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">期末备付金账户中押金余额N06<span>*</span></td>
												<td width="200"><input type="text" id="N06" name="N06" value="${table.n06}" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="10"></tr>
										</table>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right"></td>
														<td>
															<input type="button" value="返回" id="btn3" onclick="javascript:history.back(-1);" class="btn btn-primary margin30" />
															<input type="button" value="修改" id="btn" onclick="updateTable()" class="btn btn-primary margin30" /> 
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
