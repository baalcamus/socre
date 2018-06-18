<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>渠道创建</title>
<script type="text/javascript">	
	function formSubmit() {
		$("#queryForm").submit();
	}



    function add() {
    	var bankName=$("#bankName").val();
    	var channelFeature=$("#channelFeature").val();
    	var currencyType=$("#currencyType").val();
    	var channelBizRange=$("#channelBizRange").val();
    	
    	if(bankName==null||bankName==''){
    		alert("请选择银行名称");
    		return false;
    	}
    	
    	if(channelFeature==null||channelFeature==''){
    		alert("请选择渠道特征");
    		return false;
    	}
    	
    	if(channelBizRange==null||channelBizRange==''){
    		alert("请选择交易类别");
    		return false;
    	}
    	
    	if(currencyType==null||currencyType==''){
    		alert("请选择币种类别");
    		return false;
    	}
	    
    	var url = '<%=request.getContextPath()%>/static/cbTrade/forex/insertForexChannel';
    	var bankName=$("#bankName").val();
    	var channelFeature=$("#channelFeature").val();
		var	currencyType=$("#currencyType").val();										
		var	channelBizRange=$("#channelBizRange").val();	
		var	currencySuport=$("#currencySuport").val();	
		var	operation=$("#operation").val();
		var params = 'bankName='+ bankName+'&channelFeature='+channelFeature+'&currencyType='+currencyType+'&channelBizRange='+channelBizRange
					+'&currencySuport='+currencySuport+'&operation='+operation;
		$.post(url, params, checkAjaxResponsess);
		
		function checkAjaxResponsess(obj) {
		    if (obj.err) {	
		    	alert(obj.msg);
		    	window.location.reload();
			} else {
				alert("添加成功");
				window.location.reload();
			}
		}
  
    }
    
	function loadChannel(){
		var url = '<%=request.getContextPath()%>/static/cbTrade/forex/getConstantInfo';
		var params ='constantType=bank';
		$.post(url,params,checkAjaxResponsetdChannel);	
   } 
	
	window.onload = loadChannel;
  function checkAjaxResponsetdChannel(obj) {
		    if (obj.err) {	
			} else {
				var icoll = obj.constantInfo;
				var content="";
				content += "<option value=''>"+'--请选择--'+"</option>";
				for (var i = 0;i < icoll.length;i ++) {
					var kcoll = icoll[i];
					var file=kcoll.constantId;
					var name=kcoll.constantName;
					content += "<option value='" + file +"'>" + name + "</option>";
		    	}
				$("#bankName").html(content);
			}
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
						<li><i class="fa fa-home"></i>&nbsp;<a
							href="Organization_management.html">首页</a>&nbsp;&nbsp;<i
							class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li>跨境交易管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li>渠道管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li class="active">渠道创建</li>
					</ol>

					<div class="clearfix"></div>
				</div>
				<!--END TITLE & BREADCRUMB PAGE-->
				<!--BEGIN CONTENT-->
				<div class="page-content">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h2 class="panel-title">渠道创建</h2>
								</div>
								<div class="panel-body">
									<form method="post" enctype="multipart/form-data"
										class="form-horizontal">
										<input type="hidden" name="operation" value="insert" id="operation"/>
										<input type="hidden" name="currencySuport" value="CNY" id="currencySuport" />
										<div class="row">
											<div class="col-lg-4 col-md-4 ">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="110" class="text-right">银行名称<span>*</span></td>
														<td>
															<select class="form-control" id="bankName" name="bankName"
																tabindex="10">
																	<option selected="selected" value="">无</option>
															</select>
														</td>
													</tr>
												</table>
											</div>
											<div class="col-lg-4 col-md-4 ">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="110" class="text-right">渠道特征<span>*</span></td>
														<td>
															<select class="form-control" id="channelFeature" name="channelFeature"
																tabindex="10">
																	<option value="">--请选择--</option>
																	<option value="ONLINE_DIRECT">直连</option>
																	<option value="OFF_INDIRECT">非直连</option>
															</select>
														</td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-4 col-md-4 ">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="110" class="text-right">币种类别<span>*</span></td>
														<td>
															<select class="form-control" id="currencyType" name="currencyType"
																tabindex="10">
																	<option value="">--请选择--</option>
																	<option value="FOREX_BIZ">外币</option>
																	<option value="CNY_BIZ">人民币</option>
															</select>
														</td>
													</tr>
												</table>
											</div>
											<div class="col-lg-4 col-md-4 ">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="110" class="text-right">交易类别<span>*</span></td>
														<td>
															<select class="form-control" id="channelBizRange" name="channelBizRange"
																tabindex="10">
																	<option value="">--请选择--</option>
																	<option value="REMIT">付款</option>
																	<option value="GATHER">收款</option>
															</select>
														</td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div
												class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right"></td>
													<td><input type="button" value="添加" id="btn"
														onclick="add()" class="btn btn-primary margin30" /> 
														<input type="button" value="重置" id="btn2" onclick="reset()"
														class="btn btn-dark" /></td>
												</tr>
												</table>
											</div>
										</div>
									</form>
								</div>
							</div>
						<form id="queryForm"
								action="<%=request.getContextPath()%>/static/cbTrade/forex/ConstantInfoQuery"
								method="post" enctype="multipart/form-data"
								class="form-horizontal ">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />
								
						</form>		
						<!--这是列表模块开始-->
					<div class="panel panel-default clearfix">
						<header class="panel-heading clearfix">
							<h2 class="panel-inner-title02">
								列表
								<!-- <button onclick="downLoadOrder();"
									class="pull-right btn btn-primary">下载</button> -->
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
											<th>操作</th>
											<th>渠道名称</th>
											<th>渠道编号</th>
											<th>银行标志</th>
											<th>渠道特征</th>
											<th>币种类型</th>
											<th>收付汇类型</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${page.list}" var="channel">
											<tr>
												<td>
												</td>
												<td>${channel.channelName }</td>
												<td>${channel.channelNo}</td>
												<td>${channel.bankId}</td>
												<td>${channel.channelFeature}</td>
												<td>${channel.currencyType}</td>
												<td>${channel.channelBizRange}</td>
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
			<!--右侧内容 end-->
		</div>
	</div>
	
	


</body>
</html>
