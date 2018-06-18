<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<%-- <script type="text/JavaScript" src="<%=request.getContextPath()%>/statics/v2/js/My97DatePicker_1/WdatePicker.js"></script>  --%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript">
function dtl_change(){
	$("#dtl_form :input").each(function(){
		$(this).removeAttr("readonly");
		$("#dtl_form :input[name='merchantNo']").attr("readonly","readonly");
	});
}

function dtl_submit(){
	$("#dtl_form").submit();
}
</script>
<title>商户信息详情</title>
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
						<li>商户管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li>商户信息查询&nbsp;&nbsp;&nbsp;&nbsp;
						</li>
						
					</ol>
						<a href="javascript:history.go(-1)" class="pull-right pad25"><i
						class="fa fa-arrow-circle-left"></i> 返回</a>
					<div class="clearfix"></div>
				</div>
				<!--END TITLE & BREADCRUMB PAGE-->
				<!--BEGIN CONTENT-->
				<div class="page-content">

					<!--这是查询模块结束-->
					
					<div class="panel panel-default clearfix">
						<header class="panel-heading clearfix">
							<h2 class="panel-inner-title02">
								详情
							</h2>
						</header>
						<div class=" panel-body clearfix">
							<div class="table-responsive border0">
								<div class="panel-inner-body">
								<form id="dtl_form" name="dtl_form" class="form-horizontal" action="<%=request.getContextPath()%>/cbMerchant/updateMerchant.do" method="post">
								<input type="hidden" name="id" value="${cbMerchant.id}"/>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" >
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">商户号 </td>
                                                 <td><input class="form-control"
                                                           name="merchantNo" value="${cbMerchant.merchantNo}" readonly="readonly">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                     <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" >
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">商户名称 </td>
                                                <td><input class="form-control"
                                                           name="merName" value="${cbMerchant.merName}" readonly="readonly">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                 </div>
                                         <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" >
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">商户简称 </td>
                                                 <td><input class="form-control"
                                                           name="merShortName" value="${cbMerchant.merShortName}" readonly="readonly">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                     <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" >
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">商户类型 </td>
                                                <td><input class="form-control"
                                                           name="merLevel" value="${cbMerchant.merLevel}" readonly="readonly">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                 </div>
                                         <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" >
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">代理商名称 </td>
                                                 <td><input class="form-control"
                                                           name="nameOfAgent" value="${cbMerchant.nameOfAgent}" readonly="readonly">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                     <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" >
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">销售名称 </td>
                                                <td><input class="form-control"
                                                           name="signPerson" value="${cbMerchant.signPerson}" readonly="readonly">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                 </div>
                                 
                                         <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" >
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">营业执照编号 </td>
                                                 <td><input class="form-control"
                                                           name="licenseNumber" value="${cbMerchant.licenseNumber}" readonly="readonly">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                     <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" >
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">税务登记号 </td>
                                                <td><input class="form-control"
                                                           name="taxId" value="${cbMerchant.taxId}" readonly="readonly">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                 </div>
                                         <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" >
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">组织机构代码 </td>
                                                 <td><input class="form-control"
                                                           name="organizationCode" value="${cbMerchant.organizationCode}" readonly="readonly">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                     <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" >
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">公司邮箱 </td>
                                                <td><input class="form-control"
                                                           name="companyEmail" value="${cbMerchant.companyEmail}" readonly="readonly">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                 </div>
                                         <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" >
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">ICP备案号</td>
                                                 <td><input class="form-control"
                                                           name="icpRecordNumber" value="${cbMerchant.icpRecordNumber}" readonly="readonly">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                     <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" >
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">法人名称 </td>
                                                <td><input class="form-control"
                                                           name="merLegalPerson" value="${cbMerchant.merLegalPerson}" readonly="readonly">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                 </div>
                         
                                         <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" >
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">联系人 </td>
                                                 <td><input class="form-control"
                                                           name="contacter" value="${cbMerchant.contacter}" readonly="readonly">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                     <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" >
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">联系人电话 </td>
                                                <td><input class="form-control"
                                                           name="contacterPhone" value="${cbMerchant.contacterPhone}" readonly="readonly">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                 </div>
                                  <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" >
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">联系人邮箱 </td>
                                                 <td><input class="form-control"
                                                           name="contacterEmail" value="${cbMerchant.contacterEmail}" readonly="readonly">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                     <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" >
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">入网地址</td>
                                                <td><input class="form-control"
                                                           name="networkAddress" value="${cbMerchant.networkAddress}" readonly="readonly">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                 </div>
                                 <div class="row">
                                 	<div style="width: 200px;margin-left: 300px">
									<button id="btn_change" class="btn btn-warning col-sm-6" onclick="dtl_change();return false;">修改</button>
									<button id="btn_submit" class="btn btn-danger col-sm-6" onclick="dtl_submit();return false;">提交</button>
									</div>
                               </div>
                                 </form>
							</div>
							</div>

						</div>
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
