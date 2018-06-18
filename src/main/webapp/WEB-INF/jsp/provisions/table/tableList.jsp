<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>备付金报备文件管理</title>
<script type="text/javascript">
	var contextpath = "${ctx}";

	function refresh() {
		$("#queryForm").submit();
	}
	
	function addTableData() {
		$("#addTable").submit();
	}
	
	function deleteTable(id,form) {
		$.post( "<%=request.getContextPath()%>/provisions/deleteTable.do",{
				id:id,
				form:form,
			},
			function (data){
				if(data=="success"){
					alert("删除成功");
					window.location.reload();
				}else{
					alert("删除失败!");
					window.location.reload();
				}
			}
			
		);
	 }
	
	function modifyTable(id){
		$('#'+id).submit();
	}
</script>
</head>

<body class=" ">
	<jsp:include page="../../include/top.jsp" />
	<!--头部 end-->
	<div id="wrapper">
		<jsp:include page="../../include/bottom.jsp" />
		<!-- 左侧内容 -->
		<jsp:include page="../../include/left.jsp" />
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
					<li class="active">文件明细查询</li>
				</ol>

				<div class="clearfix"></div>
			</div>
			<!--END TITLE & BREADCRUMB PAGE-->
			<!--BEGIN CONTENT-->
			<div class="page-content">
				<!--这是查询模块开始-->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title">${tableName}</h2>
					</div>
					<div class="panel-body">
						<div class="row">
							<form action="<%=request.getContextPath()%>/provisions/queryTableDetail.do" method="post"  id="queryForm" class="queryForm" enctype="multipart/form-data" class="form-horizontal ">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />
								<input type="hidden" name="taskId" value="${taskId}" />
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" style="width: 205px;padding-top: 10px;">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="50" class="text-right">
												商户号：
											</td>
											<td width="100" style="color:#d9534f">
													${bank.merchantId}
											</td>
										</tr>
									</table>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" style="width: 285px;padding-top: 10px;">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="100" class="text-right">
												支付机构名称：
											</td>
											<td width="200" style="color:#d9534f">
												${bank.merchantName}
											</td>
										</tr>
									</table>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" style="width: 285px;padding-top: 10px;">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="500" class="text-right">
												备付金银行(法人)名称:
											</td>
											<td width="200" style="color:#d9534f">
												${bank.bankName}
											</td>
										</tr>
									</table>
								</div>
							</form>
							<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
								<table width="100%" class="product_detail_list">
									<tr>
										<td></td>
										<td>
											<form action="<%=request.getContextPath()%>/provisions/toAddTable.do" method="post"  id="addTable" class="addTable" enctype="multipart/form-data" class="form-horizontal ">
												<input type="hidden" name="taskId" value="${taskId}"/>
												<input type="hidden" name="reportDate" value="${reportDate}"/>
												<input type="hidden" name="form" value="${form}"/>
												<input type="hidden" name="bankCode" value="${bankCode}"/>
												<button  type="submit" class="btn btn-danger" onclick="addTableData();">
													+添加数据
												</button>
											</form>
										</td>
										<td>
											<form action="<%=request.getContextPath()%>/provisions/queryTaskList.do" method="post"  id="goback" class="goback" enctype="multipart/form-data" class="form-horizontal ">
												<input type="hidden" name="bankCode" value="${bankCode}"/>
												<input type="hidden" name="reportDate" value="${reportDate}"/>
												<button  type="submit" class="btn btn-danger" >返回</button>
											</form>
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
						</h2>
					</header>
					<div class=" panel-body clearfix">
						<div class="table-responsive border0">
							<table class="table table-hover">
								<thead>
									<tr>
										<th><span>备付金银行授权分支机构名称</span></th>
										<th><span>交易时期</span></th>
										<th><span>备付金银行账户开户银行名称</span></th>
										<th><span>备付金银行账户户名</span></th>
										<th><span>备付金银行账户账号</span></th>
										<th><span>填报日期</span></th>
										<th><span>填表人</span></th>
										<th><span>复核人</span></th>
										<th><span>交易日期</span></th>
										<th><span>操作</span></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.list}" var="table">
										<tr>
											<td>${table.provBranchName}</td>
											<td>${table.tranDate}</td>
											<td>${table.openingBankName}</td>
											<td>${table.acctName}</td>
											<td>${table.acctNo}</td>
											<td>${table.fillDate}</td>
											<td>${table.filler}</td>
											<td>${table.checker}</td>
											<td>${table.tradeDate}</td>
											<td>
												<form action="<%=request.getContextPath()%>/provisions/toModifyTable.do" method="post"  id="${table.id}" enctype="multipart/form-data" class="form-horizontal ">
													<input type="hidden" name="form" value="${form}"/>
													<input type="hidden" name="id" value="${table.id}"/>
													<input type="hidden" name="bankCode" value="${bankCode}"/>
												</form>
												<a href="javascript:modifyTable('${table.id}');">编辑</a>
												<a href="javascript:deleteTable('${table.id}','${form}');">删除</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<jsp:include page="../../include/page.jsp" />
				<!--这是列表模块结束-->
			</div>
			<!--End CONTENT-->
		</div>
		<!--右侧内容 end-->
	</div>
</body>
</html>
