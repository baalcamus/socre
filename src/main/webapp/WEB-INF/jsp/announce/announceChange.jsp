<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>公告修改</title>


<script type="text/javascript">	

    function update(id) {
    	var content=$("#content").val();
    	var expiryDate=$("#expiryDate").val();
    	
    	
    	if(content==null||content==''){
    		alert("请填写内容");
    		return false;
    	}
    	
    	if(expiryDate==null||expiryDate==''){
    		alert("请填写有效期");
    		return false;
    	}
    	
    	if (!(/(^[1-9]\d*$)/.test(expiryDate))){
     	   alert("输入的不是正整数");
     	    return false;
     	}
    	
    	$("#queryForm").submit();
    	
    }
    
    
</script>
</head>

<body class=" ">
	<div>
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
						<li>系统公告&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li class="active">公告修改</li>
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
									<h2 class="panel-title">公告修改</h2>
								</div>
								<div class="panel-body">
									<form method="post" action="<%=request.getContextPath()%>/announce/announceUpdate.do?id=${anc.id}" enctype="multipart/form-data" id="queryForm" name="queryForm"
										class="form-horizontal">
											<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">附件上传<span>&nbsp;</span></td>
														<td width="200"><input type="file" id="file-input"
															name="multpartfile" value="${anc.fileName }"></td>
														<td></td>
													</tr>
												</table>
											</div>
											<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right" style="vertical-align: top;">内容<span>*</span></td>
														<td>
															<textarea name="content" id="content" >${anc.content }</textarea>
														</td>
													
													</tr>
												</table>
											</div>
											<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">有效期（天）<span>*</span></td>
														<td width="200"><input type="text" id="expiryDate"
															name="expiryDate" class="form-control" value="${anc.expiryDate }"></td>
														<td></td>
													</tr>
												</table>
											</div>
										</div>


										<div class="row">
											<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">

												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right"></td>
														<td><td>
														<a href="javascript:update(${anc.id })" class="btn btn-primary margin30"><i
																class="fa fa-check-square-o"></i> 提交 </a></td>
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
	<!--附言弹窗 start-->
	<div id="small-dialog-details" class="zoom-anim-dialog mfp-hide">
		<div class="panel panel-default">
			<h2 class=" panel-heading">附言详情</h2>
			<div class="panel-body">
				<form class="form-horizontal " enctype="multipart/form-data"
					method="post">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div style="padding: 20px 10px;">附言内容附言内容附言内容</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<button class="mfp-close" type="button" title="Close (Esc)">×</button>
	</div>
	
	<script type="text/javascript">
		KindEditor.ready(function(K) {
			K.create( 'textarea[name="content"]',
				{
					uploadJson : '<%=request.getContextPath()%>/announce/upload.do',
					fileManagerJson : '<%=request.getContextPath()%>/announce/manage.do',
					allowFileManager : false,
					allowImageUpload : true,
					autoHeightMode : true,
					afterCreate : function() { this.loadPlugin('autoheight'); },
					afterBlur : function() { this.sync(); }
				});
		});
	
        (function(i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function() {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
        ga('create', 'UA-145464-14', 'auto');
        ga('send', 'pageview');
    </script>

</body>
</html>
