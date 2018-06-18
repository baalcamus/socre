<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>智慧生活订单查询</title>
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
                    <li>智慧生活&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li>智慧生活订单查询&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
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
                        <form id="queryForm" action="<%=request.getContextPath()%>/static/casher/orderquery" method="post"
                              enctype="multipart/form-data" class="form-horizontal ">
                            <input type="hidden" name="pageNum" value="${page.pageNum }"/>
                            <input type="hidden" name="pageSize" value="${page.pageSize }"/>
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <table width="100%" class="product_detail_list">
                                        <tr>
                                            <td width="110" class="text-right">商户编号</td>
                                            <td>
                                                <input type="text" maxlength="32" name="map['merchantNo']"
                                                       value="${paramVo.map.merchantNo}" class="form-control">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <table width="100%" class="product_detail_list">
                                        <tr>
                                            <td width="110" class="text-right">订单号</td>
                                            <td>
                                                <input type="text" maxlength="32" name="map['orderNo']"
                                                       value="${paramVo.map.orderNo}" class="form-control">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <table width="100%" class="product_detail_list">
                                        <tr>
                                            <td width="110" class="text-right">支付方式</td>
                                            <td>
                                                <select class="form-control" tabindex="10" name="map['payment']">
                                                    <option <c:if test="${paramVo.map.payment==''}">selected="selected"</c:if> value="">全部
													<option  <c:if test="${paramVo.map.payment=='P'}">selected="selected"</c:if> value="P">公众号
													<option  <c:if test="${paramVo.map.payment=='A'}">selected="selected"</c:if> value="A">支付宝
													<option  <c:if test="${paramVo.map.payment=='I'}">selected="selected"</c:if> value="I">智慧支付
													<option  <c:if test="${paramVo.map.payment=='U'}">selected="selected"</c:if> value="U">银联
													<option  <c:if test="${paramVo.map.payment=='C'}">selected="selected"</c:if> value="C">信用付
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
                                            <td width="110" class="text-right">订单状态</td>
                                            <td>
                                           <select name="map['state']" class="form-control">
										<option <c:if test="${paramVo.map.state==''}">selected="selected"</c:if> value="">全部
										<option  <c:if test="${paramVo.map.state==-1}">selected="selected"</c:if> value="-1">支付失败
										<option  <c:if test="${paramVo.map.state==0}">selected="selected"</c:if> value="0">未支付
										<option  <c:if test="${paramVo.map.state==2}">selected="selected"</c:if> value="2">支付处理中
										<option  <c:if test="${paramVo.map.state==1}">selected="selected"</c:if> value="1">已支付
									</select>
									</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <table width="100%" class="product_detail_list">
                                        <tr>
                                            <td width="110" class="text-right">订单时间</td>
                                            <td>
                                                <label>从</label> <input class="form-control" style="width: 85px" id="rateDate"
										name="map['beginDate']" value="${paramVo.map.beginDate}"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
									<label>到</label> <input style="width: 85px" class="form-control" id="endDate"
										name="map['endDate']" value="${paramVo.map.endDate}"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
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
                <div class="panel panel-default clearfix">
						<header class="panel-heading clearfix">
							<h2 class="panel-inner-title02">
								列表
								<a href="#" id="_df_a_" target="_blank" onclick="downloadACFile();"
									class="pull-right btn btn-primary">下载对账文件</a>
								<span class="pull-right">&nbsp;&nbsp;&nbsp;</span> <a
									href="javascript:formSubmit()" class="pull-right"><i
									class="fa fa-refresh"></i>刷新</a>
							</h2>
						</header>
						<div class="panel-body clearfix">
							<div class="table-responsive border0">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>操作</th>
											<th>商户编号</th>
											<th>订单号</th>
											<th>订单状态</th>
											<th>订单金额</th>
											<th>实际支付金额</th>
											<th>支付方式</th>
											<th>创建时间</th>
											<th>修改时间</th>
											<th>支付回调时间</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${page.list}" var="order">
											<tr>
												<td>&nbsp;</td>
												<td>${order.merchantNo }</td>
												<td>${order.orderNo }</td>
												<td>${order.state==1?"已支付":order.state==2?"支付处理中":order.state==-1?"支付失败":"未支付"}</td>
												<td>${order.orderAmt}</td>
												<td>${order.actualAmt }</td>
												<td>${order.payment=='P'?"微信支付":order.payment=='A'?"支付宝支付": order.payment=='I'?"慧智卡支付":"其他支付方式"}</td>
												<td><fmt:formatDate value="${order.createTime }" pattern="YYYY-MM-dd HH:mm:ss"/></td>
												<td><fmt:formatDate value="${order.updateTime }" pattern="YYYY-MM-dd HH:mm:ss"/></td>
												<td><fmt:formatDate value="${order.notifyTime }" pattern="YYYY-MM-dd HH:mm:ss"/></td>
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
<script type="text/javascript">
	
	function downloadACFile(){
		var data = $("#queryForm").serialize();
		$("#_df_a_")[0].href="<%=request.getContextPath()%>/static/casher/orderexport?"+data;
		return true;
	}
</script>
</html>
