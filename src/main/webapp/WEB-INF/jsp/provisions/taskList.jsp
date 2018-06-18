<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>备付金报备文件管理</title>
<script type="text/javascript">
	var contextpath = "${ctx}";
	
	function showOperation(){
		$("#operation").html("");
		
		var bankCode = $("#bankCode").val();
		var sendType = $("#"+bankCode).val();
		
		if(sendType=='1'){
			$("#operation").attr("href","javascript:report()");
			$("#operation").html("报备");
		}
		
		if(sendType=='2'){
			$("#operation").attr("href","javascript:download()");
			$("#operation").html("下载");
		}
	}

	function refresh() {
		var bankCode = $("#bankCode").val();
		var reportDate = $("#reportDate").val();
		
		if (bankCode == null || bankCode == '') {
			return false;
		}
		
		if (reportDate == null || reportDate == '') {
			return false;
		}
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/provisions/queryTaskList.do");
		$("#queryForm").submit();
	}
	
	function query() {
		var status = $("#status").val();
		var bankCode = $("#bankCode").val();
		var reportDate = $("#reportDate").val();
		
		if (bankCode == null || bankCode == '') {
			alert("请选择合作银行");
			return false;
		}
		
		if (reportDate == null || reportDate == '') {
			alert("请选择报备日期");
			return false;
		}
		
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/provisions/queryTaskList.do");
		$("#queryForm").submit();
	}
	
	function createData(taskId){
		alert(taskId);
	}
	
	function queryDetail(formId){
		$('#'+formId).attr("action", "<%=request.getContextPath()%>/provisions/queryTableDetail.do");
		
		$('#'+formId).submit();
	}
	
	function download(){
		var bankCode = $("#bankCode").val();
		var reportDate = $("#reportDate").val();
		
		if (bankCode == null || bankCode == '') {
			alert("请选择合作银行");
			return false;
		}
		
		if (reportDate == null || reportDate == '') {
			alert("请选择报备日期");
			return false;
		}
		
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/provisions/download.do");
		
		$("#queryForm").submit();
	}
	
	function report(){
		
		var bankCode = $("#bankCode").val();
		var reportDate = $("#reportDate").val();
		
		if (bankCode == null || bankCode == '') {
			alert("请选择合作银行");
			return false;
		}
		
		if (reportDate == null || reportDate == '') {
			alert("请选择报备日期");
			return false;
		}
				
		$("#operation").attr("href","#");
		
	    $.post("<%=request.getContextPath()%>/provisions/sendReport.do",{
			bankCode:bankCode,
			reportDate:reportDate,
		},
		function (data){
			if(data=="success"){
				alert("报送成功");
			}else{
				alert("报备失败");
			}
			$("#operation").attr("href","javascript:report()");
		}
		); 
	}
	
	function updateTaskStatus(formId){
		
		var status = $("#status").val();
		
		$('#'+formId).addClass('input').html('<input name="status" type="hidden"  value="' + status + '" />');
		
		$('#'+formId).attr("action", "<%=request.getContextPath()%>/provisions/toModifyTaskStatus.do");
		
		$('#'+formId).submit();
	}
	
	function validate(){
		var bankCode = $("#bankCode").val();
		var reportDate = $("#reportDate").val();
		
		if (bankCode == null || bankCode == '') {
			alert("请选择合作银行");
			return false;
		}
		
		if (reportDate == null || reportDate == '') {
			alert("请选择报备日期");
			return false;
		}
		
		$.post("<%=request.getContextPath()%>/provisions/validate.do",{
			bankCode:bankCode,
			reportDate:reportDate,
		},
		function (data){
			if(data=="success"){
				alert("验证成功");
			}else{
				alert(data);
			}
		}
		);
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
					<li>备付金管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li>备付金文件管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li class="active">文件查询</li>
				</ol>

				<div class="clearfix"></div>
			</div>
			<!--END TITLE & BREADCRUMB PAGE-->
			<!--BEGIN CONTENT-->
			<div class="page-content">
				<!--这是查询模块开始-->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title">文件查询</h2>
					</div>
					<div class="panel-body">
						<div class="row">
							<form action="" method="post"  id="queryForm" class="queryForm" enctype="multipart/form-data" class="form-horizontal ">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />
								<input type="hidden" id="sendType" value="${bank.sendType}" />
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" style="width: 285px;padding-top: 5px;">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="100" class="text-right"> 支付机构名称：</td>
											<td width="200" style="color:#d9534f">
												<c:if test="${bank.merchantName==''||bank.merchantName==null}">北京爱农驿站科技服务有限公司</c:if>
													${bank.merchantName}
											</td>
										</tr>
									</table>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" >
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="55" class="text-right">报备进度</td>
											<td width="200">
												<select class="form-control" tabindex="10" id="status" name="status">
													<option <c:if test="${status=='' }">selected="selected"</c:if> value="">请选择</option>
													<option <c:if test="${status=='1' }">selected="selected"</c:if> value="1">未生成</option>
													<option <c:if test="${status=='2' }">selected="selected"</c:if> value="2">生成未报备</option>
													<option <c:if test="${status=='3' }">selected="selected"</c:if> value="3">报备中</option>
													<option <c:if test="${status=='4' }">selected="selected"</c:if> value="4">报备失败</option>
													<option <c:if test="${status=='0' }">selected="selected"</c:if> value="0">报备成功</option>
												</select>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" >
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="55" class="text-right">合作银行</td>
											<td width="200">
												<select class="form-control" tabindex="10" id="bankCode"name="bankCode" onchange="showOperation();">
													<option <c:if test="${bank.bankCode==''}">selected="selected"</c:if> value="">--请选择--</option>
													<c:forEach items="${allBankList}" var="bank">
														<option <c:if test="${bank.bankCode==bankCode}">selected="selected"</c:if> value="${bank.bankCode}">${bank.bankName }</option>
													</c:forEach>	
												</select>
												<c:forEach items="${allBankList}" var="bank">
													<input type="hidden" id="${bank.bankCode}" value="${bank.sendType}"/>
												</c:forEach>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="55" class="text-right">报备日期</td>
											<td width="200">
												<div data-date-format="yyyy-mm-dd" class="input-group date datepicker-filter mbs">
													<span class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</span>
													<input type="text" class="form-control" id="reportDate" name="reportDate" value="${reportDate}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</form>
							<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
								<table width="100%" class="product_detail_list">
									<tr>
										<td></td>
										<td >
											<button  type="submit" class="btn btn-danger" onclick="query();">
												<i class="fa fa-search"></i> 查询
											</button>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!--这是查询模块结束-->
				<!--这是列表模块开始-->
				<div class="panel panel-default clearfix">
					<header class="panel-heading clearfix">
						<h2 class="panel-inner-title02">
							列表
							<a href="javascript:refresh()" class="pull-right"><i class="fa fa-refresh"></i>刷新</a>
							<c:choose>
								<c:when test="${bank.sendType=='1'}">
									<a href="javascript:report()" style="position:relative;left: 600px;" id="operation">报备</a>
								</c:when>
								<c:when test="${bank.sendType=='2'}">
									<a href="javascript:download()" style="position:relative;left: 600px;" id="operation">下载</a>
								</c:when>
								<c:otherwise>
									<a href="" style="position:relative;left: 600px;" id="operation"></a>									
								</c:otherwise>	
							</c:choose>
							<a href="javascript:validate()" style="position:relative;left: 700px;" id="operation">数据验证</a>
						</h2>
					</header>
					<div class=" panel-body clearfix">
						<div class="table-responsive border0">
							<table class="table table-hover">
								<thead>
									<tr>
										<th><span>报备银行</span></th>
										<th><span>报表名称</span></th>
										<th><span>报备日期</span></th>
										<th><span>报备时间</span></th>
										<th><span>报备进度</span></th>
										<th><span>操作</span></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${taskList}" var="task">
										<form action="" method="post"  id="${task.form}" enctype="multipart/form-data" class="form-horizontal ">
											<input type="hidden" name="bankCode" value="${bank.bankCode}"/>
											<input type="hidden" name="form" value="${task.form}"/>
											<input type="hidden" name="reportDate" value="${task.reportDate}"/>
											<input type="hidden" name="taskId" value="${task.taskId}"/>
										</form>
										<tr>
											<td>${task.bankName}</td>
											<td>${task.reportName}</td>
											<td>${task.reportDate}</td>
											<td>${task.reportTime}</td>
											<c:if test="${task.status=='0'}">
												<td>报备成功</td>
											</c:if>
											<c:if test="${task.status=='1'}">
												<td>未生成</td>
											</c:if>
											<c:if test="${task.status=='2'}">
												<td>生成未报备</td>
											</c:if>
											<c:if test="${task.status=='3'}">
												<td>报备中</td>
											</c:if>
											<c:if test="${task.status=='4'}">
												<td>报备失败</td>
											</c:if>
											<td>
											<c:choose>
												<c:when test="${task.status=='0'}">
													<span style="color:#d9534f">报备成功</span>
												</c:when>
												<c:when test="${task.status=='1'}">
													<a href="javascript:createData('${task.taskId}');" color>生成
												</c:when>
												<c:when test="${task.status=='2'}">
													<a href="javascript:createData('${task.taskId}');" color>重新生成
												</c:when>
												<c:when test="${task.status=='3'}">
													<a href="javascript:updateTaskStatus('${task.form}');">更改状态</a>
												</c:when>
												<c:when test="${task.status=='4'}">
													<span style="color:#d9534f">报备失败</span>
													&nbsp;|&nbsp;<a href="javascript:createData('${task.taskId}');" color>重新生成
												</c:when>
											</c:choose>
											&nbsp;|&nbsp;<a href="javascript:queryDetail('${task.form}');">查看</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<%-- <jsp:include page="../include/page.jsp" /> --%>
				<!--这是列表模块结束-->
			</div>
			<!--End CONTENT-->
		</div>
		<!--右侧内容 end-->
	</div>
</body>
</html>
