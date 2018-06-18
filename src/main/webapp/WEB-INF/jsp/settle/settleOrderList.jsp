<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<%-- <script type="text/JavaScript" src="<%=request.getContextPath()%>/statics/v2/js/My97DatePicker_1/WdatePicker.js"></script>  --%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>结算订单查询</title>
<script type="text/javascript">
	var contextpath = "${ctx}";

	function formSubmit() {
		$("#queryForm").submit();
	}
	
	function refresh() {
		$("#queryForm").submit();
	}
	
	function doSettle(id){
		$.post("<%=request.getContextPath()%>/settle/settleOrder",{
			id:id,
		},
		function(data){
			if(data=='success'){
				alert("结算成功");
			}else if(data=="fail"){
				alert("结算失败");
			}else{
				alert("发生异常，需人工审核");
			}
			window.location.reload();
		});
	}
	
	function doApprove(id){
		window.location.href="<%=request.getContextPath()%>/settle/approveOrder?id="+id;
	}

	function doUpdate(id) {
        window.location.href="<%=request.getContextPath()%>/settle/openUpdateSettle?id="+id;
    }
	
	function updateStatus(id,settleStatus){
		$.post("<%=request.getContextPath()%>/settle/modifySettleStatus",{
			id:id,
			settleStatus:settleStatus,
		},
		function(data){
			if(data=='success'){
				alert("修改成功");
			}else{
				alert("修改失败");
			}
			window.location.reload();
		});
	}
	
	function queryStatus(merchantNo,merchantOrderNo){
		$.post("<%=request.getContextPath()%>/settle/querySettleStatus",{
			merchantNo:merchantNo,
			merchantOrderNo:merchantOrderNo
		},
		function(data){
			if(data=='success'){
				alert("结算成功");
			}else if(data=="fail"){
				alert("结算失败");
			}else{
				alert(data);
			}
			window.location.reload();
		});
	}
	
	function querySettleOrderDetail(id) {
		window.location.href="<%=request.getContextPath()%>/settle/querySettleOrderDetail?id="+id;
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
						<li>结算管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li class="active">结算订单查询</li>
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
							<form action="<%=request.getContextPath()%>/settle/querySettleOrderList.do" method="post" id="queryForm" name="queryForm"
								enctype="multipart/form-data" class="form-horizontal ">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />
                                <div class="row">
									<div class="col-lg-4 col-md-4 ">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">商户号</td>
												<td>
													<input id="merchantNo" name ="merchantNo" value="${zpaySettleOrder.merchantNo}"  class="form-control" /> 
												</td>
											</tr>
											<tr>
												<td width="110" class="text-right">商户订单号</td>
												<td>
													<input id="merchantOrderNo" name ="merchantOrderNo" value="${zpaySettleOrder.merchantOrderNo}"  class="form-control"/> 
												</td>
											</tr>
										</table>
									</div>
									<div class="col-lg-4 col-md-4 ">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">爱农流水号</td>
												<td>
													<input id="tradeOrderNo" name ="tradeOrderNo" value="${zpaySettleOrder.tradeOrderNo}"  class="form-control"/> 
												</td>
											</tr>
											<tr>
												<td width="110" class="text-right">结算状态</td>
												<td>
													<select id="settleStatus" name="settleStatus" class="form-control">
														<option <c:if test="${zpaySettleOrder.settleStatus==''}">selected='seleceted'</c:if> value="">请选择</option>
														<option <c:if test="${zpaySettleOrder.settleStatus=='INIT'}">selected='seleceted'</c:if> value="INIT">初始化</option>
														<option <c:if test="${zpaySettleOrder.settleStatus=='WAIT_EXAM'}">selected='seleceted'</c:if> value="WAIT_EXAM">待审核</option>
														<option <c:if test="${zpaySettleOrder.settleStatus=='WAIT_SETTLE'}">selected='seleceted'</c:if> value="WAIT_SETTLE">待结算</option>
														<option <c:if test="${zpaySettleOrder.settleStatus=='INTERIM_FAIL'}">selected='seleceted'</c:if> value="INTERIM_FAIL">结算挂起</option>
														<option <c:if test="${zpaySettleOrder.settleStatus=='PROCESSING'}">selected='seleceted'</c:if> value="PROCESSING">处理中</option>
														<option <c:if test="${zpaySettleOrder.settleStatus=='SUCCESS'}">selected='seleceted'</c:if> value="SUCCESS">结算成功</option>
														<option <c:if test="${zpaySettleOrder.settleStatus=='PART_SETTLE'}">selected='seleceted'</c:if> value="PART_SETTLE">部分结算成功</option>
														<option <c:if test="${zpaySettleOrder.settleStatus=='NO_NEED'}">selected='seleceted'</c:if> value="NO_NEED">无需结算</option>
														<option <c:if test="${zpaySettleOrder.settleStatus=='FAIL'}">selected='seleceted'</c:if> value="FAIL">结算失败</option>
														<option <c:if test="${zpaySettleOrder.settleStatus=='PAY_PROCESSING'}">selected='seleceted'</c:if> value="PAY_PROCESSING">代付通道处理中</option>
													</select>
												</td>
											</tr>
										</table>
									</div>
									<div class="col-lg-4 col-md-4 ">
										<table width="100%" class="product_detail_list">
											<tr>
												<td>
													<input type="button" onclick="formSubmit()" value="查询" class="btn btn-danger">
													</input>
													
												</td>
												<td></td>
											</tr>
										</table>
									</div>
									</div>
								
								<center></center>
							</form>
						</div>
					</div>
					<!--这是查询模块结束-->
					
					<div class="panel panel-default clearfix">
						<header class="panel-heading clearfix">
							<h2 class="panel-inner-title02">
								列表<a href="javascript:refresh()" class="pull-right"><i
									class="fa fa-refresh"></i> 刷新</a>
							</h2>
						</header>
						<div class=" panel-body clearfix">
							<div class="table-responsive border0">
								<table class="table table-hover">
								
									<thead>
										<tr align="center">
											<td><span>商户号</span></td>
											<td><span>商户简称</span></td>
											<td><span>商户订单号</span></td>
											<td><span>爱农流水号</span></td>
											<td><span>结算状态</span></td>
											<td><span>结算金额</span></td>
											<td><span>创建日期</span></td>
											<td><span>结算开户行账号</span></td>
											<td><span>结算开户行姓名</span></td>
											<td><span>预留手机号</span></td>
											<td><span>操作</span></td>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${page.list}" var="zpaySettleOrder">
										<tr align="center">
											<td>${zpaySettleOrder.merchantNo}</td>
											<td>${zpaySettleOrder.merchantShortName}</td>
											<td>${zpaySettleOrder.merchantOrderNo}</td>
											<td>${zpaySettleOrder.tradeOrderNo}</td>
											<td>
												<c:if test="${zpaySettleOrder.settleStatus=='INIT'}">
													初始化
												</c:if>
												<c:if test="${zpaySettleOrder.settleStatus=='WAIT_EXAM'}">
													待审核
												</c:if>
												<c:if test="${zpaySettleOrder.settleStatus=='INTERIM_FAIL'}">
													结算挂起
												</c:if>
												<c:if test="${zpaySettleOrder.settleStatus=='WAIT_SETTLE'}">
													待结算
												</c:if>
												<c:if test="${zpaySettleOrder.settleStatus=='PROCESSING'}">
													处理中
												</c:if>
												<c:if test="${zpaySettleOrder.settleStatus=='SUCCESS'}">
													结算成功
												</c:if>
												<c:if test="${zpaySettleOrder.settleStatus=='PART_SETTLE'}">
													部分结算成功
												</c:if>
												<c:if test="${zpaySettleOrder.settleStatus=='NO_NEED'}">
													无需结算
												</c:if>
												<c:if test="${zpaySettleOrder.settleStatus=='FAIL'}">
													结算失败
												</c:if>
											</td>
											<td>${zpaySettleOrder.settleAmount}</td>
											<td>
												<fmt:formatDate value="${zpaySettleOrder.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
											</td>
											<td>${zpaySettleOrder.accountNo}</td>
											<td>${zpaySettleOrder.accountName}</td>
											<td>${zpaySettleOrder.phoneNo}</td>
											<td>
												<a href="javascript:void(0);" onclick="querySettleOrderDetail('${zpaySettleOrder.id}')">查看</a>
												<c:if test="${zpaySettleOrder.settleStatus=='WAIT_EXAM'}">
                                            		<a href="javascript:void(0);" onclick="doApprove('${zpaySettleOrder.id}')">审核</a>
                                            		<a href="javascript:void(0);" onclick="doUpdate('${zpaySettleOrder.id}')">修改</a>
                                            	</c:if>
												<c:if test="${zpaySettleOrder.settleStatus=='INTERIM_FAIL'}">
                                            		<a href="javascript:void(0);" onclick="doApprove('${zpaySettleOrder.id}')">挂起结算再审</a>
													<a href="javascript:void(0);" onclick="doUpdate('${zpaySettleOrder.id}')">修改</a>
                                            	</c:if>
                                            	<c:if test="${zpaySettleOrder.settleStatus=='PROCESSING'}">
                                            	<%-- 	<a href="javascript:void(0);" onclick="updateStatus('${zpaySettleOrder.id}','SUCCESS')">成功</a> --%>
                                            		<%-- <a href="javascript:void(0);" onclick="updateStatus('${zpaySettleOrder.id}','FAIL')">失败</a> --%>
                                            		<a href="javascript:void(0);" onclick="queryStatus('${zpaySettleOrder.merchantNo}','${zpaySettleOrder.merchantOrderNo}')">通道查询</a>
                                            	</c:if>
                                            </td>
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
	</div>
</body>
</html>
