<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<%-- <script type="text/JavaScript" src="<%=request.getContextPath()%>/statics/v2/js/My97DatePicker_1/WdatePicker.js"></script>  --%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>对账结果查询</title>
<script type="text/javascript">
	var contextpath = "${ctx}";

	function formSubmit() {
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/static/ztrade/check/queryCheckErrorDetail");
		$("#queryForm").submit();
	}
	function download() {
		var param=$("#queryForm").serialize();
		var url="<%=request.getContextPath()%>/static/ztrade/check/queryCheckErrorDetail/DownLoad?"+param;
		window.open(url);
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
						<li>业务数据汇总查询&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li class="active">对账结果查询</li>
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
							<form action="<%=request.getContextPath()%>/static/ztrade/check/queryCheckErrorDetail" method="post" id="queryForm" name="queryForm"
								enctype="multipart/form-data" class="form-horizontal ">
 								<input type="hidden" name="pageNum" value="${page.pageNum }" />
									<input type="hidden" name="pageSize" value="${page.pageSize }" />
								<div class="row">
									 <div class="col-lg-4 col-md-4 ">
                                    <table width="100%" class="product_detail_list">
                                        <tr>
                                            <td width="110" class="text-right">开始日期</td>
                                            <td>
                                                <div data-date-format="yyyymmdd"
                                                     class="input-group date datepicker-filter mbs">
                                                    <span class="input-group-addon"><i
                                                            class="fa fa-calendar"></i></span>
                                                    <input type="text" id="checkDate" name="checkDate"
                                                           value="${vo.checkDate}"
                                                           class="form-control">
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
									  <div class="col-lg-4 col-md-4 ">
										<table width="100%" class="product_detail_list">
											<tr>
												 <td width="110" class="text-right">银行通道</td>
											
												<td>
													<select name="channelNo" class="form-control">
														<option <c:if test="${vo.channelNo=='' or vo.channelNo==null }">selected="selected"</c:if> value="">全部
														<c:forEach items="${_ZPAY_CHANNELS_ }" var="_channel_">
															<option  <c:if test="${vo.channelNo==_channel_.key}">selected="selected"</c:if> value="${_channel_.key }">${_channel_.value }
														</c:forEach>
													</select>
													
												</td>
												<td></td>
											</tr>
										</table>
									</div>
									
								</div>
                                <div class="row">
									 
									  
									<div class="col-lg-4 col-md-4 ">
										<table width="100%" class="product_detail_list">
											<tr>
												<td>
<!-- 													<button type="submit" id="btnSubmit" -->
<!-- 															class="btn btn-danger"> -->
<!-- 															<i class="fa fa-search"></i> 查询 -->
															
<!-- 													</button> -->
													<input type="button" onclick="formSubmit()" value="查询" class="btn btn-danger">
<!-- 													<i class="fa fa-search"></i> 查询 -->
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
								<a href="javascript:refresh()" class="pull-right"><i
									class="fa fa-refresh"></i>
								<span class="pull-right">&nbsp;&nbsp;&nbsp;</span>刷新</a>
								<button onclick="download();"class="btn btn-danger"><i class="fa fa-search"></i>下载</button>
							</h2>
						</header>
						<div class=" panel-body clearfix">
							<div class="table-responsive border0">
								<table class="table table-hover">
								
									<thead>
										<tr>
											<th>清算日期</th>
											<th>通道名称</th>
											<th>业务流水号</th>
											<th>差错类型</th>
											<th>交易类型</th>
											<th>平台发生额</th>
											<th>通道发生额</th>
											<th>补差方式</th>
											<th>差错缘由</th>
											<th>描述</th>
											<th>操作员</th>
											<th>操作时间</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${page.list}" var="_vo_">
										<tr>
											<td>${_vo_.checkDate}</td>
											<td>${_ZPAY_CHANNELS_[_vo_.channelNo]}</td>
											<td>${_vo_.bizSerialNo}</td>
											<td>${_vo_.errorType=='PLATFORM_MORE'?"平台单边":(_vo_.errorType=='CHANNEL_MORE'?"通道单边":(_vo_.errorType=='AMOUNT_ERROR'?"金额不符":_vo_.errorType))}</td>
											<td>${_vo_.tradeType=='REFUND'?"退款":(_vo_.tradeType=='ORDER'?"消费":_vo_.tradeType)}</td>
											<td>${_vo_.platformBusAmount}</td>
											<td>${_vo_.channelBusAmount}</td>
											<td>${_vo_.balancePaymentMethod}</td>
											<td>${_vo_.errorReason}</td>
											<td>${_vo_.description}</td>
											<td>${_vo_.operator}</td>
											<td><fmt:formatDate value="${_vo_.createTime}"  pattern="yyyy-MM-dd HH:mm:ss"/></td>
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
		var url ="<%=request.getContextPath()%>/cbCustomer/customerSearch.do?method=dw&"+params;
		window.open(url);
	}
	function operate(id,op,des){
		if(confirm("确定要"+des+"吗?")){
			var url ="<%=request.getContextPath()%>/static/cbCustomer/operate";
			$.post(url,{customId:id,operate:op},function(res){
				if(res.err==true){
					alert(res.msg);
				}else{
					alert("操作成功");
				}
				formSubmit();
			});
		}
	}
</script>
</html>
