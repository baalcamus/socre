<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>大额交易统计管理</title>
<script type="text/javascript">	
	function formSubmit() {
		$("#queryForm").submit();
	}

	

    function add() {
    	var personAgencyType=$("#personAgencyType").val();
    	var month=$("#month").val();
    	
    	if(month==null||month==''){
    		alert("请选择统计月份");
    		return false;
    	}
    	
    	if(personAgencyType==null||personAgencyType==''){
    		alert("请选择客户类型");
    		return false;
    	}

    	var url = '<%=request.getContextPath()%>/static/cbTrade/forex/order/dataLargeTransaction';
    	var personAgencyType=$("#personAgencyType").val();
    	var month=$("#month").val();
		var params = 'personAgencyType='+ personAgencyType+'&month='+month;
		$.post(url, params, checkAjaxResponsess);
		
		function checkAjaxResponsess(obj) {
		    if (obj.err) {	
		    	alert(obj.msg);
		    	window.location.reload();
			} else {
				alert(obj.msg);
				window.location.reload();
			}
		}
  
    }
    
    function chongxinsc(personAgencyType,month){
		var params = 'personAgencyType='+ personAgencyType+'&month='+month+'&type=cxsc';
		var url = '<%=request.getContextPath()%>/static/cbTrade/forex/order/dataLargeTransaction';
		$.post(url, params, checkAjaxResponsess);
		
		function checkAjaxResponsess(obj) {
		    if (obj.err) {	
		    	alert(obj.msg);
		    	window.location.reload();
			} else {
				alert(obj.msg);
				window.location.reload();
			}
		}
	}
</script>
</head>

<body class=" ">
	<jsp:include page="../include/top.jsp" />
		<div id="wrapper">
			<jsp:include page="../include/bottom.jsp" />
	     	<!-- 左侧内容 -->
		<jsp:include page="../include/left.jsp" />
			
			<!--右侧内容 start-->
			<div id="page-wrapper">
				<!--BEGIN TITLE & BREADCRUMB PAGE-->
				<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
					<ol class="breadcrumb page-breadcrumb">
						<li><i class="fa fa-home"></i>&nbsp;<a
							href="Organization_management.html">首页</a>&nbsp;&nbsp;<i
							class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li>跨境交易管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li>大额交易统计&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li class="active">大额交易</li>
					</ol>

					<div class="clearfix"></div>
				</div>
				<!--END TITLE & BREADCRUMB PAGE-->
				<!--BEGIN CONTENT-->
				<div class="page-content">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h2 class="panel-title">生成数据</h2>
								</div>
								<div class="panel-body">
									<form method="post" enctype="multipart/form-data"
										class="form-horizontal">
										<div class="row">
											<div class="col-lg-4 col-md-4 ">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="110" class="text-right">统计月份<span>*</span></td>
														<td>
															<div data-date-format="yyyymmdd"
																class="input-group date datepicker-filter mbs">
																<span class="input-group-addon"><i
																	class="fa fa-calendar"></i></span> <input class="form-control"
																	id="month" name="month"
																	value="" />
															</div>
														</td>
													</tr>
												</table>
											</div>
											<div class="col-lg-4 col-md-4 ">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="110" class="text-right">客户类型<span>*</span></td>
														<td>
															<select class="form-control" id="personAgencyType" name="personAgencyType"
																tabindex="10">
																	<option value="">--请选择--</option>
																	<option value="D">个人</option>
																	<option value="C">机构</option>
															</select>
														</td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div
												class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right"></td>
													<td><input type="button" value="生成数据" id="btn"
														onclick="add()" class="btn btn-primary margin30" /> 
														<input type="button" value="重置" id="btn2" onclick="reset()"
														class="btn btn-dark" /></td>
												</tr>
												</table>
											</div>
										</div>
									</form>
								</div>
							</div>
						<form id="queryForm"
								action="<%=request.getContextPath()%>/static/cbTrade/forex/LargeTransactionOrder"
								method="post" enctype="multipart/form-data"
								class="form-horizontal ">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />
								
						</form>		
						<!--这是列表模块开始-->
					<div class="panel panel-default clearfix">
						<header class="panel-heading clearfix">
							<h2 class="panel-inner-title02">
								列表
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
											<th>序号</th>
											<th>统计年月</th>
											<th>客户类型</th>
											<th>状态</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${page.list}" var="forexLargeOrder">
											<c:if test="${!(forexLargeOrder.largeTransOrderStatus eq 'NOMATCHDATA')}">
												<tr>
													<td>${forexLargeOrder.id }</td>
													<td>${forexLargeOrder.largeTransMonth}</td>
													<td>
														<c:if test="${forexLargeOrder.personAgencyType == 'D'}">个人</c:if>
														<c:if test="${forexLargeOrder.personAgencyType == 'C'}">机构</c:if>
													</td>
													<td>
														<c:if test="${forexLargeOrder.largeTransOrderStatus == 'SUCCESS'}">已完成生成</c:if>
														<c:if test="${forexLargeOrder.largeTransOrderStatus == 'FAIL'}">生成数据失败</c:if>
														<c:if test="${forexLargeOrder.largeTransOrderStatus == 'GENERATING'}">正在生成</c:if>
														<c:if test="${forexLargeOrder.largeTransOrderStatus == 'NOMATCHDATA'}">没有符合的数据</c:if>
													</td>
													<td>
														<c:if test="${forexLargeOrder.largeTransOrderStatus == 'SUCCESS'}">
															 <a href="<%=request.getContextPath()%>/static/cbTrade/forex/largeOrder/export?personAgencyType=${forexLargeOrder.personAgencyType}&month=${forexLargeOrder.largeTransMonth}&forexLargeTransExportOrderId=${forexLargeOrder.id}">下载</a> 
														</c:if>
														<c:if test="${forexLargeOrder.largeTransOrderStatus == 'FAIL'}">
															<a href="javascript:void(0)" onclick="chongxinsc('${forexLargeOrder.personAgencyType}','${forexLargeOrder.largeTransMonth}')">重新生成</a>
														</c:if>
													</td>
												</tr>
											</c:if>
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
	</div>
	
	


</body>
</html>
