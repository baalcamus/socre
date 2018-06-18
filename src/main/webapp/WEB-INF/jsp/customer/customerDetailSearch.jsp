<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<%-- <script type="text/JavaScript" src="<%=request.getContextPath()%>/statics/v2/js/My97DatePicker_1/WdatePicker.js"></script>  --%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>海关申报明细查询</title>
<style type="text/css">
	.border0{
		overflow: auto!important;
	}
	.border0 th,.border0 td{
		white-space: nowrap;
	}
</style>
<script type="text/javascript">
	function formSubmit() {
		$("#queryForm").submit();
	}
	function refresh() {
		$("#queryForm").submit();
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
					<li>海关申报管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li class="active">海关申报明细查询</li>
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
						<form
							action="<%=request.getContextPath()%>/static/cbCustomer/queryDetail"
							method="post" id="queryForm" name="queryForm"
							enctype="multipart/form-data" class="form-horizontal ">
							<input type="hidden" name="pageNum" value="${page.pageNum }" />
							<input type="hidden" name="pageSize" value="${page.pageSize }" />

							<div class="row">
								<div class="col-lg-4 col-md-4 ">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="110" class="text-right">开始日期</td>
											<td>
												<div data-date-format="yyyy-mm-dd"
													class="input-group date datepicker-filter mbs">
													<span class="input-group-addon"><i
														class="fa fa-calendar"></i></span> <input type="text"
														id="beginDate" name="beginDate"
														value="${detail.beginDate}"
														class="form-control">
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-lg-4 col-md-4 ">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="110" class="text-right">结束日期</td>
											<td>
												<div data-date-format="yyyy-mm-dd"
													class="input-group date datepicker-filter mbs">
													<span class="input-group-addon"><i
														class="fa fa-calendar"></i></span> <input type="text"
														id="endDate" name="endDate"
														 value="${detail.endDate}"
														class="form-control">
												</div>
											</td>
										</tr>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4 col-md-4 ">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="110" class="text-right">商户号</td>
											<td><input id="merchantNo" name="merchantNo"
												value="${detail.merchantNo}" class="form-control" /></td>
										</tr>
									</table>
								</div>
								<div class="col-lg-4 col-md-4 ">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="110" class="text-right">商户批次号</td>
											<td><input id="batchNo" name="batchNo"
												value="${detail.batchNo}" class="form-control" /></td>
										</tr>
									</table>
								</div>

							</div>
							<div class="row">
								<div class="col-lg-4 col-md-4 ">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="110" class="text-right">明细状态</td>
											<td><select class="form-control" tabindex="10"
												id="status" name="status">

													<option selected="selected" value="">全部</option>
													<option
														<c:if test="${detail.status eq 'ACCEPT' }">selected="selected"</c:if>
														value="ACCEPT">接受成功</option>
													<option
														<c:if test="${detail.status eq 'PROCESSING' }">selected="selected"</c:if>
														value="PROCESSING">处理中</option>
													<option
														<c:if test="${detail.status eq 'SUCCESS' }">selected="selected"</c:if>
														value="SUCCESS">申报成功</option>
													<option
														<c:if test="${detail.status eq 'FAIL' }">selected="selected"</c:if>
														value="FAIL">申报失败</option>
													<option
														<c:if test="${detail.status eq 'PART_SUCCESS' }">selected="selected"</c:if>
														value="PART_SUCCESS">部分申报成功</option>
											</select></td>
										</tr>
									</table>
								</div>
								<div class="col-lg-4 col-md-4 ">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="110" class="text-right">明细订单号</td>
											<td><input id="orderNo" name="orderNo"
												value="${detail.orderNo}" class="form-control" /></td>
										</tr>
									</table>
								</div>
							</div>

							<div class="row">
								<div class="col-lg-4 col-md-4 ">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="110" class="text-right">支付流水号</td>
											<td><input id="payFlow" name="payFlow"
												value="${detail.payFlow}" class="form-control" /></td>
										</tr>
									</table>
								</div>

								<div class="col-lg-4 col-md-4 ">
									<table width="100%" class="product_detail_list">
										<tr>
											<td>
												<!-- 													<button type="submit" id="btnSubmit" --> <!-- 															class="btn btn-danger"> -->
												<!-- 															<i class="fa fa-search"></i> 查询 --> <!-- 													</button> -->
												<input type="button" onclick="javascript:formSubmit();"
												value="查询" class="btn btn-danger"> <!-- 													<i class="fa fa-search"></i> 查询 -->
												</input>

											</td>
											<td></td>
										</tr>
									</table>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!--这是查询模块结束-->

				<div class="panel panel-default clearfix">
					<header class="panel-heading clearfix">
						<h2 class="panel-inner-title02">
							列表 总明细笔数：${count==null?0:count} 总明细金额：${amount==null?0:amount}

							<button onclick="downLoadOrder();"
								class="pull-right btn btn-primary">下载明细</button>
							<a href="javascript:refresh()" class="pull-right"><i
								class="fa fa-refresh"></i> <span class="pull-right">&nbsp;&nbsp;&nbsp;</span>刷新</a>
						</h2>
					</header>
					<div class=" panel-body clearfix">
						<div class="table-responsive border0">
							<table class="table table-hover">

								<thead>
									<tr>
										<th><span>商户号</span></th>
										<th><span>批次号</span></th>
										<th><span>订单号</span></th>
										<th><span>支付流水号</span></th>
										<th><span>支付金额</span></th>
										<th><span>状态</span></th>
										<th><span>商品名称</span></th>
										<th><span>商品数量</span></th>
										<th><span>付款人</span></th>
										<th><span>付款人证件号</span></th>
										<th><span>实名校验</span></th>
										
										<th><span>支付币种</span></th>
										<th><span>电商平台代码</span></th>
										<th><span>电商平台名称</span></th>
										
										<th><span>海关返回码</span></th>
										<th><span>海关返回信息</span></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.list}" var="customDetailList">
										<tr>
											<td>${customDetailList.merchantNo}</td>
											<td>${customDetailList.batchNo}</td>
											<td>${customDetailList.orderNo}</td>
											<td>${customDetailList.payFlow}</td>
											<td>${customDetailList.payAmt}</td>
											<td><c:if test="${customDetailList.status=='INIT'}">初始化</c:if>
												<c:if test="${customDetailList.status=='ACCEPT'}">接受成功</c:if>
												<c:if test="${customDetailList.status=='PROCESSING'}">处理中</c:if>
												<c:if test="${customDetailList.status=='COMPLETE'}">申报完成</c:if>
												<c:if test="${customDetailList.status=='SUCCESS'}">申报成功</c:if>
												<c:if test="${customDetailList.status=='FAIL'}">申报失败</c:if>
												<c:if test="${customDetailList.status=='PART_SUCCESS'}">部分申报成功</c:if>
											</td>
											<td>${customDetailList.goodsDes}</td>
											<td>${customDetailList.goodsCount}</td>
											<td>${customDetailList.payerName}</td>
											<td>${customDetailList.payerCode}</td>
											<td>${(customDetailList.idPassFlag==null or customDetailList.idPassFlag=='')?"无需实名":fns:getEnumFieldValue('com.chinagpay.common.constant.BusinessConstant','CustomsIdPassFlagnum',customDetailList.idPassFlag,'des') }</td>
											<!-- <td>${customList.idPassFlag=="W"?"无需实名":(customList.idPassFlag=="Y"?"实名通过":(customList.idPassFlag=="D"?"待实名":(customList.idPassFlag=="N"?"实名未通过":"无需实名"))) }</td> -->
											<td>${customDetailList.payCry}</td>
											<td>${customDetailList.ebpCode}</td>
											<td>${customDetailList.ebpName}</td>
											<td>${customDetailList.returnCode}</td>
											<td>${customDetailList.returnMsg}</td>
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
<script type="text/javascript">
	function downLoadOrder(){
		var params = $("#queryForm").serialize();
		var url ="<%=request.getContextPath()%>/static/cbCustomer/queryDetailDown?"+params;
		window.open(url);
	}
</script>
</html>
