<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>备付金银行管理</title>
<script type="text/javascript">
	var contextpath = "${ctx}";

	function refresh() {
		$("#queryForm").submit();
	}
	function queyBank(){
		$("#queryForm").submit();
	}
	function queryDetail(form){
		$("#"+form).attr("action", "<%=request.getContextPath()%>/provisions/toAccountList.do");
		$("#"+form).submit();
	}
	function addBank(){
		window.location.href ="<%=request.getContextPath()%>/provisions/toBankAdd.do";
	}
	function updateBank(form){
		$("#"+form).attr("action", "<%=request.getContextPath()%>/provisions/toBankModify.do");
		$("#"+form).submit();
	}
	function deleteBank(bankCode){
		$.post("<%=request.getContextPath()%>/provisions/deleteBank.do",{
			bankCode:bankCode,
		},
		function (data){
			if(data=="success"){
				alert("删除成功");
				window.location.href="<%=request.getContextPath()%>/provisions/toBankManageList.do";
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
					<li>备付金管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li>备付金银行管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li class="active">银行查询</li>
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
							<form action="<%=request.getContextPath()%>/provisions/toBankManageList.do" method="post"  id="queryForm" class="queryForm" enctype="multipart/form-data" class="form-horizontal ">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="110" class="text-right">合作银行</td>
											<td>
												<select class="form-control" tabindex="10" id="bankCode" name="bankCode">
													<option <c:if test="${bank.bankCode==''}">selected="selected"</c:if> value="">--请选择--</option>
													<c:forEach items="${allBankList}" var="bank1">
														<option <c:if test="${bank1.bankCode==bank.bankCode}">selected="selected"</c:if> value="${bank1.bankCode}">${bank1.bankName }</option>
													</c:forEach>	
												</select>
											</td>
										</tr>
									</table>
								</div>
							</form>
							<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
								<table width="100%" class="product_detail_list">
									<tr>
										<td>
											<button type="submit" class="btn btn-danger" onclick="queyBank()">
												<i class="fa fa-search"></i> 查询
											</button>
										</td>
										<td>
											<button  class="btn btn-danger" onclick="addBank()">
												+银行注册
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
							<a href="javascript:refresh()" class="pull-right"><i class="fa fa-refresh"></i>刷新</a>
						</h2>
					</header>
					<div class=" panel-body clearfix">
						<div class="table-responsive border0">
							<table class="table table-hover">
								<thead>
									<tr>
										<th><span>银行名称</span></th>
										<th><span>银行编码</span></th>
										<th><span>银行类型</span></th>
										<th><span>报送方式</span></th>
										<th><span>商户号</span></th>
										<th><span>支付机构名称</span></th>
										<th><span>报表种类</span></th>
										<!-- <th><span>创建人</span></th>
										<th><span>创建日期</span></th> -->
										<th><span>操作</span></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.list}" var="bank">
										<tr>
											<td>${bank.bankName}</td>
											<td>${bank.bankCode}</td>
											<c:if test="${bank.bankType=='1'}">
												<td>存管银行</td>
											</c:if>
											<c:if test="${bank.bankType=='2'}">
												<td>合作银行</td>
											</c:if>
											<c:if test="${bank.sendType=='1'}">
												<td>直连</td>
											</c:if>
											<c:if test="${bank.sendType=='2'}">
												<td>手工</td>
											</c:if>
											<td>${bank.merchantId}</td>
											<td>${bank.merchantName}</td>
											<td>${bank.report}</td>
											<%-- <td>${bank.creater}</td>
											<td>
												<fmt:parseDate value="${bank.createDate}" pattern="yyyyMMddHHmmss" var="createDate"></fmt:parseDate>
												<fmt:formatDate value="${createDate}" pattern="yyyy-MM-dd" ></fmt:formatDate>
											</td> --%>
											<td>
												<form action="" id="${bank.bankCode}" method="post" enctype="multipart/form-data" class="form-horizontal">
													<input type="hidden" name="bankCode" value="${bank.bankCode}"/>
													<a href="javascript:queryDetail('${bank.bankCode}');">查看账户</a>
													&nbsp;&nbsp;<a href="javascript:updateBank('${bank.bankCode}');">修改</a>
													&nbsp;&nbsp;<a href="javascript:deleteBank('${bank.bankCode}');">删除</a>
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
