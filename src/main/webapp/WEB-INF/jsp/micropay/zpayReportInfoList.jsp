<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="text/css">
.table-nowrap {
	white-space: nowrap;
}
</style>
<style type="text/css">
.border0 {
	overflow: auto !important;
}

.border0 th, .border0 td {
	white-space: nowrap;
}
</style>
<style type="text/css">
        .overflow {
            max-height: 256px;
        }

        #cover {
            position: fixed;
            z-index: 1000;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            background-color: #000000;
            filter: alpha(opacity=0.7); /*IE滤镜，透明度50%*/
            -moz-opacity: 0.7; /*Firefox私有，透明度50%*/
            opacity: 0.7; /*其他，透明度50%*/
            text-align: center;
        }

        #cover img {
            position: absolute;
            top: 40%;
            left: 40%;
            width: 20%;
            height: 10%;
            margin-top: -15px;
            margin-left: -15px;
        }
		#mRIF  input[readonly="readonly"],#rRIF input[readonly="readonly"]{
			background: white;
		}
		#mRIF  input[readonly="readonly"],#rRIF input[readonly="readonly"]:HOVER{
			cursor: default;
		}
    </style>
    <script type="text/javascript">
        function showCover() {
            $("#cover").css("display", '');
        }
        function hideCover() {
            $("#cover").css("display", 'none');
        }
    </script>
<title>商户报备信息查询</title>
</head>
<script type="text/javascript">
    function formSubmit() {
        $("#queryForm").submit();
    }
</script>
<body class=" ">
<div id="cover" style="display: none;">
    <img src="<%=request.getContextPath() %>/statics/v2/images/wait_processing.gif">
</div>
	<!-- 头部 -->
	<jsp:include page="../include/top.jsp" />
	<div id="wrapper">
		<div>
			<jsp:include page="../include/bottom.jsp" />
			<!-- 左侧内容 -->
			<jsp:include page="../include/left.jsp" />
			<!--右侧内容 start-->
			<div id="page-wrapper">
				<!--BEGIN TITLE & BREADCRUMB PAGE-->
				<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
					<ol class="breadcrumb page-breadcrumb">
						<li><i class="fa fa-home"></i>&nbsp;<a
							href="<%=request.getContextPath()%>/main/toMain.do">首页</a>&nbsp;&nbsp;<i
							class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li>微支付管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li>商户报备信息查询&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
					</ol>

					<div class="clearfix"></div>
				</div>
				<!--END TITLE & BREADCRUMB PAGE-->
				<!--BEGIN CONTENT-->
				<div class="page-content">

					<!--这是查询模块开始-->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h2 class="panel-title">查询</h2>
						</div>
						<div class="panel-body">
							<form id="queryForm"
								action="<%=request.getContextPath()%>/ztrade/zpayReportInfoQuery"
								method="post" enctype="multipart/form-data"
								class="form-horizontal ">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />
								<div class="row">
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">商户编号</td>
												<td><input type="text" maxlength="32" id="merchantNo"
													name="merchantNo" value="${zpayReportInfo.merchantNo}"
													class="form-control"></td>
											</tr>
										</table>
									</div>
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">企业ID</td>
												<td><input type="text" maxlength="32" id="companyId"
													name="companyId" value="${zpayReportInfo.companyId}"
													class="form-control"></td>
											</tr>
										</table>
									</div>
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">公司全称</td>
												<td><input type="text" maxlength="32"
													id="merchantFullName" name="merchantFullName"
													value="${zpayReportInfo.merchantFullName}"
													class="form-control"></td>
											</tr>
										</table>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">支付显示名称</td>
												<td><input type="text" maxlength="32"
													id="displayShortName" name="displayShortName"
													value="${zpayReportInfo.displayShortName}"
													class="form-control"></td>
											</tr>
										</table>
									</div>
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">通道名称</td>
												<td><select class="form-control" id="reportChannel"
													name="reportChannel">
														<option
															<c:if test="${zpayReportInfo.reportChannel==''}">selected='selected'</c:if>
															value="">全部
												</select></td>
											</tr>
										</table>
									</div>
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">三级商户号</td>
												<td><input type="text" maxlength="32"
													id="thirdMerchantId" name="thirdMerchantId"
													value="${zpayReportInfo.thirdMerchantId}"
													class="form-control"></td>
											</tr>
										</table>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" style="text-align: center;">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">支付方式</td>
												<td><select class="form-control" id="reportPayMethod"
													name="reportPayMethod">
														<option <c:if test="${zpayReportInfo.reportPayMethod==''}">selected="selected"</c:if> value="">全部
														<option <c:if test="${zpayReportInfo.reportPayMethod=='WEIXINPAY'}">selected="selected"</c:if> value="WEIXINPAY">微信
														<option <c:if test="${zpayReportInfo.reportPayMethod=='ALIPAY'}">selected="selected"</c:if> value="ALIPAY">支付宝
														<option <c:if test="${zpayReportInfo.reportPayMethod=='QQ_WALLET'}">selected="selected"</c:if> value="QQ_WALLET">QQ钱包
														<option <c:if test="${zpayReportInfo.reportPayMethod=='BAIDU_WALLET'}">selected="selected"</c:if> value="BAIDU_WALLET">百度钱包
														<option <c:if test="${zpayReportInfo.reportPayMethod=='JD_WALLET'}">selected="selected"</c:if> value="JD_WALLET">京东钱包
												</select></td>
											</tr>
										</table>
									</div>
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" style="text-align: center;"> 
										
									</div>
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" style="text-align: center;">
										<table width="100%" class="product_detail_list">
											<tr>
												<td>
													<button type="submit" id="btnSubmit"
														class="btn btn-primary">
														<i class="fa fa-search"></i> 查询
													</button>
												</td>
												<td></td>
											</tr>
										</table>
									</div>
								</div>
								
							</form>
							<div class="row">
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" style="text-align: center;">
									<table width="100%" class="product_detail_list">
											<tr>
												<td><a style="cursor: pointer;text-decoration:underline;" href="<%=request.getContextPath()%>/statics/v2/model/report_info_ainong.xlsx">直销商户模板</a></td>
												<td><a style="cursor: pointer;text-decoration:underline;" href="<%=request.getContextPath()%>/statics/v2/model/report_info_hualala.xlsx">哗啦啦模板</a></td>
											</tr>
										</table>
									</div>
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" style="text-align: center;"> 
										<table width="100%" class="product_detail_list">
											<tr>
												<td><a style="cursor: pointer;text-decoration:underline;" href="<%=request.getContextPath()%>/statics/v2/model/address_code.xlsx">地区编码</a></td>
												<td><a style="cursor: pointer;text-decoration:underline;" href="<%=request.getContextPath()%>/statics/v2/model/catogaryV1.0.xlsx">行业类别编码</a></td>
											</tr>
										</table>
									</div>
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" style="text-align: center;">
										
									</div>
								</div>
						</div>
					</div>
					<!--这是查询模块结束-->
					<!--这是列表模块开始-->
					<div class="panel panel-default clearfix">
						<header class="panel-heading clearfix">
							<h2 class="panel-inner-title02">
								列表 <a
									href="<%=request.getContextPath()%>/ztrade/toImportExcelForReport"
									class="pull-right btn btn-primary">批量导入商户报备</a>
								<%--<a href="<%=request.getContextPath() %>/static/ztrade/newZpayReportInfo" class="pull-right btn btn-primary">报备/录入</a>--%>
								<a href="javascript:formSubmit()" class="pull-right"><i
									class="fa fa-refresh"></i>刷新</a>
							</h2>
						</header>
						<div class="panel-body clearfix">
							<div class="table-responsive border0">
								<table id="result_tab" class="table table-hover table-nowrap">
									<thead>
										<tr>
											<th>操作</th>
											<th>商户编号</th>
											<th>企业ID</th>
											<th>三级商户号</th>
											<!-- <th>一户一码标识</th> -->
											<th>公司全称</th>
											<th>支付显示名称</th>
											<th>商户状态</th>
											<th>公众号申请标记</th>
											<th>APP申请标记</th>
											<th>公司法人</th>
											<td>客服电话</td>
											<th>联系人</th>
											<!--  
                                        <td>联系人电话</td>
                                        <td>公司地址</td>
                                        <td>email</td>
                                        -->
											<th>通道名称</th>
											<th>支付方式</th>
											<th>通道商户号</th>
											<th>公众号ID</th>
											<th>APP支付ID</th>
											<th>支付授权目录</th>
											<th>模式</th>
											<%--<th>备注</th>--%>
											<th>商户识别码</th>
											<th>报备描述</th>
											<th>备注</th>
											<th>创建时间</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${page.list}" var="report">
											<tr>
												<td><a style="cursor: pointer;color: #003bb3"
													onclick='exportApplyDoc(${fns:toJson(report)});'>导出申请表</a>&nbsp;&nbsp;
													<a style="cursor: pointer;color: #003bb3"
													onclick='resendApplyDoc(${fns:toJson(report)});'>重新报备</a>&nbsp;&nbsp;
													<c:if test="${fn:startsWith(report.reportChannel,'CMBC' and report.merchantStatus=='SUCCESS')}">
														<a style="cursor: pointer;color: #003bb3" onclick='modifyApplyDoc(${fns:toJson(report)});'>通道数据变更</a>&nbsp;&nbsp;
													</c:if>
													<c:if test="${fn:startsWith(report.reportChannel,'CMBC') and report.reportPayMethod=='WEIXINPAY' and report.merchantStatus=='SUCCESS'}">
														<a href="#" style="color: #003bb3" onclick='pubNumApply(${fns:toJson(report)});'>公众号报备</a>
													</c:if>
													<c:if test="${(report.reportChannel=='CMB1001' or report.reportChannel=='SPDB1002') and report.reportPayMethod=='WEIXINPAY' and report.merchantStatus=='SUCCESS'}">
														<a href="#" style="color: #003bb3" onclick='pubNumApply(${fns:toJson(report)});'>公众号报备</a>
													</c:if>
													</td>
													
												<td>${report.merchantNo}</td>
												<td>${report.companyId}</td>
												<td>${report.thirdMerchantId}</td>
												<!-- <td>${report.singleBizCodeFlag}</td> -->
												<td>${report.merchantFullName}</td>
												<td>${report.displayShortName}</td>
												<td>
													<%--${report.merchantStatus}--%>
                                                    <c:if test="${report.merchantStatus=='1'||report.merchantStatus=='SUCCESS'}">成功&nbsp;&nbsp;<a href="#" style="color: #003bb3" onclick='changeMerchantStatus("FORBID",${fns:toJson(report)});'>(禁用)</a></c:if>
                                                    <c:if test="${report.merchantStatus=='ENSURING'}">认证中&nbsp;&nbsp;<a href="#" style="color: #003bb3" onclick='changeMerchantStatus("SUCCESS",${fns:toJson(report)});'>(认证通过)</a></c:if>
                                                    <c:if test="${report.merchantStatus=='0'||report.merchantStatus=='PROCESSING'}">报备中</c:if>
                                                    <c:if test="${report.merchantStatus=='-1'||report.merchantStatus=='FAIL'}">失败</c:if>
                                                    <c:if test="${report.merchantStatus=='INIT'}">初始化</c:if>
                                                    <c:if test="${report.merchantStatus=='FORBID'}">禁用&nbsp;&nbsp;<a href="#" style="color: #003bb3" onclick='changeMerchantStatus("SUCCESS",${fns:toJson(report)});'>(启用)</a></c:if>
													<c:if test="${report.merchantStatus=='ADD_PRODUCT'}">支付方式添加失败&nbsp;&nbsp;<a href="#" style="color: #003bb3" onclick='changeMerchantStatus("SUCCESS",${fns:toJson(report)});'>(启用)</a></c:if>
												</td>
												<td><c:if test="${report.appIdApplyFlag!='S' and report.appIdApplyFlag!='D' and report.appIdApplyFlag!='W' and report.appIdApplyFlag!='P'  and  report.appIdApplyFlag!='F' }">${report.appIdApplyFlag }</c:if>
													<c:if test="${report.appIdApplyFlag=='S'}">申请成功</c:if>
													<c:if test="${report.appIdApplyFlag=='P'}">申请中</c:if> 
													<c:if test="${report.appIdApplyFlag=='D'}">待申请</c:if>
													<c:if test="${report.appIdApplyFlag=='F'}">失败</c:if> 
													<c:if test="${report.appIdApplyFlag=='W'}">无需申请</c:if>&nbsp;
													<a href="#" style="color: #003bb3" onclick='changeApplyFlag("pub",${fns:toJson(report)});'>(修改)</a></td>
												<td><c:if test="${report.appPayIdApplyFlag!='S' and report.appPayIdApplyFlag!='D' and report.appPayIdApplyFlag!='W' and report.appPayIdApplyFlag!='P'  and  report.appPayIdApplyFlag!='F' }">${report.appPayIdApplyFlag }</c:if>
													<c:if test="${report.appPayIdApplyFlag=='S'}">申请成功</c:if>
													<c:if test="${report.appPayIdApplyFlag=='P'}">申请中</c:if> 
													<c:if test="${report.appPayIdApplyFlag=='D'}">待申请</c:if>
													<c:if test="${report.appPayIdApplyFlag=='F'}">失败</c:if> 
													<c:if test="${report.appPayIdApplyFlag=='W'}">无需申请</c:if>&nbsp;
													<a href="#" style="color: #003bb3" onclick='changeApplyFlag("app",${fns:toJson(report)});'>(修改)</a></td>
												<td>${report.legalName}</td>
												<td>${report.serviceContactPhone}</td>
												<td>${report.bizContactName}</td>
												<!--  
                                        <td>${report.bizContactPhone}</td>
                                        <td>${report.merchantAddress}</td>
                                        <td>${report.bizContactEmail}</td>
                                        -->
												<td>${report.p_ChannelName}</td>
												<td>
                                                    <c:if test="${report.reportPayMethod=='WEIXINPAY'}">微信</c:if>
                                                    <c:if test="${report.reportPayMethod=='ALIPAY'}">支付宝</c:if>
                                                    <c:if test="${report.reportPayMethod=='QQ_WALLET'}">QQ钱包</c:if>
                                                    <c:if test="${report.reportPayMethod=='BAIDU_WALLET'}">百度钱包</c:if>
                                                    <c:if test="${report.reportPayMethod=='JD_WALLET'}">京东钱包</c:if>
                                                </td>
												<td>${report.bankMerchantCode}</td>
												<td>${report.appId}</td>
												<td>${report.appPayId}</td>
												<td>${report.payAuthCatalog}</td>
												<td>
													<%--${report.patternMark}--%> <c:if
														test="${report.patternMark=='CHANNEL'}">渠道模式</c:if> <c:if
														test="${report.patternMark=='EVERY_CODE'}">一户一码</c:if> <c:if
														test="${report.patternMark=='BIG_MERCHANT'}">大商户</c:if> <c:if
														test="${report.patternMark!='EVERY_CODE' && report.patternMark!='CHANNEL'}">其他</c:if>
												</td>
												<td>${report.bankMarkCode}</td>
												<td>${report.bankMessage}</td>
												<td>${report.description}</td>
												<td>${report.createTime}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<jsp:include page="../include/page.jsp" />
				</div>
				<!--这是列表模块结束-->
			</div>
			<!--End CONTENT-->
		</div>
		<!--右侧内容 end-->
	</div>
	<div style="display: none;">
		<form id="zpayReportInfoModify" style="display: none;">
			<input type="hidden" name="id">
			<div class="form-group">
				<label class="col-lg-5" style="margin: 4px 0 0">一户一码标识</label>
				<div class="form-control" style="width: 90% !important;">
					<input type="Radio" value="Y" name="singleBizCodeFlag">是<input
						type="Radio" value="N" name="singleBizCodeFlag">否
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-5" style="margin: 4px 0 0">支付显示名称</label> <input
					class="form-control" style="width: 90% !important;" type="text"
					name="displayShortName">
			</div>
			<div class="form-group">
				<label class="col-lg-5" style="margin: 4px 0 0">通道商户号</label> <input
					class="form-control" style="width: 90% !important;" type="text"
					name="bankMerchantCode">
			</div>
			<div class="form-group">
				<label class="col-lg-5" style="margin: 4px 0 0">公众号ID</label> <input
					class="form-control" style="width: 90% !important;" type="text"
					name="appId">
			</div>
			<div class="form-group">
				<label class="col-lg-5" style="margin: 4px 0 0">APP支付ID</label> <input
					class="form-control" style="width: 90% !important;" type="text"
					name="appPayId">
			</div>
			<div class="form-group">
				<label class="col-lg-5" style="margin: 4px 0 0">支付授权目录</label> <input
					class="form-control" style="width: 90% !important;" type="text"
					name="payAuthCatalog">
			</div>
		</form>
	</div>
	<div style="display: none;">
		<form action="#" id="mRIF" name="mRIF">
			<input type="hidden" name="id">
			<table style="width:100%;">
				<tr>
					<td>商户编号</td>
					<td><span id="mRIF_merchantNo"></span></td>
				</tr>
				<tr>
					<td>公司全称</td>
					<td><span id="mRIF_merchantFullName"></span></td>
				</tr>
				<tr>
					<td>企业ID</td>
					<td><span id="mRIF_companyId" ></span></td>
				</tr>
				<tr>
					<td>三级商户ID</td>
					<td><span id="mRIF_thirdMerchantId" ></span></td>
				</tr>
				<tr>
					<td>通道名称</td>
					<td><span id="mRIF_p_ChannelName" ></span></td>
				</tr>
				<tr>
					<td>支付方式</td>
					<td><span id="mRIF_reportPayMethod" ></span></td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td>支付显示名称</td>
					<td><input type="text"  class="form-control"
						name="displayShortName" ></td>
				</tr>
				<tr>
					<td>公司地址</td>
					<td><input type="text"  class="form-control"
						name="merchantAddress"></td>
				</tr>
				
				<tr>
					<td>省份编码</td>
					<td><input type="text" class="form-control"
						name="provinceId" ></td>
				</tr>
				<tr>
					<td>城市编码</td>
					<td><input type="text" class="form-control"
						name="cityId" ></td>
				</tr>
				<tr>
					<td>区县编码</td>
					<td><input type="text" class="form-control"
						name="districtId"></td>
				</tr>
				
				<tr>
					<td>客服电话</td>
					<td><input type="text" class="form-control"
						name="serviceContactPhone"></td>
				</tr>
				<tr>
					<td>法人名称</td>
					<td><input type="text" class="form-control"
						name="legalName"></td>
				</tr>
				<tr>
					<td>法人身份证号</td>
					<td><input type="text" class="form-control"
						name="legalIdCard"></td>
				</tr>
			</table>
		</form>
	</div>
	<div style="display: none;">
		<form action="#" id="rRIF" name="rRIF">
			<input type="hidden" name="id">
			<table style="width:100%;">
				<tr>
					<td>商户编号</td>
					<td><span id="rRIF_merchantNo"></span></td>
				</tr>
				<tr>
					<td>公司全称</td>
					<td><span id="rRIF_merchantFullName"></span></td>
				</tr>
				<tr>
					<td>企业ID</td>
					<td><span id="rRIF_companyId" ></span></td>
				</tr>
				<tr>
					<td>三级商户ID</td>
					<td><span id="rRIF_thirdMerchantId" ></span></td>
				</tr>
				<tr>
					<td>通道名称</td>
					<td><span id="rRIF_p_ChannelName" ></span></td>
				</tr>
				<tr>
					<td>支付方式</td>
					<td><span id="rRIF_reportPayMethod" ></span></td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td>支付显示名称</td>
					<td><input type="text"  class="form-control"
						name="displayShortName" ></td>
				</tr>
				<tr>
					<td>公司地址</td>
					<td><input type="text"  class="form-control"
						name="merchantAddress"></td>
				</tr>
				
				<tr>
					<td>省份编码</td>
					<td><input type="text" class="form-control"
						name="provinceId" ></td>
				</tr>
				<tr>
					<td>城市编码</td>
					<td><input type="text" class="form-control"
						name="cityId" ></td>
				</tr>
				<tr>
					<td>区县编码</td>
					<td><input type="text" class="form-control"
						name="districtId"></td>
				</tr>
				
				<tr>
					<td>客服电话</td>
					<td><input type="text" class="form-control"
						name="serviceContactPhone"></td>
				</tr>
				<tr>
					<td>法人名称</td>
					<td><input type="text" class="form-control"
						name="legalName"></td>
				</tr>
				<tr>
					<td>法人身份证号</td>
					<td><input type="text" class="form-control"
						name="legalIdCard"></td>
				</tr>
				<tr>
					<td>公众号ID(微信)</td>
					<td><input type="text" class="form-control"
						name="appId"></td>
				</tr>
				<tr>
					<td>APP ID(微信)</td>
					<td><input type="text" class="form-control"
						name="appPayId"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<style type="text/css">
#mRIF table, #mRIF table tr {
	width: 99%;
}
</style>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/statics/v2/js/jquery.acronymword.js"></script>
<script type="text/javascript">
	function format(str){
		return str==undefined?"":str;
	}
	function loadReportChannel(){
		var selectedChannelNo="${zpayReportInfo.reportChannel}";
		var url="<%=request.getContextPath()%>/static/micropay/getZpayChannel";
		$.post(url,{},function(channels){
			$("#reportChannel option:not(:first)").remove();
			for(var i in channels){
				var channel = channels[i];
				var val=channel.channelNo;
    			var name=channel.channelName;
    			var selected=(selectedChannelNo==channel.channelNo);
    			var disabled=(channel.status!='VALID');
                var stylel ;
                if (channel.status!='VALID'){
                    stylel = 'color:red';
                }else {
                    stylel ='';
                }
    			$("#reportChannel").append("<option style='"+stylel+"' value='"+val+"' "+(disabled?'disabled':'')+(selected?' selected':'')+">"+name);
			}
		});
	}
	$(document).ready(function(){
		loadReportChannel();
    });
    function modifyZpayReportInfo(report){
    	//重置表单
    	$("#zpayReportInfoModify")[0].reset();
    	//赋值
    	$("#zpayReportInfoModify")[0].id.value=format(report.id);
    	$("#zpayReportInfoModify")[0].singleBizCodeFlag.value=format(report.singleBizCodeFlag);
    	$("#zpayReportInfoModify")[0].displayShortName.value=format(report.displayShortName);
    	$("#zpayReportInfoModify")[0].bankMerchantCode.value=format(report.bankMerchantCode);
    	$("#zpayReportInfoModify")[0].appId.value=format(report.appId);
    	$("#zpayReportInfoModify")[0].appPayId.value=format(report.appPayId);
    	$("#zpayReportInfoModify")[0].payAuthCatalog.value=format(report.payAuthCatalog);
    	
    	$("#zpayReportInfoModify").dialog({
    		autoOpen:true,
    		modal:true,
    		width:400,
    		height:500,
    		buttons:{
    			"取消":function(){
    				$("#zpayReportInfoModify").dialog("close");
    				$("#zpayReportInfoModify")[0].reset();
    			},
    			"确定":function(){
    				//请求update
    				var url = "<%=request.getContextPath()%>/ztrade/zpayReportInofModify";
    				var params = $("#zpayReportInfoModify").serialize();
    				$.post(url,params,function(res){
    					if(res.err==false){
    						alert("修改成功");
    						formSubmit();
    					}else{
    						alert(res.msg);
    					}
    				});
    			}
    		}
    	});
    }
    /**
    *导出申请表
    **/
    function exportApplyDoc(ri){
    	var sup=ri.supportTemplet;
    	var sapp=false;
    	var spub=false;
    	if(sup.length>0){
    		if(sup.indexOf("PUB")>-1){
    			spub=true;
    		}
    		if(sup.indexOf("APP")>-1){
    			sapp=true;
    		}
    	}
    	var url="<%=request.getContextPath()%>/static/micropay/reportInfoExport?id="+ri.id+"&method=";
    	var pub=url+"PUB";
    	var app=url+"APP";
    	$('<div style="text-align:center;"></br>'+(spub?'<a target="_blank" href="'+pub+'">公众号申请表</a></br>':'')+(sapp?'</br><a  target="_blank" href="'+app+'">APP申请表</a>':'')+(!(sapp||spub)?'<h3>暂时不支持导出模板</h3>':'')+'</br></br></div>').dialog({
    		autoOpen:true,
    		modal:true,
    		minHeight:"200px",
    		close:function(){
    			$(this).remove();
    		}
    	});
    }
    function format(str){
    	return (str==undefined&&str==null)?"":str;
    }
    
    /*
     **重新申报报备信息
     */
     function resendApplyDoc(ri){
     	document.rRIF.reset();
     	//赋值
     	document.rRIF.id.value=format(ri.id);
     	$("#rRIF_merchantNo").text(format(ri.merchantNo));
     	$("#rRIF_merchantFullName").text(format(ri.merchantFullName));
     	$("#rRIF_companyId").text(format(ri.companyId));
     	$("#rRIF_thirdMerchantId").text(format(ri.thirdMerchantId));
     	$("#rRIF_reportPayMethod").text(format(ri.reportPayMethod));
     	$("#rRIF_p_ChannelName").text(format(ri.p_ChannelName));
     	
     	
     	document.rRIF.displayShortName.value=format(ri.displayShortName);
     	document.rRIF.serviceContactPhone.value=format(ri.serviceContactPhone);
     	document.rRIF.merchantAddress.value=format(ri.merchantAddress);
     	document.rRIF.legalName.value=format(ri.legalName);
     	document.rRIF.legalIdCard.value=format(ri.legalIdCard);
     	document.rRIF.provinceId.value=format(ri.provinceId);
     	document.rRIF.cityId.value=format(ri.cityId);
     	document.rRIF.districtId.value=format(ri.districtId);
     	
     	document.rRIF.appId.value=format(ri.appId);
     	document.rRIF.appPayId.value=format(ri.appPayId);
     	
     	$(document.rRIF).dialog({
     		title:"重新申报信息",
     		autoOpen:true,
     		modal:true,
     		width:"400px",
     		buttons:{
     			"确定":function(){
     				//校验
     				showCover();
     				var dialog=$(this);
     				//submit
     				var url="<%=request.getContextPath()%>/static/mptrade/zpayReportInofResend";
     				var params=$(document.rRIF).serialize();
     				$.post(url,params,function(res){
     					if(res.err==false){
 							alert("重新申报提交成功");
 							formSubmit();
 						}else{
 							alert(res.msg);
 						}
     					dialog.dialog("close");
     					formSubmit();
     				});
     			},
     			"取消":function(){
     				$(this).dialog("close");
     			}
     		},
     		close:function(){
     			hideCover();
     		}
     	});
     }
    /*
    **修改报备信息
    */
    function modifyApplyDoc(ri){
    	document.mRIF.reset();
    	//赋值
    	document.mRIF.id.value=format(ri.id);
    	$("#mRIF_merchantNo").text(format(ri.merchantNo));
     	$("#mRIF_merchantFullName").text(format(ri.merchantFullName));
     	$("#mRIF_companyId").text(format(ri.companyId));
     	$("#mRIF_thirdMerchantId").text(format(ri.thirdMerchantId));
     	$("#mRIF_reportPayMethod").text(format(ri.reportPayMethod));
     	$("#mRIF_p_ChannelName").text(format(ri.p_ChannelName));
     	
    	
    	document.mRIF.displayShortName.value=format(ri.displayShortName);
    	document.mRIF.serviceContactPhone.value=format(ri.serviceContactPhone);
    	document.mRIF.merchantAddress.value=format(ri.merchantAddress);
    	document.mRIF.legalName.value=format(ri.legalName);
    	document.mRIF.legalIdCard.value=format(ri.legalIdCard);
    	document.mRIF.provinceId.value=format(ri.provinceId);
    	document.mRIF.cityId.value=format(ri.cityId);
    	document.mRIF.districtId.value=format(ri.districtId);
    	$(document.mRIF).dialog({
    		title:"修改申报信息",
    		autoOpen:true,
    		modal:true,
    		width:"400px",
    		buttons:{
    			"确定":function(){
    				showCover();
    				var dialog=$(this);
    				//submit
    				var url="<%=request.getContextPath()%>/static/mptrade/zpayReportInofModify";
    				var params=$(document.mRIF).serialize();
    				$.post(url,params,function(res){
    					if(res.err==false){
							alert("修改成功");
							formSubmit();
						}else{
							alert(res.msg);
						}
    					dialog.dialog("close");
    					formSubmit();
    				});
    			},
    			"取消":function(){
    				$(this).dialog("close");
    			}
    		},
    		close:function(){
    			hideCover();
    		}
    	});
    }
    function changeApplyFlag(type,ri){
    	var id=ri.id;
    	var url="<%=request.getContextPath()%>/static/mptrade/changeApplyFlag";
    	var div=$("<div></div>");
    	var select = $('<select class="form-control"></select>');
    	select.append('<option value="">请选择');
    	select.append('<option value="D">待申请');
		select.append('<option value="S">申请成功');
		select.append('<option value="P">申请中');
		select.append('<option value="F">失败');
		select.append('<option value="W">无需申请');
		div.append(select);
    	if(type=='pub'){
    		select.val(ri.appIdApplyFlag);
    	}else if(type="app"){
    		select.val(ri.appPayIdApplyFlag);
    	}else{
    		alert("操作错误");
    		return;
    	}
    	div.dialog({
			autoOpen:true,
			modal:true,
			buttons:{
				"确认":function(){
					var dia=$(this);
					var val=select.val();
					$.post(url,{id:id,type:type,value:val},function(res){
						if(res.err==false){
							alert("修改成功");
							formSubmit();
						}else{
							alert(res.msg);
						}
						dia.dialog("close");
					});
				},
				"取消":function(){
					$(this).dialog("close");
				}
			},
			close:function(){
				$(this).remove();
			}
		});
    }
    function changeMerchantStatus(merchantStatus,ri){
    	var id=ri.id;
    	var url="<%=request.getContextPath()%>/static/mptrade/changeMerchantStatus";
    	$.post(url,{id:id,merchantStatus:merchantStatus},function(res){
			if(res.err==false){
				alert("修改成功");
				formSubmit();
			}else{
				alert(res.msg);
			}
		});
    }

    function addProduct(ri) {
        var id = ri.id;
        var url="<%=request.getContextPath()%>/microPay/addProduct";
        $.post(url,{id:id},function(res){
            if(res.err==false){
                alert("添加成功");
                formSubmit();
            }else{
                alert(res.msg);
            }
        });
    }

    function pubNumApply(ri){
    	var count=0;
    	$("#pubNumApply").find("input[type=text]").each(function(){
    		$(this).attr("disabled","disabled");
    	});
    	$("#pubNumApply").find("input[type=Checkbox]").each(function(){
    		$(this).change(function(){
    			var check=$(this).attr("checked")=="checked";
    			var name = $(this).val();
    			var dom;
    			if(name=="WX_PAY_AUTH_CATALOG"){
    				dom=document._form_pubNumApply_.payAuthCatalog;
    			}else if(name=="WX_BIND_PUB_NUM"){
    				dom=document._form_pubNumApply_.appId;
    			}
    			if(dom!=undefined){
    				if(check){
    					count++;
    					$(dom).removeAttr("disabled");
    				}else{
    					count--;
    					$(dom).val("");
    					$(dom).attr("disabled","disabled");
    				}
    			}
    		});
    	});
    	$("#pubNumApply")[0].reset();
    	$("#pubNumApply").dialog({
    		title:"公众号报备",
    		autoOpen:true,
    		modal:true,
    		width:"500px",
    		buttons:{
    			"确定":function(){
    				document._form_pubNumApply_.id.value=ri.id;
    				var params = $("#pubNumApply").serialize();
    				if(count==0){
    					alert("请选择要报备的选项");
    					return ;
    				}
    				var url ='<%=request.getContextPath()%>/static/ztrade/reportInfo/pubNumApply';
    				$.post(url,params,function(res){
    					if(res.err==false){
    						alert("报备成功");
    						formSubmit();
    					}else{
    						alert(res.msg);
    					}
    				});
    			},
    			"取消":function(){
    				$("#pubNumApply").dialog("close");
    			}
    		}
    	});
    }
</script>
<div>
	<form id="pubNumApply" name="_form_pubNumApply_" action="#" style="display: none;">
		<input type="hidden" name="id">
		<div  style="border: solid 1px black; width: 100%;margin-top: 5px;padding: 5px;">
			<font color="black" style="position: relative; top: -13px; left: 1px; background-color: White">&nbsp;微信&nbsp;</font>
			<table style="width: 100%;">
				<tr>
					<td style="width: 120px;"><input type="Checkbox" name="merchantConfigType" value="WX_PAY_AUTH_CATALOG">支付授权目录</td>
					<td><input type="text" name="payAuthCatalog"  disabled="disabled"  class="form-control"></td>
				</tr>
				<tr>
					<td  style="width: 120px;"><input type="Checkbox" name="merchantConfigType" value="WX_BIND_PUB_NUM">支付绑定公众号</td>
					<td><input type="text" name="appId" disabled="disabled" class="form-control"></td>
				</tr>
				<tr>
					<td><input type="Checkbox" name="merchantConfigType" value="WX_SUB_PUB_NUM">支付即关注公众号</td>
					<td style="color: red;">不需要填写(关注公众号与支付绑定公众号相同)</td>
				</tr>
			</table>
		</div>
	</form>
</div>
</html>
