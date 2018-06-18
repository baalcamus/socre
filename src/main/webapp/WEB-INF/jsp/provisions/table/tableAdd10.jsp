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
		var K01 = $("#K01").val();
		var K02 = $("#K02").val();
		var K03 = $("#K03").val();
		var K04 = $("#K04").val();
		var K05 = $("#K05").val();
		var K06 = $("#K06").val();
		var K07 = $("#K07").val();
		var K08 = $("#K08").val();
		var K09 = $("#K09").val();
		var K10 = $("#K10").val();
		var K11 = $("#K11").val();
		var K12 = $("#K12").val();
		var K13 = $("#K13").val();
		var K14 = $("#K14").val();
		var K15 = $("#K15").val();
		var K16 = $("#K16").val();
		var K17 = $("#K17").val();
		var K18 = $("#K18").val();
		var K19 = $("#K19").val();
		var K20 = $("#K20").val();
		var K21 = $("#K21").val();
		var K22 = $("#K22").val();
		var K23 = $("#K23").val();
		var K24 = $("#K24").val();
		
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
		
		if (K01 == null || K01 == '') {
			alert("请输入K01");
			return false;
		}
		
		if (K02 == null || K02 == '') {
			alert("请输入K02");
			return false;
		}
		
		if (K03 == null || K03 == '') {
			alert("请输入K03");
			return false;
		}
		
		if (K04 == null || K04 == '') {
			alert("请输入K04");
			return false;
		}
		
		if (K05 == null || K05 == '') {
			alert("请输入K05");
			return false;
		}
		
		if (K06 == null || K06 == '') {
			alert("请输入K06");
			return false;
		}
		
		if (K07 == null || K07 == '') {
			alert("请输入K07");
			return false;
		}
		
		if (K08 == null || K08 == '') {
			alert("请输入K08");
			return false;
		}
		
		if (K09 == null || K09 == '') {
			alert("请输入K09");
			return false;
		}
		
		if (K10 == null || K10 == '') {
			alert("请输入K10");
			return false;
		}
		
		if (K11 == null || K11 == '') {
			alert("请输入K11");
			return false;
		}
		
		if (K12 == null || K12 == '') {
			alert("请输入K12");
			return false;
		}
		
		if (K13 == null || K13 == '') {
			alert("请输入K13");
			return false;
		}
		
		if (K14 == null || K14 == '') {
			alert("请输入K14");
			return false;
		} 

		if (K15 == null || K15 == '') {
			alert("请输入K15");
			return false;
		} 

		if (K16 == null || K16 == '') {
			alert("请输入K16");
			return false;
		} 

		if (K17 == null || K17 == '') {
			alert("请输入K17");
			return false;
		} 

		if (K18 == null || K18 == '') {
			alert("请输入K18");
			return false;
		} 

		if (K19 == null || K19 == '') {
			alert("请输入K19");
			return false;
		} 

		if (K20 == null || K20 == '') {
			alert("请输入K20");
			return false;
		} 

		if (K21 == null || K21 == '') {
			alert("请输入K21");
			return false;
		} 

		if (K22 == null || K22 == '') {
			alert("请输入K22");
			return false;
		} 

		if (K23 == null || K23 == '') {
			alert("请输入K23");
			return false;
		} 

		if (K24 == null || K24 == '') {
			alert("请输入K24");
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
					K01 :K01,
					K02 :K02,
					K03 :K03,
					K04 :K04,
					K05 :K05,
					K06 :K06,
					K07 :K07,
					K08 :K08,
					K09 :K09,
					K10 :K10,
					K11 :K11,
					K12 :K12,
					K13 :K13,
					K14 :K14,
					K15 :K15,
					K16 :K16,
					K17 :K17,
					K18 :K18,
					K19 :K19,
					K20 :K20,
					K21 :K21,
					K22 :K22,
					K23 :K23,
					K24 :K24,
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
												<td width="250" class="text-right">已增加客户资金未增加备付金,≤5日,笔数K01<span>*</span></td>
												<td width="200"><input type="text" id="K01" name="K01" value="" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">已增加客户资金未增加备付金,≤5日,金额K02<span>*</span></td>
												<td width="200"><input type="text" id="K02" name="K02" value="" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">已增加客户资金未增加备付金6-10日笔数K03<span>*</span></td>
												<td width="200"><input type="text" id="K03" name="K03" value="" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">已增加客户资金未增加备付金6-10日金额K04<span>*</span></td>
												<td width="200"><input type="text" id="K04" name="K04" value="" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">已增加客户资金未增加备付金,≥11日,笔数K05<span>*</span></td>
												<td width="200"><input type="text" id="K05" name="K05" value="" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">已增加客户资金未增加备付金,≥11日,金额K06<span>*</span></td>
												<td width="200"><input type="text" id="K06" name="K06" value="" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">已减少客户资金未减少备付金,≤5日,笔数K07<span>*</span></td>
												<td width="200"><input type="text" id="K07" name="K07" value="" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">已减少客户资金未减少备付金,≤5日,金额K08<span>*</span></td>
												<td width="200"><input type="text" id="K08" name="K08" value="" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">已减少客户资金未减少备付金6-10日笔数K09<span>*</span></td>
												<td width="200"><input type="text" id="K09" name="K09" value="" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">已减少客户资金未减少备付金6-10日金额K10<span>*</span></td>
												<td width="200"><input type="text" id="K10" name="K10" value="" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">已减少客户资金未减少备付金,≥11日,笔数K11<span>*</span></td>
												<td width="200"><input type="text" id="K11" name="K11" value="" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">已减少客户资金未减少备付金,≥11日,金额K12<span>*</span></td>
												<td width="200"><input type="text" id="K12" name="K12" value="" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">已增加备付金未增加客户资金,≤5日,笔数K13<span>*</span></td>
												<td width="200"><input type="text" id="K13" name="K13" value="" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">已增加备付金未增加客户资金,≤5日,金额K14<span>*</span></td>
												<td width="200"><input type="text" id="K14" name="K14" value="" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">已增加备付金未增加客户资金6-10日笔数K15<span>*</span></td>
												<td width="200"><input type="text" id="K15" name="K15" value="" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">已增加备付金未增加客户资金6-10日金额K16<span>*</span></td>
												<td width="200"><input type="text" id="K16" name="K16" value="" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">已增加备付金未增加客户资金,≥11日,笔数K17<span>*</span></td>
												<td width="200"><input type="text" id="K17" name="K17" value="" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">已增加备付金未增加客户资金,≥11日,金额K18<span>*</span></td>
												<td width="200"><input type="text" id="K18" name="K18" value="" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">已减少备付金未减少客户资金,≤5日,笔数K19<span>*</span></td>
												<td width="200"><input type="text" id="K19" name="K19" value="" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">已减少备付金未减少客户资金,≤5日,金额K20<span>*</span></td>
												<td width="200"><input type="text" id="K20" name="K20" value="" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">已减少备付金未减少客户资金6-10日笔数K21<span>*</span></td>
												<td width="200"><input type="text" id="K21" name="K21" value="" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">已减少备付金未减少客户资金6-10日金额K22<span>*</span></td>
												<td width="200"><input type="text" id="K22" name="K22" value="" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">已减少备付金未减少客户资金,≥11日,金额K23<span>*</span></td>
												<td width="200"><input type="text" id="K23" name="K23" value="" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">已减少备付金未减少客户资金,≥11日,金额K24<span>*</span></td>
												<td width="200"><input type="text" id="K24" name="K24" value="" class="form-control" style="color:#d9534f"></td>
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
