<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>备付金报备文件管理</title>
<script type="text/javascript">	

	function getL03(){
		var L01 = Number($("#L01").val());
		var L02 = Number($("#L02").val());
		var L03 = (L01-L02).toFixed(6);
		$("#L03").val(L03);
	}
	
	function getL24(){
		var L22 = Number($("#L22").val());
		var L23 = Number($("#L23").val());
		var L24 = (L22-L23).toFixed(6);
		$("#L24").val(L24);
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
		var L01 = $("#L01").val();
		var L02 = $("#L02").val();
		var L03 = $("#L03").val();
		var L04 = $("#L04").val();
		var L05 = $("#L05").val();
		var L06 = $("#L06").val();
		var L07 = $("#L07").val();
		var L08 = $("#L08").val();
		var L09 = $("#L09").val();
		var L10 = $("#L10").val();
		var L11 = $("#L11").val();
		var L12 = $("#L12").val();
		var L13 = $("#L13").val();
		var L14 = $("#L14").val();
		var L15 = $("#L15").val();
		var L16 = $("#L16").val();
		var L17 = $("#L17").val();
		var L18 = $("#L18").val();
		var L19 = $("#L19").val();
		var L20 = $("#L20").val();
		var L21 = $("#L21").val();
		var L22 = $("#L22").val();
		var L23 = $("#L23").val();
		var L24 = $("#L24").val();
		var Z01 = $("#Z01").val();
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
		
		if (L01 == null || L01 == '') {
			alert("请输入L01");
			return false;
		}
		
		if (L02 == null || L02 == '') {
			alert("请输入L02");
			return false;
		}
		
		if (L03 == null || L03 == '') {
			alert("请输入L03");
			return false;
		}
		
		if (L04 == null || L04 == '') {
			alert("请输入L04");
			return false;
		}
		
		if (L05 == null || L05 == '') {
			alert("请输入L05");
			return false;
		}
		
		if (L06 == null || L06 == '') {
			alert("请输入L06");
			return false;
		}
		
		if (L07 == null || L07 == '') {
			alert("请输入L07");
			return false;
		}
		
		if (L08 == null || L08 == '') {
			alert("请输入L08");
			return false;
		}
		
		if (L09 == null || L09 == '') {
			alert("请输入L09");
			return false;
		}
		
		if (L10 == null || L10 == '') {
			alert("请输入L10");
			return false;
		}
		
		if (L11 == null || L11 == '') {
			alert("请输入L11");
			return false;
		}
		
		if (L12 == null || L12 == '') {
			alert("请输入L12");
			return false;
		}
		
		if (L13 == null || L13 == '') {
			alert("请输入L13");
			return false;
		}
		
		if (L14 == null || L14 == '') {
			alert("请输入L14");
			return false;
		} 

		if (L15 == null || L15 == '') {
			alert("请输入L15");
			return false;
		} 

		if (L16 == null || L16 == '') {
			alert("请输入L16");
			return false;
		} 

		if (L17 == null || L17 == '') {
			alert("请输入L17");
			return false;
		} 

		if (L18 == null || L18 == '') {
			alert("请输入L18");
			return false;
		} 

		if (L19 == null || L19 == '') {
			alert("请输入L19");
			return false;
		} 

		if (L20 == null || L20 == '') {
			alert("请输入L20");
			return false;
		} 

		if (L21 == null || L21 == '') {
			alert("请输入L21");
			return false;
		} 

		if (L22 == null || L22 == '') {
			alert("请输入L22");
			return false;
		} 

		if (L23 == null || L23 == '') {
			alert("请输入L23");
			return false;
		} 

		if (L24 == null || L24 == '') {
			alert("请输入L24");
			return false;
		} 
		
		if (Z01 == null || Z01 == '') {
			alert("请输入L24");
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
					L01 :L01,
					L02 :L02,
					L03 :L03,
					L04 :L04,
					L05 :L05,
					L06 :L06,
					L07 :L07,
					L08 :L08,
					L09 :L09,
					L10 :L10,
					L11 :L11,
					L12 :L12,
					L13 :L13,
					L14 :L14,
					L15 :L15,
					L16 :L16,
					L17 :L17,
					L18 :L18,
					L19 :L19,
					L20 :L20,
					L21 :L21,
					L22 :L22,
					L23 :L23,
					L24 :L24,
					Z01 :Z01,
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
												<td width="250" class="text-right">期初客户资金账户余额L01<span>*</span></td>
												<td width="200"><input type="text" id="L01" name="L01" value="${table.l01}" class="form-control" style="color:#d9534f" onblur="getL03();"></td>
												<td width="150"></td>
												<td width="250" class="text-right">期末客户资金账户余额L02<span>*</span></td>
												<td width="200"><input type="text" id="L02" name="L02" value="${table.l02}" class="form-control" style="color:#d9534f" onblur="getL03();"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">客户资金账户余额净增加（减少）L03<span>*</span></td>
												<td width="200"><input type="text" id="L03" name="L03" value="${table.l03}" class="form-control" style="color:#d9534f" disabled="disabled"></td>
												<td width="150"></td>
												<td width="250" class="text-right">接受现金形式的客户备付金金额（减）L04<span>*</span></td>
												<td width="200"><input type="text" id="L04" name="L04" value="${table.l04}" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">向备付金银行缴存现金备付金（加）L05<span>*</span></td>
												<td width="200"><input type="text" id="L05" name="L05" value="${table.l05}" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">自有资金先行赎回预付卡的金额（加）L06<span>*</span></td>
												<td width="200"><input type="text" id="L06" name="L06" value="${table.l06}" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">办理预付卡先行赎回资金结转金额（减）L07<span>*</span></td>
												<td width="200"><input type="text" id="L07" name="L07" value="${table.l07}" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">本期实现的手续费收入（加）L08<span>*</span></td>
												<td width="200"><input type="text" id="L08" name="L08" value="${table.l08}" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">已增加客户资金未增加备付金（减）L09<span>*</span></td>
												<td width="200"><input type="text" id="L09" name="L09" value="${table.l09}" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">已减少客户资金未减少备付金（加）L10<span>*</span></td>
												<td width="200"><input type="text" id="L10" name="L10" value="${table.l10}" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">已增加备付金未增加客户资金（加）L11<span>*</span></td>
												<td width="200"><input type="text" id="L11" name="L11" value="${table.l11}" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">已减少备付金未减少客户资金（减）L12<span>*</span></td>
												<td width="200"><input type="text" id="L12" name="L12" value="${table.l12}" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">本期收到利息收入（加）L13<span>*</span></td>
												<td width="200"><input type="text" id="L13" name="L13" value="${table.l13}" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">本期申请存放的自有资金（加）L14<span>*</span></td>
												<td width="200"><input type="text" id="L14" name="L14" value="${table.l14}" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">银行扣取的手续费、管理费（减）L15<span>*</span></td>
												<td width="200"><input type="text" id="L15" name="L15" value="${table.l15}" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">结转的风险准备金（减）L16<span>*</span></td>
												<td width="200"><input type="text" id="L16" name="L16" value="${table.l16}" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">本期结转利息收入（减）L17<span>*</span></td>
												<td width="200"><input type="text" id="L17" name="L17" value="${table.l17}" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">本期结转手续费收入（减）L18<span>*</span></td>
												<td width="200"><input type="text" id="L18" name="L18" value="${table.l18}" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">本期提出原申请存放的自有资金（减）L19<span>*</span></td>
												<td width="200"><input type="text" id="L19" name="L19" value="${table.l19}" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">其他调整项目L20<span>*</span></td>
												<td width="200"><input type="text" id="L20" name="L20" value="${table.l20}" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">试算值L21<span>*</span></td>
												<td width="200"><input type="text" id="L21" name="L21" value="${table.l21}" class="form-control" style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">备付金银行账户余额期初值L22<span>*</span></td>
												<td width="200"><input type="text" id="L22" name="L22" value="${table.l22}" class="form-control" style="color:#d9534f" onblur="getL24();"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">备付金银行账户余额期末值L23<span>*</span></td>
												<td width="200"><input type="text" id="L23" name="L23" value="${table.l23}" class="form-control" style="color:#d9534f" onblur="getL24();"></td>
												<td width="150"></td>
												<td width="250" class="text-right">备付金银行账户余额净增加（减少）L24<span>*</span></td>
												<td width="200"><input type="text" id="L24" name="L24" value="${table.l24}" class="form-control" style="color:#d9534f" disabled="disabled"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">预付卡押金业务调整金额（减）Z01<span>*</span></td>
												<td width="200"><input type="text" id="Z01" name="Z01" value="${table.z01}" class="form-control" style="color:#d9534f"></td>
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
