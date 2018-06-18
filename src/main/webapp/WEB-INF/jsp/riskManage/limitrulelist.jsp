<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>商户限制规则查询</title>
<style type="text/css">
.overflow {
	max-height: 256px;
}

#cover {
	position: fixed;
	z-index: 1000;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background-color: #000000;
	filter: alpha(opacity = 0.7); /*IE滤镜，透明度50%*/
	-moz-opacity: 0.7; /*Firefox私有，透明度50%*/
	opacity: 0.7; /*其他，透明度50%*/
	text-align: center;
}

#cover img {
	position: absolute;
	top: 40%;
	left: 40%;
	width: 20%;
	height: 10%;
	margin-top: -15px;
	margin-left: -15px;
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
<script type="text/javascript">
	var contextpath = "${ctx}";
	
	function query() {
		
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/riskManage/limitrules");
		$("#queryForm").submit();
	}
	
	function down(){
		var url ="<%=request.getContextPath()%>/static/riskManage/limitrules/d";
		$("#queryForm").attr("action", url);
		$("#queryForm").submit();
	}
	
</script>
</head>

<body class=" ">
	<div id="cover" style="display: none;">
		<img
			src="<%=request.getContextPath()%>/statics/v2/images/wait_processing.gif">
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
					<li>商户限制规则&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
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
												<td width="55" class="text-right">商户编号</td>
												<td width="200">
													<div>
														<input type="text" class="form-control"
															id="customerNumber" name="customerNumber"
															value="${customerLimitRule.customerNumber}" />
													</div>
												</td>
											</tr>
										</table>
									</div>
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="55" class="text-right">企业ID</td>
												<td width="200">
													<div>
														<input type="text" class="form-control" id="companyId"
															name="companyId" value="${customerLimitRule.companyId}" />
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
													<button onclick="javascript:down();return false;"
														class="btn btn-danger">
														<i class="fa fa-search"></i>下载
													</button>
												</td>
											</tr>
										</table>
									</div>
								</div>
							</form>
						</div>
						<!-- 
						<div class="row">
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
						</div>
						 -->
					</div>
				</div>
				<!--这是查询模块结束-->
				<!--这是列表模块开始-->
				<div class="panel panel-default clearfix">
					<header class="panel-heading clearfix">
						<h2 class="panel-inner-title02">
							列表
					<a href="#" onclick="addRule();" class="pull-right btn btn-primary">添加商户限制</a></h2>
				
					</header>
					<div class=" panel-body clearfix">
						<div class="table-responsive border0">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>商户编号</th>
										<th>企业ID</th>
										<th>支付方式</th>
										<th>限制类型</th>
										<th>限制值</th>
										<th>创建时间</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.list}" var="rule">
										<tr>
											<td hidden=true>${rule.id}</td>
											<td>${rule.customerNumber}</td>
											<td>${rule.companyId}</td>
											<td>${rule.payMethod=='ALIPAY'?'支付宝':(rule.payMethod=='BAIDU_WALLET'?'百度钱包':(rule.payMethod=='WEIXINPAY'?'微信':(rule.payMethod=='QQ_WALLET'?'QQ钱包':(rule.payMethod=='JD_WALLET'?'京东钱包':(rule.payMethod)))))}</td>
											<td>${rule.limitType=='SINGLE'?'单笔限额':(rule.limitType=='DAY'?'单日限额':(rule.limitType=='MONTH'?'单月限额':(rule.limitType=='TIME'?'可交易时间':(rule.limitType))))}</td>
											<td>${rule.limitValue}&nbsp;(<a href="#"
												onclick="change(${rule.id},'${rule.limitValue }')">修改</a>)
											</td>
											<td><fmt:formatDate value="${rule.createTime}"
													type="both" /></td>
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
			<form id="changeValue" action="#">
				<input type="hidden" name="id" id="id"> <span>限制值：<input
					type="text" class="form-control" name="limitValue" id="limitValue"></span>
			</form>
		</div>
		<div>
			<form id="addRule" action="#">
				<table>
					<tr>
						<td width="70" class="text-right">商户编号&nbsp;&nbsp;&nbsp;</td>
						<td width="200"><input type="text" class="form-control"
							name="customerNumber" /></td>
					<tr>
					<tr>
						<td width="70" class="text-right">企业ID&nbsp;&nbsp;&nbsp;</td>
						<td width="200"><input type="text" class="form-control"
							name="companyId" /></td>
					<tr>
					<tr>
						<td width="70" class="text-right">支付方式&nbsp;&nbsp;&nbsp;</td>
						<td width="200"><select class="form-control" name="payMethod">
								<option value="">请选择
								<option value="WEIXINPAY">微信
								<option value="ALIPAY">支付宝
								<option value="QQ_WALLET">QQ钱包
								<option value="BAIDU_WALLET">百度钱包
								<option value="JD_WALLET">京东钱包
						</select></td>
					<tr>
					<tr>
						<td width="70" class="text-right">限制类型&nbsp;&nbsp;&nbsp;</td>
						<td width="200"><select class="form-control" name="limitType">
								<option value="">请选择
								<option value="SINGLE">单笔限额(单位:元)
								<option value="DAY">日累计限额(单位:元)
								<option value="MONTH">月累计限额(单位:元)
								<option value="TIME">交易时间限制(格式:01:02-23:45)
						</select></td>
					<tr>
					<tr>
						<td width="70" class="text-right">限制值&nbsp;&nbsp;&nbsp;</td>
						<td width="200"><input type="text" class="form-control"
							name="limitValue" /></td>
					<tr>
				</table>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	function addRule(){
		$("#addRule")[0].reset();
		$("#addRule").dialog({
			autoOpen:true,
			modal:true,
			buttons:{
				"确定":function(){
					//对每个字段进行校验
					var v1=$("#addRule")[0].customerNumber.value;
					if(v1==null||v1==undefined||v1==""){
						alert("商户编号为空");
						return;
					}
					var v2=$("#addRule")[0].companyId.value;
					if(v2==null||v2==undefined||v2==""){
						alert("企业ID为空");
						return;
					}
					var v3=$("#addRule")[0].payMethod.value;
					if(v3==null||v3==undefined||v3==""){
						alert("支付方式为空");
						return;
					}
					var v4=$("#addRule")[0].limitType.value;
					if(v4==null||v4==undefined||v4==""){
						alert("限制类型为空");
						return;
					}
					var v5=$("#addRule")[0].limitValue.value;
					if(v5==null||v5==undefined||v5==""){
						alert("限制值为空");
						return;
					}
					
					var param = $("#addRule").serialize();
					var url = '${ctx}/riskManage/limitrule/addRule'
					$.post(url,param,function(res){
						if(res.err==false){
							alert("新增成功");
							query();
						}else{
							alert(res.msg);
						}
					});
				},
				"取消":function(){
					$("#addRule").dialog("close");
				}
			}
		});
	}
	//批量导入黑名单
	function change(id,val){
		$("#changeValue")[0].reset();
		$("#changeValue")[0].id.value=id;
		$("#changeValue")[0].limitValue.value=val;
		$("#changeValue").dialog({
			autoOpen:true,
			modal:true,
			buttons:{
				"确定":function(){
					var param = $("#changeValue").serialize();
					var url = '${ctx}/riskManage/limitrule/changeVal'
					$.post(url,param,function(res){
						if(res.err==false){
							alert("修改成功");
							query();
						}else{
							alert(res.msg);
						}
					});
				},
				"取消":function(){
					$("#changeValue").dialog("close");
				}
			}
		});
	}
</script>
</html>
