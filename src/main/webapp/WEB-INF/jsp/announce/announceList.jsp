<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>公告查询</title>
<script type="text/javascript">
	var contextpath = "${ctx}";
	
	function refresh() {
		$("#queryForm").submit();
	}
	
	function formSubmit() {
		$("#queryForm").submit();
	}
	
	
	 function changeStatus(id,status) {
		    	   
			 $.post( "<%=request.getContextPath()%>/announce/changeStatus.do",{
				        id:id,
				        status:status
					},
					
					function (data){
						if(data=="ok"){
							window.location.reload();
						}else{
							alert("修改失败!");
							window.location.reload();
						}
					}
					
				);

	    }

	
</script>
</head>

<body class=" ">
	<div>
	<jsp:include page="../include/top.jsp" />
		<a id="totop" href="#"><i class="fa fa-angle-up"></i></a>
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
						<li>系统管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li>系统公告&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li class="active">公告查询</li>
					</ol>
					<div class="clearfix"></div>
				</div>
				<div class="page-content">

					<!--这是查询模块开始-->
					<div class="panel panel-default">

						<div class="panel-heading">
							<h2 class="panel-title">查询</h2>
						</div>
						<div class="panel-body">
							<form action="<%=request.getContextPath()%>/announce/toAnnounceList.do" method="post" id="queryForm" name="queryForm"
								enctype="multipart/form-data" class="form-horizontal ">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
									<input type="hidden" name="pageSize" value="${page.pageSize }" />
								<div class="row">
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">标题</td>
												<td><input type="text" id="title"
													name="title" value="${announce.title }" class="form-control"></td>
											</tr>
										</table>
									</div>
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="120" class="text-right">期限</td>
												<td>
												   <select class="form-control" tabindex="10" id="termStatus" name="termStatus" >
												        <option value="-1">--请选择--</option>
														<option value="1">有效</option>
														<option value="2">无效</option>
												    </select>
												</td>
											</tr>
										</table>
									</div>
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td>
													<button type="submit" id="btnSubmit" class="btn btn-primary">
														<i class="fa fa-search"></i> 查询
													</button>
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
					<!--这是列表模块开始-->
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
										<tr>
											<th><span>操作</span></th>
											<th><span>标题</span></th>
											<th><span>发布人</span></th>
											<th><span>有效期</span></th>
											<th><span>发布时间</span></th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${page.list}" var="announce">
										<tr>
											<td>
											<a href="<%=request.getContextPath()%>/announce/toAnnounceChange.do?id=${announce.id}">修改</a>&nbsp;&nbsp;
											   <a href="<%=request.getContextPath()%>/announce/toAnnounceDetail.do?id=${announce.id}">详情</a>&nbsp;&nbsp;
											    <c:if test="${announce.status=='1'}"><a href="javascript:changeStatus(${announce.id},${announce.status})">关闭</a></c:if>
											    <c:if test="${announce.status=='2'}"><a href="javascript:changeStatus(${announce.id},${announce.status})">开启</a></c:if>
											 </td>
											<td>${announce.title}</td>
											<td>${announce.releasePerson}</td>
											<td>${announce.expiryDate}</td>
											<td><fmt:formatDate value="${announce.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
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

