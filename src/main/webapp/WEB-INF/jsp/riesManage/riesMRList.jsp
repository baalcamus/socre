<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>商户风险信息上报</title>
<script type="text/javascript">
	var contextpath = "${ctx}";
	
	function query() {
		
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/riskManage/riskUserBlackList");
		$("#queryForm").submit();
	}
	
	function add() {
		window.location.href="<%=request.getContextPath()%>/riesManage/toRiseMRAdd?type=add";
	}
	
	function update(id) {
		window.location.href="<%=request.getContextPath()%>/riskManage/toRiskUserBlackListAdd?type=update&id="+id;
	}
	
	function preview(id) {
		window.location.href="<%=request.getContextPath()%>/riesManage/toRiseMRAdd?type=preview&id="+id;
	}
	
	function deleteList(id){
		$.post("<%=request.getContextPath()%>/riskManage/riskUserBlackListDelete",{
			id:id,
		},
		function (data){
			if(data=="success"){
				alert("删除成功");
				window.location.href="<%=request.getContextPath()%>/riskManage/riskUserBlackList";
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
					<li>支付风险信息管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
				</ol>

				<div class="clearfix"></div>
			</div>
			<!--END TITLE & BREADCRUMB PAGE-->
			<!--BEGIN CONTENT-->
			<div class="page-content">
				<!--这是查询模块开始-->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title">操作</h2>
					</div>
					<div class="panel-body">
						<div class="row">
							<form action="" method="post"  id="queryForm" class="queryForm" enctype="multipart/form-data" class="form-horizontal ">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />
	
<!-- 								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12"> -->
<!-- 									<table width="100%" class="product_detail_list"> -->
<!-- 										<tr> -->
<!-- 											<td width="55" class="text-right">姓名</td> -->
<!-- 											<td width="200"> -->
<!-- 												<div > -->
<%-- 													<input type="text" class="form-control" id="name" name="name" value="${userBlackList.name}"/> --%>
<!-- 												</div> -->
<!-- 											</td> -->
<!-- 										</tr> -->
<!-- 									</table> -->
<!-- 								</div> -->
							</form>
						<%-- 	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
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
							</div> --%>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
								<table width="100%" class="product_detail_list">
									<tr>
										<td></td>
										<td >
											<button  type="submit" class="btn btn-danger" onclick="add();">
												+添加商户风险信息上报
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
										<th><span>风险类型</span></th>
										<th><span>商户名称</span></th>
										<th><span>商户简称</span></th>
										<th><span>商户编码</span></th>
										<!-- <th><span>组织机构代码</span></th> -->
										<th><span>法定代表人姓名</span></th>
										<th><span>法定代表人证件号码</span></th>
										<th><span>风险事件发生时间</span></th>
										<th><span>风险事件结束时间</span></th>
										<th><span>状态</span></th>
										<th><span>操作</span></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${mechantReportList}" var="mechant">
										<tr>
  											<td>${fns:getEnumField("com.chinagpay.ries.enumtype.RiseEnum","RiskCumStatusEnum",mechant.riskType,"getCode","getDes")}</td>
											<td>${mechant.regName}</td>
											<td>${mechant.cusName}</td>
											<td>${mechant.cusCode}</td>
											<%-- <td>${mechant.orgCode}</td> --%>
											<td>${mechant.legRepName}</td>
											<td>${mechant.legDocCode}</td>
											<td>${mechant.occurtimeb}</td>
											<td>${mechant.occurtimee}</td>
										    <td>${fns:getEnumField("com.chinagpay.ries.enumtype.RiseEnum","ReprotStatusEnum",mechant.status,"getCode","getDes")}</td>
										    <td><a href="javascript:preview('${mechant.id}');">明细</a></td>
											<td>
												<form action="" id="${bank.bankCode}" method="post" enctype="multipart/form-data" class="form-horizontal">
													<input type="hidden" name="BlackId" value="${Person.id}"/>
													
							<%-- 						<a href="javascript:update('${Person.id}');">修改</a> --%>
													&nbsp;&nbsp;
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
