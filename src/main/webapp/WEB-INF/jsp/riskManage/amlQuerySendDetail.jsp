<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>报送记录查询</title>
</head>
<body>
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
					<li>反洗钱管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li class="active">报送记录查询</li>
				</ol>

				<div class="clearfix"></div>
			</div>
			<!--END TITLE & BREADCRUMB PAGE-->
			<!--BEGIN CONTENT-->
			<div class="page-content">
				<!--这是查询模块开始-->
				<div class="panel panel-default  withoutbottom clearfix">
	                <header class="panel-heading clearfix">
	                    <h2 class="panel-title">上传反洗钱中心返回文件</h2>
	                </header>
	
	                <div class="panel-body clearfix">
	                    <form class="form-horizontal" role="form" method="post" enctype="multipart/form-data" id="subform">
	                    	<input type="hidden" name="cbifBatchNo" id="cbifBatchNo" value="${cbifBatchNo}"/>
	                        <!--主体部分start-->
	                        <div class="panel-inner">
	                            <h2 class="panel-inner-title panel-inner-title-default">解析反洗钱中心文件</h2>
	                            <div class="panel-inner-body">
	
	                                <div class="row">
	                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" <%--id="license"--%>>
	                                        <table width="100%" class="product_detail_list">
	                                            <tr>
	                                                <td width="120" class="text-right">选择文件<span>*</span></td>
	                                                <td>
	                                                    <input id="file" type="file" name="file" value="请选择">
	                                                </td>
	                                            </tr>
	                                        </table>
	                                    </div>
	                                    
	                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
	                                    	<table width="100%" class="product_detail_list">
				                                <button class="btn btn-primary margin30">
				                                    <i class="fa fa-check-square-o"></i> 提交
				                                </button>
				                                <input type="button" value="返回" id="btn3" onclick="javascript:history.back(-1);" class="btn btn-primary margin30" />
			                                </table>
	                            		</div>
	                                </div>
	                            </div>
	                        </div>
	                    </form>
	                    <form action="<%=request.getContextPath()%>/static/risk/querySendDetail" method="post" id="queryForm" enctype="multipart/form-data" class="form-horizontal ">
	                    	<input type="hidden" name="pageNum" value="${page.pageNum }" />
							<input type="hidden" name="pageSize" value="${page.pageSize }" />
							<input type="hidden" name="cbifBatchNo" value="${cbifBatchNo}"/>
	                    </form>
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
										<th><span>文件名称</span></th>
										<th><span>批次信息编号</span></th>
										<th><span>报送记录状态</span></th>
										<th><span>报文类型</span></th>
										<th><span>中心返回信息</span></th>
										<th><span>创建人</span></th>
										<th><span>创建时间</span></th>
										<th><span>修改人</span></th>
										<th><span>修改时间</span></th>
										<th><span>描述</span></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.list}" var="record">
										<tr>
										    <td hidden= true>${record.id}</td>
										    <td>${record.fileName}</td>
										    <td>${record.cbifBatchNo}</td>
										    <td>${record.rbifRecordStatus}</td>
										    <td>${record.messageType}</td>
										    <td>${record.centerReturnMessage}</td>
											<td>${record.createStaff}</td>
											<td>${record.createTime}</td>
											<td>${record.updateStaff}</td>
											<td>${record.updateTime}</td>
											<td>${record.description}</td>
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
    $("#subform").validate({
    	rules: {
            file:"required"
        },
        submitHandler: function (form) {
            $("#subform").ajaxSubmit({
                type: 'post', 
                url: '<%=request.getContextPath()%>/static/risk/checkSendResult',
                success: function(data) {
                    alert(data);
                    window.location.reload();
                }
            });
        }
    });
</script>

</body>
</html>
