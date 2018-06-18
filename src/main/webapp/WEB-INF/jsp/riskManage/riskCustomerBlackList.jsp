<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
	.overflow{
			max-height:256px;
		}
		#cover{
			position: fixed; 
			z-index: 1000; 
			width: 100%; 
			height: 100%; 
			top:0;
			left:0;
			background-color:#000000;
			filter:alpha(opacity=0.7); /*IE滤镜，透明度50%*/
			-moz-opacity:0.7; /*Firefox私有，透明度50%*/
			opacity:0.7;/*其他，透明度50%*/
			text-align: center;
		}
		#cover img{
			position:absolute;top:40%;left:40%;width:20%;height:10%;margin-top:-15px;margin-left:-15px;
		}

</style>
<style type="text/css">
.border0 {
	overflow: auto !important;
}

.border0 th, .border0 td {
	white-space: nowrap;
}
</style>
<script type="text/javascript">
function showCover(){$("#cover").css("display",'');}
function hideCover(){$("#cover").css("display",'none');}
</script>
<title>商户黑名单管理</title>
<script type="text/javascript">
	var contextpath = "${ctx}";
	
	function query() {
		
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/riskManage/riskCustomerBlackList");
		$("#queryForm").submit();
	}
	
	function add() {
		window.location.href="<%=request.getContextPath()%>/riskManage/toRiskCustomerBlackListAdd?type=add";
	}
	
	function update(id) {
		window.location.href="<%=request.getContextPath()%>/riskManage/toRiskCustomerBlackListAdd?type=update&id="+id;
	}
	
	function deleteList(id){
		$.post("<%=request.getContextPath()%>/riskManage/riskCustomerBlackListDelete",{
			id:id,
		},
		function (data){
			if(data=="success"){
				alert("删除成功");
				window.location.href="<%=request.getContextPath()%>/riskManage/riskCustomerBlackList";
							} else {
								alert("删除失败!");
								window.location.reload();
							}
						});
	}
	function down(){
		var url ="<%=request.getContextPath()%>/static/riskManage/customerBlack/d";
		$("#queryForm").attr("action", url);
		$("#queryForm").submit();
	}
</script>
</head>

<body class=" ">
<div id="cover" style="display: none;">
	 	<img src="<%=request.getContextPath() %>/statics/v2/images/wait_processing.gif">
	</div>
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
					<li>商户白名单&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
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
							<form action="" method="post" id="queryForm" class="queryForm"
								enctype="multipart/form-data" class="form-horizontal ">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />

								<div class="row">
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="55" class="text-right">商户类型</td>
												<td width="200"><select class="form-control"
													tabindex="10" id="customerType" name="customerType">
														<option
															<c:if test="${customerBlackList.customerType=='' }">selected="selected"</c:if>
															value="">全部</option>
														<option
															<c:if test="${customerBlackList.customerType=='C' }">selected="selected"</c:if>
															value="对公">对公</option>
														<option
															<c:if test="${customerBlackList.customerType=='D' }">selected="selected"</c:if>
															value="对私">对私</option>
												</select></td>
											</tr>
										</table>
									</div>
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="55" class="text-right">商户名称</td>
												<td width="200">
													<div>
														<input type="text" class="form-control" id="customerName"
															name="customerName"
															value="${customerBlackList.customerName}" />
													</div>
												</td>
											</tr>
										</table>
									</div>
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="55" class="text-right">商户编号</td>
												<td width="200">
													<div>
														<input type="text" class="form-control"
															id="customerNumber" name="customerNumber"
															value="${customerBlackList.customerNumber}" />
													</div>
												</td>
											</tr>
										</table>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="55" class="text-right">企业ID</td>
												<td width="200">
													<div>
														<input type="text" class="form-control"
															id="companyId" name="companyId"
															value="${customerBlackList.companyId}" />
													</div>
												</td>
											</tr>
										</table>
									</div>
									
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td></td>
												<td>
													<button type="submit" class="btn btn-danger"
														onclick="query();">
														<i class="fa fa-search"></i> 查询
													</button>
													<button onclick="javascript:down();return false;"class="btn btn-danger"><i class="fa fa-search"></i>下载</button>
												</td>
											</tr>
										</table>
									</div>
								</div>
							</form>
							<!-- 
							<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
								<table width="100%" class="product_detail_list">
									<tr>
										<td></td>
										<td>
											<button type="submit" class="btn btn-danger" onclick="add();">
												+添加商户</button>
										</td>
									</tr>
								</table>
							</div>
							 -->
						</div>
					</div>
				</div>
				<!--这是查询模块结束-->
				<!--这是列表模块开始-->
				<div class="panel panel-default clearfix">
					<header class="panel-heading clearfix">
						<h2 class="panel-inner-title02">列表
						<a href="#" onclick="batchImportBlackList();" class="pull-right btn btn-primary">批量导入黑名单</a></h2>
					</header>
					<div class=" panel-body clearfix">
						<div class="table-responsive border0">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>数据来源</th>
										<th>商户类型</th>
										<th>商户编号</th>
										<th>企业ID</th>
										<th>商户名称</th>
										<th>商户简称</th>
										<th>营业执照号</th>
										<th>组织机构代码</th>
										<th>法人姓名</th>
										<th>法人身份证</th>
										<th>销售</th>
										<th>违规业务</th>
										<th>违规通道</th>
										<th>触发规则</th>
										<th>违规描述</th>
										<th>违规业务入口</th>
										<th>处理建议</th>
										<th>辅助信息</th>
										<th>创建时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${customerBlackListList}" var="Black">
										<tr>
											<td hidden=true>${Black.id}</td>
											<td>${Black.source}</td>
											<td>${Black.customerType}</td>
											<td>${Black.customerNumber}</td>
											<td>${Black.companyId}</td>
											<td>${Black.customerName}</td>
											<td>${Black.customerShortName}</td>
											<td>${Black.bizLicRegCode}</td>
											<td>${Black.orgInsCode}</td>
											<td>${Black.legalName}</td>
											<td>${Black.certificateNumber}</td>
											
											<td>${Black.salesMan}</td>
											<td>${Black.illegalBiz}</td>
											<td>${Black.illegalChannel}</td>
											<td>${Black.triggerRule}</td>
											<td>${Black.illegalDescription}</td>
											<td>${Black.illegalBizEntrance}</td>
											<td>${Black.operateType}</td>
											<td>${Black.assistantInfo}</td>
											
											
											<td><fmt:formatDate value="${Black.createTime}"
													type="both" /></td>
											<td>
												<form action="" id="${bank.bankCode}" method="post"
													enctype="multipart/form-data" class="form-horizontal">
													<input type="hidden" name="BlackId" value="${Black.id}" />

													<!-- <a href="javascript:update('${Black.id}');">修改</a> -->
													&nbsp;&nbsp;<a href="javascript:deleteList('${Black.id}');">删除</a>

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
	<div style="display: none;">
		<div>
			<form id="ibl" action="#">
				<input type="file" name="customerBlackFile" id="customerBlackFile">
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	//批量导入黑名单
	function batchImportBlackList(){
		$("#ibl")[0].reset();
		$("#ibl").dialog({
			autoOpen:true,
			title:"上传黑名单",
			modal:true,
			buttons:{
				"确定":function(){
					showCover();
					var url = '<%=request.getContextPath()%>/riskManage/importCustomerBlack';
					var formData = new FormData();
					formData.append("customerBlackFile",$("#customerBlackFile")[0].files[0]);
					$.ajax({ 
						url : url, 
						type : 'POST', 
						data : formData, 
						// 告诉jQuery不要去处理发送的数据
						processData : false, 
						// 告诉jQuery不要去设置Content-Type请求头
						contentType : false,
						beforeSend:function(){
							console.log("正在进行，请稍候");
						},
						success : function(res) {
							hideCover();
							if(res.err==false){
								alert("导入成功");
								query();
							}else{
								alert(res.msg);
							}
						}, 
						error : function(res) { 
							hideCover();
							alert(res.msg);
						} 
					});
				},
				"取消":function(){
					$("#ibl").dialog("close");
				}
			}
		});
	}
</script>
</html>
