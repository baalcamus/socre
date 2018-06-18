<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<%-- <script type="text/JavaScript" src="<%=request.getContextPath()%>/statics/v2/js/My97DatePicker_1/WdatePicker.js"></script>  --%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>海关申报订单查询</title>
<script type="text/javascript">
	var contextpath = "${ctx}";

	function formSubmit() {
		$("#queryForm").submit();
	}
	
	function refresh() {
		$("#queryForm").submit();
	}
	
	function sendCustom(id){
		$.post("<%=request.getContextPath()%>/cbCustomer/customConfirm.do",{
			customId:id
		},
		function(data){
			alert(data);
			formSubmit();
		}	
		);
	}
	function sendCheckCustom(id){
		$.post("<%=request.getContextPath()%>/static/cbCustomer/checkOrder",{
			customId:id
		},
		function(res){
			if(res.err==false){
				alert("实名校验处理中,请稍后查看结果。");
				$("#queryForm").submit();
			}else{
				alert(obj.msg);
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
						<li>海关申报管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li class="active">海关申报审核</li>
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
							<form action="<%=request.getContextPath()%>/cbCustomer/customerSearch.do" method="post" id="queryForm" name="queryForm"
								enctype="multipart/form-data" class="form-horizontal ">
 								<input type="hidden" name="pageNum" value="${page.pageNum }" />
									<input type="hidden" name="pageSize" value="${page.pageSize }" />
								<div class="row">
									 <div class="col-lg-4 col-md-4 ">
                                    <table width="100%" class="product_detail_list">
                                        <tr>
                                            <td width="110" class="text-right">开始日期</td>
                                            <td>
                                                <div data-date-format="yyyy-mm-dd"
                                                     class="input-group date datepicker-filter mbs">
                                                    <span class="input-group-addon"><i
                                                            class="fa fa-calendar"></i></span>
                                                    <input type="text" id="beginDate" name="beginDate"
                                                           value="<fmt:formatDate value="${customerInf.beginDate}" pattern="yyyy-MM-dd"/>"
                                                           class="form-control">
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                 <div class="col-lg-4 col-md-4 ">
                                    <table width="100%" class="product_detail_list">
                                        <tr>
                                            <td width="110" class="text-right">结束日期</td>
                                            <td>
                                                <div data-date-format="yyyy-mm-dd"
                                                     class="input-group date datepicker-filter mbs">
                                                    <span class="input-group-addon"><i
                                                            class="fa fa-calendar"></i></span>
                                                    <input type="text" id="endDate" name="endDate"
                                                           value="<fmt:formatDate value="${customerInf.endDate}" pattern="yyyy-MM-dd"/>"
                                                           class="form-control">
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                               </div>
                                <div class="row">
								<div class="col-lg-4 col-md-4 ">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">商户号</td>
												<td>
													<input id="merchantNo" name ="merchantNo" value="${customerInf.merchantNo}"  class="form-control" /> 
												</td>
											</tr>
										</table>
									</div>
									<div class="col-lg-4 col-md-4 ">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">商户批次号</td>
												<td>
													<input id="batchNo" name ="batchNo" value="${customerInf.batchNo}"  class="form-control"/> 
												</td>
											</tr>
										</table>
									</div>
									
									</div>
									 <div class="row">
									  <div class="col-lg-4 col-md-4 ">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">批次状态</td>
												<td>
												  <select class="form-control" tabindex="10" id="status" name="status">
							
													<option selected="selected" value="">全部</option>
													<option <c:if test="${customerInf.status eq 'ACCEPT' }">selected="selected"</c:if> value="ACCEPT">接受成功</option>
													<option <c:if test="${customerInf.status eq 'PROCESSING' }">selected="selected"</c:if> value="PROCESSING">处理中</option>
													<option <c:if test="${customerInf.status eq 'SUCCESS' }">selected="selected"</c:if> value="SUCCESS">申报成功</option>
													<option <c:if test="${customerInf.status eq 'FAIL' }">selected="selected"</c:if> value="FAIL">申报失败</option>
													<option <c:if test="${customerInf.status eq 'PART_SUCCESS' }">selected="selected"</c:if> value="PART_SUCCESS">部分申报成功</option>
												   </select>
												</td>
											</tr>
										</table>
									</div>
									<div class="col-lg-4 col-md-4 ">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="110" class="text-right">海关</td>
												<td>
												  <select class="form-control" tabindex="10" id="custCode" name="custCode">
							
													<option selected="selected" value="">全部</option>
													<option <c:if test="${customerInf.custCode eq 'PT001' }">selected="selected"</c:if> value="PT001" >平潭总署</option>
										        	<option <c:if test="${customerInf.custCode eq 'FZ001' }">selected="selected"</c:if> value="FZ001" >福州总署</option>
										        	<option <c:if test="${customerInf.custCode eq 'SH001' }">selected="selected"</c:if> value="SH001" >上海海关</option>
										        	<option <c:if test="${customerInf.custCode eq 'SH002' }">selected="selected"</c:if> value="SH002" >上海总署</option>
										        	<option <c:if test="${customerInf.custCode eq 'GD001' }">selected="selected"</c:if> value="GD001" >广州总署</option>
										        	<option <c:if test="${customerInf.custCode eq 'HZ001' }">selected="selected"</c:if> value="HZ001" >杭州总署</option>
										        	<option <c:if test="${customerInf.custCode eq 'SZ001' }">selected="selected"</c:if> value="SZ001" >深圳总署</option>
										        	<option <c:if test="${customerInf.custCode eq 'NB001' }">selected="selected"</c:if> value="NB001" >宁波总署</option>
										        	<option <c:if test="${customerInf.custCode eq 'CQ001' }">selected="selected"</c:if> value="CQ001" >重庆总署</option>
										        	<option <c:if test="${customerInf.custCode eq 'HF001' }">selected="selected"</c:if> value="HF001" >合肥总署</option>
										        	<option <c:if test="${customerInf.custCode eq 'BJ001' }">selected="selected"</c:if> value="BJ001" >北京总署</option>
										        	<option <c:if test="${customerInf.custCode eq 'NJ001' }">selected="selected"</c:if> value="NJ001" >南京总署</option>
										        	<option <c:if test="${customerInf.custCode eq 'TJ001' }">selected="selected"</c:if> value="TJ001" >天津总署</option>
			        							</select>
												</td>
											</tr>
										</table>
									</div>
									  <div class="row">
									<div class="col-lg-4 col-md-4 ">
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
							</form>
						</div>
					</div>
					<!--这是查询模块结束-->
					
					<div class="panel panel-default clearfix">
						<header class="panel-heading clearfix">
							<h2 class="panel-inner-title02">
								<a href="javascript:refresh()" class="pull-right"><i
									class="fa fa-refresh"></i>
								<span class="pull-right">&nbsp;&nbsp;&nbsp;</span>刷新</a>
							</h2>
						</header>
						<div class=" panel-body clearfix">
							<div class="table-responsive border0">
								<table class="table table-hover">
								
									<thead>
										<tr>
										    
											<th><span>商户号</span></th>
											<th><span>商户名称</span></th>
											<th><span>商户批次号</span></th>
											<th><span>状态</span></th>
											<th><span>实名校验</span></th>
											<th><span>创建时间</span></th>
											<th><span>支付总金额</span></th>
											<th><span>支付币种</span></th>
											<th><span>总笔数</span></th>
											<th><span>实名通过笔数</span></th>
											<th><span>海关编码</span></th>
											<th><span>操作</span></th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${page.list}" var="customList">
										<tr>
										   
											<td>${customList.merchantNo}</td>
											<td>${customList.merchantName}</td>
											<td>${customList.batchNo}</td>
											<td>
												<c:if test="${customList.status=='INIT'}">初始化</c:if>
												<c:if test="${customList.status=='ACCEPT'}">接受成功</c:if>
												<c:if test="${customList.status=='PROCESSING'}">处理中</c:if>
												<c:if test="${customList.status=='COMPLETE'}">申报完成</c:if>
												<c:if test="${customList.status=='SUCCESS'}">申报成功</c:if>
												<c:if test="${customList.status=='FAIL'}">申报失败</c:if>
												<c:if test="${customList.status=='PART_SUCCESS'}">部分申报成功</c:if>
											</td>
											<td>${(customList.idCheckFlag==null or customList.idCheckFlag=='')?"批次无需实名":fns:getEnumFieldValue('com.chinagpay.common.constant.BusinessConstant','CustomsIdCheckFlagnum',customList.idCheckFlag,'des') }</td>
											<!-- <td>${customList.idCheckFlag=="W"?"无需校验":(customList.idCheckFlag=="Y"?"已校验":(customList.idCheckFlag=="P"?"校验中":(customList.idCheckFlag=="N"?"未校验":"无需校验"))) }</td> -->
											<td>
												<fmt:formatDate value="${customList.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
											</td>
											<td>${customList.sumAmount}</td>
											<td>${fns:getCurrency(customList.currency) } </td>
											<td>${customList.count}</td>
											<td>${customList.idPassCount}</td>
											<td>${customList.custCode}</td>
											 <td>
                                            <a href="<%=request.getContextPath()%>/cbCustomer/customDetail.do?customId=${customList.id}">明细</a>
                                            &nbsp;&nbsp;&nbsp;
                                            
                                            <c:if test="${customList.status=='ACCEPT'}">
                                             	<a href="javascript:void(0);" onclick="sendCustom('${customList.id}')">提交海关</a>&nbsp;&nbsp;&nbsp;
                                             	
                                            </c:if>
                                     
                                             <c:if test="${customList.idCheckFlag=='N'}">
                                             	<a href="javascript:void(0);" onclick="sendCheckCustom('${customList.id}')">实名校验</a>&nbsp;&nbsp;&nbsp;
                                            </c:if>
                                            <c:if test="${customList.status=='ACCEPT' or customList.status=='PROCESSING'}">
                                            	<a href="javascript:void(0);" onclick="operate('${customList.id}','CANCEL','取消订单')">取消订单</a>&nbsp;&nbsp;&nbsp;
                                            </c:if>
                                            <c:if test="${customList.status=='PROCESSING'}">
                                            	<a href="javascript:void(0);" onclick="operate('${customList.id}','REREPORT','重新申报')">重新申报</a>&nbsp;&nbsp;&nbsp;
                                            	<a href="javascript:void(0);" onclick="operate('${customList.id}','SUCCREPORT','申报成功')">申报成功</a>&nbsp;&nbsp;&nbsp;
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

	

</body>
<script type="text/javascript">
	function downLoadOrder(){
		var params = $("#queryForm").serialize();
		var url ="<%=request.getContextPath()%>/cbCustomer/customerSearch.do?method=dw&"+params;
		window.open(url);
	}
	function operate(id,op,des){
		if(confirm("确定要"+des+"吗?")){
			var url ="<%=request.getContextPath()%>/static/cbCustomer/operate";
			$.post(url,{customId:id,operate:op},function(res){
				if(res.err==true){
					alert(res.msg);
				}else{
					alert("操作成功");
				}
				formSubmit();
			});
		}
	}
</script>
</html>
