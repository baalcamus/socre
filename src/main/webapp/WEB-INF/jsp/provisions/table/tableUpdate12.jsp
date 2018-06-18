<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>备付金报备文件管理</title>
<script type="text/javascript">	
	function getM14(){
		var M12 = Number($("#M12").val());
		var M13 = Number($("#M13").val());
		var M14 = (M13-M12).toFixed(6);
		$("#M14").val(M14);
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
		var M01 = $("#M01").val();
		var M02 = $("#M02").val();
		var M03 = $("#M03").val();
		var M04 = $("#M04").val();
		var M05 = $("#M05").val();
		var M06 = $("#M06").val();
		var M07 = $("#M07").val();
		var M08 = $("#M08").val();
		var M09 = $("#M09").val();
		var M10 = $("#M10").val();
		var M11 = $("#M11").val();
		var M12 = $("#M12").val();
		var M13 = $("#M13").val();
		var M14 = $("#M14").val();
		var Z02 = $("#Z02").val();
		var CU = $("#CU").val();
		var CV = $("#CV").val();
		var OR1 = $("#OR1").val();
		
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
		
		if (M01 == null || M01 == '') {
			alert("请输入M01");
			return false;
		}
		
		if (M02 == null || M02 == '') {
			alert("请输入M02");
			return false;
		}
		
		if (M03 == null || M03 == '') {
			alert("请输入M03");
			return false;
		}
		
		if (M04 == null || M04 == '') {
			alert("请输入M04");
			return false;
		}
		
		if (M05 == null || M05 == '') {
			alert("请输入M05");
			return false;
		}
		
		if (M06 == null || M06 == '') {
			alert("请输入M06");
			return false;
		}
		
		if (M07 == null || M07 == '') {
			alert("请输入M07");
			return false;
		}
		
		if (M08 == null || M08 == '') {
			alert("请输入M08");
			return false;
		}
		
		if (M09 == null || M09 == '') {
			alert("请输入M09");
			return false;
		}
		
		if (M10 == null || M10 == '') {
			alert("请输入M10");
			return false;
		}
		
		if (M11 == null || M11 == '') {
			alert("请输入M11");
			return false;
		}
		
		if (M12 == null || M12 == '') {
			alert("请输入M12");
			return false;
		}
		
		if (M13 == null || M13 == '') {
			alert("请输入M13");
			return false;
		}
		
		if (M14 == null || M14 == '') {
			alert("请输入M14");
			return false;
		} 
		
		if (Z02 == null || Z02 == '') {
			alert("请输入Z02");
			return false;
		}
		
		if (CU == null || CU == '') {
			alert("请输入CU");
			return false;
		} 
		
		if (CV == null || CV == '') {
			alert("请输入CV");
			return false;
		} 
		
		if (OR1 == null || OR1 == '') {
			alert("请输入OR1");
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
					M01 :M01,
					M02 :M02,
					M03 :M03,
					M04 :M04,
					M05 :M05,
					M06 :M06,
					M07 :M07,
					M08 :M08,
					M09 :M09,
					M10 :M10,
					M11 :M11,
					M12 :M12,
					M13 :M13,
					M14 :M14,
					Z02	:Z02,
					CU:CU,
					CV:CV,
					OR1:OR1,
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
												<td width="250" class="text-right">未结转的备付金银行存款利息余额M01<span>*</span></td>
												<td width="200"><input type="text" id="M01" name="M01" value="${table.m01}" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">累计申请存放的自有资金余额M02<span>*</span></td>
												<td width="200"><input type="text" id="M02" name="M02" value="${table.m02}" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">累计申请存放的自有资金余额M03<span>*</span></td>
												<td width="200"><input type="text" id="M03" name="M03" value="${table.m03}" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">未结转的支付业务净收入余额M04<span>*</span></td>
												<td width="200"><input type="text" id="M04" name="M04" value="${table.m04}" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">现金形式持有的客户备付金余额M05<span>*</span></td>
												<td width="200"><input type="text" id="M05" name="M05" value="${table.m05}" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">自有资金先行偿付的预付卡赎回金额M06<span>*</span></td>
												<td width="200"><input type="text" id="M06" name="M06" value="${table.m06}" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">已增加客户资金未增加备付金M07<span>*</span></td>
												<td width="200"><input type="text" id="M07" name="M07" value="${table.m07}" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">已减少客户资金未减少备付金M08<span>*</span></td>
												<td width="200"><input type="text" id="M08" name="M08" value="${table.m08}" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">已增加备付金未增加客户资金M09<span>*</span></td>
												<td width="200"><input type="text" id="M09" name="M09" value="${table.m09}" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">已减少备付金未减少客户资金M10<span>*</span></td>
												<td width="200"><input type="text" id="M10" name="M10" value="${table.m10}" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">其他调整项目M11<span>*</span></td>
												<td width="200"><input type="text" id="M11" name="M11" value="${table.m11}" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">支付机构客户资金账户余额试算值M12<span>*</span></td>
												<td width="200"><input type="text" id="M12" name="M12" value="${table.m12}" class="form-control" style="color:#d9534f" onblur="getM14();"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">支付机构客户资金账户余额实际值M13<span>*</span></td>
												<td width="200"><input type="text" id="M13" name="M13" value="${table.m13}" class="form-control" style="color:#d9534f" onblur="getM14();"></td>
												<td width="150"></td>
												<td width="250" class="text-right">实际值-试算值M14<span>*</span></td>
												<td width="200"><input type="text" id="M14" name="M14" value="${table.m14}" class="form-control" style="color:#d9534f" disabled="disabled"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">预付卡押金业务调整金额Z02<span>*</span></td>
												<td width="200"><input type="text" id="Z02" name="Z02" value="${table.z02}" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">在备付金银行存放的预付卡押金本期净增加数CU<span>*</span></td>
												<td width="200"><input type="text" id="CU" name="CU" value="${table.CU}" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">本期新增应收但未收到的预付卡押金金额CV<span>*</span></td>
												<td width="200"><input type="text" id="CV" name="CV" value="${table.CV}" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">其它OR1<span>*</span></td>
												<td width="200"><input type="text" id="OR1" name="OR1" value="${table.OR1}" class="form-control" style="color:#d9534f"></td>
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
