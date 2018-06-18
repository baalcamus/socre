<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>备付金银行管理</title>
<script type="text/javascript">	

	//获取复选框值    
	function chk() {
		var report = '';
		var split = ','
		$('input[name="report"]:checked').each(function() {
			report+=($(this).val());
			report+=split;
		});
		
		return report;
	}
	
	function add() {
		var bankName = $("#bankName").val();
		var bankCode = $("#bankCode").val();
		var bankType = $("#bankType").val();
		var sendType = $("#sendType").val();
		var merchantId = $("#merchantId").val();
		var merchantName = $("#merchantName").val();
		var report = chk();

		if (bankName == null || bankName == '') {
			alert("请输入银行名称");
			return false;
		}

		if (bankCode == null || bankCode == '') {
			alert("请输入银行编码");
			return false;
		}

		if (bankType == null || bankType == '') {
			alert("请选择银行类型");
			return false;
		}

		if (sendType == null || sendType == '') {
			alert("请选择报送方式");
			return false;
		}

		if (merchantId == null || merchantId == '') {
			alert("请输入商户号");
			return false;
		}
		
		if (merchantName == null || merchantName == '') {
			alert("请输入支付机构名称");
			return false;
		}
		
		if (report == null || report == '') {
			alert("请选择报表种类");
			return false;
		}


		$.post("<%=request.getContextPath()%>/provisions/bankAdd.do",{
					bankName:$("#bankName").val(),
    				bankCode:$("#bankCode").val(),
    				bankType:$("#bankType").val(),
			    	sendType:$("#sendType").val(),
			    	merchantId:$("#merchantId").val(),
			    	merchantName:$("#merchantName").val(),
			    	report :report,
				},
				function (data){
					if(data=="success"){
						alert("注册成功");
						window.location.href="<%=request.getContextPath()%>/provisions/toBankManageList.do";
					}else{
						alert("注册失败!");
						window.location.reload();
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
						<li>备付金管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li>备付金银行管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li class="active">银行注册</li>
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
									<h2 class="panel-title">银行注册</h2>
								</div>
								<div class="panel-body">
									<form method="post" enctype="multipart/form-data" class="form-horizontal">
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">银行名称<span>*</span></td>
														<td width="200">
															<input type="text" id="bankName" name="bankName" value="" class="form-control"></td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">银行编码<span>*</span></td>
														<td width="200">
															<input type="text" id="bankCode" name="bankCode" value="" class="form-control"></td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">银行类型<span>*</span></td>
														<td width="200">
															<select class="form-control" id="bankType" name="bankType" tabindex="10">
																<option value="">--请选择--</option>
																<option value="1">存管银行</option>
																<option value="2">合作银行</option>
															</select>
														</td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">报送方式<span>*</span></td>
														<td width="200">
															<select class="form-control" id="sendType" name="sendType" tabindex="10">
																<option value="">--请选择--</option>
																<option value="1">直连</option>
																<option value="2">手工</option>
															</select>
														</td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">商户号<span>*</span></td>
														<td width="200">
															<input type="text" id="merchantId" name="merchantId" value="" class="form-control" ></td>
														</td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list" >
													<tr>
														<td width="120" class="text-right">支付机构名称<span>*</span></td>
														<td width="200">
															<input type="text" id="merchantName" name="merchantName" value="" class="form-control"></td>
														</td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list" border="1">
													<tr>
														<td width="61"  class="text-right">报表种类<span>*</span></td>
														<td width="200" >
															<input type="checkbox" id="report" name="report" value="1_1" class="form-control">表1_1支付机构银行客户备付金入金业务明细表<br></br>
															<input type="checkbox" id="report" name="report" value="1_2" class="form-control">表1_2支付机构客户备付金出金业务明细表<br></br>
															<input type="checkbox" id="report" name="report" value="1_3" class="form-control">表1_3支付机构客户备付金业务实际出金明细表<br></br>
															<input type="checkbox" id="report" name="report" value="1_4" class="form-control">表1_4支付机构客户资金账户转账业务统计表<br></br>
															<input type="checkbox" id="report" name="report" value="1_5" class="form-control">表1_5支付机构客户资金账户余额统计表<br></br>
															<input type="checkbox" id="report" name="report" value="1_6" class="form-control">表1_6支付机构银行特殊业务明细表<br></br>
															<input type="checkbox" id="report" name="report" value="1_7" class="form-control">表1_7支付机构现金购卡业务统计表<br></br>
															<input type="checkbox" id="report" name="report" value="1_8" class="form-control">表1_8支付机构预付卡现金赎回业务统计表<br></br>
															<input type="checkbox" id="report" name="report" value="1_9" class="form-control">表1_9支付机构银行客户备付金业务未达账项统计表<br></br>
															<input type="checkbox" id="report" name="report" value="1_10" class="form-control">表1_10支付机构银行客户备付金业务未达账项分析表<br></br>
															<input type="checkbox" id="report" name="report" value="1_11" class="form-control">表1_11支付机构客户资金账户余额变动调节表<br></br>
															<input type="checkbox" id="report" name="report" value="1_12" class="form-control">表1_12支付机构客户资金账户余额试算表<br></br>
															<input type="checkbox" id="report" name="report" value="1_13" class="form-control">表1_13预付卡发行企业备付金账户中售卡押金统计表<br></br>
															<input type="checkbox" id="report" name="report" value="a1_1" class="form-control">表1-1（补）支付机构XX银行客户备付金入金业务调节表<br></br>
															<input type="checkbox" id="report" name="report" value="b1_2" class="form-control">表1-2（补）分银行账户备付金出金业务明细表<br></br>
															<input type="checkbox" id="report" name="report" value="2_1" class="form-control">表2-1 XX银行XX支付机构备付金银行账户余额统计表<br></br>
															<input type="checkbox" id="report" name="report" value="2_2" class="form-control">表2-2 XX支付机构管理账户情况统计</br>
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
