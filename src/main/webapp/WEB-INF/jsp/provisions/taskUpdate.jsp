<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>备付金报备文件管理</title>
<script type="text/javascript">	

	function updateTask() {
		var updateStatus = $("#updateStatus").val();
		var remark = $("#remark").val();
		var taskId = $("#taskId").val();
		
		if (updateStatus == null || updateStatus == '') {
			alert("请选择报备状态");
			return false;
		}
		
		/* if (remark == null || remark == '') {
			alert("请输入备注");
			return false;
		} */
		
		$.post("<%=request.getContextPath()%>/provisions/modifyTaskStatus.do",{
					taskId:taskId,
					updateStatus:updateStatus,
					remark:remark,
				},
				function (data){
					if(data=="success"){
						alert("修改成功！");
						$("#form").submit();
					}else{
						alert("修改失败！");
					}
				}
				);
    }
</script>
</head>

<body class=" ">
	<jsp:include page="../include/top.jsp" />
		<div id="wrapper">
			<jsp:include page="../include/bottom.jsp" />
	     	<!-- 左侧内容 -->
		<jsp:include page="../include/left.jsp" />
			
			<!--右侧内容 start-->
			<div id="page-wrapper">
				<!--BEGIN TITLE & BREADCRUMB PAGE-->
				<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
					<ol class="breadcrumb page-breadcrumb">
						<li>
							<i class="fa fa-home"></i>&nbsp;<a href="Organization_management.html">首页</a>&nbsp;&nbsp;
							<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li>系统管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li>备付金文件管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li class="active">文件状态修改</li>
					</ol>
					<div class="clearfix"></div>
				</div>
				<!--END TITLE & BREADCRUMB PAGE-->
				<!--BEGIN CONTENT-->
				<div class="page-content">
					<div class="row clearfix">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h2 class="panel-title">文件状态修改</h2>
								</div>
								<div class="panel-body">
									<form action="<%=request.getContextPath()%>/provisions/queryTaskList.do" method="post"  id="form" class="form" enctype="multipart/form-data" class="form-horizontal ">
										<input type="hidden" name="taskId" id="taskId" value="${task.taskId}" />
										<input type="hidden" name="reportDate" id="" value="${task.reportDate}" />
										<input type="hidden" name="bankCode" id="" value="${task.bankCode}" />
										<input type="hidden" name="status" id="status" value="${task.status}" />
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">报备状态<span>*</span></td>
														<td width="200">
															<select class="form-control" id="updateStatus" name="updateStatus" tabindex="10">
																<option value="">--请选择--</option>
																<option value="0">报备成功</option>
																<option value="4">报备失败</option>
															</select>
														</td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
									
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">备注<span>*</span></td>
														<td width="200">
															<textarea name="remark" id="remark"  rows="5" style="width: 300px;"></textarea>
														</td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right"></td>
														<td>
															<input type="button" value="返回" id="btn3" onclick="javascript:history.back(-1);" class="btn btn-primary margin30" />
															<input type="button" value="修改" id="btn" onclick="updateTask()" class="btn btn-primary margin30" /> 
															<input type="button" value="重置" id="btn2" onclick="reset()" class="btn btn-dark" />
														</td>
													</tr>
												</table>
											</div>
										</div>
									</form>	
								</div>
							</div>
						</div>
					</div>

				</div>
				<!--End CONTENT-->
			</div>
			<!--右侧内容 end-->
		</div>
	</div>
	
	


</body>
</html>
