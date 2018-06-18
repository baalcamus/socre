<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
.border0 {
	overflow: auto !important;
}

.border0 th, .border0 td {
	white-space: nowrap;
}
</style>
<title>微支付报备通道管理</title>
<script type="text/javascript">
	var contextpath = "${ctx}";
	
	function query() {
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/microPay/findReportChannelList");
		$("#queryForm").submit();
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
					<li>微支付管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li>支付记录查询&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li class="active">查询</li>
				</ol>

				<div class="clearfix"></div>
			</div>
			<!--END TITLE & BREADCRUMB PAGE-->
			<!--BEGIN CONTENT-->
			<div class="page-content">
				<!--这是查询模块开始-->
				<div class="panel panel-default" >
					<div class="panel-heading">
						<h2 class="panel-title">查询</h2>
					</div>
					<div class="panel-body" >
						<div>
							<form action="" method="post"  id="queryForm" class="queryForm" enctype="multipart/form-data" class="form-horizontal">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />

								<div class="row">
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="90" class="text-right">状态</td>
													<td  width="200"><select class="form-control" id="status" name="status">
														<option <c:if test="${reportChannel.status==''}">selected='selected'</c:if> value="">全部
														<option <c:if test="${reportChannel.status=='VALID'}">selected='selected'</c:if> value="VALID">有效
														<option <c:if test="${reportChannel.status=='INVALID'}">selected='selected'</c:if> value="INVALID">失效
													</select>
													</td>
												</tr>
											</table>
										</div>

									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td></td>
												<td>
													<button  class="btn btn-danger" onclick="javascript:query();return false;">
														<i class="fa fa-search"></i> 查询
													</button>
													<%--<button onclick="javascript:down();return false;"class="btn btn-danger"><i class="fa fa-search"></i>下载</button>--%>
												</td>
											</tr>
										</table>
									</div>
								</div>
							</form>
						</div>
						<%--<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" >--%>
							<%--<button onclick="javascript:createChannelRoute();return false;" class="btn btn-danger">创建新路由</button>--%>
						<%--</div>--%>
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
										<th>通道编码</th>
										<th>通道名称</th>
										<th>通道报备名称</th>
										<th>报备支付方式</th>
										<th>报备模式</th>
										<th>报备码</th>
										<th>状态</th>
										<th>公众号申请模板保存路径</th>
										<th>app支付申请模板保存路径</th>
										<th>描述</th>
										<th>创建人</th>
										<th>创建时间</th>
										<th>更新人</th>
										<th>更新时间</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.list }" var="zpayReportChannel">
										<tr>
											<td>${zpayReportChannel.channelNo }</td>
											<td>${zpayReportChannel.channelName }</td>
											<td>${zpayReportChannel.reportChannelName }</td>
											<td>${zpayReportChannel.reportPayMethod }</td>
											<td>${zpayReportChannel.patternMark }</td>
											<td>${zpayReportChannel.reportChannelCode }</td>

											<td>${zpayReportChannel.status=='VALID'?'可用':(zpayReportChannel.status=='INVALID'?'不可用':zpayReportChannel.status) }
												<c:if test="${zpayReportChannel.status=='VALID'}"><a href="" style="color: blue;" onclick="changeChannelStatus(${zpayReportChannel.id},'INVALID')">(禁用)</a></c:if>
												<c:if test="${zpayReportChannel.status=='INVALID'}"><a  href="" style="color: blue;" onclick="changeChannelStatus(${zpayReportChannel.id},'VALID')">(可用)</a></c:if>
											</td>
											<td>${zpayReportChannel.appIdTemplet }</td>
											<td>${zpayReportChannel.appPayIdTemplet }</td>
											<td>${zpayReportChannel.description }</td>
											<td>${zpayReportChannel.createStaff }</td>
											<td>${zpayReportChannel.createTime }</td>
											<td>${zpayReportChannel.updateStaff}</td>
											<td>${zpayReportChannel.updateTime }</td>
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



	
	<script type="text/javascript">
	


	function changeChannelStatus(id,status) {
        var url="<%=request.getContextPath()%>/microPay/updateReportChannelStatus";
        $.post(url,{id:id,status:status},function(res){
            if('SUCCESS'==res){
                alert("修改成功");
                query();
            }else{
                alert(res);
            }
        });
	}


	</script>
</body>
</html>
