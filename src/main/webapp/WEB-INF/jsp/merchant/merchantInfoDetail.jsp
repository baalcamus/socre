<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp" %>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/statics/v2/css/easyzoom.css">
<html lang="en">
<head>
    <title>商户详细信息</title>
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
                <li class="active">商户详细信息</li>
            </ol>
            <div class="clearfix"></div>
        </div>
        <!--END TITLE & BREADCRUMB PAGE-->
        <!--BEGIN CONTENT-->
        <div class="page-content">
            <div class="panel panel-default  withoutbottom clearfix">
                <header class="panel-heading clearfix">
                    <h2 class="panel-title">商户详细信息</h2>
                </header>

                <div class="panel-body clearfix">
                    <form class="form-horizontal" role="form" method="post" enctype="multipart/form-data" id="subform" >
                        <input type="text" id="customerType" name="customerType" value="${customerType}" hidden='true'></input>
                         <table width="100%" class="product_detail_list">
                          <tr>
                          <td><input type="text" id="busLicenceCftPath" hidden='true' name="busLicenceCftPath" value="${merchantInfo.busLicenceCftPath}"></td>
                          <td><input type="text" id="taxRegCtfPath" hidden='true' name="taxRegCtfPath"  value="${merchantInfo.taxRegCtfPath}"></td>
                          <td><input type="text" id="orgCodeCtfPath" hidden='true' name="orgCodeCtfPath"  value="${merchantInfo.orgCodeCtfPath}"></td>
                          <td><input type="text" id="legalPerCtfPath"  hidden='true' name="legalPerCtfPath"  value="${merchantInfo.legalPerCtfPath}"></td>
                          <td><input type="text" id="accountOpenCtfPath" hidden='true' name="accountOpenCtfPath"  value="${merchantInfo.accountOpenCtfPath}"></td>
                          <td><input type="text" id="speIndusLicenceCtfPath" hidden='true' name="speIndusLicenceCtfPath"  value="${merchantInfo.speIndusLicenceCtfPath}"></td>
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
															
															<a href="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantInfo.busLicenceCftPath}">
																	<img
																	src="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantInfo.busLicenceCftPath}"
																	alt="" width="300" height="200" />
																</a>
															</div>											
																							
															<div class="easyzoom easyzoom--overlay"  >
															<div>税务登记证</div>
															<a href="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantInfo.taxRegCtfPath}">
																	<img
																	src="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantInfo.taxRegCtfPath}"
																	alt="" width="300" height="200" />
																</a>
															</div>
															
															<div class="easyzoom easyzoom--overlay" >
															<div>组织机构代码证</div>
															<a href="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantInfo.orgCodeCtfPath}">
																	<img
																	src="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantInfo.orgCodeCtfPath}"
																	alt="" width="300" height="200" />
																</a>
															</div>
												</div>
                                    
                                                        <div class="container form-horizontal">
                                    					
															<div class="easyzoom easyzoom--overlay ">
															<div>法人证件照</div>
															<a href="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantInfo.legalPerCtfPath}">
																	<img
																	src="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantInfo.legalPerCtfPath}"
																	alt="" width="300" height="200" />
																</a>
															</div>											
																							
															<div class="easyzoom easyzoom--overlay">
															<div>银行开户证明</div>
															<a href="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantInfo.accountOpenCtfPath}">
																	<img
																	src="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantInfo.accountOpenCtfPath}"
																	alt="" width="300" height="200" />
																</a>
															</div>
															
															<div class="easyzoom easyzoom--overlay">
															<div>特殊行业经营许可证路径</div>
															<a href="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantInfo.speIndusLicenceCtfPath}">
																	<img
																	src="<%=request.getContextPath()%>/cbMerchant/static?path=${merchantInfo.speIndusLicenceCtfPath}"
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
                                                    	<option  <c:if test="${merchantInfo.merchantIndustry==''}">selected="selected"</c:if> value="">请选择</option>
                                                    	<option  <c:if test="${merchantInfo.merchantIndustry=='CY'}">selected="selected"</c:if> value="CY">餐饮</option>
                                                    	<option  <c:if test="${merchantInfo.merchantIndustry=='YL'}">selected="selected"</c:if> value="YL">娱乐</option>
                                                    	<option <c:if test="${merchantInfo.merchantIndustry=='DS'}">selected="selected"</c:if> value="DS">电商</option>
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
                                                    	<option  <c:if test="${merchantInfo.merchantFeature==''}">selected="selected"</c:if> value="">请选择</option>
                                                    	<option  <c:if test="${merchantInfo.merchantFeature=='AGENT_MER'}">selected="selected"</c:if> value="AGENT_MER">代理商</option>
                                                    	<option  <c:if test="${merchantInfo.merchantFeature=='NORMAL_MER'}">selected="selected"</c:if> value="NORMAL_MER">普通商户</option>
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
                                                    	<option  <c:if test="${merchantInfo.merchantType==''}">selected="selected"</c:if> value="">请选择</option>
                                                    	<option  <c:if test="${merchantInfo.merchantType=='B2B'}">selected="selected"</c:if> value="B2B">B2B</option>
                                                    	<option  <c:if test="${merchantInfo.merchantType=='B2C'}">selected="selected"</c:if> value="B2C">B2C</option>
                                                    	<option  <c:if test="${merchantInfo.merchantType=='P2P'}">selected="selected"</c:if> value="P2P">P2P</option>
                                                    	<option  <c:if test="${merchantInfo.merchantType=='P2C'}">selected="selected"</c:if> value="P2C">P2C</option>
                                                    	<option  <c:if test="${merchantInfo.merchantType=='O2O'}">selected="selected"</c:if> value="O2O">O2O</option>
                                                    	<option  <c:if test="${merchantInfo.merchantType=='C2C'}">selected="selected"</c:if>  value="C2C">C2C</option>
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
                                                    <input type="text" class="form-control"   value="${merchantInfo.merchantName }"  id="merchantName" name="merchantName">
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
                                                <td><input type="text" class="form-control"   value="${merchantInfo.merchantShortName }"  id="merchantShortName" name="merchantShortName"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">网站域名</td>
                                                <td><input type="text" class="form-control"   value="${merchantInfo.websiteDomain }" id="websiteDomain" name="websiteDomain"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">商户业务码</td>
                                                <td><input type="text" class="form-control"  value="${merchantInfo.merchantBusCode }" id="merchantBusCode" name="merchantBusCode"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    
                                    <c:if test="${merchantInfo.belongAgentMctNo!=null}">
	                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" id="merchant1">
	                                        <table width="100%" class="product_detail_list">
	                                            <tr>
	                                                <td width="120" class="text-right">所属代理商</td>
	                                                <td>
	                                              		<c:forEach var="agentMcts" items="${agentMcts}"  >                                              				
	                                              				<c:if test="${merchantInfo.belongAgentMctNo==agentMcts.merchantNo}">
					                                         		<input type="text" class="form-control"  value="${agentMcts.merchantName }" id="belongAgentMctNo" name="belongAgentMctNo">
	                                              				</c:if>
	                                              		</c:forEach>
	                                                </td>
	                                            </tr>
	                                        </table>
	                                    </div>
                                    </c:if>
                                    
                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">注册地址<span>*</span></td>
                                                <td><input type="text" class="form-control"  value="${merchantInfo.registerAddress }"  id="registerAddress" name="registerAddress"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">联系地址<span>*</span></td>
                                                <td><input type="text" class="form-control"  value="${merchantInfo.contactAddress }" id="contactAddress" name="contactAddress"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" id="merchant2">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">需代理商提供技术<span>*</span></td>
                                                <td>
                                                	<select class="form-control" id="isITSptByAgent" tabindex="10" name="isITSptByAgent">
                                                    	<option <c:if test="${merchantInfo.isITSptByAgent==''}">selected="selected"</c:if> value="">请选择</option>
                                                    	<option <c:if test="${merchantInfo.isITSptByAgent=='Y'}">selected="selected"</c:if> value="Y">是</option>
                                                    	<option <c:if test="${merchantInfo.isITSptByAgent=='N'}">selected="selected"</c:if> value="N">否</option>
                                                	</select>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">所属销售<span>*</span></td>
                                                <td><input type="text" class="form-control"  value="${merchantInfo.salesman }" id="salesman" name="salesman" maxlength="50"></td>
                                            </tr>
                                        </table>
                                    </div>
                                 </div>
                                 <div class="row" >
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">销售联系电话</td>
                                                <td><input class="form-control"  value="${merchantInfo.salesmanPhone }" id="salesmanPhone" name="salesmanPhone"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">互联网商编<span>*</span></td>
                                                <td><input class="form-control"  value="${merchantInfo.interNo }" id="interNo" name="interNo"></td>
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
                                                <td><input type="text" class="form-control"  value="${merchantInfo.legalPerson }" id="legalPerson" name="legalPerson">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right" >法人联系电话<span>*</span>
                                                </td>
                                                <td><input type="text" class="form-control"  value="${merchantInfo.legalPerPhoneNo }" id="legalPerPhoneNo" name="legalPerPhoneNo">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" >
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">法人证件类型<span>*</span></td><c:if test=""></c:if>
                                                <td>
                                                	<select class="form-control" id="legalPerCtfType" tabindex="10" name="legalPerCtfType">
                                                    	<option <c:if test="${merchantInfo.legalPerCtfType ==''}">selected="selected"</c:if> value="">请选择</option>
                                                    	<option <c:if test="${merchantInfo.legalPerCtfType =='ID_CARD'}">selected="selected"</c:if>  value="ID_CARD">身份证</option>
                                                    	<option <c:if test="${merchantInfo.legalPerCtfType =='PASS_PORT'}">selected="selected"</c:if>  value="PASS_PORT">护照</option>
                                                    	<option <c:if test="${merchantInfo.legalPerCtfType =='RESIDENCE'}">selected="selected"</c:if>  value="RESIDENCE">户口本</option>
                                                    	<option <c:if test="${merchantInfo.legalPerCtfType =='OFFICIAL_CARD'}">selected="selected"</c:if>  value="OFFICIAL_CARD">军官证</option>
                                                    	<option <c:if test="${merchantInfo.legalPerCtfType =='HK_MACAO_CARD'}">selected="selected"</c:if>  value="HK_MACAO_CARD">往来港澳</option>
                                                    	<option <c:if test="${merchantInfo.legalPerCtfType =='HK_MACAO_CARD'}">selected="selected"</c:if>  value="TAIWAN_CARD">台胞证</option>
                                                    	<option <c:if test="${merchantInfo.legalPerCtfType =='TEMP_ID_CARD'}">selected="selected"</c:if>  value="TEMP_ID_CARD">临时身份证</option>
                                                    	<option <c:if test="${merchantInfo.legalPerCtfType =='OTHER'}">selected="selected"</c:if>  value="OTHER">其他</option>
                                                	</select>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">法人证件号<span>*</span></td>
                                                <td>
                                                	<input class="form-control" value="${merchantInfo.legalPerCtfNo }"  id="legalPerCtfNo" name="legalPerCtfNo" maxlength="18" style="width:150px;">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">证件有效期</td>
                                                <td>
                                                    <div data-date-format="yyyy-mm-dd" class="input-group date datepicker-filter mbs">
														<span class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</span>
														<input type="text" class="form-control"  value="${merchantInfo.legalPerCtfDate }" id="legalPerCtfDate" name="legalPerCtfDate"/>
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
                                                	<input type="text" class="form-control"   value="${merchantInfo.merchantContactPerson }" id="merchantContactPerson" name="merchantContactPerson">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">业务联系电话<span>*</span></td>
                                                <td>
                                                	<input type="text" class="form-control"   value="${merchantInfo.merchantContactPhone }" id="merchantContactPhone" name="merchantContactPhone" maxlength="11" onkeyup="this.value=this.value.replace(/[^\d-]/g,'')">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">业务联系人邮箱<span>*</span></td>
                                                <td>
                                                	<input type="text" class="form-control"   value="${merchantInfo.merchantContactEmail }" id="merchantContactEmail" name="merchantContactEmail" maxlength="50">
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
                                                	<input type="text" class="form-control"  value="${merchantInfo.busLicenceNo }" id="busLicenceNo" name="busLicenceNo">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">税务登记编号<span>*</span></td>
                                                <td>
                                                	<input type="text" class="form-control" value="${merchantInfo.taxRegCtfNo }"  id="taxRegCtfNo" name="taxRegCtfNo" maxlength="11" onkeyup="this.value=this.value.replace(/[^\d-]/g,'')">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">组织机构代码编号<span>*</span></td>
                                                <td>
                                                	<input type="text" class="form-control"  value="${merchantInfo.orgCode }" id="orgCode" name="orgCode" maxlength="50">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">特殊行业经营许可证编号</td>
                                                <td>
                                                	<input type="text" class="form-control"  value="${merchantInfo.speIndusLicenceNo }" id="speIndusLicenceNo" name="speIndusLicenceNo" maxlength="50">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">ICP备案号</td>
                                                <td>
                                                	<input type="text" class="form-control" value="${merchantInfo.icpRecordNumber }" id="icpRecordNumber" name="icpRecordNumber" maxlength="50">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 结算信息 -->
						<div class="panel-body clearfix">
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
																<option <c:if test="${merchantSettleInfo.bankId==bankData.shortName }">selected="selected"</c:if> value="${bankData.shortName}">${bankData.bankName}</option>
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
														name="bankAddress" value="${merchantSettleInfo.bankAddress }"></td>
												</tr>
											</table>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="130" class="text-right">账户类型<span>*</span></td>

													<td><input type="Radio"  <c:if test="${merchantSettleInfo.accountType=='PUBLIC' }"> checked="checked"</c:if> name="accountType" value="PUBLIC">对公
													 <input type="Radio" <c:if test="${merchantSettleInfo.accountType=='PRIVATE' }"> checked="checked"</c:if> name="accountType" value="PRIVATE">对私</td>
												</tr>
											</table>
										</div>

										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="130" class="text-right">账户名称<span>*</span></td>
													<td><input type="text" class="form-control"
														id="accountName" name="accountName" value="${merchantSettleInfo.accountName }"></td>
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
														id="accountNo" name="accountNo"  value="${merchantSettleInfo.accountNo }"
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
															<option <c:if test="${merchantSettleInfo.accountOpenCtfType=='' }">selected="selected"</c:if> value="">请选择</option>
															<option <c:if test="${merchantSettleInfo.accountOpenCtfType=='ID_CARD' }">selected="selected"</c:if> value="ID_CARD">身份证</option>
															<option <c:if test="${merchantSettleInfo.accountOpenCtfType=='PASS_PORT' }">selected="selected"</c:if> value="PASS_PORT">护照</option>
															<option <c:if test="${merchantSettleInfo.accountOpenCtfType=='RESIDENCE' }">selected="selected"</c:if> value="RESIDENCE">户口本</option>
															<option <c:if test="${merchantSettleInfo.accountOpenCtfType=='OFFICIAL_CARD' }">selected="selected"</c:if> value="OFFICIAL_CARD">军官证</option>
															<option <c:if test="${merchantSettleInfo.accountOpenCtfType=='HK_MACAO_CARD' }">selected="selected"</c:if> value="HK_MACAO_CARD">往来港澳</option>
															<option <c:if test="${merchantSettleInfo.accountOpenCtfType=='TAIWAN_CARD' }">selected="selected"</c:if> value="TAIWAN_CARD">台胞证</option>
															<option <c:if test="${merchantSettleInfo.accountOpenCtfType=='TEMP_ID_CARD' }">selected="selected"</c:if> value="TEMP_ID_CARD">临时身份证</option>
															<option <c:if test="${merchantSettleInfo.accountOpenCtfType=='OTHER' }">selected="selected"</c:if> value="OTHER">其他</option>
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
														id="accountOpenCtfNo" name="accountOpenCtfNo" value="${merchantSettleInfo.accountOpenCtfNo }">
													</td>
												</tr>
											</table>
										</div>

										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="130" class="text-right">开户人预留手机号<span>*</span></td>
													<td><input type="text" class="form-control"
														id="accountRemainPhone" name="accountRemainPhone"  value="${merchantSettleInfo.accountRemainPhone }"
														maxlength="11">
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
													<input  <c:if test="${merchantSettleInfo.settleType=='DEPENDENT' }">checked="checked"</c:if>
														type="Radio" name="settleType" value="DEPENDENT">前置结算 
														<input <c:if test="${merchantSettleInfo.settleType=='AUTO' }">checked="checked"</c:if>
														type="Radio" name="settleType" value="AUTO">自动结算
														<input <c:if test="${merchantSettleInfo.settleType=='SELF' }">checked="checked"</c:if>
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
													<td><input  <c:if test="${fn:startsWith(merchantSettleInfo.settleCycle,'TX|')}">checked="checked"</c:if> 
														type="Radio" name="settleCycle" value="TX">T+<input
													<c:choose> 
														<c:when test="${fn:startsWith(merchantSettleInfo.settleCycle,'TX|')}">
															value="${fn:substring(merchantSettleInfo.settleCycle,3,-1)}"
														</c:when>
														<c:otherwise>
															value="X"
														</c:otherwise>
													</c:choose>
														readonly="readonly" name='number' value="X"
														style="display: inline;" type="text" size="5"> 
														<input  <c:if test="${fn:startsWith(merchantSettleInfo.settleCycle,'YJ|')}">checked="checked"</c:if> 
														type="Radio" name="settleCycle" value="YJ">月结 
														<input  <c:if test="${fn:startsWith(merchantSettleInfo.settleCycle,'JJ|')}">checked="checked"</c:if> 
														type="Radio" name="settleCycle" value="JJ">季结 
														<input  <c:if test="${fn:startsWith(merchantSettleInfo.settleCycle,'NJ|')}">checked="checked"</c:if> 
														type="Radio" name="settleCycle" value="NJ">年结 
														<input  <c:if test="${fn:startsWith(merchantSettleInfo.settleCycle,'MYXR|')}">checked="checked"</c:if> 
														type="Radio" name="settleCycle" value="MYXR">每月
														<input 
														<c:choose> 
														<c:when test="${fn:startsWith(merchantSettleInfo.settleCycle,'MYXR|')}">
															value="${fn:substring(merchantSettleInfo.settleCycle,5,-1)}"
														</c:when>
														<c:otherwise>
															value="X"
														</c:otherwise>
														</c:choose>
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
														for="minSettleAmount" >最小结算金额</label></td>
													<td><input type="number" class="form-control"
														name="minSettleAmount" id="minSettleAmount"   value="${merchantSettleInfo.minSettleAmount }"></td>
												</tr>
											</table>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td class="text-right" width="130"><label
														for="maxSettleAmount">最大结算金额</label></td>
													<td><input type="number" class="form-control"
														name="maxSettleAmount" id="maxSettleAmount"   value="${merchantSettleInfo.maxSettleAmount }"></td>
												</tr>
											</table>
										</div>
									</div>
									<div class="row">
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td class="text-right" width="130"><label
														for="assumeFeeFlag">承担结算手续费<span>*</span></label></td>
													<td><select class="form-control" id="assumeFeeFlag"
														name="assumeFeeFlag">
															<option <c:if test="${merchantSettleInfo.assumeFeeFlag eq ''}">selected="selected"</c:if>  value="">请选择
															<option <c:if test="${merchantSettleInfo.assumeFeeFlag eq 'Y'.charAt(0)}">selected="selected"</c:if> value="Y">是
															<option <c:if test="${merchantSettleInfo.assumeFeeFlag eq 'N'.charAt(0)}">selected="selected"</c:if> value="N">否
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
														name="riskStorageDays" id="riskStorageDays"   value="${merchantSettleInfo.riskStorageDays }"></td>
												</tr>
											</table>
										</div>
									</div>
								</div>

						</div>

					</div>
                        <!-- 业务信息 -->
                        <div class="panel-body clearfix">
							<div class="panel-inner">
								<h2 class="panel-inner-title panel-inner-title-default">产品设置
								</h2>
								<!-- 所有产品 -->
								<select style="display: none;" id="_sel_product_" 
												class="form-control">
													<option
														<c:if test="${paramVo.map.feeProduct==''}">selected="selected"</c:if>
														value="">全部</option>
													<c:forEach items="${products }" var="map">
													<c:if test="${map.key==null}">
													<c:forEach items="${map.value }" var="product_root">
														<c:forEach items="${products[product_root.productNo] }" var="child">
															<option 
															<c:if test="${paramVo.map.feeProduct==child.productCode}">selected="selected"</c:if>
															value="${child.productCode }">${child.productName }
														</c:forEach>
													</c:forEach>
												</c:if>
											</c:forEach>
											</select>
											
								<div class="panel-inner-body">
									<div class="row">
										<table width="100%" class="product_detail_list">
											<c:forEach items="${products }" var="map">
												<c:if test="${map.key==null}">
													<c:forEach items="${map.value }" var="product_root">
														<tr class="text-left">
															<td><input type="Checkbox" id="${product_root.productCode }" value="${product_root.productCode }" 
															<c:forEach items="${merchantBusinessInfo.openBiz.split(',') }" var="_o_b_i_z_">
																<c:if test="${_o_b_i_z_==product_root.productCode  }">
																checked="checked"
															</c:if>
															</c:forEach>
															name="openBiz">${product_root.productName }</td>
														</tr>
														<tr>
															<td style="padding-left: 40px">
																<c:forEach items="${products[product_root.productNo] }" var="child">
																	<input type="Checkbox" value="${child.productCode }" name="openProduct" 
																	<c:forEach items="${merchantBusinessInfo.openProduct.split(',') }" var="_o_p_r_o_">
																		<c:if test="${_o_p_r_o_==child.productCode  }">
																			checked="checked"
																		</c:if>
																	</c:forEach>
																	pid="${product_root.productCode }">${child.productName }&nbsp;&nbsp;
																</c:forEach>
															</td>
														</tr>
													</c:forEach>
												</c:if>
											</c:forEach>
										</table>
									</div>
								</div>
							</div>
							
							<div class="panel-inner">
								<h2 class="panel-inner-title panel-inner-title-default">商户虚拟账户设置
								</h2>
								<div class="panel-inner-body">
									<div class="row">
										<table width="100%" class="product_detail_list">
											<tr>
												<td style="padding-left: 40px; width: 135px">
												<input  <c:if test="${fn:contains(merchantBusinessInfo.virtualAccountType,'FUND') }">checked="checkde"</c:if>
												name="virtualAccountType" value="FUND" type="Checkbox">资金账户</td>
											</tr>
											<tr>
												<td style="padding-left: 40px; width: 135px">
												<input  <c:if test="${fn:contains(merchantBusinessInfo.virtualAccountType,'BAIL') }">checked="checkde"</c:if>
													onclick="bailChange(this);" type="Checkbox" id="bailCheckBox" name="virtualAccountType" value="BAIL">保证金账户</td>
												<td id="_bailAmountTD" style="display: none;text-align: left;">金额:<input
													type="number" id="bailAmount" name="bailAmount" value="0.00"></td>
											</tr>
										</table>
									</div>
								</div>
							</div>


						<div class="panel-inner">
							<h2 class="panel-inner-title panel-inner-title-default">
								手续费设置&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</h2>
							<div class="panel-inner-body">
								<div class="row">
									<table width="100%" class="product_detail_list">
										<tr>
											<td>手续费收取方式</td>
										</tr>
										<tr>
											<td  style="padding-left: 40px; width: 135px">
												<input  <c:if test="${merchantBusinessInfo.feeChargeType=='ADVANCE' }">checked="checkde"</c:if> type="Radio" name="feeChargeType" value="ADVANCE">预付
												<input   <c:if test="${merchantBusinessInfo.feeChargeType=='REALTIME' }">checked="checkde"</c:if> type="Radio" name="feeChargeType" value="REALTIME">实收
												<input  <c:if test="${merchantBusinessInfo.feeChargeType=='LATER' }">checked="checkde"</c:if> type="Radio" name="feeChargeType" value="LATER">后收
											</td>
										</tr>
									</table>
								</div>
								
								<div class="row">
									<table width="98%">
										<tr>
											<td style="width: 135px">设置手续费</td>
											<!-- <td><button class="btn btn-info" style="padding: 0px 5px 0px 5px!important;"
									onclick="javascript:addFee();return false;">添加</button></td> -->
										</tr>
									</table>
								</div>
								<div class="row">
									
									<div id="feeList">
										<input type="hidden" name="feeData" id="feeData" value="" />
										<table width="98%" id="fee_items_table" border="1">
											<tr style="background-color: #efefef;" align="center">
												<td width="80">商户编号</td>
												<td width="100">计费产品</td>
												<td width="90">计费开始日期</td>
												<td width="90">计费结束日期</td>
												<td width="80">计费类型</td>
												<td width="90">额外加收金额</td>
												<td width="80">费率(小数)</td>
												<td width="80">最低金额</td>
												<td width="80">最高金额</td>
												<td width="80">固定金额</td>
												<td width="80">限额</td>
												<td width="90">不足补收手续费</td>
												<td width="90">计费表达式</td>
												<td width="90">操作</td>
											</tr>
											<c:forEach items="${feeRules }" var="feeRule">
												<tr  class="text-center">
													<td>${feeRule.merchantNo }</td>
													<td>
													<c:forEach items="${products }" var="map">
													<c:if test="${map.key==null}">
													<c:forEach items="${map.value }" var="product_root">
														<c:forEach items="${products[product_root.productNo] }" var="child">
															<c:if test="${child.productCode==feeRule.feeProduct}">${child.productName }</c:if>
														</c:forEach>
													</c:forEach>
												</c:if>
												</c:forEach>
													
													</td>
													<td>${feeRule.ruleBeginDate }</td>
													<td>${feeRule.ruleEndDate }</td>
													<td>${fns:getEnumFieldValue("com.chinagpay.cb.merchant.facade.enumtype.MerchantConstant","FeeTypeEnum",feeRule.feeType,"des")}</td>
													<td>${feeRule.addGatherAmount }</td>
													<td>${feeRule.percentage }</td>
													<td>${feeRule.minAmount }</td>
													<td>${feeRule.maxAmount }</td>
													<td>${feeRule.fixedAmount }</td>
													<td>${feeRule.lessLineAmount }</td>
													<td>${feeRule.lessLineGatherFee }</td>
													<td>${feeRule.feeRule }</td>
												</tr>
											</c:forEach>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
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
	  //获取type 修改type类型
	 console.log(type=='reject');
	  if(type=='reject'){
		  $('#type').val("reject");
	  }
// 	  if(type=='pass'){
// 		  $('#type').val("pass");
// 	  }
	var ajaxCallUrl = "<%=request.getContextPath()%>/cbMerchant/toApprovalMerchantPieceInfo";
	$.ajax({
        cache: true,
        type: "POST",
        url:ajaxCallUrl,
        data:$('#subform').serialize(),// 你的formid
        async: false,
        error: function(request) {
            alert("Connection error");
        },
        success: function(data) {
			if(data=="success"){
				alert("操作成功！");
				window.location.href="<%=request.getContextPath()%>/cbMerchant/toMerchantPieceSearch";
			}else if(data=="fail"){
				alert("操作失败！");
			}else {
				alert("操作失败！");
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
     var obj = eval('${json}');
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

	$(function () {
		//加载json数据
		toTd();
		//根据type设置 显示是否可以修改
		var type = '${type}';
		if(type == 'write'){
			//可修改状态
			console.log('write')
		}else if(type == 'readOnly'){
			//设置所有只读  统一的css 控制
			console.log('readOnly');
			dtl_change();
		}
		
		//根据
		var temp = '${customerType}';
		
// 	    $("input[name='customerType']").on('ifChecked', function (event) {
// 	        var temp = event.target.value;
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
// 	});
    $().ready(function () {
    	var customerType = $("#customerType").val();
    	console.log(customerType+'  customerType');
//         $("input[name='customerType']").each(function () {
//             if ($(this).attr("checked") == 'checked') {
//                 customerType = $(this).val();
//             }
//         })
      
      var typeValue =  $('#type').val();
      if(typeValue == 'pass'){
//  		alert("进入检验方法");
        if(customerType==1){
           $("form").validate({
                rules: {
//                     busLicenceCftFile: {
//                         required: true,
//                         checkName: true
//                     },
//                     taxRegCtfFile: {
//                         required: true,
//                         checkName: true
//                     },
//                     orgCodeCtfFile: {
//                         required: true,
//                         checkName: true
//                     },
//                     legalPerCtfFile: {
//                         required: true,
//                         checkName: true
//                     },
//                     accountOpenCtfFile: {
//                         required: true,
//                         checkName: true
//                     },
//                     speIndusLicenceCtFile: {
//                         required: true,
//                         checkName: true
//                     },
                    merchantIndustry: {
                    	required:true,
                    },
                    merchantFeature: {
                    	required:true,
                    },
                    licenseNumber: {
                    	required:true,
                    },
                    merchantType: {
                    	required:true,
                    },
                    merchantName: {
                    	required:true,
                    },
                    merchantShortName: {
                    	required:true,
                    },
                    websiteDomain:{
                    	required:true,
                    },
                    merchantBusCode:{
                    	required:true,
                    },
                    belongAgentMctNo:{
                    	required:true,
                    },
                    belongGroupMctNo:{
                    	required:true,
                    },
                    registerAddress:{
                    	required:true,
                    },
                    contactAddress:{
                    	required:true,
                    },
                    belongAgentMctNo:{
                    	required:true,
                    },
                    belongGroupMctNo:{
                    	required:true,
                    },
                    
                    merchantClass:'required',
                    ipList:'required',
                    salesman:'required',
                    salesmanPhone:'required',
                    legalPerson:'required',
                    legalPerPhoneNo:'required',
                    legalPerCtfType:'required',
                    legalPerCtfNo:'required',
                    legalPerCtfDate:'required',
                    merchantContactPerson:'required',
                    merchantContactPhone:'required',
                    merchantContactEmail:'required',
                    busLicenceNo:'required',
                    taxRegCtfNo:'required',
                    orgCode:'required',
                    speIndusLicenceNo:'required',
                    icpRecordNumber:'required',
                    virtualAccCurrency:'required',
                    feePayType:'required',
                    accountOpenBank:'required',
                    bankAddress:'required',
                    accountType:'required',
                    accountName:'required',
                    accountNo:'required',
                    accountOpenCtfType:'required',
                    accountOpenCtfNo:'required',
                    accountRemainPhone:'required',
                    settleType:'required',
                    settleCycle: {
                        required: true,
                        number: true,
                        digits: true
                    },
                },
                messages: {
                	 busLicenceCftFile: {
                         required: "请选择图片"
                     },
                     taxRegCtfFile: {
                         required: "请选择图片"
                     },
                     orgCodeCtfFile: {
                         required: "请选择图片"
                     },
                     legalPerCtfFile: {
                         required: "请选择图片"
                     },
                     accountOpenCtfFile: {
                         required: "请选择图片"
                     },
                     speIndusLicenceCtFile: {
                         required: "请选择图片"
                     }
                },
                submitHandler: function (form) {
                	commit('pass');
//                     form.submit();
                }
            });
        }else if (customerType == 2) {
        	$("form").validate({
                rules: {
//                     legalPerCtfFile: {
//                         required: true,
//                         checkName: true
//                     },
//                     accountOpenCtfFile: {
//                         required: true,
//                         checkName: true
//                     },
//                     speIndusLicenceCtFile: {
//                         required: true,
//                         checkName: true
//                     },
                    belongGroupMctNo:{
                    	required:true,
                    },
                    registerAddress:{
                    	required:true,
                    },
                    contactAddress:{
                    	required:true,
                    },
                    salesman:'required',
                    salesmanPhone:'required',
                    legalPerson:'required',
                    legalPerPhoneNo:'required',
                    legalPerCtfType:'required',
                    legalPerCtfNo:'required',
                    legalPerCtfDate:'required',
                    merchantContactPerson:'required',
                    merchantContactPhone:'required',
                    merchantContactEmail:'required',
                    accountOpenBank:'required',
                    bankAddress:'required',
                    accountType:'required',
                    accountName:'required',
                    accountNo:'required',
                    accountOpenCtfType:'required',
                    accountOpenCtfNo:'required',
                    accountRemainPhone:'required',
                    settleType:'required',
                    settleCycle: {
                        required: true,
                        number: true,
                        digits: true
                    },
//                     reportData: 'required',
//                     feeData: 'required'

                },
                messages: {
                     legalPerCtfFile: {
                         required: "请选择图片"
                     },
                     accountOpenCtfFile: {
                         required: "请选择图片"
                     },
                     speIndusLicenceCtFile: {
                         required: "请选择图片"
                     }
                },
                submitHandler: function (form) {
                	commit('pass');
//                     form.submit();
                }
           		
            });
        }
        jQuery.validator.addMethod('checkName', function (value, element) {
            var name = /([a-zA-Z0-9\u4e00-\u9fa5]+)(.jpg|.JPG|.png|.PNG)$/
            return this.optional(element) || name.test(value);
        }, '格式不正确');
        jQuery.validator.addMethod('checkCompanyEmail', function (value, element) {
            var exist;
            $.ajax({
                url: "<%=request.getContextPath()%>/merpiece/checkCompanyEmail.do",
                data: {companyEmail: $("#companyEmail").val()},
                type: 'POST',
                async: false,
                success: function (data) {
                    if (data == 'exist') {
                        exist = false;
                    } else {
                        exist = true;
                    }
                }
            })
            return this.optional(element) || exist;
        }, '该邮箱已存在请重新输入');
        jQuery.validator.addMethod('checkIdCard', function (value, element) {
            var no = /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
            return this.optional(element) || no.test(value);
        }, '求输入正确的身份证号码');
      }
    })


    $(function () {
        $.fn.serializeName = function ()  //获取form表单下全部的name 
        {
            var o = [];
            var a = this.serializeArray();
            $.each(a, function () {
                o.push(this.name);
            });
            return o;
        };
    });

</script>
<script type="text/javascript">
		//设置所有元素不可编辑
		 $('#subform').find('input,textarea,select').attr("disabled",true);
</script>
</body>
</html>
