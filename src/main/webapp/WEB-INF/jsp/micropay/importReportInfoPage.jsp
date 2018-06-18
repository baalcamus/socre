<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp" %>
<html lang="en">
<head>
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
            filter: alpha(opacity=0.7); /*IE滤镜，透明度50%*/
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
    <script type="text/javascript">
        function showCover() {
            $("#cover").css("display", '');
        }
        function hideCover() {
            $("#cover").css("display", 'none');
        }
    </script>
    <title>报备信息报备-批量导入报备</title>
</head>

<body class=" ">
<div id="cover" style="display: none;">
    <img src="<%=request.getContextPath() %>/statics/v2/images/wait_processing.gif">
</div>
<jsp:include page="../include/top.jsp"/>
<div id="wrapper">
    <jsp:include page="../include/bottom.jsp"/>
    <!-- 左侧内容 -->
    <jsp:include page="../include/left.jsp"/>
    <!--右侧内容 start-->
    <div id="page-wrapper">
        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
            <ol class="breadcrumb page-breadcrumb">
                <li><i class="fa fa-home"></i>&nbsp;<a
                        href="${ctx}/main/toMain.do">首页</a>&nbsp;&nbsp;<i
                        class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                <li>微支付管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
                </li>
                <li class="active">报备信息报备-录入</li>
            </ol>
            <div class="clearfix"></div>
        </div>
        <!--END TITLE & BREADCRUMB PAGE-->
        <!--BEGIN CONTENT-->
        <div class="page-content">
            <div class="panel panel-default  withoutbottom clearfix">
                <header class="panel-heading clearfix">
                    <h2 class="panel-title">报备/录入</h2>
                </header>

                <div class="panel-body clearfix">
                    <form class="form-horizontal" role="form" method="post" enctype="multipart/form-data" id="subform">
                        <!--主体部分start-->
                        <div class="panel-inner">
                            <h2 class="panel-inner-title panel-inner-title-default">基本信息</h2>
                            <div class="panel-inner-body">

                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">渠道名称<span>*</span></td>
                                                <td>
                                                	<select class="form-control" id="reportChannelCode" name="reportChannelCode">
                                                    	<option>请选择</option>
                                                    	<c:forEach items="${reportChannelList}" var="zpayReportChannel">
                                                    		<c:choose>
	                                                    		<c:when test="${zpayReportChannel.status=='VALID'}">
	                                                    			<option value="${zpayReportChannel.reportChannelCode}" )>${zpayReportChannel.reportChannelName}</option>
	                                                    		</c:when>
	                                                    		<c:otherwise>
	                                                    			<option style="color:red;" value="${zpayReportChannel.reportChannelCode}" disabled="disabled">${zpayReportChannel.reportChannelName}</option>
	                                                    		</c:otherwise>
                                                    		</c:choose>
                                                    	</c:forEach>
	                                                </select>
	                                            </td>
                                            </tr>
                                        </table>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" <%--id="license"--%>>
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">选择文件<span>*</span></td>
                                                <td>
                                                    <input id="reportFile" type="file" name="reportFile" value="请选择">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    
                                    
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    	<table width="100%" class="product_detail_list">
			                                <button class="btn btn-primary margin30">
			                                    <i class="fa fa-check-square-o"></i> 提交
			                                </button>
		                                </table>
                            		</div>
                                </div>
                            </div>
                        </div>
                        <!-- ####### 招商 补充表单 -->
                        <div class="panel-inner" style="display:none;" id="cmbMoreInfo">
                            <h2 class="panel-inner-title panel-inner-title-default">招商补充信息</h2>
                            <div class="panel-inner-body">

								<div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="120" class="text-right">营业执照注册号<span>*</span></td>
												<td >
													<input type="text" class="form-control" id="license_num" name="license_num" value=""/>
												</td>
											</tr>
										</table>
									</div>

                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="120" class="text-right">营业执照经营范围<span>*</span></td>
												<td>
													<input type="text" class="form-control" id="license_scope" name="license_scope" value=""/>
												</td>
											</tr>
										</table>
									</div>
                                </div>
                                
                                <div class="row">
								    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="120" class="text-right">营业执照开始时间<span>*</span></td>
												<td>
													<div data-date-format="yyyy-mm-dd" class="input-group date datepicker-filter mbs">
														<span class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</span>
														<input type="text" class="form-control" id="license_start_date" name="license_start_date" value=""/>
													</div>
												</td>
											</tr>
										</table>
									</div>
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="120" class="text-right">营业执照到期时间<span>*</span></td>
												<td>
													<div data-date-format="yyyy-mm-dd" class="input-group date datepicker-filter mbs">
														<span class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</span>
														<input type="text" class="form-control" id="license_end_date" name="license_end_date" value=""/>
													</div>
												</td>
											</tr>
										</table>
									</div>
							</div>
                                
                                <div class="row">
                                	<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">执照是否长期有效<span>*</span></td>
                                                <td>
                                                	<select class="form-control" id="license_period" name="license_period">
                                                    	<option value="">请选择</option>
                                                    	<option value="1">是</option>
	                                                </select>
	                                            </td>
                                            </tr>
                                        </table>
                                    </div>
                                    
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">身份证正面图片<span>*</span></td>
                                                <td>
                                                    <input id="id_card_img_f" type="file" name="id_card_img_f" value="请选择">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                	<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" >
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">身份证反面图片<span>*</span></td>
                                                <td>
                                                    <input id="id_card_img_b" type="file" name="id_card_img_b" value="请选择">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                	<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" >
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">营业执照图片<span>*</span></td>
                                                <td>
                                                    <input id="license_img" type="file" name="license_img" value="请选择">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row" id="cmbParamter" style="display:none;">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" >
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">门头照片<span>*</span></td>
                                                <td>
                                                    <input id="mchFrontImg" type="file" name="mchFrontImg" value="请选择">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" >
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">内景照片<span>*</span></td>
                                                <td>
                                                    <input id="mchInnerImg" type="file" name="mchInnerImg" value="请选择">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- ####### 中信 补充表单 -->
                        <div class="panel-inner" style="display:none;" id="eciticMoreInfo">
                            <h2 class="panel-inner-title panel-inner-title-default">中信补充信息</h2>
                            <div class="panel-inner-body">

                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">身份证正面图片<span>*</span></td>
                                                <td>
                                                    <input id="id_card_img_f_ecitic" type="file" name="id_card_img_f_ecitic" value="请选择">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" >
                                        <table width="110%" class="product_detail_list">
                                            <tr>
                                                <td width="130" class="text-right">身份证反面图片<span>*</span></td>
                                                <td>
                                                    <input id="id_card_img_b_ecitic" type="file" name="id_card_img_b_ecitic" value="请选择">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" >
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">营业执照图片<span>*</span></td>
                                                <td>
                                                    <input id="license_img_ecitic" type="file" name="license_img_ecitic" value="请选择">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" >
                                        <table width="110%" class="product_detail_list">
                                            <tr>
                                                <td width="130" class="text-right">开户许可证图片<span>(企业)*</span></td>
                                                <td>
                                                    <input id="account_open_img_ecitic" type="file" name="account_open_img_ecitic" value="请选择">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" >
                                        <table width="100%" class="product_detail_list">
                                            <tr>
                                                <td width="120" class="text-right">门头照图片<span>(个人)*</span></td>
                                                <td>
                                                    <input id="mch_front_img_ecitic" type="file" name="mch_front_img_ecitic" value="请选择">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--End CONTENT-->
    </div>
    <!--右侧内容 end-->


</div>
<!--全局动态-->
<script type="text/javascript">
    $("#subform").validate({
        rules: {
            reportChannelCode: {
            	min:1
            },
            reportFile:"required",
            license_num:"required",
            license_scope:"required",
            license_start_date:"required",
            id_card_img_f:"required",
            id_card_img_b:"required",
            license_img:"required"
        },
        messages:{
        	reportChannelCode:{
        		min:"必选"
        	}
        },
        submitHandler: function (form) {
        	var reportChannelCode = $("#reportChannelCode").val();
        	if(reportChannelCode=='6001'){
        		var license_period = $("#license_period").val();
                var endDate = $("#license_end_date").val();
                if(license_period==''&&endDate==''){
                	alert('"营业执照是否长期有效"和"营业执照到期时间"至少输入一个');
                	return;
                }
        	}
            if( reportChannelCode=='8001'){
                var license_period = $("#license_period_spdbxm").val();
                var endDate = $("#license_end_date_spdbxm").val();
                if(license_period==''&&endDate==''){
                    alert('"营业执照是否长期有效"和"营业执照到期时间"至少输入一个');
                    return;
                }
            }
        	showCover();
            $("#subform").ajaxSubmit({
                type: 'post', // 提交方式 get/post
                url: '<%=request.getContextPath()%>/micropay/importReportInfoExcel',
                success: function(data) { // data 保存提交后返回的数据，一般为 json 数据
                    // 此处可对 data 作相关处理
                    alert(data.msg);
                	if(data.err){
                		location.replace("<%=request.getContextPath()%>/ztrade/zpayReportInfoQuery");
                	}
                    hideCover();
                }
            });
        }
    });
    
    $(document).ready(function(){
    	$("#reportChannelCode").on("change",function(){
    		if($("option:selected",this).val() == '6001'){
    			$("#cmbMoreInfo").show();
                $("#cmbParamter").show();
                $("#eciticMoreInfo").hide();
            }else if($("option:selected",this).val() == '8001'){
                $("#cmbMoreInfo").show();
                $("#cmbParamter").hide();
                $("#eciticMoreInfo").hide();
            }else if($("option:selected",this).val() == '3001'
                ||$("option:selected",this).val() == '3003'
                || $("option:selected",this).val() == '3004' ){
                $("#cmbMoreInfo").hide();
                $("#cmbParamter").hide();
                $("#eciticMoreInfo").show();
            }else{
                $("#cmbMoreInfo").hide();
                $("#cmbParamter").hide();
                $("#eciticMoreInfo").hide();
            }
    	});
    });
</script>

</body>
</html>
