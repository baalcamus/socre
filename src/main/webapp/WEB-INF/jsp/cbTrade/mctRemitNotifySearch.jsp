<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<style type="text/css">
		.table-nowrap{
			white-space: nowrap;
		}
	</style>
    <title>汇款通知查询</title>
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
                    <li>账户管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li>跨境账户汇款通知&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
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
                        <form id="queryForm" action="<%=request.getContextPath()%>/cbTrade/mctRemitNotifyQuery.do" method="post"
                              enctype="multipart/form-data" class="form-horizontal ">
                            <input type="hidden" name="pageNum" value="${page.pageNum }"/>
                            <input type="hidden" name="pageSize" value="${page.pageSize }"/>
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <table width="100%" class="product_detail_list">
                                        <tr>
                                            <td width="110" class="text-right">商户编号</td>
                                            <td>
                                                <input type="text" maxlength="32" id="merchantNo" name="map['merchantNo']"
                                                       value="${paramVo.map.merchantNo}" class="form-control">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <table width="100%" class="product_detail_list">
                                        <tr>
                                            <td width="110" class="text-right">通知流水</td>
                                            <td>
                                                <input type="text" maxlength="32" id="notifySerialNo" name="map['notifySerialNo']"
                                                       value="${paramVo.map.notifySerialNo}" class="form-control">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-lg-2 col-md-3 col-sm-6 col-xs-12">
                                    <table width="100%" class="product_detail_list">
                                        <tr>
                                            <td width="110" class="text-right">通知状态</td>
                                            <td>
                                                <select class="form-control" name="map['notifyStatus']"
                                                        id="notifyStatus">
                                                    <option <c:if test="${paramVo.map.notifyStatus==''}">selected="selected"</c:if> value=""> 全部
                                                    </option>
                                                    <option <c:if test="${paramVo.map.notifyStatus=='PROCESSING'}">selected="selected"</c:if> value="PROCESSING">处理中
                                                    </option>
                                                    <option <c:if test="${paramVo.map.notifyStatus=='SUCCESS'}">selected="selected"</c:if> value="SUCCESS">处理成功
                                                    </option>
                                                    <option <c:if test="${paramVo.map.notifyStatus=='FAIL'}">selected="selected"</c:if> value="FAIL">处理失败
                                                    </option>
                                                </select>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <table width="100%" class="product_detail_list">
                                        <tr>
                                            <td width="110" class="text-right">通知时间</td>
                                            <td>从
											</td><td><input class="form-control" id="rateDate" name ="map['beginDate']" value="${paramVo.map.beginDate}" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" /> 
                                            </td><td>到
											</td><td><input class="form-control" id="endDate" name ="map['endDate']" value="${paramVo.map.endDate}" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" /> 
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-lg-1 col-md-3 col-sm-6 col-xs-12">
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
                        <h2 class="panel-inner-title02">列表<a href="javascript:formSubmit()" class="pull-right"><i
                                class="fa fa-refresh"></i>刷新</a></h2>
                    </header>
                    <div class="panel-body clearfix">
                        <div class="table-responsive border0">
                            <table id="result_tab" class="table table-hover table-nowrap">
                                <thead>
	                                <tr>
	                                    <th><span>操作</span></th>
	                                    <th><span>汇款商户</span></th>
										<th><span>账户名</span></th>
										<th><span>账户号</span></th>
										<th><span>开户行</span></th>
										<th><span>汇款日期</span></th>
										<th><span>汇款币种</span></th>
										<th><span>通知汇款金额</span></th>
										<th><span>通知类型</span></th>
										<th><span>通知时间</span></th>
										<th><span>通知状态</span></th>
										<th><span>实际调账金额</span></th>
										<th><span>通知流水</span></th>
										<th><span>备注</span></th>
	                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${page.list}" var="mctRemitNotify" >
                                    <tr>
                                        <td>
                                            <a href="<%=request.getContextPath()%>/cbTrade/mctRemitNotifyQuery.do?id=${mctRemitNotify.id}">审核</a>
                                            &nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td>${mctRemitNotify.merchantNo}</td>
                                        <td>${mctRemitNotify.accountName}</td>
                                        <td>${mctRemitNotify.accountNo}</td>
                                        <td>${mctRemitNotify.bankName}</td>
                                        <td><fmt:formatDate value="${mctRemitNotify.remitDate}" pattern="YYYY年MM月dd日"/></td>
                                        <td>${fns:getCurrency(mctRemitNotify.remitCurrency)}</td>
                                        <td><fmt:formatNumber value="${mctRemitNotify.remitAmount}" pattern="#,##0.00"/>
                                        </td>
                                        <td><c:choose>
                                        		<c:when test="${mctRemitNotify.notifyType=='LOCAL_REMIT'}">境内汇款</c:when>
                                        		<c:when test="${mctRemitNotify.notifyType=='FOREIGN_REMIT'}">境外汇款</c:when>
                                        		<c:otherwise>${mctRemitNotify.notifyType}</c:otherwise>
                                        </c:choose></td>
                                        <td><fmt:formatDate value="${mctRemitNotify.notifyTime}" pattern="YYYY-MM-dd HH:mm:ss"/></td>
                                        <td><c:choose>
                                        		<c:when test="${mctRemitNotify.notifyStatus=='PROCESSING'}">处理中</c:when>
                                        		<c:when test="${mctRemitNotify.notifyStatus=='SUCCESS'}">处理成功</c:when>
                                        		<c:when test="${mctRemitNotify.notifyStatus=='FAIL'}">处理失败</c:when>
                                        		<c:when test="${mctRemitNotify.notifyStatus=='WAIT_EXG_SETTLE'}">待收结汇</c:when>
                                        		<c:when test="${mctRemitNotify.notifyStatus=='EXG_SETTLE_PRO'}">结汇处理中</c:when>
                                        		<c:otherwise>${mctRemitNotify.notifyStatus}</c:otherwise>
                                        </c:choose></td>
                                        <td><fmt:formatNumber value="${mctRemitNotify.realAmount}" pattern="#,##0.00"/>
                                        </td>
                                        <td>${mctRemitNotify.notifySerialNo}</td>
                                        <td>${mctRemitNotify.comments}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <jsp:include page="../include/page.jsp"/>
            </div>
            <!--这是列表模块结束-->
        </div>
        <!--End CONTENT-->
    </div>
    <!--右侧内容 end-->
</div>


</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/statics/v2/js/jquery.acronymword.js"></script>
<script type="text/javascript">
    function ContractWord(){
		$('#result_tab tr td:last-child').each(function(){
			$(this).AcronymWord({
				delay:5000,
				acronymChar:'...',
				len:15
			});
		});
	}
	$(document).ready(function(){
		ContractWord();
	});
</script>
</html>
