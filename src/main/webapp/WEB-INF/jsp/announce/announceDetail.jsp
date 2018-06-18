<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>公告详情</title>
<script type="text/javascript">
	var contextpath = "${ctx}";
	
	function download(id){
		 
		 window.location.href="<%=request.getContextPath()%>/announce/download.do?id="+ id
	}
	
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
    	
    	$("#queryForm").submit();
    	
    }
</script>

</head>

<body class=" ">
	<div>
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
						<li>系统管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li>系统公告&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li>公告查询&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li class="active">公告详情</li>
					</ol>
					<a href="javascript:history.go(-1)" class="pull-right pad25"><i
						class="fa fa-arrow-circle-left"></i> 返回</a>
					<div class="clearfix"></div>
				</div>
				<!--END TITLE & BREADCRUMB PAGE-->
				<!--BEGIN CONTENT-->
				<div class="page-content">
					<div class="row clearfix">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h2 class="panel-title">
										公告详情<a href="<%=request.getContextPath()%>/announce/toAnnounceChange.do?id=${anc.id}" class="pull-right " style="vertical-align:middle;"><i class="fa fa-edit"></i> 修改 </a>
									</h2>
								</div>
								<div class="panel-body">
									<div class="gg-title">${anc.title }</div>
									<div class="tck_text">
										<p class="text-right">
											发布人：${anc.releasePerson }&nbsp;&nbsp;&nbsp;<span>发布时间：<fmt:formatDate
													value="${anc.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
										</p>
										<div class="fj_update">
											<table width="100%" class="product_detail_list">
												<tr>
												<c:if test="${anc.upLoadPath!=null }">
													<td width="60">附件：</td>
													<td>${anc.fileName }</td>
													
													 <td class="text-right">
														<button type="button" onclick="download('${anc.id}')"
															class="btn btn-default">
															<i class="fa fa-cloud-download"></i> 下载
														</button>
													  </td>
													 </c:if>
												</tr>
											</table>
										</div>
										<p>${anc.content}</p>
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
	<!-- 入网信息（注册））弹窗 start-->
	
	</div>
	<!-- 入网信息（注册）弹窗 end-->
	<!--全局动态-->

	<script type="text/javascript">
	KindEditor.ready(function(K) {
		K.create( 'textarea[name="content"]',
			{
				uploadJson : '<%=request.getContextPath()%>/announce/upload.do',
				fileManagerJson : '<%=request.getContextPath()%>/announce/manage.do',
				allowFileManager : true,
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
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script',
				'//www.google-analytics.com/analytics.js', 'ga');
		ga('create', 'UA-145464-14', 'auto');
		ga('send', 'pageview');
	</script>

</body>
</html>
