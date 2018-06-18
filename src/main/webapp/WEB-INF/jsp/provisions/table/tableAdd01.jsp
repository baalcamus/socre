<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>备付金报备文件管理</title>
<script type="text/javascript">	

	function changename(){
		var acctNo = $("#acctNo").val();
		var str = $("#"+acctNo).val();
		var openingBankName = str.split(",")[0];
		var acctName = str.split(",")[1];
		var provBranchName = str.split(",")[2];
		$("#openingBankName").val(openingBankName); 
		$("#acctName").val(acctName);
		$("#provBranchName").val(provBranchName);
	}

	function add() {
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
		var A01 = $("#A01").val();
		var A02 = $("#A02").val();
		var A03 = $("#A03").val();
		var A04 = $("#A04").val();
		var A05 = $("#A05").val();
		var A06 = $("#A06").val();
		var A07 = $("#A07").val();
		var A08 = $("#A08").val();
		var A09 = $("#A09").val();
		var A10 = $("#A10").val();
		var A11 = $("#A11").val();
		var A12 = $("#A12").val();
		var A13 = $("#A13").val();
		var A14 = $("#A14").val();
		
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
		
		if (A01 == null || A01 == '') {
			alert("请输入A01");
			return false;
		}
		
		if (A02 == null || A02 == '') {
			alert("请输入A02");
			return false;
		}
		
		if (A03 == null || A03 == '') {
			alert("请输入A03");
			return false;
		}
		
		if (A04 == null || A04 == '') {
			alert("请输入A04");
			return false;
		}
		
		if (A05 == null || A05 == '') {
			alert("请输入A05");
			return false;
		}
		
		if (A06 == null || A06 == '') {
			alert("请输入A06");
			return false;
		}
		
		if (A07 == null || A07 == '') {
			alert("请输入A07");
			return false;
		}
		
		if (A08 == null || A08 == '') {
			alert("请输入A08");
			return false;
		}
		
		if (A09 == null || A09 == '') {
			alert("请输入A09");
			return false;
		}
		
		if (A10 == null || A10 == '') {
			alert("请输入A10");
			return false;
		}
		
		if (A11 == null || A11 == '') {
			alert("请输入A11");
			return false;
		}
		
		if (A12 == null || A12 == '') {
			alert("请输入A12");
			return false;
		}
		
		if (A13 == null || A13 == '') {
			alert("请输入A13");
			return false;
		}
		
		if (A14 == null || A14 == '') {
			alert("请输入A14");
			return false;
		} 

		
		$.post("<%=request.getContextPath()%>/provisions/addTable.do",{
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
					A01 :A01,
					A02 :A02,
					A03 :A03,
					A04 :A04,
					A05 :A05,
					A06 :A06,
					A07 :A07,
					A08 :A08,
					A09 :A09,
					A10 :A10,
					A11 :A11,
					A12 :A12,
					A13 :A13,
					A14 :A14,
				},
				function (data){
					if(data=="success"){
						alert("新增成功！");
						window.location.href="<%=request.getContextPath()%>/provisions/queryTableDetail.do?taskId="+taskId+"&bankCode="+bankCode;
					}else if(data=="exist"){
						alert("此账号在该填报日期已存在数据!");
					}else{
						alert("新增失败！");
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
						<li class="active">文件明细增加</li>
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
										<input type="hidden" name="taskId" id="taskId" value="${task.taskId}"/>
										<input type="hidden" name="form" id="form" value="${task.form}"/>
										<input type="hidden" name="bankCode" id="bankCode" value="${bank.bankCode}"/>
										<table>
											<tr>
												<td width="250" class="text-right">商户号<span>*</span></td>
												<td width="200"><input type="text" id="merchantId" name="merchantId" value="${bank.merchantId}"  class="form-control" disabled="disabled" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">支付机构名称<span>*</span></td>
												<td width="200"><input type="text" id="merchantName" name="merchantName" value="${bank.merchantName}" class="form-control" disabled="disabled" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">备付金银行（法人）名称<span>*</span></td>
												<td width="200"><input type="text" id="bankName" name="bankName" value="${bank.bankName}" class="form-control" disabled="disabled" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">备付金银行授权分支机构名称<span>*</span></td>
												<td width="200"><input type="text" id="provBranchName" name="provBranchName" value="" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">交易时期<span>*</span></td>
												<td width="200">
													<div data-date-format="yyyy-mm-dd" class="input-group date datepicker-filter mbs">
														<span class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</span>
														<input type="text" id="tranDate" name="tranDate" value="" class="form-control" style="color:#d9534f">
													</div>
												</td>
												<td width="150"></td>
												<td width="250" class="text-right">备付金银行账户开户银行名称<span>*</span></td>
												<td width="200"><input type="text" id="openingBankName" name="openingBankName" value="" class="form-control" style="color:#d9534f" disabled="disabled"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">备付金银行账户账号<span>*</span></td>
												<td width="200">	
													<select class="form-control" id="acctNo" name="acctNo" onchange="changename();" style="color:#d9534f">
														<option  value="">--请选择--</option>
														<c:forEach items="${accounts}" var="account">
															<option  value="${account.acctNo}">${account.acctNo}</option>
														</c:forEach>	
													</select>
													<c:forEach items="${accounts}" var="account">
														<input type="hidden" id="${account.acctNo}" value="${account.childBankName},${account.acctName},${account.provBranchName}"/>
													</c:forEach>
												</td>
												<td width="150"></td>
												<td width="250" class="text-right">备付金银行账户户名<span>*</span></td>
												<td width="200"><input type="text" id="acctName" name="acctName" value="" class="form-control" style="color:#d9534f" disabled="disabled"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">填报日期<span>*</span></td>
												<td width="200">
													<div data-date-format="yyyy-mm-dd" class="input-group date datepicker-filter mbs">
														<span class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</span>
														<input type="text" id="fillDate" name="fillDate" value="${task.reportDate}" class="form-control" style="color:#d9534f" disabled="disabled">
													</div>
												</td>
												<td width="150"></td>
												<td width="250" class="text-right">填表人<span>*</span></td>
												<td width="200"><input type="text" id="filler" name="filler" value="罗宇" class="form-control"  style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">复核人<span>*</span></td>
												<td width="200"><input type="text" id="checker" name="checker" value="高菲" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">交易日期<span>*</span></td>
												<td width="200">
													<div data-date-format="yyyy-mm-dd" class="input-group date datepicker-filter mbs">
														<span class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</span>
														<input type="text" id="tradeDate" name="tradeDate" value="" class="form-control" style="color:#d9534f">
													</div>
												</td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">业务系统中贷记客户资金账户金额A01<span>*</span></td>
												<td width="200"><input type="text" id="A01" name="A01" value="" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">手续费收入（支出）A02<span>*</span></td>
												<td width="200"><input type="text" id="A02" name="A02" value="" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">其他A03<span>*</span></td>
												<td width="200"><input type="text" id="A03" name="A03" value="" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">业务系统中贷记客户资金账户金额A04<span>*</span></td>
												<td width="200"><input type="text" id="A04" name="A04" value="" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">手续费收入（支出）A05<span>*</span></td>
												<td width="200"><input type="text" id="A05" name="A05" value="" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">其他A06<span>*</span></td>
												<td width="200"><input type="text" id="A06" name="A06" value="" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">本期业务系统中已贷记客户资金账户金额A07<span>*</span></td>
												<td width="200"><input type="text" id="A07" name="A07" value="" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">本期手续费收入A08<span>*</span></td>
												<td width="200"><input type="text" id="A08" name="A08" value="" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">其他A09<span>*</span></td>
												<td width="200"><input type="text" id="A09" name="A09" value="" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">本期收到的金额A10<span>*</span></td>
												<td width="200"><input type="text" id="A10" name="A10" value="" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">业务系统中贷记客户资金账户金额A11<span>*</span></td>
												<td width="200"><input type="text" id="A11" name="A11" value="" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">手续费收入（支出）A12<span>*</span></td>
												<td width="200"><input type="text" id="A12" name="A12" value="" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">其他A13<span>*</span></td>
												<td width="200"><input type="text" id="A13" name="A13" value="" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">退回A14<span>*</span></td>
												<td width="200"><input type="text" id="A14" name="A14" value="" class="form-control" style="color:#d9534f"></td>
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
															<input type="button" value="添加" id="btn" onclick="add()" class="btn btn-primary margin30" /> 
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
