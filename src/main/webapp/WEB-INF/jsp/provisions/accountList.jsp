<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>备付金账户管理</title>
<script type="text/javascript">
	var contextpath = "${ctx}";

	function refresh() {
		$("#queryForm").submit();
	}
	
	function updateStatus(bankCode,acctNo,acctStatus) {
		$.post( "<%=request.getContextPath()%>/provisions/modifyAccountStatus.do",{
				bankCode:bankCode,
				acctNo:acctNo,
				acctStatus:acctStatus,
			},
			function (data){
				if(data=="success"){
					alert("操作成功");
					window.location.reload();
				}else{
					alert("操作失败!");
					window.location.reload();
				}
			}
			
		);
	 }
	
	
	function modifyAccount(bankCode,acctNo) {
		window.location.href="<%=request.getContextPath()%>/provisions/toAccountModify.do?bankCode="+bankCode+"&acctNo="+acctNo;
	}
	
	function deleteAccount(bankCode,acctNo) {
		$.post( "<%=request.getContextPath()%>/provisions/deleteAccount.do",{
				bankCode:bankCode,
				acctNo:acctNo,
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
					<li>备付金账户管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li class="active">账户查询</li>
				</ol>

				<div class="clearfix"></div>
			</div>
			<!--END TITLE & BREADCRUMB PAGE-->
			<!--BEGIN CONTENT-->
			<div class="page-content">
				<!--这是查询模块开始-->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title">账户信息</h2>
					</div>
					<div class="panel-body">
						<div class="row">
							<form action="<%=request.getContextPath()%>/provisions/toAccountList.do" method="post"  id="queryForm" class="queryForm" enctype="multipart/form-data" class="form-horizontal ">
								<input type="hidden" name="bankCode" value="${bank.bankCode }" />
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td style="padding-top:15px;">
													 银行名称：${bank.bankName}
											</td>
											<td style="padding-top:15px;">
													银行编码：${bank.bankCode}
											</td>
										</tr>
									</table>
								</div>
							</form>
							<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
								<table width="100%" class="product_detail_list">
									<tr>
										<td>
										</td>
										<td>
											<form action="<%=request.getContextPath()%>/provisions/toAccountAdd.do" method="post"  enctype="multipart/form-data" class="form-horizontal ">
												<input type="hidden" name="bankCode" value="${bank.bankCode}"/>
												<button  type="submit" class="btn btn-danger">
													+账户注册
												</button>
											</form>
										</td>
										<td>
										<form action="<%=request.getContextPath()%>/provisions/toBankManageList.do" method="post"  id="goback" class="goback" enctype="multipart/form-data" class="form-horizontal ">
											<button  type="submit" class="btn btn-danger" >返回</button>
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
							<a href="javascript:refresh()" class="pull-right"></a>
						</h2>
					</header>
					<div class=" panel-body clearfix">
						<div class="table-responsive border0">
							<table class="table table-hover">
								<thead>
									<tr>
										<th><span>分行名称</span></th>
										<th><span>授权分支机构名称</span></th>
										<th><span>账户户名</span></th>
										<th><span>账户账号</span></th>
										<th><span>账户状态</span></th>
										<th><span>账户类型</span></th>
										<th><span>业务类型</span></th>
										<th><span>报表种类</span></th>
										<!-- <th><span>创建人</span></th>
										<th><span>创建日期</span></th> -->
										<th><span>操作</span></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${accountList}" var="account">
										<tr>
											<td>${account.childBankName}</td>
											<td>${account.provBranchName}</td>
											<td>${account.acctName}</td>
											<td>${account.acctNo}</td>
											<c:if test="${account.acctStatus=='1'}">
												<td>开通</td>
											</c:if>
											<c:if test="${account.acctStatus=='2'}">
												<td>关闭</td>
											</c:if>
											<c:if test="${bank.bankType=='1'}">
												<td>存管银行</td>
											</c:if>
											<c:if test="${bank.bankType=='2'}">
												<td>合作银行</td>
											</c:if>
											<td>${account.bussinessType}</td>
											<td>${account.form}</td>
											<%-- <td>${account.creater}</td>
											<td>
												<fmt:parseDate value="${account.createDate}" pattern="yyyyMMddHHmmss" var="createDate"></fmt:parseDate>
												<fmt:formatDate value="${createDate}" pattern="yyyy-MM-dd" ></fmt:formatDate>
											</td> --%>
											<td>
												<c:if test="${account.acctStatus=='1'}">
													<a href="javascript:updateStatus('${bank.bankCode}','${account.acctNo}','2');">关闭</a>
												</c:if>
												<c:if test="${account.acctStatus=='2'}">
													<a href="javascript:updateStatus('${bank.bankCode}','${account.acctNo}','1');">开通</a>
												</c:if>
												&nbsp;&nbsp;<a href="javascript:modifyAccount('${bank.bankCode}','${account.acctNo}');">修改</a>
												&nbsp;&nbsp;<a href="javascript:deleteAccount('${bank.bankCode}','${account.acctNo}');">删除</a>
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
