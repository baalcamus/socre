<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>商户黑名单管理</title>
<script type="text/javascript">	
	function isnull(Object,info){
		var value = Object.val();
		if(value == null || value == ''){
			alert(info);
			return false;
		}else{
			return true;
		}
	}
	
	
	function add() {
		
		var type = $("#type").val();
		var id = $("#id").val();
		
// 		if(isnull($("#customerNumber"),'请输入商户编号') == false)
// 		return false;
		var customerNumber = $("#customerNumber").val();
		var customerName = $("#customerName").val();
		var customerType = $("#customerType").val();
		var orgInsCode = $("#orgInsCode").val();
		var bizLicRegCode=$("#bizLicRegCode").val();
		var certificateType = $("#certificateType").val();
		var certificateNumber = $("#certificateNumber").val();
		var description = $("#description").val();	
		if (customerNumber == null || customerNumber == '') {
			alert("请输入商户编号");
			return false;
		}
		if (customerName == null || customerName == '') {
			alert("请输入商户名称");
			return false;
		}
		if (customerType == null || customerType == '') {
			alert("请输入商户类型");
			return false;
		}
		if (orgInsCode == null || orgInsCode == '') {
			alert("请输入组织机构代码");
			return false;
		}
		if (bizLicRegCode == null || bizLicRegCode == '') {
			alert("请输入营业执照注册号");
			return false;
		}
				if (certificateType == null || certificateType == '') {
			alert("请输入证件类型");
			return false;
		}
				if (certificateNumber == null || certificateNumber == '') {
			alert("请输入证件号");
			return false;
		}
		if (description == null || description == '') {
			alert("请输入描述");
			return false;
		}
		
		var result = true;
		$('input').each(function(){
	        if($(this).attr('le')){
// 	        	 alert($(this).val());
	            if($(this).val().length > Number($(this).attr('le'))){
	                $(this).focus();
	                alert('长度超过'+ $(this).attr('le')+',请重新填写');
	                result = false;
	                return false;
	            }
	        }
	    });
		if(result == false){
			return false;
		}
		
		var ajaxCallUrl = "<%=request.getContextPath()%>/riskManage/riskCustomerBlackListAdd?type="+type;
		$.ajax({
            cache: true,
            type: "POST",
            url:ajaxCallUrl,
            data:$('#fromid').serialize(),// 你的formid
            async: false,
            error: function(request) {
                alert("Connection error");
            },
            success: function(data) {
				if(data=="success"){
					alert("操作成功！");
					window.location.href="<%=request.getContextPath()%>/riskManage/riskCustomerBlackList";

				}else if(data=="fail"){
					//alert("此账号在该填报日期已存在数据!");
					alert("操作失败！");
				}else if(data=="exits"){
					alert("此商户编号已存在!");
					//alert("操作失败！");
				}else {
					alert("新增失败！");
				}
            }
        });
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
			<!--右侧内容 start-->
			<div id="page-wrapper">
				<!--BEGIN TITLE & BREADCRUMB PAGE-->
				<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
					<ol class="breadcrumb page-breadcrumb">
						<li>
							<i class="fa fa-home"></i>&nbsp;<a href="Organization_management.html">首页</a>&nbsp;&nbsp;
							<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li>风控管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li>商户黑名单管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<c:if test="${type == 'add' }">
							<li class="active">商户黑名单新增</li>
						</c:if>
						<c:if test="${type == 'update' }">
							<li class="active">商户黑名单修改</li>
						</c:if>
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
									<c:if test="${type == 'add' }">
									<h2 class="panel-title">名单新增</h2>
									</c:if>
									<c:if test="${type == 'update' }">
									<h2 class="panel-title">名单修改</h2>
									</c:if>
								</div>
								<div class="panel-body">
									<form method="post" id="fromid" enctype="multipart/form-data" class="form-horizontal">
										<input type="hidden" name="type" id="type" value="${type}"/>
										<input type="hidden" name="id" id="id" value="${customerBlackList.id}"/>
										<input type="hidden" name="status" id="status" value="${customerBlackList.status}"/>
										<input type="hidden" name="createStaff" id="createStaff" value="${customerBlackList.createStaff}"/>
<%-- 										<input type="hidden" name="createTime" id="createTime" value="${customerBlackList.createTime}"/> --%>
										<table>
											<tr>
												<td width="250" class="text-right">商户编号<span>*</span></td>
												<td width="200"><input le="20" type="text" id="customerNumber" name="customerNumber" value="${customerBlackList.customerNumber}"  class="form-control"  style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">商户名称<span>*</span></td>
												<td width="200"><input le="250" type="text" id="customerName" name="customerName" value="${customerBlackList.customerName}" class="form-control"  style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">商户类型<span>*</span></td>
												<td width="200">
													<select class="form-control" tabindex="10" id="customerType" name="customerType">
													<option <c:if test="${customerBlackList.customerType=='' }">selected="selected"</c:if> value="">全部</option>
													<option <c:if test="${customerBlackList.customerType=='C' }">selected="selected"</c:if> value="C">对公</option>
													<option <c:if test="${customerBlackList.customerType=='D' }">selected="selected"</c:if> value="D">对私</option>
													</select>
												</td>
												<td width="150"></td>
												<td width="250" class="text-right">组织机构代码<span>*</span></td>
												<td width="200"><input  le="20" type="text" id="orgInsCode" name="orgInsCode" value="${customerBlackList.orgInsCode}" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">营业执照注册号<span>*</span></td>
												<td width="200"><input  le="20" type="text" id="bizLicRegCode" name="bizLicRegCode" value="${customerBlackList.bizLicRegCode}" class="form-control"  style="color:#d9534f"></td>
												<td width="150"></td>
												<td width="250" class="text-right">证件类型<span>*</span></td>
												<td width="200">
													<select class="form-control" tabindex="10" id="certificateType" name="certificateType">
													<option <c:if test="${customerBlackList.certificateType=='' }">selected="selected"</c:if> value="">请选择</option>
													<option <c:if test="${customerBlackList.certificateType=='1' }">selected="selected"</c:if> value="1">营业执照</option>
<%-- 													<option <c:if test="${customerBlackList.certificateType=='2' }">selected="selected"</c:if> value="2">签证</option> --%>
<%-- 													<option <c:if test="${customerBlackList.certificateType=='3' }">selected="selected"</c:if> value="3">护照</option> --%>
													</select>
												</td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">证件号<span>*</span></td>
												<td width="200"><input  le="20" type="text" id="certificateNumber" name="certificateNumber" value="${customerBlackList.certificateNumber}" class="form-control"  style="color:#d9534f"></td>
												<td width="150"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">描述<span>*</span></td>
												<td width="200"><textarea rows="3" cols="20" id="description" name="description"  class="form-control"  style="color:#d9534f">${customerBlackList.description}</textarea></td>
											</tr>
											
											<tr height="10"></tr>
										</table>
										<div class="row">
											<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right"></td>
														<td>
															<input type="button" value="返回" id="btn3" onclick="javascript:history.back(-1);" class="btn btn-primary margin30" />
															<input type="button" value="提交" id="btn" onclick="add()" class="btn btn-primary margin30" /> 
														</td>
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
