<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>跨境折算美元汇率</title>
</head>
<script type="text/javascript">
	function formSubmit() {
		$("#queryForm").submit();
	}
</script>

<body class=" ">
	<!-- 头部 -->
	<jsp:include page="../include/top.jsp" />
	<div id="wrapper">
		<div>
			<jsp:include page="../include/bottom.jsp" />
			<!-- 左侧内容 -->
			<jsp:include page="../include/left.jsp" />
			<!--右侧内容 start-->
			<div id="page-wrapper">
				<!--BEGIN TITLE & BREADCRUMB PAGE-->
				<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
					<ol class="breadcrumb page-breadcrumb">
						<li><i class="fa fa-home"></i>&nbsp;<a
							href="<%=request.getContextPath()%>/main/toMain.do">首页</a>&nbsp;&nbsp;<i
							class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li>跨境资源管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li>折算美元汇率&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
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
							<h2 class="panel-title">查询</h2>
						</div>
						<div class="panel-body">
							<form id="queryForm"
								action="<%=request.getContextPath()%>/cbBank/currency2Usd/query.do"
								method="post" enctype="multipart/form-data"
								class="form-horizontal ">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />
								<div class="row">
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table class="product_detail_list">
											<tr>
												<td width="110" class="text-right">查询币种</td>
												<td>
												<select name="currencyCode" class="form-control">
													<option <c:if test="${currency2UsdRate.currencyCode==''}">selected="selected"</c:if> value="">全部</option>
													<c:forEach var="currency" items="${fns:getCurrencys()}">
														<option
															<c:if test="${currency2UsdRate.currencyCode=='currency'}">selected="selected"</c:if>
															value="${currency}">${currency.unit}</option>
													</c:forEach>
												</select>
												</td>
											</tr>
										</table>
									</div>
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table class="product_detail_list">
											<tr>
												<td width="110" class="text-right">时间</td>
												<td><input class="form-control" name="effectMonth"
													value="${currency2UsdRate.effectMonth}"
													onclick="WdatePicker({dateFmt:'yyyyMM',readOnly:true})" />
												</td>
											</tr>
										</table>
									</div>
									<div class="col-lg-1 col-md-3 col-sm-6 col-xs-12">
										<table class="product_detail_list">
											<tr>
												<td>
													<button type="submit" id="btnSubmit"
														class="btn btn-primary">
														<i class="fa fa-search"></i> 查询
													</button>
												</td>
											</tr>
										</table>
									</div>
								</div>
							</form>
						</div>
					</div>
					<!--这是查询模块结束-->
					<!--这是列表模块开始-->
					<div class="panel panel-default clearfix">
						<header class="panel-heading clearfix">
							<h2 class="panel-inner-title02">
								列表&nbsp;资源地址<a href="http://www.safe.gov.cn/wps/portal/sy/tjsj_dmzsl" target="_blank">http://www.safe.gov.cn/wps/portal/sy/tjsj_dmzsl</a>
								<button onclick="newRateImport();"
									class="pull-right btn btn-primary">新增+</button>
								<span class="pull-right">&nbsp;&nbsp;&nbsp;</span> <a
									href="javascript:formSubmit()" class="pull-right"><i
									class="fa fa-refresh"></i>刷新</a>
							</h2>
						</header>
						<div class="panel-body clearfix">
							<div class="table-responsive border0">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>币种</th>
											<th>折算汇率</th>
											<th>折算单位</th>
											<th>时间</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${page.list}" var="rate">
											<tr>
												<td>${fns:getCurrency(rate.currencyCode) }</td>
												<td><fmt:formatNumber value="${rate.exchangeRate}"
														pattern="###,##0.000000" /></td>
												<td>${rate.unit}${fns:getCurrency(rate.currencyCode) }</td>
												<td>${rate.effectMonth}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>


					<jsp:include page="../include/page.jsp" />
				</div>
				<!--这是列表模块结束-->
			</div>
			<!--End CONTENT-->
		</div>
		<div id="import_panel" style="display: none;">
			<div class="form-group">
				<a href="<%=request.getContextPath()%>/statics/v2/model/ZSMYHLMB.xls" class="btn btn-link">点击下载模板</a>
			</div>
			<form id="importForm" class="form-group"
				action="<%=request.getContextPath()%>/cbBank/currency2Usd/importRate.do"
				method="post"  enctype="multipart/form-data">
				<div class="form-group">
					<label for="result" class="control-label">上传Excel文件</label> <input
						type="file" id="rateFile" name="rateFile" class="form-control">
				</div>
				<div class="form-group">
					<label for="result" class="control-label">汇率生效时间</label> <input
						class="form-control" id="effectMonth" name="effectMonth"
						value="" onclick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-{%M+12}',minDate:'%y-%M',readOnly:true})" />
				</div>
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
			var file = document.getElementById("rateFile").value;
			if (file == undefined || file == null || file == '') {
				alert("请选择文件!");
				return;
			}
			var effectMonth=$("#effectMonth").val();
			if (effectMonth == undefined || effectMonth == null || effectMonth == '') {
				alert("请选择生效月份!");
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
