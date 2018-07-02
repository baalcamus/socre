<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>详情</title>
<script type="text/javascript">	

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
						<li>账务管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li>账务详情&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
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
									<h2 class="panel-title">账务详情</h2>
								</div>
								<div class="panel-body">
								  <div class="row">
                        <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
                          
                           <table border="1" width="100%" class="product_detail_list">
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">商户编号</td>
                             	<td width="200">${normalAccounting.merchantNo}</td>
                             </tr>
                             <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">服务商编号</td>
                             	<td width="200">${normalAccounting.spMerchantNo}</td>
                             </tr>
							 <tr>
                            	<td  bgcolor="#f2f2f0" width="159" class="text-left">支付方式</td>
                             	<td width="200">${normalAccounting.payMethod}</td>
                             </tr> 
                           </table>
                          </div>
                          </div>
								
								</div>

								<!-- *********************************************************************************************************************************** -->
								
								<div class="row">
									<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="120" class="text-right"></td>
												<td>
													<input type="button" value="返回" id="btn3" style="float: right;" onclick="javascript:history.back(-1);" class="btn btn-primary margin30" />
												</td>
											</tr>
										</table>
									</div>
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
