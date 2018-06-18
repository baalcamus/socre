<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>业务统计年报</title>
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
                    <li><i class="fa fa-home"></i>&nbsp;<a href="<%=request.getContextPath()%>/main/toMain.do">首页</a>&nbsp;&nbsp;<i
                            class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li>报表统计&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li>业务统计年报&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
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
                        <form id="queryForm" action="${ctx}/reportStatistics/selectYearReportOfBusinessList"
                              method="post"
                              enctype="multipart/form-data" class="form-horizontal ">
                            <div class="row ">
                                <div class="col-lg-4 col-md-4">
                                    <table width="100%" class="product_detail_list">
                                        <tr>
                                            <td width="110" class="text-right">统计开始日期</td>
                                            <td>
                                                <div data-date-format="yyyy-mm-dd"
                                                     class="input-group date datepicker-filter mbs">
                                                    <span class="input-group-addon"><i
                                                            class="fa fa-calendar"></i></span>
                                                    <input type="text" id="beginDate" name="beginDate"
                                                           value="<fmt:formatDate value="${businessReport.beginDate}" pattern="yyyy-MM-dd"/>"
                                                           class="form-control">
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-lg-4 col-md-4 ">
                                    <table width="100%" class="product_detail_list">
                                        <tr>
                                            <td width="110" class="text-right">统计结束日期</td>
                                            <td>
                                                <div data-date-format="yyyy-mm-dd"
                                                     class="input-group date datepicker-filter mbs">
                                                    <span class="input-group-addon"><i
                                                            class="fa fa-calendar"></i></span>
                                                    <input type="text" id="endDate" name="endDate"
                                                           value="<fmt:formatDate value="${businessReport.endDate}" pattern="yyyy-MM-dd"/>"
                                                           class="form-control">
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <table width="100%" class="product_detail_list">
                                        <tr>
                                            <td>
                                                <button type="submit" id="btnSubmit" class="btn btn-primary">
                                                    <i class="fa fa-search"></i> 查询
                                                </button>
                                            </td>
                                            <td>

                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!--这是查询模块结束-->
                <!--这是列表模块开始-->
                <div class="panel panel-default clearfix">
                    <header class="panel-heading clearfix">
                        <h2 class="panel-inner-title02">业务统计年报</h2>
                    </header>
                    <div class=" panel-body ">
                        <%--<div class="table-responsive border0">--%>
                            <div class="row" >
                                <div class="col-lg-6 col-md-6" >
                                    <table width="100%" class="table">
                                        <tr>
                                            <td class="col-md-3">起始日止新增商户数：</td>
                                            <td class="col-md-3 text-right">${businessReport.beginAddMerCount}</td>
                                        </tr>
                                    </table>

                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <table width="100%" class="table">
                                        <tr>
                                            <td class="col-md-3">结束日止新增商户数：</td>
                                            <td class="col-md-3 text-right">${businessReport.endAddMerCount}</td>
                                        </tr>
                                    </table>
                                </div>

                            </div>
                            <div class="row " >
                                <div class="col-lg-6 col-md-6 ">
                                    <table width="100%" class="table">
                                        <tr>
                                            <td class="col-md-3">起始日累计商户数：</td>
                                            <td class="col-md-3 text-right">${businessReport.beginSumMerCount}</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-lg-6 col-md-6 ">
                                    <table width="100%" class="table">
                                        <tr>
                                            <td class="col-md-3">结束日累计商户数：</td>
                                            <td class="col-md-3 text-right">${businessReport.endSumMerCount}</td>
                                        </tr>
                                    </table>
                                </div>

                            </div>
                            <div class="row ">
                                <div class="col-lg-6 col-md-6 " >
                                    <table width="100%" class="table">
                                        <tr>
                                            <td class="col-md-3">起始日总笔数（万笔）：</td>
                                            <td class="col-md-3 text-right">${businessReport.beginTotalTrade}</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-lg-6 col-md-6 ">
                                    <table width="100%" class="table">
                                        <tr>
                                            <td class="col-md-3">结束日总笔数（万笔）：</td>
                                            <td class="col-md-3 text-right">${businessReport.endTotalTrade}</td>
                                        </tr>
                                    </table>
                                </div>

                            </div>
                            <div class="row ">
                                <div class="col-lg-6 col-md-6 ">
                                    <table width="100%" class="table">
                                        <tr>
                                            <td class="col-md-3">互联网交易总金额（万元）：</td>
                                            <td class="col-md-3 text-right">${businessReport.endTotalAmount}</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <table width="100%" class="table">
                                        <tr>
                                            <td class="col-md-3">代付总金额（万元）：</td>
                                            <td class="col-md-3 text-right">${businessReport.payAnotherAmount}</td>
                                        </tr>
                                    </table>
                                </div>

                            </div>
                            <%-- <table class="table table-hover">
                                 <thead>
                                 <tr>
                                     <th><span>起始日止新增商户数</span></th>
                                     <th><span>起始日累计商户数</span></th>
                                     <th><span>起始日总笔数(万笔)</span></th>
                                     <th><span>起始日总金额（万元）</span></th>
                                     <th><span>结束日止新增商户数</span></th>
                                     <th><span>结束日累计商户数</span></th>
                                     <th><span>结束日总笔数（万笔）</span></th>
                                     <th><span>结束日总笔数（万元）</span></th>
                                 </tr>
                                 </thead>
                                 <tbody>
                                     <tr>
                                         <td>${businessReport.beginAddMerCount}</td>
                                         <td>${businessReport.beginSumMerCount}</td>
                                         <td>${businessReport.beginTotalTrade}</td>
                                         <td>${businessReport.beginTotalAmount}</td>
                                         <td>${businessReport.endAddMerCount}</td>
                                         <td>${businessReport.endSumMerCount}</td>
                                         <td>${businessReport.endTotalTrade}</td>
                                         <td>${businessReport.endTotalAmount}</td>
                                     </tr>
                                 </tbody>
                             </table>--%>
                        <%--</div>--%>
                    </div>
                </div>
            </div>
            <!--这是列表模块结束-->
        </div>
        <!--End CONTENT-->
    </div>
    <!--右侧内容 end-->
</div>


</body>
</html>
