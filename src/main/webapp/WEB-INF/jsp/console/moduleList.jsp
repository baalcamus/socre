<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>模块查询</title>
<script type="text/javascript">
	var contextpath = "${ctx}";
	

	function formSubmit() {
		$("#queryForm").submit();
	}
	
	function refresh() {
		$("#queryForm").submit();
	}
	
	 function deleteRow(id) {
		    	   
			 $.post( "<%=request.getContextPath()%>/console/deleteRow.do",{
				        id:id,
					},
					function (data){
						if(data=="ok"){
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
						<li>系统管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li>模块管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li class="active">模块查询</li>
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
							<form action="<%=request.getContextPath()%>/console/toModuleList.do" method="post" id="queryForm" <%--name="queryForm"--%>
								enctype="multipart/form-data" class="form-horizontal ">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
									<input type="hidden" name="pageSize" value="${page.pageSize }" />
								<div class="row">

									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">模块名称</td>
												<td><input type="text" id="mark"
													name="mark" value="${consoleRule.mark }" class="form-control"></td>
											</tr>
										</table>
									</div>
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">模块类型</td>
												<td><select class="form-control" tabindex="10" id="type" name="type" value="${consoleRule.type}">
												 <option value="-1">--请选择--</option>
												 <option value="1" <c:if test="${consoleRule.type=='1'}">selected="selected"</c:if>>系统模块</option>
                                                 <option value="2" <c:if test="${consoleRule.type=='2'}">selected="selected"</c:if>>门户模块</option>
												</select></td>
											</tr>
										</table>
									</div>
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td>
													<button type="submit" id="btnSubmit"
															class="btn btn-danger">
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
								列表<a href="javascript:refresh()"
									 class="pull-right"><i
									class="fa fa-refresh"></i> 刷新</a>
							</h2>
						</header>
						<div class=" panel-body clearfix">
							<div class="table-responsive border0">
								<table class="table table-hover">
									<thead>
										<tr>
											<th><span>操作</span></th>
											<th><span>模块地址</span></th>
											<th><span>模块名称</span></th>
											<th><span>模块类型</span></th>
											<th><span>上级菜单</span></th>
											<th><span>创建时间</span></th>
											<th><span>模块级别</span></th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${page.list}" var="consoleRule">
										<tr>
											<td><a href="#" onclick="deleteRow(${consoleRule.id})">删除</a></td>
											<td>${consoleRule.code }</td>
											<td>${consoleRule.mark }</td>
											<td>
											<c:if test="${consoleRule.type=='1'}">系统模块</c:if>
											<c:if test="${consoleRule.type=='2'}">门户模块</c:if>
                                            </td>
											<td>
												${consoleRule.mark}
											</td>
											<td>
											<fmt:formatDate value="${consoleRule.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
											</td>
											<td>
											<c:if test="${consoleRule.ruleLevel=='1'}">一级菜单</c:if>
											<c:if test="${consoleRule.ruleLevel=='2'}">二级菜单</c:if>
											<c:if test="${consoleRule.ruleLevel=='3'}">三级菜单</c:if>
											<c:if test="${consoleRule.ruleLevel=='4'}">四级菜单</c:if>
											<c:if test="${consoleRule.ruleLevel=='5'}">五级菜单</c:if>
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
