<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>模块管理</title>
<script type="text/javascript">	
    function add() {
    	var code=$("#code").val();
    	var mark=$("#mark").val();
    	var ruleLevelParent=$("#ruleLevelParent").val();
    	var type=$("#type").val();
    	var ruleLevel=$("#ruleLevel").val();
    	
    	if(code==null||code==''){
    		alert("请输入模块地址");
    		return false;
    	}
    	
    	if(mark==null||mark==''){
    		alert("请输入模块名称");
    		return false;
    	}
    	
    	if(type==null||type==''){
    		alert("请选择模块类型");
    		return false;
    	}
    	
    	if(ruleLevelParent==null||ruleLevelParent==''){
    		alert("请选择上级菜单");
    		return false;
    	}
    	
    	if(ruleLevel==null||ruleLevel==''){
    		alert("请选择模块级别");
    		return false;
    	}
	    	   
		$.post( "<%=request.getContextPath()%>/console/moduleAdd.do",{
			        code:$("#code").val(),
			        mark:$("#mark").val(),
			        ruleLevelParent:$("#ruleLevelParent").val(),										
					type:$("#type").val(),	
					ruleLevel:$("#ruleLevel").val(),	
					
				},
				function (data){
					if(data=="ok"){
						alert("添加成功");
						window.location.href='<%=request.getContextPath()%>/console/toModuleAdd.do';
					}else{
						alert("添加失败!");
						window.location.reload();
					}
				}
				
			);

    }
    
    
    function changeType(type) {
    	
    	if(type !="") {
    		$.post( "<%=request.getContextPath()%>/console/getConsoleRuleList.do",{
		        type:type
			},
			
			function (data){
				if(data !=""){
					var content;
					$.each(JSON.parse(data), function(i, u) {
						content += "<option value='" + u.id +"'>" + u.mark + "</option>";
					});
					$("#ruleLevelParent").html(content);
				}
			}
              );
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
						<li>系统管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li>模块管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li class="active">模块创建</li>
					</ol>

					<div class="clearfix"></div>
				</div>
				<!--END TITLE & BREADCRUMB PAGE-->
				<!--BEGIN CONTENT-->
				<div class="page-content">
					<div class="row clearfix">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h2 class="panel-title">模块创建</h2>
								</div>
								<div class="panel-body">
									<form method="post" enctype="multipart/form-data"
										class="form-horizontal">
										<div class="row">
											<div
												class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">模块地址<span>*</span></td>
														<td width="200"><input type="text" id="code"
															name="code" value="" class="form-control"></td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div
												class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">模块名称<span>*</span></td>
														<td width="200"><input type="text" id="mark"
															name="mark" value="" class="form-control"></td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div
												class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">模块类型<span>*</span></td>
														<td width="200"><select class="form-control" id="type" name="type"
															tabindex="10" onchange="changeType(this.value)">
																<option value="">--请选择--</option>
																<option value="1">系统模块</option>
																<option value="2">门户模块</option>
														</select></td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="row">
											<div
												class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list">
												<tr>
													<td width="120" class="text-right">上级菜单<span>*</span></td>
													<td width="200">
													<select class="form-control" tabindex="10"
														name="ruleLevelParent" id="ruleLevelParent">
															
													</select>
													</td>
													<td></td>
												</tr>
											</table>
											</div>
										</div>
										<div class="row">
											<div
												class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">模块级别<span>*</span></td>
														<td width="200"><select class="form-control" id="ruleLevel" name="ruleLevel"
															tabindex="10">
																<option value="">--请选择--</option>
																<option value="1">一级菜单</option>
																<option value="2">二级菜单</option>
																<option value="3">三级菜单</option>
																<option value="4">四级菜单</option>
																<option value="5">五级菜单</option>
														</select></td>
														<td></td>
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
													<td><input type="button" value="提交" id="btn"
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
						</div>
					</div>

				</div>
				<!--End CONTENT-->
			</div>
			<!--右侧内容 end-->
		</div>
	</div>
	
	


</body>
</html>
