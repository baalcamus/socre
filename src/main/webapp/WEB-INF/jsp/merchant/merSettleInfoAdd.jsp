<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<html lang="en">
<head>
<title>商户结算设置</title>
<style type="text/css">
.red {
	color: red;
}

#_form_table_ tr {
	white-space: nowrap;
	padding: 10px 0px 10px 0px;
	height: 35px;
}

#_form_table_ tr td:nth-child(1) {
	text-align: right;
	padding-right: 20px;
}
</style>
<style type="text/css">
	.overflow{
			max-height:256px;
		}
		#cover{
			position: fixed; 
			z-index: 1000; 
			width: 100%; 
			height: 100%; 
			top:0;
			left:0;
			background-color:#000000;
			filter:alpha(opacity=0.7); /*IE滤镜，透明度50%*/
			-moz-opacity:0.7; /*Firefox私有，透明度50%*/
			opacity:0.7;/*其他，透明度50%*/
			text-align: center;
		}
		#cover img{
			position:absolute;top:40%;left:40%;width:20%;height:10%;margin-top:-15px;margin-left:-15px;
		}

</style>
<script type="text/javascript">
function showCover(){$("#cover").css("display",'');}
function hideCover(){$("#cover").css("display",'none');}
</script>
</head>

<body class=" ">
<div id="cover" style="display: none;">
	 	<img src="<%=request.getContextPath() %>/statics/v2/images/wait_processing.gif">
	</div>
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
					<li><i class="fa fa-home"></i>&nbsp;<a
						href="${ctx}/main/toMain.do">首页</a>&nbsp;&nbsp;<i
						class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
					<li>商户管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li class="active">商户结算设置</li>
				</ol>
				<div class="clearfix"></div>
			</div>
			<!--END TITLE & BREADCRUMB PAGE-->
			<!--BEGIN CONTENT-->
			<div class="page-content">
				<form name="_info_form_" method="post">
					<input type="hidden" name="merchantNo" value="${merchantNo }">
					<div class="panel panel-default  withoutbottom clearfix">
						<header class="panel-heading clearfix">
							<h2 class="panel-title">商户结算设置</h2>
						</header>
						<div class="panel-body clearfix">
							<div class="panel-inner">
								<h2 class="panel-inner-title panel-inner-title-default">商户信息
								</h2>
								<div class="panel-inner-body">
									<div class="row">
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="130" class="text-left">商户编号&nbsp;&nbsp;<span>${merchantNo }</span></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>


							<div class="panel-inner">
								<h2 class="panel-inner-title panel-inner-title-default">商户结算账户开户信息
								</h2>
								<div class="panel-inner-body">
									<div class="row">
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="130" class="text-right">开户行<span>*</span></td>
													<td><select name="bankId" id="bankId" tabindex="10"
														class="form-control">
															<option value="">请选择</option>
															<c:forEach items="${banks}" var="bankData">
																<option value="${bankData.shortName}">${bankData.bankName}</option>
															</c:forEach>
													</select></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="130" class="text-right">开户行地址(包括支行)<span>*</span></td>
													<td><input class="form-control" id="bankAddress"
														name="bankAddress"></td>
												</tr>
											</table>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="130" class="text-right">账户类型<span>*</span></td>

													<td><input type="Radio" name="accountType"
														value="PUBLIC">对公 <input type="Radio"
														name="accountType" value="PRIVATE">对私</td>
												</tr>
											</table>
										</div>

										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="130" class="text-right">账户名称<span>*</span></td>
													<td><input type="text" class="form-control"
														id="accountName" name="accountName"></td>
												</tr>
											</table>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="130" class="text-right">开户账号<span>*</span></td>
													<td><input type="text" class="form-control"
														id="accountNo" name="accountNo"
														onkeyup='this.value=this.value.replace(/\D/gi,"")'>
													</td>
												</tr>
											</table>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="130" class="text-right">开户人证件类型<span>*</span></td>
													<td><select class="form-control"
														id="accountOpenCtfType" tabindex="10"
														name="accountOpenCtfType">
															<option value="">请选择</option>
															<option value="ID_CARD">身份证</option>
															<option value="PASS_PORT">护照</option>
															<option value="RESIDENCE">户口本</option>
															<option value="OFFICIAL_CARD">军官证</option>
															<option value="HK_MACAO_CARD">往来港澳</option>
															<option value="TAIWAN_CARD">台胞证</option>
															<option value="TEMP_ID_CARD">临时身份证</option>
															<option value="OTHER">其他</option>
													</select></td>
												</tr>
											</table>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="130" class="text-right">开户人证件号码<span>*</span></td>
													<td><input type="text" class="form-control"
														id="accountOpenCtfNo" name="accountOpenCtfNo"
														onkeyup='this.value=this.value.replace(/\D/gi,"")'>
													</td>
												</tr>
											</table>
										</div>

										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="130" class="text-right">开户人预留手机号<span>*</span></td>
													<td><input type="text" class="form-control"
														id="accountRemainPhone" name="accountRemainPhone"
														maxlength="11"
														onkeyup="this.value=this.value.replace(/[^\d-]/g,'')">
													</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>

							<div class="panel-inner">
								<h2 class="panel-inner-title panel-inner-title-default">结算信息
								</h2>
								<div class="panel-inner-body">
									<div class="row">
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td class="text-right" width="130"><label
														for="settleType">结算类型<span>*</span></label></td>
													<td>
													<input
														type="Radio" name="settleType" value="DEPENDENT">前置结算 <input
														type="Radio" name="settleType" value="AUTO">自动结算 <input
														type="Radio" name="settleType" value="SELF">自助结算 
													</td>
												</tr>
											</table>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td class="text-right" width="130"><label
														for="settleCycle">结算周期<span>*</span></label></td>
													<td><input type="Radio" name="settleCycle" value="TX">T+<input
														readonly="readonly" name='number' value="X"
														style="display: inline;" type="text" size="5"> <input
														type="Radio" name="settleCycle" value="YJ">月结 <input
														type="Radio" name="settleCycle" value="JJ">季结 <input
														type="Radio" name="settleCycle" value="NJ">年结 <input
														type="Radio" name="settleCycle" value="MYXR">每月<input
														readonly="readonly" name='number' value="X"
														style="display: inline;" type="text" size="5">日</td>
												</tr>
											</table>
										</div>
									</div>

									<div class="row">
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td class="text-right" width="130"><label
														for="minSettleAmount">最小结算金额</label></td>
													<td><input type="number" class="form-control"
														name="minSettleAmount" id="minSettleAmount"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td class="text-right" width="130"><label
														for="maxSettleAmount">最大结算金额</label></td>
													<td><input type="number" class="form-control"
														name="maxSettleAmount" id="maxSettleAmount"></td>
												</tr>
											</table>
										</div>
									</div>
									<div class="row">
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td class="text-right" width="130"><label
														for="assumeFeeFlag">承担结算手续费<b class="red">*</b></label></td>
													<td><select class="form-control" id="assumeFeeFlag"
														name="assumeFeeFlag">
															<option value="">请选择
															<option value="Y">是
															<option value="N">否
													</select></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td class="text-right" width="130"><label
														for="riskStorageDays">风险预存期天数</label></td>
													<td><input type="number" class="form-control"
														name="riskStorageDays" id="riskStorageDays"></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>

						</div>

					</div>
					<button class="btn btn-primary" type="submit">提交</button>
				</form>
			</div>
			<!--End CONTENT-->
		</div>
		<!--右侧内容 end-->
	</div>

</body>
<style type="text/css">
.__list__view__ {
	height: 100%;
	width: 100%;
	position: absolute;
	z-index: 1000;
	background: red;
	list-style: none;
}
</style>
<script type="text/javascript">
	$(function() {
		//重置form表单
		document._info_form_.reset();
		$(document._info_form_).validate({
			rules : {
				merchantNo : "required",
				accountOpenBank : "required",
				bankAddress : "required",
				accountType : "required",
				accountName : "required",
				accountNo : "required",
				accountOpenCtfType : "required",
				accountOpenCtfNo : "required",
				accountRemainPhone : "required",
				settleType : "required",
				settleCycle : "required",
				//minSettleAmount:"required",
				//maxSettleAmount:"required",
				//riskStorageDays : "required",
				assumeFeeFlag : "required"
			},
			messages : {

			},
			errorPlacement : function(error, element) {
				error.appendTo(element.parent());
			},
			submitHandler : function(form) {
				showCover();
				var url="<%=request.getContextPath()%>/mersettleinfo/add";
				$.post(url,$(document._info_form_).serialize(),function(res){
					if(res.err==false){
						alert("设置成功");
						location.replace("<%=request.getContextPath()%>/cbMerchant/queryMerchant") ;
					}else{
						alert(res.msg);
					}
					hideCover();
				});
				//form.submit();
			}
		});

		$(":Radio[name='settleCycle']").click(
				function() {
					//已有的input
					$(this).parent().find("input[name='number']").attr(
							'readonly', 'readonly').map(function() {
						var defaultVal = $(this)[0].defaultValue;
						$(this).val(defaultVal);
					});
					$(this).next("input[name='number']").removeAttr('readonly')
							.val("").focus();
				});
	});

</script>

</html>
