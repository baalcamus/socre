<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>风控管理</title>
<script type="text/javascript">
	var contextpath = "${ctx}";
	
	function query() {
		var name = $('#name').val();
		var idNumber = $('#idNumber').val();
		
		if(name==''||name==null){
			alert("姓名不能为空");
			return;
		}
		if(idNumber==''||idNumber==null){
			alert("身份证号码不能为空");
			return;
		}
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/static/realNameAuthControl/realNameAuthPost");
		$("#queryForm").submit();
	}

	function down(){
		var params = $("#queryForm").serialize();
		var url ="<%=request.getContextPath()%>/micropay/mpayOrder/downMpayOrderList?"+params;
		window.open(url);
	}
	
	function Info(id) {
		window.location.href="<%=request.getContextPath()%>/micropay/mpayOrder/queryMpayOrderDetail?id="+id;
	}
	
	
	function orderNotify(merchantNo,merchantOrderNo) {
		$.post( "<%=request.getContextPath()%>/micropay/mpayOrder/merchantNotifyProcess",{
			merchantNo:merchantNo,merchantOrderNo:merchantOrderNo
			},
			 function (res){
				if(res.err==true){
					alert("通知商户成功!");
					 query();
				}else{
					alert("通知商户失败!失败原因"+res.msg);
				}
			} 
		); 
	}
	
	function orderRefund(id,orderAmount,refundSucAmount){
		document.refundForm.reset();
		$("#id").val(id);
		var ableRefundAmount = orderAmount-refundSucAmount;
		$("#refundAmount").val(ableRefundAmount);
		$("#refund_panel").dialog({
			title:"退款",
			autoOpen:true,
			modal:true,
			width:300,
			height:300,
			buttons:{
				"提交":function(){
					var refundAmount=$("#refundAmount").val();
					if(refundAmount==""||refundAmount==null||refundAmount==undefined){
						alert("请输入退款金额");
						return false;
					}else if(refundAmount>ableRefundAmount){
						alert("退款金额大于可退款金额,可退款金额为："+ableRefundAmount+"元");
						return false;
					}
					var refundReason=$("#refundReason").val();
					if(refundReason==""||refundReason==null||refundReason==undefined){
						alert("请填写退款原因");
						return false;
					}
					var url = "<%=request.getContextPath()%>/micropay/mpayOrder/orderRefund";
					var params = $(document.refundForm).serialize();
					$.post(url,params,function(obj){
						if(obj.err){
							alert(obj.msg);
						}else{
							var msg = obj.msg;
							if(msg==null||msg==''||msg==undefined){
								msg='退款完成';
							}
							alert(msg);
							window.location.reload();
						}
						$("#refund_panel").dialog("close");
					});
				},
				"取消":function(){
					$("#refund_panel").dialog("close");
				}
			}
		});
		return false;
	}
	
	function querOrderToBank(id){
		$.post( "<%=request.getContextPath()%>/micropay/mpayOrder/querOrderToBank",{
				id:id
			},
			function (data){
				alert("订单状态："+data);
				window.location.reload();
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
					<li>风控管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li>身份证查询&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li class="active">身份证查询</li>
				</ol>

				<div class="clearfix"></div>
			</div>
			<!--END TITLE & BREADCRUMB PAGE-->
			<!--BEGIN CONTENT-->
			<div class="page-content">
				<!--这是查询模块开始-->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title">身份证查询</h2>
					</div>
					<div class="panel-body">
						<form action="" method="post"  id="queryForm" class="queryForm" enctype="multipart/form-data" class="form-horizontal ">
							<div class="row">
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">姓名</td>
											<td width="200">
												<div >
													<input type="text" class="form-control" id="name" name="name" value="${realAuthRequest.name}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="90" class="text-right">身份证号码</td>
											<td width="200">
												<div >
													<input type="text" class="form-control" id="idNumber" name="idNumber" value="${realAuthRequest.idNumber}"/>
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
												<button  type="submit" class="btn btn-danger" onclick="query();">
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
							列表
						</h2>
					</header>
					<div class=" panel-body clearfix">
						<div class="table-responsive border0">
							<table class="table table-hover">
								<thead>
									<tr>
										<th><span>姓名</span></th>
										<th><span>身份证号码</span></th>
										<th><span>机构验证返回结果</span></th>
										<th><span>证件验证机构返回图片</span></th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${realAuthResponse!=null}">
										<tr>
										    <td >${realAuthRequest.name}</td>
										    <td >${realAuthRequest.idNumber}</td>
										    <td >${realAuthResponse.resultInfo}</td>
										    <td ><img src="data:image/gif;base64,${realAuthResponse.imgData}"/></td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!--这是列表模块结束-->
			</div>
			<!--End CONTENT-->
		</div>
		<!--右侧内容 end-->
	</div>
	<div id="refund_panel" style="display: none">
		<form name="refundForm">
			  <input type="hidden" name="id" id="id" value=""/>
			  <div class="form-group" id="realAmount_div">
			    <label for="refundAmount">退款金额</label>
			    <input type="number" class="form-control" id="refundAmount" name="refundAmount" placeholder="请输入退款金额" onblur="checkAmount(this);"> <label style="color:red;" id="error"></label>
			  </div>
			  <div class="form-group">
			    <label for="refundReason">退款原因</label>
			    <textarea class="form-control" id="refundReason" name="refundReason" placeholder="请认真填写退款原因" rows="" cols=""></textarea>
			  </div>
		</form>
	</div>
</body>
</html>
