<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<html lang="en">
<head>
<title>进件录入</title>
<link
	href="<%=request.getContextPath()%>/statics/v2/vendors/lightbox/css/lightbox.css"
	rel="stylesheet">

<style type="text/css">
#fee table tr td {
	white-space: nowrap;
}

.table_container {
	width: 100%;
}

.table_container tr td {
	padding-right: 5px;
}
.form-control[disabled], .form-control[readonly]{
	cursor: pointer!important;
}
.btn-succ,.btn-fail{
	min-width:100px; 
}
</style>
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
					<li><i class="fa fa-home"></i>&nbsp;<a
						href="${ctx}/main/toMain.do">首页</a>&nbsp;&nbsp;<i
						class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
					<li>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li class="active">进件信息审批</li>
				</ol>
				<div class="clearfix"></div>
			</div>
			<!--END TITLE & BREADCRUMB PAGE-->
			<!--BEGIN CONTENT-->
			<div class="page-content">
				<div class="panel panel-default  withoutbottom clearfix">
					<header class="panel-heading clearfix">
						<h2 class="panel-title">进件信息审批</h2>
					</header>

					<div class="panel-body clearfix">
						<form class="form-horizontal" role="form" method="post"
							enctype="multipart/form-data" id="subform"
							action="<%=request.getContextPath()%>/cbMerchant/toApprovalMerchantPieceInfo">
							<!--主体部分start-->
							<!-- 每个模块内容布局
							<div class="panel-inner">
								<h2 class="panel-inner-title panel-inner-title-default">商户附件上传</h2>
								<div class="panel-inner-body">
									<div class="row">
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list table_container">
                                            <tr>
                                                <td width="120" class="text-right">商户行业<span>*</span></td>
                                                <td>
                                                	
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
									</div>
								</div>
							</div>
						 -->
						 <input type="text" hidden='true' id="id" name="id" value="${merchantPieceInfo.id}" ></input>
							<div class="panel-inner">
								<h2 class="panel-inner-title panel-inner-title-default">商户基本信息</h2>
								<div class="panel-inner-body">
									<div class="row">
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-right">服务商商编</td>
													<td><input type="text" class="form-control"
														value="${merchantPieceInfo.pieceMerchantNo }"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-right">商户企业ID</td>
													<td><input type="text" class="form-control"
														value="${merchantPieceInfo.companyId }"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-right">商户三级ID</td>
													<td><input type="text" class="form-control"
														value="${merchantPieceInfo.thirdMerchantId }"></td>
												</tr>
											</table>
										</div>
										</div>
										
										
										<div class="row">
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-right">进见生成商编</td>
													<td><input type="text" class="form-control"
														value="${merchantPieceInfo.merchantNo }"></td>
												</tr>
											</table>
										</div>
										
										
										
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-right">商户名称</td>
													<td><input type="text" class="form-control"
														value="${merchantPieceInfo.merchantName }"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-right">商户简称</td>
													<td><input type="text" class="form-control"
														value="${merchantPieceInfo.merchantShortName }"></td>
												</tr>
											</table>
										</div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-right">商户类型</td>
													<td><input type="text" class="form-control"
														value="${merchantPieceInfo.merchantClass=='TO_PUBLIC_TYPE'?'对公':(merchantPieceInfo.merchantClass=='TO_PRIVATE_TYPE'?'对私':(merchantPieceInfo.merchantClass)) }"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-right">商户行业</td>
													<td><input type="text" class="form-control"
														value="${merchantPieceInfo.merchantIndustry }"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-right">商户性质</td>
													<td><input type="text" class="form-control"
														value="${merchantPieceInfo.merchantNature=='GENERAL'?'普通商户':(merchantPieceInfo.merchantNature=='LEAGUE'?'加盟商':(merchantPieceInfo.merchantNature=='PERSONAL'?'个人':(merchantPieceInfo.merchantNature))) }"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-right">网站域名</td>
													<td><input type="text" class="form-control"
														value="${merchantPieceInfo.websiteDomain }"></td>
												</tr>
											</table>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-right">注册地址</td>
													<td><input type="text" class="form-control"
														value="${merchantPieceInfo.registerAddress }"></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>

							<div class="panel-inner">
								<h2 class="panel-inner-title panel-inner-title-default">商户法人/联系人信息</h2>
								<div class="panel-inner-body">
									<div class="row">
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-right">法人姓名</td>
													<td><input type="text" class="form-control"
														value="${merchantPieceInfo.legalPerson }"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-right">法人证件号</td>
													<td><input type="text" class="form-control"
														value="${merchantPieceInfo.legalPerCtfNo }"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-right">法人联系方式</td>
													<td><input type="text" class="form-control"
														value="${merchantPieceInfo.legalPerPhoneNo }"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-right">业务联系人</td>
													<td><input type="text" class="form-control"
														value="${merchantPieceInfo.merchantContactPerson }"></td>
												</tr>
											</table>
										</div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-right">业务联系方式</td>
													<td><input type="text" class="form-control"
														value="${merchantPieceInfo.merchantContactPhone }"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-right">业务联系邮箱</td>
													<td><input type="text" class="form-control"
														value="${merchantPieceInfo.merchantContactEmail }"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-right">客服电话</td>
													<td><input type="text" class="form-control"
														value="${merchantPieceInfo.servicePhone }"></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>

							<div class="panel-inner">
								<h2 class="panel-inner-title panel-inner-title-default">结算信息</h2>
								<div class="panel-inner-body">
									<div class="row">
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-right">手续费收取方</td>
													<td><input type="text" class="form-control"
														value="${merchantPieceInfo.feePayType=='REAL_TIME'?'实收':(merchantPieceInfo.feePayType=='LATER'?'后收':(merchantPieceInfo.feePayType)) }"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-right">账户类型</td>
													<td><input type="text" class="form-control"
														value="${merchantPieceInfo.accountType=='PUBLIC'?'对公':(merchantPieceInfo.accountType=='PRIVATE'?'对私':(merchantPieceInfo.accountType=='PASSPORT'?'存折':(merchantPieceInfo.accountType))) }"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-right">开户行全称</td>
													<td><input type="text" class="form-control"
														value="${merchantPieceInfo.bankAddress}"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-right">账户名</td>
													<td><input type="text" class="form-control"
														value="${merchantPieceInfo.accountName}"></td>
												</tr>
											</table>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-right">账号</td>
													<td><input type="text" class="form-control"
														value="${merchantPieceInfo.accountNo}"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-right">开户证件号</td>
													<td><input type="text" class="form-control"
														value="${merchantPieceInfo.accountOpenCtfNo}"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-right">开户预留手机号</td>
													<td><input type="text" class="form-control"
														value="${merchantPieceInfo.accountRemainPhone}"></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="panel-inner">
								<h2 class="panel-inner-title panel-inner-title-default">业务信息</h2>
								<div class="panel-inner-body">
									<div class="row">
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-right">开通产品</td>
													<td><textarea readonly="readonly" class="form-control" rows="1" cols="50">${merchantPieceInfo.product }</textarea></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="panel-inner">
								<h2 class="panel-inner-title panel-inner-title-default">附件/图片</h2>
								<div class="panel-inner-body">

									<div class="row">
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-center">法人证件照-正面</td>
												</tr>
												<tr>
													<td class="text-center"><a
														href="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.legalPerCtfPath }"
														data-lightbox="accessory-pic" data-title="法人证件照-正面"> <img
															src="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.legalPerCtfPath }"
															width="95%" height="95%">
													</a></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-center">法人证件照-反面</td>
												</tr>
												<tr>
													<td class="text-center"><a
														href="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.legalPersonPicBack }"
														data-lightbox="accessory-pic" data-title="法人证件照-反面"> <img
															src="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.legalPersonPicBack }"
															width="95%" height="95%">
													</a></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-center">营业执照</td>
												</tr>
												<tr>
													<td class="text-center"><a
														href="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.busLicenceCftPath }"
														data-lightbox="accessory-pic" data-title="营业执照"> <img
															src="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.busLicenceCftPath }"
															width="95%" height="95%">
													</a></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-center">开户许可证</td>
												</tr>
												<tr>
													<td class="text-center"><a
														href="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.accountOpenCtfPath }"
														data-lightbox="accessory-pic" data-title="开户许可证"> <img
															src="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.accountOpenCtfPath }"
															width="95%" height="95%">
													</a></td>
												</tr>
											</table>
										</div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-center">组织机构代码证</td>
												</tr>
												<tr>
													<td class="text-center"><a
														href="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.orgCodeCtfPath }"
														data-lightbox="accessory-pic" data-title="组织机构代码证"> <img
															src="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.orgCodeCtfPath }"
															width="95%" height="95%">
													</a></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-center">税务登记证</td>
												</tr>
												<tr>
													<td class="text-center"><a
														href="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.taxRegCtfPath }"
														data-lightbox="accessory-pic" data-title="税务登记证"> <img
															src="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.taxRegCtfPath }"
															width="95%" height="95%">
													</a></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-center">食品经营许可证</td>
												</tr>
												<tr>
													<td class="text-center"><a
														href="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.foodBusPermissionCtf }"
														data-lightbox="accessory-pic" data-title="食品经营许可证"> <img
															src="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.foodBusPermissionCtf }"
															width="95%" height="95%">
													</a></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-center">门脸照</td>
												</tr>
												<tr>
													<td class="text-center"><a
														href="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.prosceniumPic }"
														data-lightbox="accessory-pic" data-title="门脸照"> <img
															src="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.prosceniumPic }"
															width="95%" height="95%">
													</a></td>
												</tr>
											</table>
										</div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-center">店内照</td>
												</tr>
												<tr>
													<td class="text-center"><a
														href="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.innerStorePic }"
														data-lightbox="accessory-pic" data-title="店内照"> <img
															src="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.innerStorePic }"
															width="95%" height="95%">
													</a></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table class="table_container">
												<tr>
													<td width="120" class="text-center">收银台照</td>
												</tr>
												<tr>
													<td class="text-center"><a
														href="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.cashierDeskPic }"
														data-lightbox="accessory-pic" data-title="收银台照"> <img
															src="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.cashierDeskPic }"
															width="95%" height="95%">
													</a></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</form>
						<c:if test="${merchantPieceInfo.pieceStatus=='WAIT' }">
							<div class="panel-inner">
								<h2 class="panel-inner-title panel-inner-title-default">操作</h2>
								<div class="panel-inner-body">
									<div class="row">
										<div class="col-12 text-center">
											<table class="table_container">
												<tr>
													<td><button class="btn btn-primary btn-succ" onclick="verifyPiece('SUCCESS');">通过</button></td>
													<td><button class="btn btn-primary btn-fail" onclick="verifyPiece('FAIL');">不通过</button></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</c:if>

						<div class="row">
							<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
								<table width="100%" class="product_detail_list">
									<tr>
										<td width="120" class="text-right"></td>
										<td>
											<input type="button" value="返回" id="btn3" onclick="javascript:history.back(-1);" class="btn btn-primary margin30" />
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--End CONTENT-->
		</div>
		<!--右侧内容 end-->


	</div>
	<link href="<%=request.getContextPath()%>/statics/v2/cover/cover.css" rel="stylesheet"/>
	<script src="<%=request.getContextPath()%>/statics/v2/cover/cover.js"></script>
	<script src="<%=request.getContextPath()%>/statics/v2/vendors/lightbox/js/lightbox.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#subform input").each(function(){
				$(this).attr("readonly",true);
			});
		});
		function verifyPiece(pieceStatus){
			var ajaxCallUrl = "<%=request.getContextPath()%>/cbMerchant/toApprovalMerchantPieceInfo";
			var id = $("#subform")[0].id.value;
			$.showcover();
			$.ajax({
		        cache: true,
		        type: "POST",
		        url:ajaxCallUrl,
		        data:{id:id,pieceStatus:pieceStatus},// 你的formid
		        async: false,
		        error: function(request) {
		            alert("Connection error");
		            $.hidecover();
		        },
		        success: function(res) {
					if(res.err==false){
						alert("操作成功！");
						window.location.href="<%=request.getContextPath()%>/cbMerchant/toMerchantPieceSearch";
					}else {
						alert(res.msg);
					}
					$.hidecover();
		        }
		    });
		}
	</script>
</body>
</html>
