<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp" %>
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
    <title>哗啦啦通道路由切换（服务商模式）</title>
</head>
<script type="text/javascript">
    function formSubmit() {
        $("#queryForm").submit();
    }
</script>
<body class=" ">
<!-- 头部 -->
<jsp:include page="../include/top.jsp"/>
<div id="wrapper">
    <div>
        <jsp:include page="../include/bottom.jsp"/>
        <!-- 左侧内容 -->
        <jsp:include page="../include/left.jsp"/>
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
                    <li>哗啦啦通道路由切换（服务商模式）&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
                    </li>
                </ol>

                <div class="clearfix"></div>
            </div>
            <!--END TITLE & BREADCRUMB PAGE-->
            <!--BEGIN CONTENT-->
            <div class="page-content">

                <!--这是查询模块开始-->
                <div class="panel panel-default">
                    <%--<div class="panel-heading">--%>
                        <%--<h2 class="panel-title">查询</h2>--%>
                    <%--</div>--%>

                    <!--这是查询模块结束-->
                    <div>
                        <form id="queryForm"
                              action="<%=request.getContextPath()%>/micropay/toRouteListSpMerchantNo"
                              method="post" enctype="multipart/form-data"
                              class="form-horizontal ">
                        </form>
                    </div>
                    <!--这是列表模块开始-->
                    <div class="panel panel-default clearfix">
                        <header class="panel-heading clearfix">
                            <h2 class="panel-inner-title02">
                                列表 <%--<a
                                    href="<%=request.getContextPath()%>/ztrade/toImportExcelForReport"
                                    class="pull-right btn btn-primary">批量导入商户报备</a>--%>
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
                                        <th>服务商编号</th>
                                        <th>路由名称</th>
                                        <th>使用渠道</th>
                                        <th>支付方式</th>
                                        <th>支付产品</th>
                                        <th>状态</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${routes}" var="route">
                                        <tr>
                                            <td><c:if test="${route.status=='VALID'}"></c:if>
                                                <c:if test="${route.status=='INVALID'}"><a style="color: blue" href="javascript:updateRouteSpMctNo('${route.fixedSpMctNo}','${route.channelNo}','${route.payMethodMode}','${route.payProductMode}')">使用</a></c:if></td>
                                            <td>${route.fixedSpMctNo}</td>
                                            <td>${route.routeName}</td>
                                            <td><c:if test="${route.channelNo=='ECITIC1001'}">中信通道</c:if>
                                                <c:if test="${route.channelNo=='SJT1002'}">深金结</c:if>
                                                <c:if test="${route.channelNo=='CMBC1001'}">民生</c:if>
                                                <c:if test="${route.channelNo=='CMB1001'}">招商</c:if>
                                                <c:if test="${route.channelNo=='SPDB1002'}">厦门浦发</c:if>
                                            </td>
                                            <td><c:if test="${route.payMethodMode=='10000'}">微信支付</c:if>
                                                <c:if test="${route.payMethodMode=='01000'}">支付宝</c:if>
                                                <c:if test="${route.payMethodMode=='00100'}">QQ钱包</c:if>
                                                <c:if test="${route.payMethodMode=='00010'}">京东钱包</c:if>
                                                <c:if test="${route.payMethodMode=='00001'}">百度钱包</c:if>
                                            </td>
                                            <td><c:if test="${route.payProductMode=='10000'}">刷卡支付</c:if>
                                                <c:if test="${route.payProductMode=='01000'}">扫码支付</c:if>
                                                <c:if test="${route.payProductMode=='00100'}">公众号/H5支付</c:if>
                                                <c:if test="${route.payProductMode=='00010'}">APP支付</c:if>
                                                <%--<c:if test="${route.payProductMode=='00001'}">刷卡</c:if>--%>
                                            </td>
                                            <td><c:if test="${route.status=='VALID'}">使用中</c:if>
                                                <c:if test="${route.status=='INVALID'}">未使用</c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <%--<jsp:include page="../include/page.jsp"/>--%>
                </div>
                <!--这是列表模块结束-->
            </div>
            <!--End CONTENT-->
        </div>
        <!--右侧内容 end-->
    </div>

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
    function updateRouteSpMctNo(spMerchantNo,channelNo,payMethod,payProduct) {
        $.post("<%=request.getContextPath()%>/micropay/updateRouteSpMerchantNo",
                {
                    spMerchantNo:spMerchantNo,
                    channelNo:channelNo,
                    payMethod:payMethod,
                    payProduct:payProduct
                },
                function(msg){
                    if(msg=='SUCCESS'){
                        alert('路由切换成功！')
                    }else{
                        alert('路由切换失败！')
                    }
                    location.replace("<%=request.getContextPath()%>/micropay/toRouteListSpMerchantNo");
                }
        );
    }
</script>
</html>
