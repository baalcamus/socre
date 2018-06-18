<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
.border0 {
	overflow: auto !important;
}

.border0 th, .border0 td {
	white-space: nowrap;
}
.auditButton hover{
	cursor: pointer;
	text-decoration: none;
}
</style>
<title>微支付外部订单管理</title>
<script type="text/javascript">
	var contextpath = "${ctx}";
	
	function query() {
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/micropay/outOrderList");
		$("#queryForm").submit();
	}
	function outOrderAudit(type,merchantNo,merchantOrderNo){
		var msg = "";
		if(type=="pass"){
			msg = "通过";
		}else if(type=="refuse"){
			msg = "拒绝";
		}
		if(confirm("确定审核"+msg+"该外部订单？")){
			$.post("<%=request.getContextPath()%>/micropay/outOrderAudit",{type:type,merchantNo:merchantNo,merchantOrderNo:merchantOrderNo},function(result){
				if(result=="success"){
					alert("操作成功");
					query();
				}else{
					alert("操作失败");
				}
				
			})
		}
	}
	
	function repeatLedger(type,merchantNo,merchantOrderNo){
		
		if(confirm("确定再次入账？")){
			$.post("<%=request.getContextPath()%>/micropay/outOrderAudit",{type:type,merchantNo:merchantNo,merchantOrderNo:merchantOrderNo},function(result){
				if(result=="success"){
					alert("操作成功");
					query();
				}else{
					alert("操作失败");
				}
				
			})
		}
	}
	
</script>
</head>

<body class=" ">
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
					<li>微支付管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li>外部订单管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
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
						<form action="" method="post"  id="queryForm" class="queryForm" enctype="multipart/form-data" class="form-horizontal">
							<input type="hidden" name="pageNum" value="${page.pageNum }" />
							<input type="hidden" name="pageSize" value="${page.pageSize }" />
							
							<div class="row">
								<div class="col-lg-8 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="90" class="text-right">订单类型</td>
												<td  width="200">
													<select class="form-control" id="orderType" name="orderType">
													<option value="">全部
													<option <c:if test="${order.orderType eq 'QUICK'}">selected='selected'</c:if> value="QUICK">快捷
													<option <c:if test="${order.orderType eq 'WITHHOLD'}">selected='selected'</c:if> value="WITHHOLD">代扣
													<option <c:if test="${order.orderType eq 'GATEWAY'}">selected='selected'</c:if> value="GATEWAY">网关
													<option <c:if test="${order.orderType eq 'MEMBER'}">selected='selected'</c:if> value="MEMBER">会员
													<option <c:if test="${order.orderType eq 'RED_ENVELOPE'}">selected='selected'</c:if> value="RED_ENVELOPE">红包
													</select>
												</td>
												<td width="90" class="text-right">订单状态</td>
												<td  width="200">
													<select class="form-control" id="outOrderStatus" name="outOrderStatus">
													<option value="">全部
													<option <c:if test="${order.outOrderStatus eq 'WAIT_AUDIT'}">selected='selected'</c:if> value="WAIT_AUDIT">待审核
													<option <c:if test="${order.outOrderStatus eq 'PASS_AUDIT'}">selected='selected'</c:if> value="PASS_AUDIT">审核通过
													<option <c:if test="${order.outOrderStatus eq 'REFUSE_AUDIT'}">selected='selected'</c:if> value="REFUSE_AUDIT">审核拒绝
													</select>
												</td>
												<td width="90" class="text-right">商户号</td>
												<td  width="200">
													<div >
													<input type="text" class="form-control" id="merchantNo" name="merchantNo" value="${order.merchantNo}"/>
													</div>
												</td>
												<td width="90" class="text-right">商户订单号</td>
												<td  width="200">
													<div >
													<input type="text" class="form-control" id="merchantOrderNo" name="merchantOrderNo" value="${order.merchantOrderNo}"/>
													</div>
												</td>
											</tr>
										</table>
									</div>
								
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td></td>
											<td>
												<button  class="btn btn-danger" onclick="javascript:query();return false;">
													<i class="fa fa-search"></i> 查询
												</button>
											<!-- 	<button onclick="javascript:down();return false;"class="btn btn-danger"><i class="fa fa-search"></i>下载</button> -->
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
										<th>审核</th>
										<th>商户编号</th>
										<th>商户订单号</th>
										<th>系统内订单号</th>
										<th>订单类型</th>
										<th>订单金额</th>
										<th>订单标题</th>
										<th>订单手续费</th>
										<th>订单描述</th>
										<th>回调地址</th>
										<th>订单状态</th>
										<th>订单入账状态</th>
										<th>订单入账金额</th>
										<th>订单创建时间</th>
										<th>订单修改时间</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.list }" var="outorder">
										<tr>
											<td>
												<c:if test="${outorder.outOrderStatus eq 'WAIT_AUDIT'}"><a style="color:green;cursor: pointer;" class="auditButton" onclick="outOrderAudit('pass','${outorder.merchantNo}','${outorder.merchantOrderNo}');">通过</a>&nbsp;|&nbsp;<a style="color:red;cursor: pointer;" class="auditButton" onclick="outOrderAudit('refuse','${outorder.merchantNo}','${outorder.merchantOrderNo}');">拒绝</a></c:if>
												<c:if test="${outorder.outOrderStatus eq 'PASS_AUDIT'}"><span style="color: #cccccc">已审核通过</span></c:if>
												<c:if test="${outorder.outOrderStatus eq 'REFUSE_AUDIT'}"><span style="color: #cccccc">已审核拒绝</span></c:if>
											</td>
											<td>${outorder.merchantNo}</td>
											<td>${outorder.merchantOrderNo}</td>
											<td>${outorder.outTradeOrderNo}</td>
											<td>
												<c:if test="${outorder.orderType eq 'QUICK'}">快捷</c:if>
												<c:if test="${outorder.orderType eq 'WITHHOLD'}">代扣</c:if>
												<c:if test="${outorder.orderType eq 'GATEWAY'}">网关</c:if>
												<c:if test="${outorder.orderType eq 'MEMBER'}">会员</c:if>
												<c:if test="${outorder.orderType eq 'RED_ENVELOPE'}">红包</c:if>
											</td>
											<td><fmt:formatNumber value="${outorder.orderAmount}" pattern="0.00"/></td>
											<td>${outorder.subject}</td>
											<td><fmt:formatNumber value="${outorder.orderFee }" pattern="0.00"/></td>
											<td>${outorder.description}</td>
											<td>${outorder.notifyUrl}</td>
											<td>
												<c:if test="${outorder.outOrderStatus eq 'WAIT_AUDIT'}">待审核</c:if>
												<c:if test="${outorder.outOrderStatus eq 'PASS_AUDIT'}">审核通过</c:if>
												<c:if test="${outorder.outOrderStatus eq 'REFUSE_AUDIT'}">审核拒绝</c:if>
											</td>
											<td>
												<c:if test="${outorder.outOrderAccountedStatus eq 'INIT'}">初始化</c:if>
												<c:if test="${outorder.outOrderAccountedStatus eq 'WAIT_ACCOUNTING'}">待入账</c:if>
												<c:if test="${outorder.outOrderAccountedStatus eq 'TO_ACCOUNTING'}">已发送入账</c:if>
												<c:if test="${outorder.outOrderAccountedStatus eq 'SUCCESS_ACCOUNTED'}">入账成功</c:if>
												<c:if test="${outorder.outOrderAccountedStatus eq 'FAIL_ACCOUNTED'}">
													入账失败
													<c:if test="${outorder.outOrderStatus eq 'PASS_AUDIT'}">（<a style="color:blue;cursor: pointer;" class="auditButton" onclick="repeatLedger('pass','${outorder.merchantNo}','${outorder.merchantOrderNo}');">再入</a>）</c:if>
												</c:if>
											</td>
											<td><fmt:formatNumber value="${outorder.outOrderAccountedAmount }" pattern="0.00"/></td>
											
											<td><fmt:formatDate value="${outorder.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
											<td><fmt:formatDate value="${outorder.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
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
	
	
	
	<script type="text/javascript">
	

	</script>
</body>
</html>
