<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<%-- <script type="text/JavaScript" src="<%=request.getContextPath()%>/statics/v2/js/My97DatePicker_1/WdatePicker.js"></script>  --%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>海关申报订单查询</title>
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
						<li>海关申报审核&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li class="active">明细查询</li>
						
					</ol>
						<a href="javascript:history.go(-1)" class="pull-right pad25"><i
						class="fa fa-arrow-circle-left"></i> 返回</a>
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
								action="<%=request.getContextPath()%>/cbCustomer/customDetail.do"
								method="post" enctype="multipart/form-data"
								class="form-horizontal ">
								<input type="hidden" name="customId" value="${customId }">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />
							</form>
						</div>
					</div>

					<!--这是查询模块结束-->
					
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
											<th><span>订单号</span></th>
											<th><span>商品名称</span></th>
											<th><span>商品数量</span></th>
											<th><span>付款人</span></th>
											<th><span>付款人证件号</span></th>
											<th><span>实名校验</span></th>
											<th><span>支付流水号</span></th>
											<th><span>支付金额</span></th>
											<th><span>支付币种</span></th>
											<th><span>电商平台代码</span></th>
											<th><span>电商平台名称</span></th>
											<th><span>状态</span></th>
											<th><span>海关返回码</span></th>
											<th><span>海关返回信息</span></th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${page.list}" var="customDetailList">
										<tr>
											<td>${customDetailList.orderNo}</td>
											<td>${customDetailList.goodsDes}</td>
											<td>${customDetailList.goodsCount}</td>
											<td>${customDetailList.payerName}</td>
											<td>${customDetailList.payerCode}</td>
											<td>${(customDetailList.idPassFlag==null or customDetailList.idPassFlag=='')?"无需实名":fns:getEnumFieldValue('com.chinagpay.common.constant.BusinessConstant','CustomsIdPassFlagnum',customDetailList.idPassFlag,'des') }</td>
											<!-- <td>${customList.idPassFlag=="W"?"无需实名":(customList.idPassFlag=="Y"?"实名通过":(customList.idPassFlag=="D"?"待实名":(customList.idPassFlag=="N"?"实名未通过":"无需实名"))) }</td> -->
											<td>${customDetailList.payFlow}</td>
											<td>${customDetailList.payAmt}</td>
											<td>${customDetailList.payCry}</td>
											<td>${customDetailList.ebpCode}</td>
											<td>${customDetailList.ebpName}</td>
											<td>
												<c:if test="${customDetailList.status=='INIT'}">初始化</c:if>
												<c:if test="${customDetailList.status=='ACCEPT'}">接受成功</c:if>
												<c:if test="${customDetailList.status=='PROCESSING'}">处理中</c:if>
												<c:if test="${customDetailList.status=='COMPLETE'}">申报完成</c:if>
												<c:if test="${customDetailList.status=='SUCCESS'}">申报成功</c:if>
												<c:if test="${customDetailList.status=='FAIL'}">申报失败</c:if>
												<c:if test="${customDetailList.status=='PART_SUCCESS'}">部分申报成功</c:if>
											</td>
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
</html>
