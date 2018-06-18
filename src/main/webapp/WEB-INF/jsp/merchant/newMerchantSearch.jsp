<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<%-- <script type="text/JavaScript" src="<%=request.getContextPath()%>/statics/v2/js/My97DatePicker_1/WdatePicker.js"></script>  --%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>商户信息查询</title>
<script type="text/javascript">
	var contextpath = "${ctx}";

	function formSubmit() {
		$("#queryForm").submit();
	}
	
	function refresh() {
		$("#queryForm").submit();
	}
	
	function doDetail(id){
		$("#queryId").val(id);
		$("#detailForm").submit();
		
	}
	
	function sendCustom(id){
		$.post("<%=request.getContextPath()%>/cbCustomer/customConfirm.do",{
			customId:id,
		},
		function(data){
			alert(data);
		}
				
		);
		
	}
	
	
	function updateMerStatus(merId,sta)
	{
		$.post( "<%=request.getContextPath()%>/merchant/udpateMerStatus",{
			merchantNo:merId,
			status:sta
			},
			function (res){
				if(res.err=="ok"){
					alert("操作成功!");
					refresh()
				}else{
					alert("操作失败!失败原因"+res.msg);
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
						<li>商户管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li class="active">商户信息查询</li>
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
							<form action="<%=request.getContextPath()%>/merchant/queryMerchant" method="post" id="queryForm" name="queryForm"
								enctype="multipart/form-data" class="form-horizontal ">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />
                                <div class="row">
								<div class="col-md-3 ">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">商户号</td>
												<td>
													<input id="merchantNo" name ="merchantNo" value="${merchantInfo.merchantNo}"  class="form-control" /> 
												</td>
											</tr>
										</table>
									</div>
									<div class="col-md-3 ">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">商户名称</td>
												<td>
													<input id="merchantName" name ="merchantName" value="${merchantInfo.merchantName}"  class="form-control"/> 
												</td>
											</tr>
										</table>
									</div>
									<div class="col-md-3 ">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">销售名称</td>
												<td>
													<input id="merchantName" name ="salesman" value="${merchantInfo.salesman}"  class="form-control"/> 
												</td>
											</tr>
										</table>
									</div>
									<div class="col-md-3 ">
										<table width="100%" class="product_detail_list">
											<tr>
												<td>
<!-- 													<button type="submit" id="btnSubmit" -->
<!-- 															class="btn btn-danger"> -->
<!-- 															<i class="fa fa-search"></i> 查询 -->
															
<!-- 													</button> -->
													<input type="button" onclick="formSubmit()" value="查询" class="btn btn-danger">
<!-- 													<i class="fa fa-search"></i> 查询 -->
													</input>
													
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
											<th>操作</th>
											<th>商户号</th>
											<th>互联网商编</th>
											<th>商户简称</th>
											<th>销售名称</th>
											<th>业务联系人姓名</th>
											<th>业务联系人电话</th>
											<th>业务联系人邮箱</th>
											<th>所属代理商</th>
											<th>创建日期</th>
											<th>开通业务</th>
											<th>开通结算信息</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${page.list}" var="_l_merchantInfo_">
										<tr>
											<td>
												<c:if test="${_l_merchantInfo_.status=='MERCHANT_ACTIVE' }">
													<a href="<%=request.getContextPath() %>/cbzpay/new_ecsauthmgr?merchantNo=${_l_merchantInfo_.merchantNo}">跨境权限管理</a>
													<a href="javascript:updateMerStatus('${_l_merchantInfo_.merchantNo}','MERCHANT_CLOSE')" style="margin-left: 10px">商户关闭</a>
													<a href="<%=request.getContextPath() %>/merchant/updateMerchantPage?merchantNo=${_l_merchantInfo_.merchantNo}">信息修改</a>
												</c:if>
												<c:if test="${_l_merchantInfo_.status=='MERCHANT_CLOSE' }">
													<a href="javascript:updateMerStatus('${_l_merchantInfo_.merchantNo}','MERCHANT_ACTIVE')" style="margin-left: 10px">商户开启</a>
												</c:if>
													
												</td>
											<td><a style="text-decoration:underline;" href="<%=request.getContextPath() %>/static/cbMerchant/merchantdetail?merchantNo=${_l_merchantInfo_.merchantNo}">${_l_merchantInfo_.merchantNo}</a></td>
											<td>${_l_merchantInfo_.interNo}</td>
											<td>${_l_merchantInfo_.merchantShortName}</td>
											<td>${_l_merchantInfo_.salesman}</td>
											<td>${_l_merchantInfo_.merchantContactPerson}</td>
											<td>${_l_merchantInfo_.merchantContactPhone}</td>
											<td>${_l_merchantInfo_.merchantContactEmail}</td>
											
											<td>
										
												<c:if test="${_l_merchantInfo_.belongAgentMctNo!=null}">
														<c:forEach var="agentMcts" items="${agentMcts}"  >                                              				
	                                              				<c:if test="${_l_merchantInfo_.belongAgentMctNo==agentMcts.merchantNo}">
					                                         		${agentMcts.merchantName }
	                                              				</c:if>
	                                              		</c:forEach>
												</c:if>
							
											</td>
											<td>
												<fmt:formatDate value="${_l_merchantInfo_.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
											</td>
											<td>${_l_merchantInfo_.openBusinessInfo!='Y'?"未开通":"已开通"}
												<c:if test="${_l_merchantInfo_.openBusinessInfo!='Y'}">
													<a style="margin-left: 10px" href="<%=request.getContextPath() %>/merbizset/toAdd?merchantNo=${_l_merchantInfo_.merchantNo}&merchantFeature=${_l_merchantInfo_.merchantFeature}">(点击设置)</a>
												</c:if>
											</td>
											<td>${_l_merchantInfo_.openSettleInfo!='Y'?"未开通":"已开通"}
												<c:if test="${_l_merchantInfo_.openSettleInfo!='Y'}">
													<a style="margin-left: 10px" href="<%=request.getContextPath() %>/mersettleinfo/toAdd?merchantNo=${_l_merchantInfo_.merchantNo}">(点击设置)</a>
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
			<!--右侧内容 end-->
		</div>
	</div>
	
	<form name="detailForm" id="detailForm" method="post" action="<%=request.getContextPath()%>/cbMerchant/merchantDetail.do">
		<input name="id" type="hidden" id="queryId"/>
		<input name="type" type="hidden" value="doDetail"/>
	</form>

	

</body>
</html>
