<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>个人白名单管理</title>
<script type="text/javascript">
	var contextpath = "${ctx}";
	
	function query() {
		
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/riskManage/riskUserWhiteList");
		$("#queryForm").submit();
	}
	
	function add() {
		window.location.href="<%=request.getContextPath()%>/riskManage/toRiskUserWhiteListAdd?type=add";
	}
	
	function update(id) {
		window.location.href="<%=request.getContextPath()%>/riskManage/toRiskUserWhiteListAdd?type=update&id="+id;
	}
	
	function deleteList(id){
		$.post("<%=request.getContextPath()%>/riskManage/riskUserWhiteListDelete",{
			id:id,
		},
		function (data){
			if(data=="success"){
				alert("删除成功");
				window.location.href="<%=request.getContextPath()%>/riskManage/riskUserWhiteList";
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
					<li>风控管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li>个人白名单&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
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
						<div class="row">
							<form action="" method="post"  id="queryForm" class="queryForm" enctype="multipart/form-data" class="form-horizontal ">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />
	
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="55" class="text-right">姓名</td>
											<td width="200">
												<div >
													<input type="text" class="form-control" id="name" name="name" value="${userWhiteList.name}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
							   <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="55" class="text-right">手机号</td>
											<td width="200">
												<div >
													<input type="text" class="form-control" id="phone" name="phone" value="${userWhiteList.phone}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="55" class="text-right">卡号</td>
											<td width="200">
												<div >
													<input type="text" class="form-control" id="cardNumber" name="cardNumber" value="${userWhiteList.cardNumber}"/>
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
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
								<table width="100%" class="product_detail_list">
									<tr>
										<td></td>
										<td >
											<button  type="submit" class="btn btn-danger" onclick="add();">
												+添加个人用户
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
						</h2>
					</header>
					<div class=" panel-body clearfix">
						<div class="table-responsive border0">
							<table class="table table-hover">
								<thead>
									<tr>
										<th><span>姓名</span></th>
										<th><span>证件类型</span></th>
										<th><span>证件号</span></th>
										<th><span>手机号</span></th>
										<th><span>卡号</span></th>
										<th><span>创建人</span></th>
										<th><span>创建时间</span></th>
										<th><span>操作</span></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${userWhiteListList}" var="White">
										<tr>
										    <td hidden= true>${White.id}</td>
											<td>${White.name}</td>
											<c:if test="${White.certificateType=='1'}">
												<td>身份证</td>
											</c:if>
											<c:if test="${White.certificateType=='2'}">
												<td>签证</td>
											</c:if>
											<c:if test="${White.certificateType=='3'}">
												<td>护照</td>
											</c:if>
											<td>${White.certificateNumber}</td>
											<td>${White.phone}</td>
											<td>${White.cardNumber}</td>
											<td>${White.createStaff}</td>
											<td>
											<fmt:formatDate value="${White.createTime}" type="both"/>
											</td>
											<td>
												<form action="" id="${bank.bankCode}" method="post" enctype="multipart/form-data" class="form-horizontal">
													<input type="hidden" name="WhiteId" value="${White.id}"/>
													
													<a href="javascript:update('${White.id}');">修改</a>
													&nbsp;&nbsp;<a href="javascript:deleteList('${White.id}');">删除</a>
													
												</form>
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
</body>
</html>
