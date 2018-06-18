<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp" %>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/statics/v2/css/easyzoom.css">
<html lang="en">
<head>
    <title>进件录入</title>
    <style type="text/css">
    #fee table tr td{
    	white-space: nowrap;
    }
    
    </style>
</head>

<body class=" ">
<jsp:include page="../include/top.jsp"/>
<div id="wrapper">
    <jsp:include page="../include/bottom.jsp"/>
    <!-- 左侧内容 -->
    <jsp:include page="../include/left.jsp"/>
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
                    <form class="form-horizontal" role="form" method="post" enctype="multipart/form-data" id="subform" action="<%=request.getContextPath()%>/cbMerchant/toApprovalMerchantPieceInfo">
                        <input type="text" id="customerType" name="customerType" value="${customerType}" hidden='true'></input>
                         <table width="100%" class="product_detail_list">
                          <tr>
                          <td><input type="text" id="busLicenceCftPath" hidden='true' name="busLicenceCftPath" value="${merchantPieceInfo.busLicenceCftPath}"></td>
                          <td><input type="text" id="taxRegCtfPath" hidden='true' name="taxRegCtfPath"  value="${merchantPieceInfo.taxRegCtfPath}"></td>
                          <td><input type="text" id="orgCodeCtfPath" hidden='true' name="orgCodeCtfPath"  value="${merchantPieceInfo.orgCodeCtfPath}"></td>
                          <td><input type="text" id="legalPerCtfPath"  hidden='true' name="legalPerCtfPath"  value="${merchantPieceInfo.legalPerCtfPath}"></td>
                          <td><input type="text" id="accountOpenCtfPath" hidden='true' name="accountOpenCtfPath"  value="${merchantPieceInfo.accountOpenCtfPath}"></td>
                          <td><input type="text" id="speIndusLicenceCtfPath" hidden='true' name="speIndusLicenceCtfPath"  value="${merchantPieceInfo.speIndusLicenceCtfPath}"></td>
                           </tr>
                           </table>                                                                             
                        <!--主体部分start-->

                        <div class="panel-inner">
                            <h2 class="panel-inner-title panel-inner-title-default">商户附件上传</h2>
                            <div class="panel-inner-body">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    		<div class="container form-horizontal" id="license">
                                    					
															<div class="easyzoom easyzoom--overlay" >
															 <div>营业执照</div>
															
															<a href="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.busLicenceCftPath}">
																	<img
																	src="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.busLicenceCftPath}"
																	alt="" width="300" height="200" />
																</a>
															</div>											
																							
															<div class="easyzoom easyzoom--overlay"  >
															<div>税务登记证</div>
															<a href="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.taxRegCtfPath}">
																	<img
																	src="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.taxRegCtfPath}"
																	alt="" width="300" height="200" />
																</a>
															</div>
															
															<div class="easyzoom easyzoom--overlay" >
															<div>组织机构代码证</div>
															<a href="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.orgCodeCtfPath}">
																	<img
																	src="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.orgCodeCtfPath}"
																	alt="" width="300" height="200" />
																</a>
															</div>
												</div>
                                    
                                                        <div class="container form-horizontal">
                                    					
															<div class="easyzoom easyzoom--overlay ">
															<div>法人证件照</div>
															<a href="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.legalPerCtfPath}">
																	<img
																	src="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.legalPerCtfPath}"
																	alt="" width="300" height="200" />
																</a>
															</div>											
																							
															<div class="easyzoom easyzoom--overlay">
															<div>银行开户证明</div>
															<a href="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.accountOpenCtfPath}">
																	<img
																	src="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.accountOpenCtfPath}"
																	alt="" width="300" height="200" />
																</a>
															</div>
															
															<div class="easyzoom easyzoom--overlay">
															<div>特殊行业经营许可证路径</div>
															<a href="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.speIndusLicenceCtfPath}">
																	<img
																	src="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantPieceInfo.speIndusLicenceCtfPath}"
																	alt="" width="300" height="200" />
																</a>
															</div>
												</div>
                                    </div>                                   

                            </div>
                        </div>
   				 <div class="panel-inner">
                            <h2 class="panel-inner-title panel-inner-title-default">商户基本信息
                            </h2>
                            <div class="panel-inner-body">
                                <div class="row" id="agent1">
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">商户行业<span>*</span></td>
                                                <td>
                                                	<select class="form-control" id="merchantIndustry" tabindex="10" name="merchantIndustry">
                                                    	<option value="" <c:if test="${merchantPieceInfo.merchantIndustry==''}">selected='selected'</c:if>>请选择</option>
                                                    	<option value="CY" <c:if test="${merchantPieceInfo.merchantIndustry=='CY'}">selected='selected'</c:if>>餐饮</option>
                                                    	<option value="YL" <c:if test="${merchantPieceInfo.merchantIndustry=='YL'}">selected='selected'</c:if>>娱乐</option>
                                                    	<option value="DS" <c:if test="${merchantPieceInfo.merchantIndustry=='DS'}">selected='selected'</c:if>>电商</option>
                                                	</select>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">商户性质<span>*</span></td>
                                                <td id="agentName">
                                                	<select class="form-control" id="merchantFeature" tabindex="10" name="merchantFeature">
                                                    	<option value="" <c:if test="${merchantPieceInfo.merchantFeature==''}">selected='selected'</c:if>>请选择</option>
                                                    	<option value="AGENT_MER" <c:if test="${merchantPieceInfo.merchantFeature=='AGENT_MER'}">selected='selected'</c:if>>普通商户</option>
                                                    	<option value="NORMAL_MER" <c:if test="${merchantPieceInfo.merchantFeature=='NORMAL_MER'}">selected='selected'</c:if>>集团商户</option>
                                                	</select>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">商户类型<span>*</span></td>
                                                <td id="agentName">
                                                	<select class="form-control" id="merchantType" tabindex="10" name="merchantType">
                                                    	<option value="" <c:if test="${merchantPieceInfo.merchantType==''}">selected='selected'</c:if>>请选择</option>
                                                    	<option value="B2B" <c:if test="${merchantPieceInfo.merchantType=='B2B'}">selected='selected'</c:if>>B2B</option>
                                                    	<option value="B2C" <c:if test="${merchantPieceInfo.merchantType=='B2C'}">selected='selected'</c:if>>B2C</option>
                                                	</select>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">商户名称<span>*</span></td>
                                                <td>
                                                    <input type="text" class="form-control" id="merchantName" name="merchantName" value="${merchantPieceInfo.merchantName}">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row" id="agent2">
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">商户简称<span>*</span></td>
                                                <td><input type="text" class="form-control" id="merchantShortName" name="merchantShortName" value="${merchantPieceInfo.merchantShortName}"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">网站域名<span>*</span></td>
                                                <td><input type="text" class="form-control" id="websiteDomain" name="websiteDomain" value="${merchantPieceInfo.websiteDomain}"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">商户业务码<span>*</span></td>
                                                <td><input type="text" class="form-control" id="merchantBusCode" name="merchantBusCode" value="${merchantPieceInfo.merchantBusCode}"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" id="merchant1">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">所属代理商<span>*</span></td>
                                                <td>
                                                	<select class="form-control" id="belongAgentMctNo" tabindex="10" name="belongAgentMctNo">
                                                    	<option value="" <c:if test="${merchantPieceInfo.belongAgentMctNo==''}">selected='selected'</c:if>>请选择</option>
                                                    	<option value="HLL" <c:if test="${merchantPieceInfo.belongAgentMctNo=='HLL'}">selected='selected'</c:if>>哗啦啦</option>
                                                	</select>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">注册地址<span>*</span></td>
                                                <td><input type="text" class="form-control" id="registerAddress" name="registerAddress" value="${merchantPieceInfo.registerAddress}"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">联系地址<span>*</span></td>
                                                <td><input type="text" class="form-control" id="contactAddress" name="contactAddress" value="${merchantPieceInfo.contactAddress}"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" id="merchant2">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">需代理商提供技术<span>*</span></td>
                                                <td>
                                                	<select class="form-control" id="isItSptByAgent" tabindex="10" name="isItSptByAgent">
                                                    	<option value="" <c:if test="${merchantPieceInfo.isItSptByAgent==''}">selected='selected'</c:if>>请选择</option>
                                                    	<option value="Y" <c:if test="${merchantPieceInfo.isItSptByAgent=='Y'}">selected='selected'</c:if>>是</option>
                                                    	<option value="N" <c:if test="${merchantPieceInfo.isItSptByAgent=='N'}">selected='selected'</c:if>>否</option>
                                                	</select>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">所属销售<span>*</span></td>
                                                <td><input type="text" class="form-control" id="salesman" name="salesman" maxlength="50" value="${merchantPieceInfo.salesman}"></td>
                                            </tr>
                                        </table>
                                    </div>
                                 </div>
                                 <div class="row" >
                                    <%-- <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" id="merchant3">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">商户服务器ip列表<span>*</span></td>
                                                <td>
                                                    <input type="text" class="form-control" id="ipList" name="ipList" value="${merchantPieceInfo.ipList}"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </div> --%>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">销售联系方式<span>*</span></td>
                                                <td><input class="form-control" id="salesmanPhone" name="salesmanPhone" value="${merchantPieceInfo.salesmanPhone}"></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="panel-inner">
                            <h2 class="panel-inner-title panel-inner-title-default">商户法人/负责人信息
                            </h2>
                            <div class="panel-inner-body">
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right" >法人名称<span>*</span>
                                                </td>
                                                <td><input type="text" class="form-control" id="legalPerson" name="legalPerson" value="${merchantPieceInfo.legalPerson}">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right" >法人手机号<span>*</span>
                                                </td>
                                                <td><input type="text" class="form-control" id="legalPerPhoneNo" name="legalPerPhoneNo" value="${merchantPieceInfo.legalPerPhoneNo}">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" >
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">法人证件类型<span>*</span></td>
                                                <td>
                                                	<select class="form-control" id="legalPerCtfType" tabindex="10" name="legalPerCtfType" value="${merchantPieceInfo.legalPerCtfType}">
                                                    	<option value="" <c:if test="${merchantPieceInfo.legalPerCtfType==''}">selected='selected'</c:if>>请选择</option>
                                                    	<option value="ID_CARD" <c:if test="${merchantPieceInfo.legalPerCtfType=='ID_CARD'}">selected='selected'</c:if>>身份证</option>
                                                    	<option value="PASS_PORT" <c:if test="${merchantPieceInfo.legalPerCtfType=='PASS_PORT'}">selected='selected'</c:if>>护照</option>
                                                	</select>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">身份证号<span>*</span></td>
                                                <td>
                                                	<input class="form-control" id="legalPerCtfNo" name="legalPerCtfNo" maxlength="18" style="width:150px;" value="${merchantPieceInfo.legalPerCtfNo}">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">证件有效期<span>*</span></td>
                                                <td>
                                                    <div data-date-format="yyyy-mm-dd" class="input-group date datepicker-filter mbs">
														<span class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</span>
														<input type="text" class="form-control" id="legalPerCtfDate" name="legalPerCtfDate" value="${merchantPieceInfo.legalPerCtfDate}"/>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-inner">
                            <h2 class="panel-inner-title panel-inner-title-default">业务联系人信息
                            </h2>
                            <div class="panel-inner-body">
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">业务联系人名称<span>*</span></td>
                                                <td>
                                                	<input type="text" class="form-control" id="merchantContactPerson" name="merchantContactPerson" value="${merchantPieceInfo.merchantContactPerson}">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">业务联系电话<span>*</span></td>
                                                <td>
                                                	<input type="text" class="form-control" id="merchantContactPhone" name="merchantContactPhone" maxlength="11" onkeyup="this.value=this.value.replace(/[^\d-]/g,'')" value="${merchantPieceInfo.merchantContactPhone}">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">业务联系人邮箱<span>*</span></td>
                                                <td>
                                                	<input type="text" class="form-control" id="merchantContactEmail" name="merchantContactEmail" maxlength="50" value="${merchantPieceInfo.merchantContactEmail}">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-inner" id="acceptLicense">
                            <h2 class="panel-inner-title panel-inner-title-default">许可证件信息
                            </h2>
                            <div class="panel-inner-body">
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">商户执照编号<span>*</span></td>
                                                <td>
                                                	<input type="text" class="form-control" id="busLicenceNo" name="busLicenceNo" value="${merchantPieceInfo.busLicenceNo}">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">税务登记编号<span>*</span></td>
                                                <td>
                                                	<input type="text" class="form-control" id="taxRegCtfNo" name="taxRegCtfNo" maxlength="11" onkeyup="this.value=this.value.replace(/[^\d-]/g,'')" value="${merchantPieceInfo.taxRegCtfNo}">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">组织机构代码编号<span>*</span></td>
                                                <td>
                                                	<input type="text" class="form-control" id="orgCode" name="orgCode" maxlength="50" value="${merchantPieceInfo.orgCode}">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">特殊行业经营许可证编号<span>*</span></td>
                                                <td>
                                                	<input type="text" class="form-control" id="speIndusLicenceNo" name="speIndusLicenceNo" maxlength="50" value="${merchantPieceInfo.speIndusLicenceNo}">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">ICP备案号<span>*</span></td>
                                                <td>
                                                	<input type="text" class="form-control" id="icpRecordNumber" name="icpRecordNumber" maxlength="50" value="${merchantPieceInfo.icpRecordNumber}">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">虚拟账户开通币种<span>*</span></td>
                                                <td>
                                                	<input type="text" class="form-control" id="virtualAccCurrency" name="virtualAccCurrency" maxlength="50" value="${merchantPieceInfo.virtualAccCurrency}">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">手续费收取方式<span>*</span></td>
                                                <td>
                                                	<select name="feePayType" id="feePayType" tabindex="10" class="form-control">
                                                        <option value="" <c:if test="${merchantPieceInfo.feePayType==''}">selected='selected'</c:if>>请选择</option>
                                                        <option value="NOW_GET" <c:if test="${merchantPieceInfo.feePayType=='NOW_GET'}">selected='selected'</c:if>>实收</option>
                                                        <option value="AFTRE_GET" <c:if test="${merchantPieceInfo.feePayType=='AFTRE_GET'}">selected='selected'</c:if>>后收</option>
                                                    </select>
                                                </td>
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
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">开户行<span>*</span></td>
                                                <td>
                                                    <select name="accountOpenBank" id="accountOpenBank" tabindex="10" class="form-control">
                                                        <option value="">请选择</option>
                                                        <c:forEach items="${banks}" var="bankData">
                                                            <option value="${bankData.shortName}" <c:if test="${bankData.shortName==merchantPieceInfo.accountOpenBank}">selected='selected'</c:if>>${bankData.bankName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">开户行全称(包括支行)<span>*</span></td>
                                                <td><input class="form-control" id="bankAddress" name="bankAddress" value="${merchantPieceInfo.bankAddress}"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">账户类型<span>*</span></td>
                                                <td>
                                                	<select class="form-control" id="accountType" tabindex="10" name="accountType">
	                                                    <option value="" <c:if test="${merchantPieceInfo.accountType==''}">selected='selected'</c:if>>请选择</option>
	                                                    <option value="TO_PUBLIC_TYPE" <c:if test="${merchantPieceInfo.accountType=='TO_PUBLIC_TYPE'}">selected='selected'</c:if>>对公</option>
	                                                    <option value="TO_PRIVATE_TYPE" <c:if test="${merchantPieceInfo.accountType=='TO_PRIVATE_TYPE'}">selected='selected'</c:if>>对私</option>
                                                	</select>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>

                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">账户名称<span>*</span></td>
                                                <td>
                                                	<input type="text" class="form-control" id="accountName" name="accountName" value="${merchantPieceInfo.accountName}">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
								</div>
								<div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">开户账号<span>*</span></td>
                                                <td>
                                                	<input type="text" class="form-control" id="accountNo" name="accountNo" onkeyup='this.value=this.value.replace(/\D/gi,"")' value="${merchantPieceInfo.accountNo}">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
									
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">开户人证件类型<span>*</span></td>
                                                <td>
                                                	<select class="form-control" id="accountOpenCtfType" tabindex="10" name="accountOpenCtfType">
	                                                    <option value="" <c:if test="${merchantPieceInfo.accountOpenCtfType==''}">selected='selected'</c:if>>请选择</option>
	                                                    <option value="ID_CARD" <c:if test="${merchantPieceInfo.accountOpenCtfType=='ID_CARD'}">selected='selected'</c:if>>身份证</option>
	                                                    <option value="PASS_PORT" <c:if test="${merchantPieceInfo.accountOpenCtfType=='PASS_PORT'}">selected='selected'</c:if>>护照</option>
                                                	</select>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">开户人证件号码<span>*</span></td>
                                                <td>
                                                	<input type="text" class="form-control" id="accountOpenCtfNo" name="accountOpenCtfNo" onkeyup='this.value=this.value.replace(/\D/gi,"")' value="${merchantPieceInfo.accountOpenCtfNo}">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>

									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">开户人预留手机号<span>*</span></td>
                                                <td>
                                                	<input type="text" class="form-control" id="accountRemainPhone" name="accountRemainPhone" maxlength="11" onkeyup="this.value=this.value.replace(/[^\d-]/g,'')" value="${merchantPieceInfo.accountRemainPhone}">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-inner">
                            <h2 class="panel-inner-title panel-inner-title-default">商户结算信息
                            </h2>
                            <div class="panel-inner-body">
                                <div class="row">
                                	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">结算类型<span>*</span></td>
                                                <td>
                                                	<select class="form-control" id="settleType" tabindex="10" name="settleType">
	                                                    <option value="" <c:if test="${merchantPieceInfo.settleType==''}">selected='selected'</c:if>>--请选择--</option>
	                                                    <option value="00" <c:if test="${merchantPieceInfo.settleType=='00'}">selected='selected'</c:if>>作扣</option>
	                                                    <option value="01" <c:if test="${merchantPieceInfo.settleType=='01'}">selected='selected'</c:if>>预存</option>
	                                                    <option value="02" <c:if test="${merchantPieceInfo.settleType=='02'}">selected='selected'</c:if>>月结</option>
                                                	</select>
                                                </td>
                                            </tr>
                                        </table>
                                    </div> 
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">清算周期<span>*</span></td>
                                                <td>
                                                    <input type="text" class="form-control" id="settleCycle" name="settleCycle" value="${merchantPieceInfo.settleCycle}">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="panel-inner">
                            <h2 class="panel-inner-title panel-inner-title-default">商户报备信息
                            </h2>
                            <div class="panel-inner-body">
                                <div class="row">
                                	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">报备信息<span>*</span></td>
                                                <td>
                                                	<input type="text" class="form-control" id="reportData" name="reportData" value="${merchantPieceInfo.reportData}">
                                                </td>
                                            </tr>
                                        </table>
                                    </div> 
                                </div>
                            </div>
                        </div>
                        

						  <div class="panel-inner">
                            <h2 class="panel-inner-title panel-inner-title-default">手续费信息
                            </h2>
                            <div class="panel-inner-body">
                                <div class="row">
                                	<div >
                                <input type="text"  id="feeData"  hidden='true' name="feeData" value="${merchantPieceInfo.feeData}">
                                        <table  width="100%" class="product_detail_list table-bordered" id="fee" >
                                            <tr>
                                            <td >计费产品</td>
                                            <td >计费开始日期 </td>
                                            <td >计费结束日期</td>
                                            <td >计费类型</td>
                                            <td>额外加收金额</td>
											<td>费率(小数)</td>
											<td>最低金额</td>
											<td>最高金额</td>
											<td>固定金额</td>
											<td>限额</td>
											<td>不足收取手续费</td>
                                            </tr>

                                        </table>
                                    </div> 
                                </div>
                            </div>
                        </div>
					
                        <div class="panel panel-default save-box-grey clearfix">
                         <input id="type" name="type" value="pass" hidden='true'>
                         <input type="text" hidden='true' id="pieceMerchantNo" name="pieceMerchantNo" value="${merchantPieceInfo.pieceMerchantNo}" ></input>
                           <input type="text" hidden='true' id="id" name="id" value="${merchantPieceInfo.id}" ></input>
                            <center>
                                <button id="btn1" class="btn btn-primary margin30"  onclick="commit('SUCCESS')"  type='button'>
                                	<i class="fa fa-check-square-o"></i> 通过
                                </button>
                                
                                <button id="btn2" class="btn btn-primary margin30" onclick="commit('FAIL')" type='button'>
                                	<i class="fa fa-check-square-o"></i> 不通过
                                </button>
                                
						<input type="button" value="返回" id="btn3" onclick="javascript:history.back(-1);" class="btn btn-primary margin30" />
                            </center>
                        </div>
                    </form>
                </div>

            </div>


        </div>

        <!--End CONTENT-->
    </div>
    <!--右侧内容 end-->


</div>

<!--附言弹窗 start-->
<div id="small-dialog-details" class="zoom-anim-dialog mfp-hide">
    <div class="panel panel-default">
        <h2 class=" panel-heading">附言详情</h2>
        <div class="panel-body">
            <form class="form-horizontal " enctype="multipart/form-data"
                  method="post">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div style="padding: 20px 10px;">附言内容附言内容附言内容</div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <button class="mfp-close" type="button" title="Close (Esc)">×</button>
</div>
<!--附言弹窗 end-->
<!--全局动态-->
<script src="<%=request.getContextPath()%>/statics/v2/js/zoom/easyzoom.js"></script>
<script src="<%=request.getContextPath()%>/statics/v2/vendors/jquery-validate/messages_zh.js"></script>
<script type="text/javascript">

$(function(){
	var $easyzoom = $('.easyzoom').easyZoom();

	// Setup thumbnails example
	var api1 = $easyzoom.filter('.easyzoom--with-thumbnails').data('easyZoom');

	$('.thumbnails').on('click', 'a', function(e) {
		var $this = $(this);

		e.preventDefault();

		// Use EasyZoom's `swap` method
		api1.swap($this.data('standard'), $this.attr('href'));
	});

	// Setup toggles example
	var api2 = $easyzoom.filter('.easyzoom--with-toggle').data('easyZoom');

	$('.toggle').on('click', function() {
		var $this = $(this);

		if ($this.data("active") === true) {
			$this.text("Switch on").data("active", false);
			api2.teardown();
		} else {
			$this.text("Switch off").data("active", true);
			api2._init();
		}
	});
});

function commit(type){
	var ajaxCallUrl = "<%=request.getContextPath()%>/cbMerchant/toApprovalMerchantPieceInfo";
	var id = $("#subform")[0].id.value;
	
	$.ajax({
        cache: true,
        type: "POST",
        url:ajaxCallUrl,
        data:{id:id,pieceStatus:type},// 你的formid
        async: false,
        error: function(request) {
            alert("Connection error");
        },
        success: function(res) {
			if(res.err==false){
				alert("操作成功！");
				window.location.href="<%=request.getContextPath()%>/cbMerchant/toMerchantPieceSearch";
			}else {
				alert(res.msg);
			}
        }
    });
}

function dtl_change(){
	$("#subform :input").each(function(){
		$(this).attr("disabled",true);
	});
	//隐藏两个按钮
	 $("#btn1").hide();
	 $("#btn2").hide();
	$("#btn3").attr("disabled",false);
}

function toTd(){
	 var tbody = "";
     //------------遍历对象 .each的使用-------------
     //对象语法JSON数据格式(当服务器端回调回来的对象数据格式是json数据格式，必须保证JSON的格式要求，回调的对象必须使用eval函数进行转化（否则将得不到Object）。本文不作详细介绍服务器端回调的数据问题，我们将直接自定义对象)
    // var obj = [{ "name": "项海军", "password": "123456"},{ "name": "项海军1", "password": "1234562"}];
     var _fee_json = '${json}';
     if(_fee_json==null||_fee_json==undefined||_fee_json==''){
    	 return;
     }
     var obj = eval(_fee_json);
//      $("#result").html("------------遍历对象 .each的使用-------------");
    // alert(obj); //是个object元素
     //下面使用each进行遍历
     $.each(obj, function (n, value) {
         var trs = ""; 
         var product ;
         var type;
         if(value.feeProduct == 'LOCAL_REMIT'){
        	 product ='跨境人民币汇款';
         }else if(value.feeProduct == 'LOCAL_GATHER'){
        	 product ='跨境人民币收款';
         }else if(value.feeProduct == 'FOREX_SALE'){
        	 product ='跨境购付汇';
         }else if(value.feeProduct == 'FOREX_SETTLE'){
        	 product ='跨境收结汇';
         }else if(value.feeProduct == 'RECHARGE'){
        	 product ='充值';
         }
         
         if(value.feeType == 'STANDARD'){
        	 type ='标准计费';
         }else if(value.feeType == 'SINGLE_FIXED'){
        	 type ='单笔固定';
         }else if(value.feeType == 'REMIT_DEDUCT'){
        	 type ='汇款扣除';
         }else if(value.feeType == 'LESS_ADD'){
        	 type ='不足补收';
         }
         trs += "<tr><td>" + product + "</td> "+
         			"<td>" + value.ruleBeginDate + "</td> "+
         			"<td>" + value.ruleEndDate + "</td> "+
         			"<td>" + type + "</td> "+
         			"<td>" + value.addGatherAmount + "</td> "+
         			"<td>" + value.percentage + "</td> "+
         			"<td>" + value.addGatherAmount + "</td> "+
         			"<td>" + value.minAmount + "</td> "+
         			"<td>" + value.maxAmount + "</td> "+
         			"<td>" + value.fixedAmount + "</td> "+
         			"<td>" + value.lessLineAmount + "</td> "+
         			"<td>" + value.lessLineGatherFee + "</td></tr>";
         tbody += trs;
     });
     $("#fee").append(tbody);
}

	$(document).ready(function () {
		//加载json数据
		toTd();
		//根据type设置 显示是否可以修改
		var type = '${type}';
		if(type == 'write'){
			//可修改状态
			$("#subform :input").each(function(){
				$(this).attr("disabled",true);
			});
			$("#btn1").attr("disabled",false);
			$("#btn2").attr("disabled",false);
			$("#btn3").attr("disabled",false);
		}else if(type == 'readOnly'){
			//设置所有只读  统一的css 控制
			console.log('readOnly');
			dtl_change();
		}
		//根据
		var temp = '${customerType}';
	        if (temp == 1) {
	            $("#license").attr('style', 'display:block');
	            $("#tax").attr('style', 'display:block');
	            $("#organization").attr('style', 'display:block');
	            $("#agent1").attr('style', 'display:block');
	            $("#agent2").attr('style', 'display:block');
	            $("#merchant1").attr('style', 'display:block');
	            $("#merchant2").attr('style', 'display:block');
	            $("#merchant3").attr('style', 'display:block');
	            $("#acceptLicense").attr('style', 'display:block');
	        }
	        if (temp == 2) {
	            $("#license").attr('style', 'display:none');
	            $("#tax").attr('style', 'display:none');
	            $("#organization").attr('style', 'display:none');
	            $("#agent1").attr('style', 'display:none');
	            $("#agent2").attr('style', 'display:none');
	            $("#merchant1").attr('style', 'display:none');
	            $("#merchant2").attr('style', 'display:none');
	            $("#merchant3").attr('style', 'display:none');
	            $("#acceptLicense").attr('style', 'display:none');
	        }
	    });

</script>

</body>
</html>
