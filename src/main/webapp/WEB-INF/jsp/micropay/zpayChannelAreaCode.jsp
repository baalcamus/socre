<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
.border0 {
	overflow: auto !important;
}

.border0 th, .border0 td {
	white-space: nowrap;
}
</style>
<title>微支付路由管理</title>

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
					<li>微支付管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li>支付记录查询&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li class="active">查询</li>
				</ol>

				<div class="clearfix"></div>
			</div>
			<!--这是查询模块开始-->
			<div class="page-content">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title">查询</h2>
					</div>
					<div class="panel-body">

						<div>
							<form id="queryForm" class="queryForm"
								enctype="multipart/form-data" class="form-horizontal">


								<div class="row">
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">

										
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="100%" class="text-left"><label>请输入地区：</label><input maxlength="32" id="addressName" name="addressName" class="form-control" /><span id="namespan"> </span></td>												
											</tr>
											<tr>
												<td width="100%" class="text-left"><label>请输入编码:</label><input maxlength="32" id="addressCode" name="addressCode" class="form-control" /><span id="codespan"> </span></td>														
											</tr>

											<tr>
												<td width="200" class="text-left"><label>请选择地区级别：</label><select class="form-control" id="level" name="level"><option value="0">请选择</option></select></td>
											</tr>
											<tr>
												<td width="200" class="text-left"><label>请选择上一级地区：</label><select class="form-control" id="pAddressCode" name="pAddressCode"><option value="0">请选择</option></select></td>
											</tr>
											<tr>
												<td width="200" class="text-left"><button id="tj" class="btn btn-green"><i class="fa fa-search"></i>提交</button></td>
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

	</div>

	<script type="text/javascript">
	var contextpath = "${ctx}";
	var url="<%=request.getContextPath()%>/static/micropay/route/getLevelList";
	$.post(
		url,
		function(data){
			for(var i in data){				
				$("#level").append($("<option value="+data[i].level+">"+data[i].level+"</option>"));				
			}
		},
		"json"
	)	
	$(function(){
		
		$("#level").change(function(){
			
			$("#pAddressCode").empty();			
			var level = $(this).val();			
			if(level == 1){			
				$("#pAddressCode").append("<option value="+0+">"+null+"</option>"); 				
				return ;
			}						
			var url = "<%=request.getContextPath()%>/static/micropay/route/getLastCityListByID";
			$.post(
				url,
				{level:level-1},
				function(data){					
					for(var i in data){
						
						$("#pAddressCode").append($("<option value="+data[i].addressCode+">"+data[i].addressName+"</option>"));
					}					
				},
				"json"			
			)			
		});
		
		
		//校验输入地区的名称
		$("#addressName").blur(function(){
			
			var addressName = $(this).val();
		
			if(addressName == ""){				
				$("#namespan").html("<font color='red'>请输入地区</font>");				
				$("#tj").attr("disabled",true);				
				return;				
			}
			
			//将输入的地区名称与既有地区验证						
			var url = "<%=request.getContextPath()%>/static/micropay/route/findCityByName";
			$.post(				
					url,					
					{addressName:addressName},
					function(data){	
						
						if(data>0){
						
							$("#namespan").html("<font color='red'  size='1'>地区已有,请重新输入</font>");							
							$("#tj").attr("disabled",true);
							
						}else{							
							$("#namespan").html("");							
							$("#tj").attr("disabled",false);
						}						
					},
				"json"
			)
		});
		
		//校验地区编码
		$("#addressCode").blur(function(){
			
			var addressCode = $(this).val();
			
			if(addressCode == ""){
				
				$("#codespan").html("<font color='red'>请输入编码 </font>");				
				$("#tj").attr("disabled",true);				
				return;
			}			
			
			//正则校验
			var testaddressCode = /^ZP\d+$/;

			if(!testaddressCode.test(addressCode)){

				$("#codespan").html("<font color='red'  size='1'>请以大写ZP开头加数字</font>");
				$("#tj").attr("disabled",true);
			}else{

			//将输入的地区编码与既有编码验证
			var url = "<%=request.getContextPath()%>/static/micropay/route/findCityCodeByCode";
			$.post(
					url,
					{addressCode:addressCode},
					function(data){
						if(data>0){
							$("#codespan").html("<font color='red'  size='1'>编码已存在,请重新输入</font>");
							$("#tj").attr("disabled",true);
						}else{
							$("#codespan").html("");
							$("#tj").attr("disabled",false);
						}
					},
					"json"
				)
			}
		});
				
		$("#tj").click(function(){
			
			//获得用户输入的信息
			var addressName = $("#addressName").val();
			var addressCode = $("#addressCode").val();
			var level = $("#level").val();
			var pAddressCode = $("#pAddressCode").val();
			
			if(addressName != ""&&addressCode != ""&&level != ""&&pAddressCode != ""){
				
				 if(confirm("您确定要增加当前地区吗？")){
			
					var url= "<%=request.getContextPath()%>/static/micropay/route/addAddress";		
					$.post(						
						url,
						 $("form").serialize(),
						 function(data){
							
							if(data>0){
								alert("增加成功");
								
							} else {				 							
								alert("增加失败");
							}
											
						}
						
				   )
			   }	  			     
		 } else {			 		
			 	alert("请填写全部选项");
		}
	});

})
	</script>
</body>
</html>
