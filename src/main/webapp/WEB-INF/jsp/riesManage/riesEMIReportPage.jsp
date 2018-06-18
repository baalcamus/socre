<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>特约商户信息上报</title>
<script type="text/javascript">
	var contextpath = "${ctx}";
	
	function query() {	
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/riskManage/riskUserBlackList");
		$("#queryForm").submit();
	}
	
	function add() {  //跳转到添加信息界面
		window.location.href="<%=request.getContextPath()%>/riesManage/toCompanyMerchantAdd?type=add";
	}
	function updateMessage(id) {  //跳转到修改数据库信息界面
		window.location.href="<%=request.getContextPath()%>/riesManage/toCompanyMerchantAdd?type=update&id="+id;
	}
	
	
	function exportMessage(id) {  //上报
		$.post("<%=request.getContextPath()%>/riesManage/riesCMReport?type=exportMessage",{
				id:id,
			},
			function (data){
				if(data=="success"){
					alert("上报成功");
					window.location.href="<%=request.getContextPath()%>/riesManage/riesEMIReportPage";
				}else{
					alert("上报失败!");
					window.location.reload();
				}
			}
		); 
	}
	
	function preview(id) {  //详情
		window.location.href="<%=request.getContextPath()%>/riesManage/toCompanyMerchantAdd?type=preview&id="+id;
	}
	
	function deleteList(id){  //删除
		$.post("<%=request.getContextPath()%>/riesManage/riesCMReport?type=deleteMessage",{
			id:id,
		},
		function (data){
			if(data=="success"){
				alert("取消成功");
				window.location.href="<%=request.getContextPath()%>/riesManage/riesEMIReportPage";
			}else{
				alert("取消失败!");
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
					<li>特约商户信息上报&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
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
							</form>
							<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
								<table width="100%" class="product_detail_list">
									<tr>
										<td></td>
										<td >
											<button  type="submit" class="btn btn-danger" onclick="add();">
												+添加特约商户信息
											</button>
										</td>
										<td >
											<button class="btn btn-danger" onclick="newRateImport();">
												导入特约商户信息
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
										<th><span>序号</span></th>
										<th><span>商户名称</span></th>
										<th><span>商户类型</span></th>
										<th><span>商户行业类别</span></th>
										<th><span>商户状态</span></th>
										<th><span>合规风险状况</span></th>
										<th><span>系统返回信息</span></th>
										<th><span>上报日期</span></th>
										<th><span>状态</span></th>
										<th><span>操作</span></th>
									</tr>
								</thead>
								<tbody>
									<%-- <c:forEach items="${cmerchantReportList}" var="cmerchant"> --%>
									<c:forEach items="${page.list}" var="cmerchant">
										<tr>
											<td>${cmerchant.id}</td>
											<td>${cmerchant.regName}</td>
											<td>
												<c:if test="${cmerchant.cusType=='01'}">自然人</c:if>
												<c:if test="${cmerchant.cusType=='02'}">企业商户</c:if>
												<c:if test="${cmerchant.cusType=='03'}">个体工商户</c:if>
											</td>
											<td>${cmerchant.induType}</td>
											<td>
												<c:if test="${cmerchant.status=='01'}">启用</c:if>
												<c:if test="${cmerchant.status=='02'}">关闭(暂停)</c:if>
												<c:if test="${cmerchant.status=='03'}">注销</c:if>
											</td>
											<td>
												<c:if test="${cmerchant.riskStatus=='01'}">合规</c:if>
												<c:if test="${cmerchant.riskStatus=='02'}">风险</c:if>
											</td>
											<td>${cmerchant.reportStatus}</td>
											<td>${cmerchant.repDate}</td>
											<td>
												<c:if test="${cmerchant.state=='INIT'}">待上报</c:if>
												<c:if test="${cmerchant.state=='FAIL'}">失败</c:if>
												<c:if test="${cmerchant.state=='SUCCESS'}">成功</c:if>
											</td>
											<td>
												<c:if test="${cmerchant.state=='INIT'}">
													<button  type="button" onclick="exportMessage(${cmerchant.id});">
														上报
													</button>|
													<button  type="button" onclick="updateMessage(${cmerchant.id});">
														修改
													</button>|
													<button  type="button" onclick="preview(${cmerchant.id});">
														详情
													</button>
													
												</c:if>
												<c:if test="${cmerchant.state=='FAIL'}">
													<button  type="button" onclick="updateMessage(${cmerchant.id});">
														修改
													</button>|
													<button  type="button" onclick="preview(${cmerchant.id});">
														详情
													</button>
												</c:if>
												<c:if test="${cmerchant.state=='SUCCESS'}">
													<button  type="button" onclick="deleteList(${cmerchant.id});">
														取消
													</button>|
													<button  type="button" onclick="preview(${cmerchant.id});">
														详情
													</button>
												</c:if>
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
		<div id="import_panel" style="display: none;">
			<div class="form-group">
				<a href="<%=request.getContextPath()%>/statics/v2/model/TYSHXXMB.xlsx" class="btn btn-link">点击下载模板</a>
			</div>
			<form id="importForm" class="form-group"
				action="<%=request.getContextPath()%>/riesManage/specialMerchantMessImport"
				method="post"  enctype="multipart/form-data">
				<div class="form-group">
					<label for="result" class="control-label">上传Excel文件</label> <input
						type="file" id="merchantMessFile" name="merchantMessFile" class="form-control">
				</div>
<!-- 				<div class="form-group">
					<label for="result" class="control-label">汇率生效时间</label> <input
						class="form-control" id="effectMonth" name="effectMonth"
						value="" onclick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-{%M+12}',minDate:'%y-%M',readOnly:true})" />
				</div> -->
				<button type="button" class="btn btn-danger col-md-6"
					onclick="importSubmit();">提交</button>
			</form>
		</div>
		<!--右侧内容 end-->
	</div>
		<script type="text/javascript">
		$(function() {
			init();
		});
		function init() {
			$('#import_panel').dialog({
				autoOpen : false,
				width : "400",
				height : "400",
				buttons : {
					"关闭" : function() {
						$('#import_panel').dialog("close");
					}
				}
			});
		}
		function importSubmit() {
			var file = document.getElementById("merchantMessFile").value;
			if (file == undefined || file == null || file == '') {
				alert("请选择文件!");
				return;
			}
			$("#importForm").submit();
		}
		//导入汇率
		function newRateImport() {
			$('#import_panel').dialog("open");
		}
	</script>
</body>
</html>
