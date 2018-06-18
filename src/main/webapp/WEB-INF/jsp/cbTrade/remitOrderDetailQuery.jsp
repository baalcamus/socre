<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>跨境付款订单明细查询</title>
<style type="text/css">
	.table-nowrap{
		white-space: nowrap;
		overflow: scroll;
	}
</style>
</head>
<script type="text/javascript">
	function formSubmit() {
		$("#queryForm").submit();
	}
</script>

<body class=" ">
	<!-- 头部 -->
	<jsp:include page="../include/top.jsp" />
	<div id="wrapper">
		<div>
			<jsp:include page="../include/bottom.jsp" />
			<!-- 左侧内容 -->
			<jsp:include page="../include/left.jsp" />
			<!--右侧内容 start-->
			<div id="page-wrapper">
				<!--BEGIN TITLE & BREADCRUMB PAGE-->
				<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
					<ol class="breadcrumb page-breadcrumb">
						<li><i class="fa fa-home"></i>&nbsp;<a
							href="<%=request.getContextPath()%>/main/toMain.do">首页</a>&nbsp;&nbsp;<i
							class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li>跨境交易管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li>付款管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li>付款订单查询&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
					</ol>

					<div class="clearfix"></div>
				</div>
				<!--END TITLE & BREADCRUMB PAGE-->
				<!--BEGIN CONTENT-->
				<div class="page-content">
				<!--这是查询模块开始-->
					<div class="panel panel-default" style="display: none;">
						<div class="panel-heading">
							<h2 class="panel-title">查询</h2>
						</div>
						<div class="panel-body">
							<form id="queryForm"
								action="<%=request.getContextPath()%>/cbTrade/forex/remit/querydetail"
								method="post" enctype="multipart/form-data"
								class="form-horizontal ">
								<input type="hidden" name="forexOrderId" value="${forexOrderId }">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />
							</form>
						</div>
					</div>
					<!--这是查询模块结束-->
					<!--这是列表模块开始-->
					<div class="panel panel-default clearfix">
						<header class="panel-heading clearfix">
							<h2 class="panel-inner-title02">
								列表<button onclick="downLoadOrder();"
									class="pull-right btn btn-primary">下载</button>
								<span class="pull-right">&nbsp;&nbsp;&nbsp;</span> <a href="#" onclick="window.history.go(-1)" class="pull-right"><i
									class="fa fa-refresh"></i>返回</a>
							</h2>
						</header>
						<div class="panel-body clearfix">
							<div class="table-responsive border0 table-nowrap">
								<table class="table table-hover table-nowrap">
									<thead>
										<tr>
											<th>商户编号</th>
											<th>商户订单号</th>
											<th>申报币种</th>
											<th>申报金额</th>
											<th>订单号</th>
											<th>订单时间</th>
											<th>订单金额</th>
											<th>订单币种</th>
											<th>商品种类</th>
											<th>商品名称</th>
											<th>商品描述</th>
											<th>商品数量</th>
											<th>商品单位</th>
											<th>卖家主体类型</th>
											<th>组织机构代码</th>
											<th>卖家姓名</th>
											<th>卖家证件号</th>
											<th>卖家国别</th>
											<th>卖家联系方式</th>
											<th>买家主体类型</th>
											<th>组织机构代码</th>
											<th>买家姓名</th>
											<th>买家证件号</th>
											<th>买家国别</th>
											<th>买家联系方式</th>
											<th>运单号</th>
											<th>货运机构名</th>
											<th>订单支付渠道</th>
											<th>支付方式</th>
											<th>合同号</th>
											<th>发票号</th>
											<th>收付款性质</th>
											<th>二级商户名称</th>
											<th>创建时间</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${page.list}" var="order">
											<tr>
												<td>${order.merchantNo }</td>
												<td>${order.merchantOrderNo }</td>
												<td>${fns:getCurrency(order.forexCurrency) }</td>
												<td><fmt:formatNumber pattern="#,##0.00" value="${order.forexAmount }"/></td>
												<td>${order.merchantOriginalOrderNo }</td>
												<td><fmt:formatDate pattern="yyyy-MM-dd" value="${order.merchantOrderDate }"/></td>
												<td><fmt:formatNumber pattern="#,##0.00" value="${order.orderAmount }"/></td>
												<td>${fns:getCurrency(order.orderCurrency) }</td>
												<td>${order.productType }</td>
												<td>${order.productName }</td>
												<td>${order.productDes }</td>
												<td>${order.productQuantity }</td>
												<td></td>
												<td>${order.sellerType}</td>
												<td>${order.sellerAgencyCode }</td>
												<td>${order.sellerName }</td>
												<td>${order.sellerIdNo }</td>
												<td>${order.sellerCountry }</td>
												<td>${order.sellerPhoneNo }</td>
												
												<td>${order.buyerType }</td>
												<td>${order.buyerAgencyCode }</td>
												<td>${order.buyerName }</td>
												<td>${order.buyerIdNo }</td>
												<td>${order.buyerCountry }</td>
												<td>${order.buyerPhoneNo }</td>
												
												<td>${order.transportNo }</td>
												<td>${order.cargoAgencyName }</td>
												
												<td>${order.orderPayChannel }</td>
												<td>${order.payType }</td>
												<td>${order.contractNo }</td>
												<td>${order.invoiceNo }</td>
												
												<td>${order.twomerchantName }</td>
												<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${order.createTime }"/></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>


					<jsp:include page="../include/page.jsp" />
				</div>
				<!--这是列表模块结束-->
			</div>
			<!--End CONTENT-->
		</div>
		<!--右侧内容 end-->
	</div>
<form id="downLoadForm" method="post" target="_blank" action="<%=request.getContextPath()%>/cbTrade/forex/remit/querydetail?method=download">
	</form>
	<script type="text/javascript">
		function downLoadOrder(){
			$('#downLoadForm').empty();
			var v = $('#queryForm').serializeArray();
			for(var i=0;i<v.length;i++){
				$('#downLoadForm').append($('<input type="hidden" name="'+v[i].name+'" value="'+format(v[i].value)+'"/>'));
			}
			$('#downLoadForm').submit();
			return false;
		}
		function isNull(value){
			if(value==undefined||value==null||value=='')return true;
		}
		function format(value){
			if(isNull(value))
				value="";
			return value
		}
	</script>

</body>
</html>
