<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>备付金报备文件管理</title>
<script type="text/javascript">

	function getF10(){
		var F01 = Number($("#F01").val());
		var F02 = Number($("#F02").val());
		var F03 = Number($("#F03").val());
		var F04 = Number($("#F04").val());
		var F05 = Number($("#F05").val());
		var F06 = Number($("#F06").val());
		var F07 = Number($("#F07").val());
		var F08 = Number($("#F08").val());
		var F09 = Number($("#F09").val());
		var total = (F01+F02+F03+F04+F05+F06+F07+F08+F09).toFixed(6);
		$("#F10").val(total);
	}
	
	function getG14(){
		var G01 = Number($("#G01").val());
		var G02 = Number($("#G02").val());
		var G03 = Number($("#G03").val());
		var G04 = Number($("#G04").val());
		var G05 = Number($("#G05").val());
		var G06 = Number($("#G06").val());
		var G07 = Number($("#G07").val());
		var G08 = Number($("#G08").val());
		var G09 = Number($("#G09").val());
		var G10 = Number($("#G10").val());
		var G11 = Number($("#G11").val());
		var G12 = Number($("#G12").val());
		var G13 = Number($("#G13").val());
		var total = (G01+G02+G03+G04+G05+G06+G07+G08+G09+G10+G11+G12+G13).toFixed(6);
		$("#G14").val(total);
	}

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
		var F01 = $("#F01").val();
		var F02 = $("#F02").val();
		var F03 = $("#F03").val();
		var F04 = $("#F04").val();
		var F05 = $("#F05").val();
		var F06 = $("#F06").val();
		var F07 = $("#F07").val();
		var F08 = $("#F08").val();
		var F09 = $("#F09").val();
		var F10 = $("#F10").val();
		var G01 = $("#G01").val();
		var G02 = $("#G02").val();
		var G03 = $("#G03").val();
		var G04 = $("#G04").val();
		var G05 = $("#G05").val();
		var G06 = $("#G06").val();
		var G07 = $("#G07").val();
		var G08 = $("#G08").val();
		var G09 = $("#G09").val();
		var G10 = $("#G10").val();
		var G11 = $("#G11").val();
		var G12 = $("#G12").val();
		var G13 = $("#G13").val();
		var G14 = $("#G14").val();
		
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
		
		if (F01 == null || F01 == '') {
			alert("请输入F01");
			return false;
		}
		
		if (F02 == null || F02 == '') {
			alert("请输入F02");
			return false;
		}
		
		if (F03 == null || F03 == '') {
			alert("请输入F03");
			return false;
		}
		
		if (F04 == null || F04 == '') {
			alert("请输入F04");
			return false;
		}
		
		if (F05 == null || F05 == '') {
			alert("请输入F05");
			return false;
		}
		
		if (F06 == null || F06 == '') {
			alert("请输入F06");
			return false;
		}
		
		if (F07 == null || F07 == '') {
			alert("请输入F07");
			return false;
		}
		
		if (F08 == null || F08 == '') {
			alert("请输入F08");
			return false;
		}
		
		if (F09 == null || F09 == '') {
			alert("请输入F09");
			return false;
		}
		
		if (F10 == null || F10 == '') {
			alert("请输入F10");
			return false;
		}
		
		if (G01 == null || G01 == '') {
			alert("请输入G01");
			return false;
		}
		
		if (G02 == null || G02 == '') {
			alert("请输入G02");
			return false;
		}
		
		if (G03 == null || G03 == '') {
			alert("请输入G03");
			return false;
		}
		
		if (G04 == null || G04 == '') {
			alert("请输入G04");
			return false;
		}
		
		if (G05 == null || G05 == '') {
			alert("请输入G05");
			return false;
		}
		
		if (G06 == null || G06 == '') {
			alert("请输入G06");
			return false;
		}
		
		if (G07 == null || G07 == '') {
			alert("请输入G07");
			return false;
		}
		
		if (G08 == null || G08 == '') {
			alert("请输入G08");
			return false;
		}
		
		if (G09 == null || G09 == '') {
			alert("请输入G09");
			return false;
		}
		
		if (G10 == null || G10 == '') {
			alert("请输入G10");
			return false;
		}
		
		if (G11 == null || G11 == '') {
			alert("请输入G11");
			return false;
		}
		
		if (G12 == null || G12 == '') {
			alert("请输入G12");
			return false;
		}
		
		if (G13 == null || G13 == '') {
			alert("请输入G13");
			return false;
		}
		
		if (G14 == null || G14 == '') {
			alert("请输入G14");
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
					filler:filler,
					checker:checker,
					tradeDate:tradeDate,
					taskId:taskId,
					form:form,
					F01:F01,
					F02:F02,
					F03:F03,
					F04:F04,
					F05:F05,
					F06:F06,
					F07:F07,
					F08:F08,
					F09:F09,
					F10:F10,
					G01:G01,
					G02:G02,
					G03:G03,
					G04:G04,
					G05:G05,
					G06:G06,
					G07:G07,
					G08:G08,
					G09:G09,
					G10:G10,
					G11:G11,
					G12:G12,
					G13:G13,
					G14:G14,
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
												<td width="250" class="text-right">缴存现金形式备付金F01<span>*</span></td>
												<td width="200"><input type="text" id="F01" name="F01" value="${table.f01}" class="form-control" style="color:#d9534f" onblur="getF10();"></td>
												<td width="150"></td>
												<td width="250" class="text-right">银行间头寸调拨（调入行）F02<span>*</span></td>
												<td width="200"><input type="text" id="F02" name="F02" value="${table.f02}" class="form-control" style="color:#d9534f" onblur="getF10();"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">收到利息收入F03<span>*</span></td>
												<td width="200"><input type="text" id="F03" name="F03" value="${table.f03}" class="form-control" style="color:#d9534f" onblur="getF10();"></td>
												<td width="150"></td>
												<td width="250" class="text-right">非活期存款转活期存款F04<span>*</span></td>
												<td width="200"><input type="text" id="F04" name="F04" value="${table.f04}" class="form-control" style="color:#d9534f" onblur="getF10();"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">活期存款转非活期存款F05<span>*</span></td>
												<td width="200"><input type="text" id="F05" name="F05" value="${table.f05}" class="form-control" style="color:#d9534f" onblur="getF10();"></td>
												<td width="150"></td>
												<td width="250" class="text-right">当日申请存放的自有资金F06<span>*</span></td>
												<td width="200"><input type="text" id="F06" name="F06" value="${table.f06}" class="form-control" style="color:#d9534f" onblur="getF10();"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">利息收入划拨存管银行F07<span>*</span></td>
												<td width="200"><input type="text" id="F07" name="F07" value="${table.f07}" class="form-control" style="color:#d9534f" onblur="getF10();"></td>
												<td width="150"></td>
												<td width="250" class="text-right">缴存现金形式预付卡押金F08<span>*</span></td>
												<td width="200"><input type="text" id="F08" name="F08" value="${table.f08}" class="form-control" style="color:#d9534f" onblur="getF10();"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">F09<span>*</span></td>
												<td width="200"><input type="text" id="F09" name="F09" value="${table.f09}" class="form-control" style="color:#d9534f" onblur="getF10();"></td>
												<td width="150"></td>
												<td width="250" class="text-right">合计F10<span>*</span></td>
												<td width="200"><input type="text" id="F10" name="F10" value="${table.f10}" class="form-control" style="color:#d9534f" disabled="disabled"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">银行间头寸调拨G01<span>*</span></td>
												<td width="200"><input type="text" id="G01" name="G01" value="${table.g01}" class="form-control" style="color:#d9534f" onblur="getG14();"></td>
												<td width="150"></td>
												<td width="250" class="text-right">利息收入划拨存管银行G02<span>*</span></td>
												<td width="200"><input type="text" id="G02" name="G02" value="${table.g02}" class="form-control" style="color:#d9534f" onblur="getG14();"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">扣取手续费、管理费G03<span>*</span></td>
												<td width="200"><input type="text" id="G03" name="G03" value="${table.g03}" class="form-control" style="color:#d9534f" onblur="getG14();"></td>
												<td width="150"></td>
												<td width="250" class="text-right">非活期存款转活期存款G04<span>*</span></td>
												<td width="200"><input type="text" id="G04" name="G04" value="${table.g04}" class="form-control" style="color:#d9534f" onblur="getG14();"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">活期存款转非活期存款G05<span>*</span></td>
												<td width="200"><input type="text" id="G05" name="G05" value="${table.g05}" class="form-control" style="color:#d9534f" onblur="getG14();"></td>
												<td width="150"></td>
												<td width="250" class="text-right">结转风险准备金G06<span>*</span></td>
												<td width="200"><input type="text" id="G06" name="G06" value="${table.g06}" class="form-control" style="color:#d9534f" onblur="getG14();"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">结转利息收入G07<span>*</span></td>
												<td width="200"><input type="text" id="G07" name="G07" value="${table.g07}" class="form-control" style="color:#d9534f" onblur="getG14();"></td>
												<td width="150"></td>
												<td width="250" class="text-right">结转手续费收入G08<span>*</span></td>
												<td width="200"><input type="text" id="G08" name="G08" value="${table.g08}" class="form-control" style="color:#d9534f" onblur="getG14();"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">办理预付卡先行现金赎回业务G09<span>*</span></td>
												<td width="200"><input type="text" id="G09" name="G09" value="${table.g09}" class="form-control" style="color:#d9534f" onblur="getG14();"></td>
												<td width="150"></td>
												<td width="250" class="text-right">当日提出原申请存放的自有资金G10<span>*</span></td>
												<td width="200"><input type="text" id="G10" name="G10" value="${table.g10}" class="form-control" style="color:#d9534f" onblur="getG14();"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">以转账方式退回购卡押金G11<span>*</span></td>
												<td width="200"><input type="text" id="G11" name="G11" value="${table.g11}" class="form-control" style="color:#d9534f" onblur="getG14();"></td>
												<td width="150"></td>
												<td width="250" class="text-right">办理预付卡押金先行现金赎回业务G12<span>*</span></td>
												<td width="200"><input type="text" id="G12" name="G12" value="${table.g12}" class="form-control" style="color:#d9534f" onblur="getG14();"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">G13<span>*</span></td>
												<td width="200"><input type="text" id="G13" name="G13" value="${table.g13}" class="form-control" style="color:#d9534f" onblur="getG14();"></td>
												<td width="150"></td>
												<td width="250" class="text-right">合计G14<span>*</span></td>
												<td width="200"><input type="text" id="G14" name="G14" value="${table.g14}" class="form-control" style="color:#d9534f" disabled="disabled"></td>
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
