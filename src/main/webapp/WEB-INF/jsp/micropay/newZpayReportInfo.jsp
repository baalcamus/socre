<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp" %>
<html lang="en">
<head>
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

    </style>
    <script type="text/javascript">
        function showCover() {
            $("#cover").css("display", '');
        }
        function hideCover() {
            $("#cover").css("display", 'none');
        }
    </script>
    <title>报备信息报备-录入</title>
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
                <li>微支付管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
                </li>
                <li class="active">报备信息报备-录入</li>
            </ol>
            <div class="clearfix"></div>
        </div>
        <!--END TITLE & BREADCRUMB PAGE-->
        <!--BEGIN CONTENT-->
        <div class="page-content">
            <div class="panel panel-default  withoutbottom clearfix">
                <header class="panel-heading clearfix">
                    <h2 class="panel-title">报备/录入</h2>
                </header>

                <div class="panel-body clearfix">
                    <form class="form-horizontal" role="form" method="post" enctype="multipart/form-data" id="subform"
                          action="<%=request.getContextPath()%>/static/ztrade/zpayReportInfoCreate">
                        <!--主体部分start-->
                        <div class="panel-inner">
                            <h2 class="panel-inner-title panel-inner-title-default">基本信息</h2>
                            <div class="panel-inner-body">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="license">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">商户编号<span>*</span></td>
                                                <td><input class="form-control" type="text" id="merchantNo"
                                                           name="merchantNo"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="ccol-lg-4 col-md-4 col-sm-6 col-xs-12" id="tax">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">企业ID<span>*</span></td>
                                                <td><input type="text" class="form-control" id="companyId"
                                                           name="companyId"></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" <%--id="license"--%>>
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">公司全称<span>*</span></td>
                                                <td><input class="form-control" type="text" id="merchantFullName"
                                                           name="merchantFullName"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" <%--id="license"--%>>
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">公司地址<span>*</span></td>
                                                <td><input class="form-control" type="text" id="merchantAddress"
                                                           name="merchantAddress"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="ccol-lg-4 col-md-4 col-sm-6 col-xs-12" <%--id="tax"--%>>
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">支付显示名称<span>*</span></td>
                                                <td><input type="text" class="form-control" id="displayShortName"
                                                           name="displayShortName"></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="ccol-lg-4 col-md-4 col-sm-6 col-xs-12" <%--id="tax"--%>>
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">客服联系人<span>*</span></td>
                                                <td><input type="text" class="form-control" id="serviceContactName"
                                                           name="serviceContactName"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" <%--id="license"--%>>
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">客服电话<span>*</span></td>
                                                <td><input class="form-control" type="text" id="serviceContactPhone"
                                                           name="serviceContactPhone"></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="ccol-lg-4 col-md-4 col-sm-6 col-xs-12" <%--id="tax"--%>>
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">经营类目<span>*</span></td>
                                                <td><input type="text" class="form-control" id="bizCategory"
                                                           name="bizCategory"></td>
                                                <%--<td><select name="bizCategory" >--%>
                                                <%--<option value=""></option>--%>
                                                <%--</select></td>--%>
                                            </tr>
                                        </table>
                                    </div>
                                </div>

                                <div class="row">

                                    <div class="ccol-lg-4 col-md-4 col-sm-6 col-xs-12" <%--id="tax"--%>>
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">业务联系人<span>*</span></td>
                                                <td><input type="text" class="form-control" id="bizContactName"
                                                           name="bizContactName"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" <%--id="license"--%>>
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">联系人电话<span>*</span></td>
                                                <td><input class="form-control" type="text" id="bizContactPhone"
                                                           name="bizContactPhone"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" <%--id="license"--%>>
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">业务联系人邮箱<span>*</span></td>
                                                <td><input class="form-control" type="text" id="bizContactEmail"
                                                           name="bizContactEmail"></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="ccol-lg-4 col-md-4 col-sm-6 col-xs-12" <%--id="tax"--%>>
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">AppId(公众号)<span>*</span></td>
                                                <td><input type="text" class="form-control" id="appId" name="appId">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" <%--id="license"--%>>
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">AppId(APP支付)<span>*</span></td>
                                                <td><input class="form-control" type="text" id="appPayId"
                                                           name="appPayId"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" <%--id="license"--%>>
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">支付授权目录<span>*</span></td>
                                                <td><input class="form-control" type="text" id="payAuthCatalog"
                                                           name="payAuthCatalog"></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="ccol-lg-4 col-md-4 col-sm-6 col-xs-12" <%--id="tax"--%>>
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">一户一码标识<span>*</span></td>
                                                <td><input type="Radio" value="Y" name="singleBizCodeFlag">是
                                                    <input type="Radio" value="N" name="singleBizCodeFlag">否
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">渠道名称<span>*</span></td>
                                                <td><select class="form-control" id="reportChannel"
                                                            name="reportChannel">
                                                    <option>请选择</option>
                                                    <option value="ECITIC1001">中信</option>
                                                    <option value="CMBC1001">民生</option>
                                                    <option value="STJ1001">结算中心</option>
                                                    <%--<option value=""></option>--%>
                                                    <%--<option value=""></option>--%>

                                                </select>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" <%--id="license"--%>>
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">支付方式<span>*</span></td>
                                                <td><%--<input  class="form-control"  type="text" id="reportPayMethod" name="reportPayMethod">--%>
                                                    <select name="reportPayMethod">
                                                        <option>请选择</option>
                                                        <option value="WEIXINPAY">微信支付</option>
                                                        <option value="ALIPAY">支付宝</option>
                                                    </select>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>


                            <div class="panel panel-default save-box-grey clearfix">
                                <button class="btn btn-primary margin30">
                                    <i class="fa fa-check-square-o"></i> 提交
                                </button>
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
<!--全局动态-->
<script type="text/javascript">
    $("#subform").validate({
        rules: {
            merchantNo: "required",
            reportChannel: "required",
            reportPayMethod: "required",
            bankMerchantCode: "required",
            appId: "required",
            companyId: "required",
            merchantFullName: "required",
            displayShortName: "required",
            serviceContactPhone: "required",
            serviceContactName: "required",
            bizCategory: "required",
            bizContactPhone: "required",
            bizContactName: "required",
            bizContactEmail: "required",
            appPayId: "required",
            payAuthCatalog: "required",
            singleBizCodeFlag: "required"
        },
        errorPlacement: function (error, element) {
            error.appendTo(element.parent());
        },
        submitHandler: function (form) {
            var url = "<%=request.getContextPath()%>/ztrade/zpayReportInfoCreate";
            var params = $(form).serialize();
            showCover();
            $.post(url, params, function (res) {
                if (res.err == false) {
                    //查询
                    alert("新增完成");
                    location.replace("<%=request.getContextPath()%>/ztrade/zpayReportInfoQuery");
                } else {
                    alert(res.msg);
                }
                hideCover();
            });
        }
    });
</script>

</body>
</html>
