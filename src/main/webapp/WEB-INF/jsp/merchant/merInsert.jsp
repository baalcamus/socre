<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp" %>
<html lang="en">
<head>
    <title>商户录入</title>
    <script type="text/javascript">
        function getFlowInfo() {
            $.post("<%=request.getContextPath()%>/cbMerchant/selectCbMerchantsByMerLevel", {
                        merLevel: $("#merLevel").val()=='MERCHANT'? 'AGENT':'MERCHANT'
                    },
                    function (data) {
                        if (data == ''||data ==null) {
                            var str = '<select class="form-control" id="nameOfAgent" tabindex="10" name="nameOfAgent"><option value="">请选择</option><option>爱农</option></select>'
                            document.all('agentName').innerHTML = str;
                        } else if (data != "") {
                            var str = '<select class="form-control" id="nameOfAgent" tabindex="10" name="nameOfAgent">';
                            str += '<option value="">请选择</option><option>爱农</option>' ;
                            $.each( data, function(index, content)
                            {
                                str += "<option value='"+content.merName+"'>" +content.merName + "</option>";
                            });
                            str += "</select>";
                            document.all('agentName').innerHTML = str;
                        }
                    })
        }

    </script>
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
                    <form class="form-horizontal" role="form" method="post"
                          enctype="multipart/form-data" id="subform"
                          action="<%=request.getContextPath()%>/cbMerchant/createCbMerchant.do">
                        <!--主体部分start-->
                        <div style="text-align: center">
                            <td>商户类型：</td>
                            <input type="radio" name="customerType" value="1" checked="checked"> 企业
                            <input type="radio" name="customerType" value="2"> 个人
                        </div>
                        <div class="panel-inner">
                            <h2 class="panel-inner-title panel-inner-title-default">
                                商户附件上传</h2>
                            <div class="panel-inner-body">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="license">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">营业执照</td>
                                                <td><input type="file" id="file-input1"
                                                           name="licenseFile"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="ccol-lg-4 col-md-4 col-sm-6 col-xs-12" id="tax">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">税务登记证</td>
                                                <td><input type="file" id="file-input2"
                                                           name="taxFile"></td>
                                            </tr>
                                        </table>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="organization">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">组织机构代码证</td>
                                                <td><input type="file" id="file-input3"
                                                           name="organizationFile"></td>
                                            </tr>
                                        </table>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">身份证</td>
                                                <td><input type="file" id="file-input4"
                                                           name="idCardFile"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">银行开户证明</td>
                                                <td><input type="file" id="file-input5"
                                                           name="bankCardFile"></td>
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
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">流程号<span>*</span></td>
                                                <td><input class="form-control"
                                                           name="flowNumber" value="${flowNumber}" readonly="readonly">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" id="agent2">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">商户性质<span>*</span></td>
                                                <td><select onchange="getFlowInfo()" class="form-control"
                                                            id="merLevel"
                                                            tabindex="10"
                                                            name="merLevel">
                                                    <option value="">请选择</option>
                                                    <option value="MERCHANT">普通商户</option>
                                                    <option value="AGENT">代理商</option>
                                                </select></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" id="agent1">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">代理商名称<span>*</span></td>
                                                <td id="agentName"><select class="form-control" id="nameOfAgent"
                                                                           tabindex="10" name="nameOfAgent">
                                                    <option value="">请选择</option>
                                                    <option>爱农</option>
                                                </select>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">销售名称<span>*</span></td>
                                                <td><!-- <select class="form-control" id="signPerson" tabindex="10" name="signPerson">
														<option>田丰</option>
														<option>唐旭</option>
												</select> -->


                                                    <input type="text" class="form-control"
                                                           id="signPerson" name="signPerson">


                                                    <%-- 	<select name="signPerson" id="signPerson" tabindex="10"
                                                            class="form-control">
                                                            <option value="">请选择</option>
                                                            <c:forEach items="${sales}" var="sale">
                                                                <option
                                                                    value="${sale.name}">
                                                                    ${sale.name}
                                                                </option>
                                                            </c:forEach>
                                                            </select> --%>


                                                </td>
                                            </tr>
                                        </table>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" id="merchant1">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">商户简称<span>*</span></td>
                                                <td><input type="text" class="form-control"
                                                           id="merShortName" name="merShortName"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" id="merchant2">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">商户执照名称<span>*</span></td>
                                                <td><input type="text" class="form-control"
                                                           id="merName" name="merName"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" id="merchant3">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">商户执照号<span>*</span></td>
                                                <td><input type="text" class="form-control"
                                                           id="licenseNumber" name="licenseNumber"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" id="merchant4">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">税务登记号<span>*</span></td>
                                                <td><input type="text" class="form-control"
                                                           id="taxId" name="taxId"
                                                           onkeyup='this.value=this.value.replace(/\D/gi,"")'></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" id="merchant5">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">组织机构证<span>*</span></td>
                                                <td><input type="text" class="form-control"
                                                           id="organizationCode" name="organizationCode"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">入网地址<span>*</span></td>
                                                <td><input type="text" class="form-control"
                                                           id="networkAddress" name="networkAddress"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">入网时间<span>*</span></td>
                                                <td>
                                                    <input type="text" value="${networkDate}"
                                                           class="form-control" id="networkDate" readonly="readonly"
                                                           name="networkDate"/>
                                                </td>
                                            </tr>
                                        </table>

                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" id="merchant6">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">公司邮箱<span>*</span></td>
                                                <td><input type="text" class="form-control"
                                                           id="companyEmail"
                                                           name="companyEmail" <%--onblur="checkEmail()"--%>
                                                           maxlength="50"></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" id="merchant7">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">ICP备案号/app名称<span>*</span></td>
                                                <td><input class="form-control"
                                                           id="icpRecordNumber" name="icpRecordNumber"></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="panel-inner">
                            <h2 class="panel-inner-title panel-inner-title-default">商户法人信息
                            </h2>
                            <div class="panel-inner-body">
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right" id="merchant8">法人名称<span>*</span>
                                                </td>
                                                <td><input type="text" class="form-control"
                                                           id="merLegalPerson" name="merLegalPerson">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">身份证号<span>*</span></td>
                                                <td><input class="form-control"
                                                           id="merLegalIdCard" name="merLegalIdCard" maxlength="18"
                                                           style="width:150px;"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">证件有效期<span>*</span></td>
                                                <td>
                                                    <div data-date-format="yyyy-mm-dd"
                                                         class="input-group date datepicker-filter mbs">
														<span class="input-group-addon"><i
                                                                class="fa fa-calendar"></i></span><input type="text"
                                                                                                         class="form-control"
                                                                                                         id="validityOfDocuments"
                                                                                                         name="validityOfDocuments"/>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-inner">
                            <h2 class="panel-inner-title panel-inner-title-default">商户联系人信息
                            </h2>
                            <div class="panel-inner-body">
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">联系人名称<span>*</span></td>
                                                <td><input type="text" class="form-control"
                                                           id="contacter" name="contacter"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">联系电话<span>*</span></td>
                                                <td><input type="text" class="form-control"
                                                           id="contacterPhone" name="contacterPhone" maxlength="11"
                                                           onkeyup="this.value=this.value.replace(/[^\d-]/g,'')"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">Email<span>*</span></td>
                                                <td><input type="text" class="form-control"
                                                           id="contacterEmail" name="contacterEmail"
                                                           maxlength="50"></td>
                                            </tr>
                                        </table>
                                    </div>


                                </div>


                            </div>
                        </div>
                        <div class="panel-inner">
                            <h2 class="panel-inner-title panel-inner-title-default">商户账户信息
                            </h2>
                            <div class="panel-inner-body">
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">开户行<span>*</span></td>
                                                <td>
                                                    <select name="acqAgentName" <%--onchange="changeBank()"--%>
                                                            id="acqAgentName" tabindex="10"
                                                            class="form-control">
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
                                                <td width="120" class="text-right">开户行名称<span>*</span></td>
                                                <td><input class="form-control"
                                                           id="openBankName" name="openBankName"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <%--									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                                            <table width="100%" class="product_detail_list">
                                                                                <tr id="tr1" hidden="true">
                                                                                    <td width="120" class="text-right"><span>银行名称*</span></td>
                                                                                    <td><input  class="form-control"
                                                                                        id="otherBank" name="otherBank" hidden="true" onblur="getBankInfo()"></td>
                                                                                </tr>
                                                                            </table>
                                                                        </div>--%>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">账户类型<span>*</span></td>
                                                <td><select class="form-control" id="settAccType" tabindex="10"
                                                            name="settAccType">
                                                    <option value="">请选择</option>
                                                    <option value="TO_PUBLIC_TYPE">对公</option>
                                                    <option value="TO_PRIVATE_TYPE">对私</option>
                                                </select></td>
                                            </tr>
                                        </table>
                                    </div>

                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">账户名称<span>*</span></td>
                                                <td><input type="text" class="form-control"
                                                           id="settAccountName" name="settAccountName"></td>
                                            </tr>
                                        </table>
                                    </div>

                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">开户账号<span>*</span></td>
                                                <td><input type="text" class="form-control"
                                                           id="settAccountNo" name="settAccountNo"
                                                           onkeyup='this.value=this.value.replace(/\D/gi,"")'></td>
                                            </tr>
                                        </table>
                                    </div>


                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">结算方式<span>*</span></td>
                                                <td><select class="form-control" id="clearType" tabindex="10"
                                                            name="clearType">
                                                    <option value="">--请选择--</option>
                                                    <option value="00">作扣</option>
                                                    <option value="01">预存</option>
                                                    <option value="02">月结</option>
                                                </select></td>
                                            </tr>
                                        </table>
                                    </div>

                                </div>


                            </div>
                        </div>
                        <div class="panel-inner">
                            <h2 class="panel-inner-title panel-inner-title-default">商户清算信息
                            </h2>
                            <div class="panel-inner-body">
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">清算周期<span>*</span></td>
                                                <td>
                                                    <!-- 	<select class="form-control" id="billCycle" tabindex="10" name="billCycle">
                                                            <option>T+0</option>
                                                            <option value="1|D">T+1</option>
                                                            <option value="1|M">1|M</option>
                                                        </select> -->
                                                    <input type="text" class="form-control"
                                                           id="billCycle" name="billCycle">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>


                                </div>


                            </div>
                        </div>

                        <div class="panel panel-default save-box-grey clearfix">
                            <center>
                                <button class="btn btn-primary margin30" type="submit"><i
                                        class="fa fa-check-square-o"></i> 提交
                                </button>
                                <!-- <input type="button" value="重置"  id="btn2"  onclick="reset()"  class="btn btn-dark" />  -->
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
    $(function () {
        $("input[name='customerType']").on('ifChecked', function (event) {
            var temp = event.target.value;
            if (temp == 1) {
                $("#license").attr('style', 'display:block');
                $("#tax").attr('style', 'display:block');
                $("#organization").attr('style', 'display:block');
                $("#agent1").attr('style', 'display:block');
                $("#agent2").attr('style', 'display:block');
                $("#merchant1").attr('style', 'display:block');
                $("#merchant2").attr('style', 'display:block');
                $("#merchant3").attr('style', 'display:block');
                $("#merchant4").attr('style', 'display:block');
                $("#merchant5").attr('style', 'display:block');
                $("#merchant6").attr('style', 'display:block');
                $("#merchant7").attr('style', 'display:block');
                $("#merchant8").html('法人名称');
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
                $("#merchant4").attr('style', 'display:none');
                $("#merchant5").attr('style', 'display:none');
                $("#merchant6").attr('style', 'display:none');
                $("#merchant7").attr('style', 'display:none');
                $("#merchant8").html('客户名称');

            }
        });
    });


    //    $("form").validate({
    //            rules:{
    //                merShortName:{
    //                    required: true
    //                }
    //            },
    //            messages:{
    //                merShortName:{
    //                    required :'请输入商户简称'
    //                }
    //            },
    //            submitHandler:function(form) {
    //                form.submit();
    //
    //            }
    //        })
    $().ready(function () {
        var customerType;
        $("input[name='customerType']").each(function () {
            if ($(this).attr("checked") == 'checked') {
                customerType = $(this).val();
            }
        })
        if (customerType == 1) {
            $("form").validate({
                rules: {
                    merShortName: {
                        required: true
                    },
                    licenseFile: {
                        required: true,
                        checkName: true
                    },
                    taxFile: {
                        required: true,
                        checkName: true
                    },
                    organizationFile: {
                        required: true,
                        checkName: true
                    },
                    idCardFile: {
                        required: true,
                        checkName: true
                    },
                    bankCardFile: {
                        required: true,
                        checkName: true
                    },
                    flowNumber: {
                        required: true
                    },
                    merLevel: {
                        required: true
                    },
                    nameOfAgent: 'required',
                    signPerson: 'required',
                    merName: 'required',
                    licenseNumber: 'required',
                    taxId: 'required',
                    organizationCode: 'required',
                    networkAddress: 'required',
                    networkDate: {
                        required: true,
                        date: true
                    },
                    companyEmail: {
                        required: true,
                        email: true,
                        checkCompanyEmail: true
                    },
                    icpRecordNumber: 'required',
                    merLegalPerson: 'required',
                    merLegalIdCard: {
                        required: true,
                        checkIdCard: true
                    },
                    validityOfDocuments: {
                        required: true,
                        date: true
                    },
                    contacter: 'required',
                    contacterPhone: {
                        required: true
                    },
                    contacterEmail: {
                        required: true,
                        email: true
                    },
                    acqAgentName: 'required',
                    openBankName: 'required',
                    settAccType: 'required',
                    settAccountName: 'required',
                    settAccountNo: {
                        required: true
                    },
                    clearType: 'required',
                    billCycle: {
                        required: true,
                        number: true,
                        digits: true
                    }

                },
                messages: {
                    merShortName: {
                        required: '请输入商户简称'
                    },
                    licenseFile: {
                        required: '请选择图片'
                    },
                    taxFile: {
                        required: '请选择图片'
                    },
                    organizationFile: {
                        required: '请选择图片'
                    },
                    idCardFile: {
                        required: '请选择图片'
                    },
                    bankCardFile: {
                        required: '请选择图片'
                    },
                    flowNumber: {
                        required: '请输入流程号'
                    },
                    merLevel: {
                        required: '请选择商户性质'
                    },
                    nameOfAgent: {
                        required: '请选择代理商'
                    },
                    signPerson: {
                        required: '请输入销售'
                    },
                    merName: {
                        required: '请输入商户执照名称'
                    },
                    licenseNumber: {
                        required: '请输入执照号'
                    },
                    taxId: {
                        required: '请输入税务登记号'
                    },
                    organizationCode: {
                        required: '请输入组织机构代码'
                    },
                    networkAddress: {
                        required: '请输入入网地址'
                    },
                    networkDate: {
                        required: '请输入入网时间',
                        date: '请输入正确时间'
                    },
                    companyEmail: {
                        required: '请输入公司邮箱',
                        email: '请输入正确的邮箱格式'
                    },
                    icpRecordNumber: {
                        required: '请输入ICP备案号/app名称'
                    },
                    merLegalPerson: {
                        required: '请输入法人名称'
                    },
                    merLegalIdCard: {
                        required: '请输入身份证号'
                    },
                    validityOfDocuments: {
                        required: '请选择日期',
                        date: '请输入正确时间'
                    },
                    contacter: {
                        required: '请输入联系人名称'
                    },
                    contacterPhone: {
                        required: '请输入联系电话'
                    },
                    contacterEmail: {
                        required: '请输入Email',
                        email: '请输入正确的邮箱格式'
                    },
                    acqAgentName: {
                        required: '请选择开户行'
                    },
                    openBankName: {
                        required: '请输入开户行名称'
                    },
                    settAccType: {
                        required: '请选择账户类型'
                    },
                    settAccountName: {
                        required: '请输入账户名称'
                    },
                    settAccountNo: {
                        required: '请输入开户账户'
                    },
                    clearType: {
                        required: '请选择结算方式'
                    },
                    billCycle: {
                        required: '请输入清算周期',
                        number: '请输入数字',
                        digits: '请输入整数'
                    }
                },
                submitHandler: function (form) {
                    form.submit();
                }
            });

        } else if (customerType == 2) {
            $("form").validate({
                rules: {
                    idCardFile: {
                        required: true,
                        checkName: true
                    },
                    bankCardFile: {
                        required: true,
                        checkName: true
                    },
                    flowNumber: {
                        required: true
                    },
                    signPerson: 'required',
                    networkAddress: 'required',
                    networkDate: {
                        required: true,
                        date: true
                    },
                    merLegalPerson: 'required',
                    merLegalIdCard: {
                        required: true,
                        checkIdCard: true
                    },
                    validityOfDocuments: {
                        required: true,
                        date: true
                    },
                    contacter: 'required',
                    contacterPhone: {
                        required: true
                    },
                    contacterEmail: {
                        required: true,
                        email: true
                    },
                    acqAgentName: 'required',
                    openBankName: 'required',
                    settAccType: 'required',
                    settAccountName: 'required',
                    settAccountNo: {
                        required: true
                    },
                    clearType: 'required',
                    billCycle: {
                        required: true,
                        number: true,
                        digits: true
                    }
                },
                messages: {
                    idCardFile: {
                        required: '请选择图片'
                    },
                    bankCardFile: {
                        required: '请选择图片'
                    },
                    flowNumber: {
                        required: '请输入流程号'
                    },
                    signPerson: {
                        required: '请输入销售'
                    },
                    networkAddress: {
                        required: '请输入入网地址'
                    },
                    networkDate: {
                        required: '请输入入网时间',
                        date: '请输入正确时间'
                    },
                    merLegalPerson: {
                        required: '请输入客户名称'
                    },
                    merLegalIdCard: {
                        required: '请输入身份证号'
                    },
                    validityOfDocuments: {
                        required: '请选择日期',
                        date: '请输入正确时间'
                    },
                    contacter: {
                        required: '请输入联系人名称'
                    },
                    contacterPhone: {
                        required: '请输入联系电话'
                    },
                    contacterEmail: {
                        required: '请输入Email',
                        email: '请输入正确的邮箱格式'
                    },
                    acqAgentName: {
                        required: '请选择开户行'
                    },
                    openBankName: {
                        required: '请输入开户行名称'
                    },
                    settAccType: {
                        required: '请选择账户类型'
                    },
                    settAccountName: {
                        required: '请输入账户名称'
                    },
                    settAccountNo: {
                        required: '请输入开户账户'
                    },
                    clearType: {
                        required: '请选择结算方式'
                    },
                    billCycle: {
                        required: '请输入清算周期',
                        number: '请输入数字',
                        digits: '请输入整数'
                    }

                },
                submitHandler: function (form) {
                    form.submit();
                }
            })
        }
        jQuery.validator.addMethod('checkName', function (value, element) {
            var name = /([a-zA-Z0-9\u4e00-\u9fa5]+)(.jpg|.JPG|.png|.PNG)$/
            return this.optional(element) || name.test(value);
        }, '格式不正确');
        jQuery.validator.addMethod('checkCompanyEmail', function (value, element) {
            var exist;
            $.ajax({
                url: "<%=request.getContextPath()%>/cbMerchant/checkCompanyEmail.do",
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
            	console.log("1");
                o.push(this.name);
            });
            return o;
        };
    });

</script>

</body>
</html>
