<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp" %>
<html lang="en">
<head>
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
    <title>进件录入</title>
</head>

<body class=" ">
<div id="cover" style="display: none;">
	 	<img src="<%=request.getContextPath() %>/statics/v2/images/wait_processing.gif">
	</div>
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
                <li>商户管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
                </li>
                <li class="active">商户信息录入</li>
            </ol>
            <div class="clearfix"></div>
        </div>
        <!--END TITLE & BREADCRUMB PAGE-->
        <!--BEGIN CONTENT-->
        <div class="page-content">
            <div class="panel panel-default  withoutbottom clearfix">
                <header class="panel-heading clearfix">
                    <h2 class="panel-title">商户信息录入</h2>
                </header>


                <div class="panel-body clearfix">
                    <form class="form-horizontal" role="form" method="post" enctype="multipart/form-data" id="subform" action="<%=request.getContextPath()%>/merchant/newCreateMerchant">
                        <!--主体部分start-->
                        <div style="text-align: center">
                            <td>商户分类：</td>
                            <input type="radio" name="merchantClass" value="TO_PUBLIC_TYPE" checked="checked"> 对公
                            <input type="radio" name="merchantClass" value="TO_PRIVATE_TYPE"> 对私
                        </div>
                        <div class="panel-inner">
                            <h2 class="panel-inner-title panel-inner-title-default">商户证件照上传</h2>
                            <div class="panel-inner-body">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="license">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">营业执照<span>*</span></td>
                                                <td><input type="file" id="file-input1" name="busLicenceCftFile"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="ccol-lg-4 col-md-4 col-sm-6 col-xs-12" id="tax">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">税务登记证<span>*</span></td>
                                                <td><input type="file" id="file-input2" name="taxRegCtfFile"></td>
                                            </tr>
                                        </table>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="organization">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">组织机构代码证<span>*</span></td>
                                                <td><input type="file" id="file-input3" name="orgCodeCtfFile"></td>
                                            </tr>
                                        </table>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" >
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">法人证件照<span>*</span></td>
                                                <td><input type="file" id="file-input4" name="legalPerCtfFile"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">银行开户证明<span>*</span></td>
                                                <td><input type="file" id="file-input5" name="accountOpenCtfFile"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">特殊行业经营许可证路径</td>
                                                <td><input type="file" id="file-input6" name="speIndusLicenceCtFile"></td>
                                            </tr>
                                        </table>
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
                                                    	<option value="">请选择</option>
                                                    	<option value="CY">餐饮</option>
                                                    	<option value="YL">娱乐</option>
                                                    	<option value="DS">电商</option>
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
                                                    	<option value="">请选择</option>
                                                    	<option value="AGENT_MER">代理商</option>
                                                    	<option value="NORMAL_MER">普通商户</option>
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
                                                    	<option value="">请选择</option>
                                                    	<option value="B2B">B2B</option>
                                                    	<option value="B2C">B2C</option>
                                                    	<option value="P2P">P2P</option>
                                                    	<option value="P2C">P2C</option>
                                                    	<option value="O2O">O2O</option>
                                                    	<option value="C2C">C2C</option>
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
                                                    <input type="text" class="form-control" id="merchantName" name="merchantName">
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
                                                <td><input type="text" class="form-control" id="merchantShortName" name="merchantShortName"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">网站域名</td>
                                                <td><input type="text" class="form-control" id="websiteDomain" name="websiteDomain"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">商户业务码</td>
                                                <td><input type="text" class="form-control" id="merchantBusCode" name="merchantBusCode"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" id="merchant1">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">所属代理商</td>
                                                <td>
                                               <select name="belongAgentMctNo" id="belongAgentMctNo" class="form-control" >
                                                		<option value="">请选择</option>
                                                		<c:forEach var="agentMcts" items="${agentMcts}">
                                                				<option value="${agentMcts.merchantNo }">${agentMcts.merchantName }</option>
                                                		</c:forEach>
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
                                                <td><input type="text" class="form-control" id="registerAddress" name="registerAddress"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">联系地址<span>*</span></td>
                                                <td><input type="text" class="form-control" id="contactAddress" name="contactAddress"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" id="merchant2">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">需代理商提供技术<span>*</span></td>
                                                <td>
                                                	<select class="form-control" id="isITSptByAgent" tabindex="10" name="isITSptByAgent">
                                                    	<option value="">请选择</option>
                                                    	<option value="Y">是</option>
                                                    	<option value="N">否</option>
                                                	</select>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">所属销售<span>*</span></td>
                                                <td><input type="text" class="form-control" id="salesman" name="salesman" maxlength="50"></td>
                                            </tr>
                                        </table>
                                    </div>
                                 </div>
                                 <div class="row" >
                                    <!-- <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" id="merchant3">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">商户服务器ip列表<span>*</span></td>
                                                <td>
                                                    <input type="text" class="form-control" id="ipList" name="ipList"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </div> -->
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">销售联系电话</td>
                                                <td><input class="form-control" id="salesmanPhone" name="salesmanPhone"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">互联网商编<span>*</span></td>
                                                <td><input class="form-control" id="interNo" name="interNo"></td>
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
                                                <td><input type="text" class="form-control" id="legalPerson" name="legalPerson">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right" >法人联系电话<span>*</span>
                                                </td>
                                                <td><input type="text" class="form-control" id="legalPerPhoneNo" name="legalPerPhoneNo">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" >
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">法人证件类型<span>*</span></td>
                                                <td>
                                                	<select class="form-control" id="legalPerCtfType" tabindex="10" name="legalPerCtfType">
                                                    	<option value="">请选择</option>
                                                    	<option value="ID_CARD">身份证</option>
                                                    	<option value="PASS_PORT">护照</option>
                                                    	<option value="RESIDENCE">户口本</option>
                                                    	<option value="OFFICIAL_CARD">军官证</option>
                                                    	<option value="HK_MACAO_CARD">往来港澳</option>
                                                    	<option value="TAIWAN_CARD">台胞证</option>
                                                    	<option value="TEMP_ID_CARD">临时身份证</option>
                                                    	<option value="OTHER">其他</option>
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
                                                	<input class="form-control" id="legalPerCtfNo" name="legalPerCtfNo" maxlength="18" style="width:150px;">
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
														<input type="text" class="form-control" id="legalPerCtfDate" name="legalPerCtfDate"/>
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
                                                	<input type="text" class="form-control" id="merchantContactPerson" name="merchantContactPerson">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">业务联系电话<span>*</span></td>
                                                <td>
                                                	<input type="text" class="form-control" id="merchantContactPhone" name="merchantContactPhone" maxlength="11" onkeyup="this.value=this.value.replace(/[^\d-]/g,'')">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">业务联系人邮箱<span>*</span></td>
                                                <td>
                                                	<input type="text" class="form-control" id="merchantContactEmail" name="merchantContactEmail" maxlength="50">
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
                                                	<input type="text" class="form-control" id="busLicenceNo" name="busLicenceNo">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">税务登记编号<span>*</span></td>
                                                <td>
                                                	<input type="text" class="form-control" id="taxRegCtfNo" name="taxRegCtfNo" maxlength="11" onkeyup="this.value=this.value.replace(/[^\d-]/g,'')">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">组织机构代码编号<span>*</span></td>
                                                <td>
                                                	<input type="text" class="form-control" id="orgCode" name="orgCode" maxlength="50">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">特殊行业经营许可证编号</td>
                                                <td>
                                                	<input type="text" class="form-control" id="speIndusLicenceNo" name="speIndusLicenceNo" maxlength="50">
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
                                                	<input type="text" class="form-control" id="icpRecordNumber" name="icpRecordNumber" maxlength="50">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                     <!-- 
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">虚拟账户开通币种<span>*</span></td>
                                                <td>
                                                	<input type="text" class="form-control" id="virtualAccCurrency" name="virtualAccCurrency" maxlength="50">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">手续费收取方式</td>
                                                <td>
                                                	<select name="feePayType" id="feePayType" tabindex="10" class="form-control">
                                                        <option value="">请选择</option>
                                                        <option value="NOW_GET">实收</option>
                                                        <option value="AFTRE_GET">后收</option>
                                                    </select>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    -->
                                </div>
                            </div>
                        </div>
                         <!-- 
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
                                                            <option value="${bankData.shortName}">${bankData.bankName}</option>
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
                                                <td><input class="form-control" id="bankAddress" name="bankAddress"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">账户类型<span>*</span></td>
                                                <td>
                                                	<select class="form-control" id="accountType" tabindex="10" name="accountType">
	                                                    <option value="">请选择</option>
	                                                    <option value="TO_PUBLIC_TYPE">对公</option>
	                                                    <option value="TO_PRIVATE_TYPE">对私</option>
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
                                                	<input type="text" class="form-control" id="accountName" name="accountName">
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
                                                	<input type="text" class="form-control" id="accountNo" name="accountNo" onkeyup='this.value=this.value.replace(/\D/gi,"")'>
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
	                                                    <option value="">请选择</option>
	                                                    <option value="ID_CARD">身份证</option>
	                                                    <option value="PASS_PORT">护照</option>
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
                                                	<input type="text" class="form-control" id="accountOpenCtfNo" name="accountOpenCtfNo" onkeyup='this.value=this.value.replace(/\D/gi,"")'>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>

									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">开户人预留手机号<span>*</span></td>
                                                <td>
                                                	<input type="text" class="form-control" id="accountRemainPhone" name="accountRemainPhone" maxlength="11" onkeyup="this.value=this.value.replace(/[^\d-]/g,'')">
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
                                                <td width="120" class="text-right">手续费收取方式<span>*</span></td>
                                                <td>
                                                	<select name="feePayType" id="feePayType" tabindex="10" class="form-control">
                                                        <option value="">请选择</option>
                                                        <option value="ADVANCE">预付</option>
                                                        <option value="REALTIME">实收</option>
                                                        <option value="LATER">后收</option>
                                                    </select>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">结算类型<span>*</span></td>
                                                <td>
                                                	<select class="form-control" id="settleType" tabindex="10" name="settleType">
	                                                    <option value="">--请选择--</option>
	                                                    <option value="DEPENDENT">前置结算</option>
	                                                    <option value="AUTO">自动结算</option>
	                                                    <option value="FIXED">固定周期</option>
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
                                                    <input type="text" class="form-control" id="settleCycle" name="settleCycle">
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
                                                	<input type="text" class="form-control" id="reportData" name="reportData">
                                                </td>
                                            </tr>
                                        </table>
                                    </div> 
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="panel-inner">
							<h2 class="panel-inner-title panel-inner-title-default">手续费设置&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            	<button class="btn btn-primary" onclick="javascript:addFee();return false;">新增+</button>
                            </h2>
                            <div class="panel-inner-body">
                                <div class="row">
                                	<div id="feeList" style="display: none">
                                		<input type="hidden" name="feeData" id="feeData" value=""/>
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
												<td width="90">操作</td>
											</tr>
                                        </table>
                                    </div>
                                    <div id="feeAddDetail" style="display: none">
                                    	<hr></hr>
                                        <table width="98%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">商户编号<span>*</span></td>
                                                <td width="100">
                                                	<input type="text" class="form-control" id="merchantNo">
                                                </td>
                                                
                                                <td width="120" class="text-right">计费产品<span>*</span></td>
                                                <td width="100">
                                                	<select id="feeProduct" class="form-control">
														<option value="">请选择</option>
														<option value="LOCAL_REMIT">跨境人民币汇款</option>
														<option value="LOCAL_GATHER">跨境人民币收款</option>
														<option value="FOREX_SALE">跨境购付汇</option>
														<option value="FOREX_SETTLE">跨境收结汇</option>
														<option value="RECHARGE">充值</option>
														<option value="IDENTITY">实名认证</option>
													</select>
                                                </td>
                                                
                                                <td width="120" class="text-right">计费开始日期<span>*</span></td>
                                                <td width="100">
                                                    <div data-date-format="yyyy-mm-dd" class="input-group date datepicker-filter mbs">
														<span class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</span>
														<input type="text" class="form-control" id="ruleBeginDate" />
                                                    </div>
                                                </td>
                                                
                                                <td width="120" class="text-right">计费结束日期<span>*</span></td>
                                                <td width="100">
                                                	<div data-date-format="yyyy-mm-dd" class="input-group date datepicker-filter mbs">
														<span class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</span>
														<input type="text" class="form-control" id="ruleEndDate" />
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="100" class="text-right">计费类型<span>*</span></td>
                                                <td width="100">
                                                	<select class="form-control" id="feeType" onchange="changeType();">
														<option value="" selected="selected">未定义</option>
														<option value="STANDARD">标准计费</option>
														<option value="SINGLE_FIXED">单笔固定</option>
														<option value="REMIT_DEDUCT">汇款扣除</option>
														<option value="LESS_ADD">不足补收</option>
													</select>
                                                </td>
                                                
                                                <td width="100" class="text-right fixed">固定金额<span>*</span></td>
                                                <td width="100" class="fixed">
                                                	<input type="text" value="0.00" id="fixedAmount" class="form-control" onblur="checkAmount(this);">
                                                	<em for="fixedAmount" class="invalid"></em>
                                                </td>
                                                
                                                <td width="100" class="text-right remitDeduct">费率(小数)<span>*</span></td>
	                                             <td width="100" class="remitDeduct">
	                                             	<input type="text" value="0.00" id="remitDeduct_percentage" class="form-control" onblur="checkPercentage(this);">
	                                             	<em for="remitDeduct_percentage" class="invalid"></em>
	                                             </td>
                                            </tr>
                                            <tr id="standard">
                                            	<td width="100" class="text-right">额外加收金额<span>*</span></td>
                                                <td width="100">
                                                	<input type="text" value="0.00" id="addGatherAmount" class="form-control" onblur="checkAmount(this);">
                                                	<em for="addGatherAmount" class="invalid"></em>
                                                </td>
                                                
                                                <td width="100" class="text-right">费率(小数)<span>*</span></td>
                                                <td width="100">
                                                	<input type="text" value="0.0000" id="standard_percentage" class="form-control" onblur="checkPercentage(this);">
                                                	<em for="percentage" class="invalid"></em>
                                                </td>
                                                
                                                <td width="100" class="text-right">最低金额<span>*</span></td>
                                                <td width="100">
                                                	<input type="text" value="0.00" id="minAmount" class="form-control" onblur="checkAmount(this);">
                                                	<em for="minAmount" class="invalid"></em>
                                                </td>
                                                
                                                <td width="100" class="text-right">最高金额<span>*</span></td>
                                                <td width="100">
                                                	<input type="text" value="0.00" id="maxAmount" class="form-control" onblur="checkAmount(this);">
                                                	<em for="maxAmount" class="invalid"></em>
                                                </td>
                                            </tr>
                                            <tr id="lessLine">
                                                <td width="100" class="text-right">费率(小数)<span>*</span></td>
                                                <td width="100">
                                                	<input type="text" value="0.00" id="lessLine_percentage" class="form-control" onblur="checkPercentage(this);">
                                                	<em for="lessLine_percentage" class="invalid"></em>
                                            	</td>
                                            	
                                                <td width="100" class="text-right">限额<span>*</span></td>
                                                <td width="100">
                                                	<input type="text" value="0.00" id="lessLineAmount" class="form-control" onblur="checkAmount(this);">
                                                	<em for="lessLineAmount" class="invalid"></em>
                                                </td>
                                                
                                                <td width="100" class="text-right">不足补收手续费<span>*</span></td>
                                                <td width="100">
                                                	<input type="text" value="0.00" id="lessLineGatherFee" class="form-control" onblur="checkAmount(this);">
                                                	<em for="lessLineGatherFee" class="invalid"></em>
                                                </td>
                                            </tr>
                                            <tr>
                                            	<td colspan="1"></td>
                                            	<td><button class="btn btn-primary" onclick="javascript:add(this,'add');return false;">添加</button></td>
                                            </tr>
                                        </table>
                                    </div>  
                                </div>
                            </div>
                        </div>
                         -->
                        <div class="panel panel-default save-box-grey clearfix">
                            <center>
                                <button class="btn btn-primary margin30" onclick="javascript:createMerchant();return false;">
                                	<i class="fa fa-check-square-o"></i> 提交
                                </button>
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
<script type="text/javascript">
	function createMerchant(){
		//显示遮罩
		/**
		var items=[];
		$("#fee_items_table tr:not(:first)").map(function(){
			var values=[];
			var i=0;
			$(this).find("td").map(function(){
				values[i++]=$(this).attr('_val_');
			});
			items[items.length]=values;
		});
		
		var fee={
				merchantNo:'',
				feeProduct:'',
				feeType:'',
				ruleBeginDate:'',
				ruleEndDate:'',
				fixedAmount:'',
				percentage:'',
				minAmount:'',
				maxAmount:'',
				addGatherAmount:'',
				lessLineAmount:'',
				lessLineGatherFee:''
		};
		var rules=[];
		for(var i=0;i<items.length;i++){
			var item = items[i];
			fee.merchantNo=item[0];
			fee.feeProduct=item[1];
			fee.ruleBeginDate=item[2];
			fee.ruleEndDate=item[3];
			fee.feeType=item[4];
			fee.addGatherAmount=item[5];
			fee.percentage=item[6];
			fee.minAmount=item[7];
			fee.maxAmount=item[8];
			fee.fixedAmount=item[9];
			fee.lessLineAmount=item[10];
			fee.lessLineGatherFee=item[11];
			rules.push(fee);
		}
		
		var feeData = JSON.stringify(rules);
		console.log(feeData);
		console.log(feeData.length);
		if(feeData==null||feeData.length==2){
			alert("请完善手续费信息");
			return false;
		}else{
			$("#feeData").val(feeData);
			$("#subform").submit();
		}
		**/
// 		if(merchantFeatureVa!='AGENT_MER'&&($("#belongAgentMctNo").val()==""||($("#belongAgentMctNo").val())==null))
//     	{
//     		alert("请选择所属代理商");
//     		return;
//     	}
		$("#subform").submit();
		
	}
	function changeType(){
		$("#standard").hide();
		$(".fixed").hide();
		$("#lessLine").hide();
		$(".remitDeduct").hide();
		var feeType=$("#feeType").val();
		if(feeType=="STANDARD"){
			$("#standard").show();
		}else if(feeType=="SINGLE_FIXED"){
			$(".fixed").show();
		}else if(feeType=="REMIT_DEDUCT"){
			$(".remitDeduct").show();
		}else if(feeType=="LESS_ADD"){
			$("#lessLine").show();
		}else{
		}
	}
	function addFee(){
		$("#merchantNo").val("");
		$("#feeProduct").val("");
		$("#ruleBeginDate").val("");
		$("#ruleEndDate").val("");
		$("#feeType").val("");
		$("#fixedAmount").val("0.00");
		$("#remitDeduct_percentage").val("0.00");
		$("#addGatherAmount").val("0.00");
		$("#standard_percentage").val("0.00");
		$("#minAmount").val("0.00");
		$("#maxAmount").val("0.00");
		$("#lessLine_percentage").val("0.00");
		$("#lessLineAmount").val("0.00");
		$("#lessLineGatherFee").val("0.00");
		$("#feeAddDetail").attr('style', 'display:block');
	}
	function isNull(value){
		if(value==undefined||value==''){
			return true;
		}
		return false;
	}
	function add(btn,method){
		var	merchantNo=$('#merchantNo').val();
		if(isNull(merchantNo)){
			alert("请填写商户号");
			return false;
		}
		var feeProduct=$("#feeProduct").val();
		if(isNull(feeProduct)){
			alert("请选择计费项目");
			return false;
		}
		var feeType=$("#feeType").val();
		var ruleBeginDate=$("#ruleBeginDate").val();
		var ruleEndDate=$("#ruleEndDate").val();
		if(isNull(feeType)){
			alert("请选择计费方式!");
			return false;
		}
		if(isNull(ruleBeginDate)||isNull(ruleEndDate)){
			alert("规则起止时间不能为空!");
			return false;
		}
		if(ruleBeginDate>ruleEndDate){
			alert("规则开始日期不能大于结束日期!");
			return false;
		}
		var fixedAmount="0";
		var percentage="0";
		var minAmount="0";
		var maxAmount="0";
		var addGatherAmount="0";
		var lessLineAmount="0";
		var lessLineGatherFee="0";
		if(feeType=="STANDARD"){
			addGatherAmount=$("#addGatherAmount").val();
			percentage=$("#standard_percentage").val();
			minAmount=$("#minAmount").val();
			maxAmount=$("#maxAmount").val();
		}else if(feeType=="SINGLE_FIXED"){
			fixedAmount=$("#fixedAmount").val();
		}else if(feeType=="REMIT_DEDUCT"){
			percentage=$("#remitDeduct_percentage").val();
		}else if(feeType=="LESS_ADD"){
			percentage=$("#lessLine_percentage").val();
			lessLineAmount=$("#lessLineAmount").val();
			lessLineGatherFee=$("#lessLineGatherFee").val();
		}else{
			alert("未知计费方式");
			return false;
		}
		if(confirm("所有金额如果没填将默认为0,是否确定提交?")){
			//判断是否已经添加了
			//查出现在有的
			var items=[];
			$("#fee_items_table tr:not(:first,:last)").map(function(){
				var values=[];
				var i=0;
				$(this).find("td").map(function(){
					values[i++]=$(this).attr('_val_');
				});
				items[items.length]=values;
			});
			for(var i=0;i<items.length;i++){
				var item = items[i];
				//如果
				if(item[0]==merchantNo&&item[1]==feeProduct){
					alert("商户计费规则以存在!");
					return false;
				}
			}
			//添加到table中
			var tr = $("<tr align='center'></tr>");
			tr.append("<td _val_='"+merchantNo+"'>"+merchantNo+"</td>");
			tr.append("<td _val_='"+feeProduct+"'>"+$("#feeProduct").find("option:selected").text()+"</td>");
			tr.append("<td _val_='"+ruleBeginDate+"'>"+ruleBeginDate+"</td>");
			tr.append("<td _val_='"+ruleEndDate+"'>"+ruleEndDate+"</td>");
			tr.append("<td _val_='"+feeType+"'>"+$('#feeType').find("option:selected").text()+"</td>");
			tr.append("<td _val_='"+addGatherAmount+"'>"+addGatherAmount+"</td>");
			tr.append("<td _val_='"+percentage+"'>"+percentage+"</td>");
			tr.append("<td _val_='"+minAmount+"'>"+minAmount+"</td>");
			tr.append("<td _val_='"+maxAmount+"'>"+maxAmount+"</td>");
			tr.append("<td _val_='"+fixedAmount+"'>"+fixedAmount+"</td>");
			tr.append("<td _val_='"+lessLineAmount+"'>"+lessLineAmount+"</td>");
			tr.append("<td _val_='"+lessLineGatherFee+"'>"+lessLineGatherFee+"</td>");
			tr.append("<td><button onclick='javascript:del_tr(this);return false;'>删除</button></td>");
			$("#fee_items_table tr:last").after(tr);
			$("#feeList").attr('style', 'display:block');
			$("#feeAddDetail").attr('style', 'display:none');
		}
	}
	function del_tr(tdson){
		if(confirm("是否确定删除?")){
			$(tdson.parentNode.parentNode).remove();
		}
	}
	function isMoney(money){
		var reg = /^[\d]+[\.]{0,1}[\d]{0,2}$/;
		return reg.test(money);
	}
	function isRate(rate){
		var reg = /^[\d]+[\.]{0,1}[\d]{0,4}$/;
		return reg.test(rate);
	}
	function formatMoney(money){
		if(isMoney(money)){
			var index = money.indexOf(".");
			if(index==-1){
				money=money+".00";
				return money;
			}
			while(money.substring(index).length<3){
				money=money+"0";
			}
			return money;
		}
	}
	function checkAmount(form){
		$(form).parent().removeClass("state-success");
		$(form).parent().children(".invalid").attr('style', 'display:block');
		var error="";
		if(isMoney(form.value)){
			$(form).parent().addClass("state-success");
			$(form).parent().children(".invalid").attr('style', 'display:none');
			form.value=formatMoney(form.value);
		}else{
			$(form).parent().addClass("state-error");
			$(form).parent().children(".form-control").addClass("invalid");
			error="金额格式错误!";
			$(form).parent().children(".invalid").text(error);
		}
	}
	function checkPercentage(form){
		$(form).parent().removeClass("state-success");
		$(form).parent().children(".invalid").attr('style', 'display:block');
		var error="";
		if(!isRate(form.value)){
			$(form).parent().addClass("state-error");
			$(form).parent().children(".form-control").addClass("invalid");
			error="费率格式错误!";
			$(form).parent().children(".invalid").text(error);
		}else{
			$(form).parent().addClass("state-success");
			$(form).parent().children(".invalid").attr('style', 'display:none');
		}
	}
	
	$(function () {
	    $("input[name='merchantClass']").on('ifChecked', function (event) {
	        var temp = event.target.value;
	        if (temp == 'TO_PUBLIC_TYPE') {
	            $("#license").attr('style', 'display:block');
	            $("#tax").attr('style', 'display:block');
	            $("#organization").attr('style', 'display:block');
	            $("#agent1").attr('style', 'display:block');
	            $("#agent2").attr('style', 'display:block');
	            $("#merchant1").attr('style', 'display:block');
	            $("#merchant2").attr('style', 'display:block');
	            $("#acceptLicense").attr('style', 'display:block');
	        }
	        if (temp == 'TO_PRIVATE_TYPE') {
	            $("#license").attr('style', 'display:none');
	            $("#tax").attr('style', 'display:none');
	            $("#organization").attr('style', 'display:none');
	            $("#agent1").attr('style', 'display:none');
	            $("#agent2").attr('style', 'display:none');
	            $("#merchant1").attr('style', 'display:none');
	            $("#merchant2").attr('style', 'display:none');
	            $("#acceptLicense").attr('style', 'display:none');
	        }
	    });
	});
    $().ready(function () {
    	var merchantClass;
        $("input[name='merchantClass']").each(function () {
            if ($(this).attr("checked") == 'checked') {
            	merchantClass = $(this).val();
            }
        })
      
        if(merchantClass=='TO_PUBLIC_TYPE'){
            $("form").validate({
                rules: {
                    busLicenceCftFile: {
                        required: true,
                        checkName: true
                    },
                    taxRegCtfFile: {
                        required: true,
                        checkName: true
                    },
                    orgCodeCtfFile: {
                        required: true,
                        checkName: true
                    },
                    legalPerCtfFile: {
                        required: true,
                        checkName: true
                    },
                    accountOpenCtfFile: {
                        required: true,
                        checkName: true
                    },
                    speIndusLicenceCtFile: {
                        required: false,
                        checkName: true
                    },
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
                    belongAgentMctNo:{
                    	required:false,
                    },
                    registerAddress:{
                    	required:true,
                    },
                    contactAddress:{
                    	required:true,
                    },
                    isITSptByAgent:'required',
                    salesman:'required',
                    legalPerson:'required',
                    legalPerPhoneNo:'required',
                    legalPerCtfType:'required',
                    legalPerCtfNo:'required',
                    merchantContactPerson:'required',
                    merchantContactPhone:'required',
                    merchantContactEmail:'required',
                    busLicenceNo:'required',
                    taxRegCtfNo:'required',
                    orgCode:'required',
                    accountOpenBank:'required',
                    bankAddress:'required',
                    accountType:'required',
                    accountName:'required',
                    accountNo:'required',
                    accountOpenCtfType:'required',
                    accountOpenCtfNo:'required',
                    accountRemainPhone:'required',
                    settleType:'required',
                    feePayType:'required',
                    settleCycle: {
                        required: true,
                        number: true,
                        digits: true
                    },
                    reportData: 'required',
                    feeData: 'required' 
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
            		showCover();
                    form.submit();
                }
           		
            });
        }else if (merchantClass == 'TO_PRIVATE_TYPE') {
        	$("form").validate({
                rules: {
                    legalPerCtfFile: {
                        required: true,
                        checkName: true
                    },
                    accountOpenCtfFile: {
                        required: true,
                        checkName: true
                    },
                    speIndusLicenceCtFile: {
                        required: true,
                        checkName: true
                    },
                    registerAddress:{
                    	required:true,
                    },
                    contactAddress:{
                    	required:true,
                    },
                    salesman:'required',
                    legalPerson:'required',
                    legalPerPhoneNo:'required',
                    legalPerCtfType:'required',
                    legalPerCtfNo:'required',
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
                    reportData: 'required',
                    feeData: 'required'
				
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
                	console.log("eeeeeeeeeeeeeeeeeeeeeeeeeeeee");
                    form.submit();
                }
           		
            });
        }
        

        $("#merchantFeature").change(function(){
    		var va = $(this).val();
    		merchantFeatureVa = va;
    		if(va=='AGENT_MER')
    		{
    			$("#belongAgentMctNo").val("");
    			$("#merchant1").attr('style', 'display:none');
    		}else
    		{
    			$("#belongAgentMctNo").val("");
    			$("#merchant1").attr('style', 'display:show');
    		}
    	});
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

</body>
</html>
