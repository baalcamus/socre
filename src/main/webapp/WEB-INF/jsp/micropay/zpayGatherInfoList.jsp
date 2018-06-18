<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>业务数据汇总查询</title>
<script type="text/javascript">
	var contextpath = "${ctx}";
	
	function query() {
		
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/micropay/zpayGatherInfo/queryZpayGatherInfoList");
		$("#queryForm").submit();
	}
	
	function down(){
		var params = $("#queryForm").serialize();
		var url ="<%=request.getContextPath()%>/micropay/zpayGatherInfo/downZpayGatherInfoList?"+params;
		window.open(url);
	}
</script>
</head>
<body>
	<jsp:include page="../include/top.jsp" />
	<!--头部 end-->
	<div id="wrapper">
		<jsp:include page="../include/bottom.jsp" />
		<!-- 左侧内容 -->
		<jsp:include page="../include/left.jsp" />
		<div id="page-wrapper">
			<!--BEGIN TITLE & BREADCRUMB PAGE-->
			<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
				<ol class="breadcrumb page-breadcrumb">
					<li><i class="fa fa-home"></i>&nbsp;<a
						href="Organization_management.html">首页</a>&nbsp;&nbsp;<i
						class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
					<li>业务数据汇总&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li>业务数据汇总查询&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li class="active">查询</li>
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
						<form action="" method="post"  id="queryForm" class="queryForm" enctype="multipart/form-data" class="form-horizontal ">
							<input type="hidden" name="pageNum" value="${page.pageNum }" />
							<input type="hidden" name="pageSize" value="${page.pageSize }" />	
							<div class="row">
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">数据类型</td>
											<td width="200">
												<div >
													<select class="form-control" tabindex="10" id="dataType" name="dataType">
														<option <c:if test="${zpayGatherInfo.dataType=='' }">selected="selected"</c:if> value="">全部</option>
														<option <c:if test="${zpayGatherInfo.dataType=='BANK' }">selected="selected"</c:if> value="BANK">银行数据</option>
														<option <c:if test="${zpayGatherInfo.dataType=='MICROPAY' }">selected="selected"</c:if> value="MICROPAY">平台数据</option>
													</select>
												</div>
											</td>
										</tr>
									</table>
								</div>
							    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">订单开始日期</td>
											<td width="200">
												<div data-date-format="yyyy-mm-dd" class="input-group date datepicker-filter mbs">
													<span class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</span>
													<input type="text" class="form-control" id="beginDate" name="beginDate" value="${beginDate}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">订单结束日期</td>
											<td width="200">
												<div data-date-format="yyyy-mm-dd" class="input-group date datepicker-filter mbs">
													<span class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</span>
													<input type="text" class="form-control" id="endDate" name="endDate" value="${endDate}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</div>
							<div class="row">					
							    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">商户编号</td>
											<td width="190">
												<div >
													<input type="text" class="form-control" id="merchantNo" name="merchantNo" value="${zpayGatherInfo.merchantNo}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
							    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">通道编号</td>
											<td width="190">
												<div >
													<input type="text" class="form-control" id="channelNo" name="channelNo" value="${zpayGatherInfo.channelNo}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">平台产品</td>
											<td width="200">
												<div>
													<select class="form-control" tabindex="10" id="productNo" name="productNo">
														<option <c:if test="${zpayGatherInfo.productNo=='' }">selected="selected"</c:if> value="">全部</option>
														<option <c:if test="${zpayGatherInfo.productNo=='WEIXINPAY' }">selected="selected"</c:if> value="WEIXINPAY">微信</option>
														<option <c:if test="${zpayGatherInfo.productNo=='ALIPAY' }">selected="selected"</c:if> value="ALIPAY">支付宝</option>
													</select>
													<%-- <input type="text" class="form-control" id="productNo" name="productNo" value="${zpayGatherInfo.productNo}"/> --%>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td></td>
											<td>
												<button  type="submit" class="btn btn-danger" onclick="query();">
													<i class="fa fa-search"></i> 查询
												</button>
												<button onclick="down();"class="btn btn-danger"><i class="fa fa-search"></i>下载</button>
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
						<h2 class="panel-inner-title02">
							列表
						</h2>
					</header>
					<div class=" panel-body clearfix">
						<div class="table-responsive border0">
							<table class="table table-hover">
								<thead>
									<tr>
										<th><span>订单日期</span></th>
										<th><span>数据类型</span></th>
										<th><span>商户编号</span></th>
										<th><span>通道编号</span></th>
										<th><span>平台产品</span></th>
										<th><span>支付方式</span></th>
										<th><span>交易类型</span></th>
										<th><span>总笔数</span></th>
										<th><span>订单总金额</span></th>
										<th><span>订单总手续费</span></th>
										<th><span>创建人</span></th>
										<th><span>创建时间</span></th>
										<th><span>修改人</span></th>
										<th><span>修改时间</span></th>
										<th><span>描述</span></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${zpayGatherInfoList}" var="zpayGatherInfoList">
										<tr>
										    <td hidden= true>${zpayGatherInfoList.id}</td>
										    <td >${zpayGatherInfoList.orderDate}</td>
										    <td >
										    	<c:if test="${zpayGatherInfoList.dataType=='BANK'}">
													银行数据
												</c:if>
	   										    <c:if test="${zpayGatherInfoList.dataType=='MICROPAY'}">
													平台数据
												</c:if>
										    </td>
										    <td >${zpayGatherInfoList.merchantNo}</td>
										    <td >${zpayGatherInfoList.channelNo}</td>
										    <td >
										    	<c:if test="${zpayGatherInfoList.productNo=='WEIXINPAY'}">
													微信
												</c:if>
	   										    <c:if test="${zpayGatherInfoList.productNo=='ALIPAY'}">
													支付宝
												</c:if>
										    </td>
											<td>
	   										    <c:if test="${zpayGatherInfoList.payMethod=='SCAN_CARD'}">
													刷卡支付
												</c:if>
												<c:if test="${zpayGatherInfoList.payMethod=='CODE_SCAN'}">
													扫码支付
												</c:if>
												<c:if test="${zpayGatherInfoList.payMethod=='PUB_NUM'}">
													公众号支付
												</c:if>
												<c:if test="${zpayGatherInfoList.payMethod=='APP'}">
													app支付
												</c:if>
											</td>
											<td>
												<c:if test="${zpayGatherInfoList.tradeType=='ORDER'}">
													消费
												</c:if>
												<c:if test="${zpayGatherInfoList.tradeType=='REFUND'}">
													退款
												</c:if>
											</td>
										    <td>${zpayGatherInfoList.totalCount}</td>
										    <td>${zpayGatherInfoList.totalOrderAmount}</td>
											<td>${zpayGatherInfoList.totalOrderFee}</td>
											<td>${zpayGatherInfoList.createStaff}</td>
											<td>${zpayGatherInfoList.createTime}</td>
											<td>${zpayGatherInfoList.updateStaff}</td>
											<td>${zpayGatherInfoList.updateTime}</td>
											<td>${zpayGatherInfoList.description}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<jsp:include page="../include/page.jsp" />
				<!--这是列表模块结束-->
			</div>
			<!--End CONTENT-->
		</div>
		<!--右侧内容 end-->
	</div>
</body>
</html>
