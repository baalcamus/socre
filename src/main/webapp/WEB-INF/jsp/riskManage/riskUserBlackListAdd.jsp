<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>个人黑名单管理</title>
<script type="text/javascript">	

	function add() {
		var type = $("#type").val();
		var id = $("#id").val();
		
		var name = $("#name").val();
		var phone = $("#phone").val();
		var cardNumber = $("#cardNumber").val();
		var certificateType = $("#certificateType").val();
		var certificateNumber = $("#certificateNumber").val();
		var description = $("#description").val();	
		if (name == null || name == '') {
			alert("请输入姓名");
			return false;
		}
		if (phone == null || phone == '') {
			alert("请输入手机号");
			return false;
		}else{
			  var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0-9]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;       
			  if(!myreg.test(phone)){
				  alert("请输入正确的手机号格式");
				  $("#phone").focus(); 
				  return false;
			  }			
		}

	
		if (cardNumber == null || cardNumber == '') {
			alert("请输入卡号");
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
		
		var ajaxCallUrl = "<%=request.getContextPath()%>/riskManage/riskUserBlackListAdd?type="+type;
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
					window.location.href="<%=request.getContextPath()%>/riskManage/riskUserBlackList";

				}else if(data=="fail"){
					//alert("此账号在该填报日期已存在数据!");
					alert("操作失败！");
				}else{
					alert("操作失败！");
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
						<li>个人黑名单管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<c:if test="${type == 'add' }">
							<li class="active">个人黑名单新增</li>
						</c:if>
						<c:if test="${type == 'update' }">
							<li class="active">个人黑名单修改</li>
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
										<input type="hidden" name="id" id="id" value="${userBlackList.id}"/>
										<input type="hidden" name="status" id="status" value="${userBlackList.status}"/>
										<input type="hidden" name="createStaff" id="createStaff" value="${userBlackList.createStaff}"/>
<%-- 										<input type="hidden" name="createTime" id="createTime" value="${userBlackList.createTime}"/> --%>
										<table>
											<tr>
												<td width="250" class="text-right">姓名<span>*</span></td>
												<td width="200"><input  le="100"  type="text" id="name" name="name" value="${userBlackList.name}"  class="form-control"  style="color:#d9534f"></td>
												<td width="150"></td>
																<td width="100" class="text-right">证件类型<span>*</span></td>
												<td width="200">
													<select class="form-control" tabindex="10" id="certificateType" name="certificateType">
													<option <c:if test="${userBlackList.certificateType=='' }">selected="selected"</c:if> value="">请选择</option>
													<option <c:if test="${userBlackList.certificateType=='1' }">selected="selected"</c:if> value="1">身份证</option>
													<option <c:if test="${userBlackList.certificateType=='2' }">selected="selected"</c:if> value="2">签证</option>
													<option <c:if test="${userBlackList.certificateType=='3' }">selected="selected"</c:if> value="3">护照</option>
													</select>
												</td>									
											 </tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">证件号<span>*</span></td>
												<td width="200"><input  le="20" type="text" id="certificateNumber" name="certificateNumber" value="${userBlackList.certificateNumber}" class="form-control" style="color:#d9534f"></td>
								
											    <td width="150"></td>
												<td width="250" class="text-right">手机号<span>*</span></td>
												<td width="200"><input type="text" id="phone" name="phone" value="${userBlackList.phone}" class="form-control" style="color:#d9534f"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">卡号<span>*</span></td>
												<td width="200"><input  le="20" type="text" id="cardNumber" name="cardNumber" value="${userBlackList.cardNumber}" class="form-control"  style="color:#d9534f"></td>
												<td width="150"></td>
											</tr>
											<tr height="15"></tr>
											<tr>
												<td width="250" class="text-right">描述<span>*</span></td>
												<td width="200"><textarea rows="3" cols="20" id="description" name="description"  class="form-control"  style="color:#d9534f">${userBlackList.description}</textarea></td>
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
