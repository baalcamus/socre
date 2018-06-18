<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<%-- <script type="text/JavaScript" src="<%=request.getContextPath()%>/statics/v2/js/My97DatePicker_1/WdatePicker.js"></script>  --%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>汇率查询</title>
<script type="text/javascript">
	var contextpath = "${ctx}";

	function formSubmit() {
		
		var rateDate = $("#rateDate").val();
		var currency = $("#currency").val();
// 		alert(currency +"  " +rateDate);
		if(rateDate == null  || rateDate == '' || typeof(rateDate) == "undefined"){
			alert("请选择时间")
			return;
		}
		if(currency == null || currency ==  '' || currency == '-1'){
			alert("请选择币种")
			return;
		}
		$("#queryForm").submit();
	}
	
	function refresh() {
		var rateDate = $("#rateDate").val();
		var currency = $("#currency").val();
		if(rateDate == null  || rateDate == '' || typeof(rateDate) == "undefined"){
			return;
		}
		if(currency == null || currency ==  '' || currency == '-1'){
			return;
		}
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
						<li>跨境交易管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li class="active">牌价查询</li>
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
							<form action="<%=request.getContextPath()%>/crossBorderTradeManager/exchangeRateQuery.do" method="post" id="queryForm" name="queryForm"
								enctype="multipart/form-data" class="form-horizontal ">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
									<input type="hidden" name="pageSize" value="${page.pageSize }" />
								<div class="row">
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">牌价日期</td>
												<td>
													<input id="rateDate" name ="rateDate" value="${rate.rateDate}" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" /> 
												</td>
											</tr>
										</table>
									</div>
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">币种</td>
												<td><select class="form-control" tabindex="10" id="currency" name="currency" value="${rate.currency}">
													<option value="-1">--请选择--</option>
													<option value="GBP" <c:if test="${rate.currency=='GBP'}">selected="selected"</c:if>>英镑</option>
													<option value="HKD" <c:if test="${rate.currency=='HKD'}">selected="selected"</c:if>>港币</option>
													<option value="USD" <c:if test="${rate.currency=='USD'}">selected="selected"</c:if>>美元</option>
													<option value="CAD" <c:if test="${rate.currency=='CAD'}">selected="selected"</c:if>>加拿大元</option>
													<option value="AUD" <c:if test="${rate.currency=='AUD'}">selected="selected"</c:if>>澳大利亚元</option>
													<option value="EUR" <c:if test="${rate.currency=='EUR'}">selected="selected"</c:if>>欧元</option>
													<option value="JPY" <c:if test="${rate.currency=='JPY'}">selected="selected"</c:if>>日元</option>
													<option value="NZD" <c:if test="${rate.currency=='NZD'}">selected="selected"</c:if>>新西兰元</option>
													<option value="SGD" <c:if test="${rate.currency=='SGD'}">selected="selected"</c:if>>新加坡元</option>
													<option value="KRW" <c:if test="${rate.currency=='KRW'}">selected="selected"</c:if>>韩国元</option>
													<option value="MOP" <c:if test="${rate.currency=='MOP'}">selected="selected"</c:if>>澳门元</option>
													<option value="THB" <c:if test="${rate.currency=='THB'}">selected="selected"</c:if>>泰国铢</option>
													<option value="CHF" <c:if test="${rate.currency=='CHF'}">selected="selected"</c:if>>瑞士法郎</option>
													<option value="SEK" <c:if test="${rate.currency=='SEK'}">selected="selected"</c:if>>瑞典克郎</option>
													<option value="DKK" <c:if test="${rate.currency=='DKK'}">selected="selected"</c:if>>丹麦克朗</option>
													<option value="NOK" <c:if test="${rate.currency=='NOK'}">selected="selected"</c:if>>挪威克朗</option>
												</select></td>
											</tr>
										</table>
									</div>
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
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
											<th><span>币种</span></th>
											<th><span>银行编码</span></th>
											<th><span>商户号</span></th>
											<th><span>牌价日期</span></th>
											<th><span>牌价类型</span></th>
											<th><span>购汇牌价</span></th>
											<th><span>结汇牌价</span></th>
											<th><span>牌价锁定开始时间</span></th>
											<th><span>牌价锁定结束时间</span></th>
											<th><span>数据来源</span></th>
											<th><span>更新日期</span></th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${page.list}" var="rateList">
										<tr>
											<td>
												<c:if test="${rateList.currency=='GBP'}">英镑</c:if>
												<c:if test="${rateList.currency=='HKD'}">港币</c:if>
												<c:if test="${rateList.currency=='USD'}">美元</c:if>
												<c:if test="${rateList.currency=='CAD'}">加拿大元</c:if>
												<c:if test="${rateList.currency=='AUD'}">澳大利亚元</c:if>
												<c:if test="${rateList.currency=='EUR'}">欧元</c:if>
												<c:if test="${rateList.currency=='JPY'}">日元</c:if>
											</td>
											<td>${rateList.bankCode}</td>
											<td>${rateList.merchantNo}</td>
											<td>${rateList.rateDate}</td>
											<td>
											  <c:if test="${rateList.rateType=='LOCK'}">实时</c:if>
											  <c:if test="${rateList.rateType=='ACTUAL'}">锁定</c:if>
											</td>
											<td>${rateList.rate}</td>
											<td>${rateList.settleRate}</td>
											
											<td>
												<fmt:formatDate value="${rateList.fromLockTime}" pattern="yyyy-MM-dd HH:mm"/>
											</td>
											<td>
												<fmt:formatDate value="${rateList.toLockTime}" pattern="yyyy-MM-dd HH:mm"/>
											</td>
											<td>
											<c:if test="${rateList.dataSource=='THIRD_PARTY'}">第三方</c:if>
											</td>
											<td>
												<fmt:formatDate value="${rateList.updateTime}" pattern="yyyy-MM-dd HH:mm"/>
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
