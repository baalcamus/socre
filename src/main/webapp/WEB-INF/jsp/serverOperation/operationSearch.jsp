<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<style type="text/css">
		.overflow{
			max-height:256px;
		}
		#cover{
			position: fixed;
			z-index: 1000;
			width: 100%;
			height: 100%;
			top:0;
			left:0;
			background-color:#000000;
			filter:alpha(opacity=0.7); /*IE滤镜，透明度50%*/
			-moz-opacity:0.7; /*Firefox私有，透明度50%*/
			opacity:0.7;/*其他，透明度50%*/
			text-align: center;
		}
		#cover img{
			position:absolute;top:40%;left:40%;width:20%;height:10%;margin-top:-15px;margin-left:-15px;
		}

	</style>
	<style type="text/css">
		.border0 {
			overflow: auto !important;
		}

		.border0 th, .border0 td {
			white-space: nowrap;
		}
	</style>
	<script type="text/javascript">
        function showCover(){$("#cover").css("display",'');}
        function hideCover(){$("#cover").css("display",'none');}
	</script>
	<title>微支付应用管理</title>
	<script type="text/javascript">
        var contextpath = "${ctx}";
        function shellOperate(ip,userId,filePath,password){
        	if(confirm("确认操作吗？"))
        	{
                openDialog();
				$("#out").html("状态：<span style='color:red'>执行中</span>");
                $.post("<%=request.getContextPath()%>/static/serverOperation/shellOperate",{
                        ip:ip,
                        userId:userId,
                        filePath:filePath,
                        password:password,
                    },
                    function (data){
						$("#out").html("状态："+data.msg);
						if(data.sysOut.length!=0)
						{
							$("#sysOut").html("系统消息："+data.sysOut);
						}
						if(data.sysErr.length!=0)
						{
							$("#sysErr").html("异常信息："+data.sysErr);
						}
						$("#cBtn").show();
                });
        	}
        }


        function reloadFile() {

            $("#queryForm").attr("action", "<%=request.getContextPath()%>/static/serverOperation/getOperationList?type=FORCE");
            $("#queryForm").submit();
        }

        function closeDialog(){
        	$("#sysOut").html("");
			$("#sysErr").html("");
            showDialog.dialog("close");
		}

		function openDialog(){
            showDialog =  $("#showConfirm").dialog({
                autoOpen: false,
                title: "提示框",
                width:500,
                height:200,
                modal: true,
                close: function(){
                }
            });
			$("#cBtn").hide();
            showDialog.dialog("open");
		}
	</script>
</head>

<body class=" ">
<div id="cover" style="display: none;">
	<img src="<%=request.getContextPath() %>/statics/v2/images/wait_processing.gif">
</div>
<jsp:include page="../include/top.jsp" />
<!--头部 1end-->
<div id="wrapper">
	<jsp:include page="../include/bottom.jsp" />
	<!-- 左侧内容 -->
	<jsp:include page="../include/left.jsp" />
	<div id="page-wrapper">
		<!--BEGIN TITLE & BREADCRUMB PAGE-->
		<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
			<ol class="breadcrumb page-breadcrumb">
				<%--<li><i class="fa fa-home"></i>&nbsp;<a--%>
						<%--href="Organization_management.html">首页</a>&nbsp;&nbsp;<i--%>
						<%--class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>--%>
				<%--<li>风控管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;--%>
				<%--</li>--%>
				<%--<li>商户白名单&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;--%>
				<%--</li>--%>
				<li class="active">微支付应用管理</li>
			</ol>

			<div class="clearfix"></div>
		</div>
		<!--END TITLE & BREADCRUMB PAGE-->
		<!--BEGIN CONTENT-->
		<div class="page-content">

			<!--这是查询模块结束-->
			<!--这是列表模块开始-->
			<div class="panel panel-default clearfix">
				<header class="panel-heading clearfix">
					<h2 class="panel-inner-title02">列表
						<a href="#" onclick="reloadFile();" class="pull-right btn btn-primary">重新载入配置文件</a></h2>
				</header>
				<div class=" panel-body clearfix">
					<div class="table-responsive border0">
						<form action="" method="post" id="queryForm" class="queryForm"></form>
						<table class="table table-hover">
							<thead>
							<tr>
								<th>应用</th>
								<th>IP</th>
								<th>操作</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${OperationInfoList}" var="OperationInfo">
								<tr>
									<td>${OperationInfo.instruction}</td>
									<td>${OperationInfo.ip}</td>
									<%--<td>${OperationInfo.userId}</td>--%>
									<%--<td>${OperationInfo.password}</td>--%>

								<c:forEach items="${OperationInfo.fileInfoList}" var="fileInfoList">

									<td >
										<a href="javascript:shellOperate('${OperationInfo.ip}','${OperationInfo.userId}','${fileInfoList.filePath}','${OperationInfo.password}');">${fileInfoList.type}</a>
									</td>

								</c:forEach>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<%--<jsp:include page="../include/page.jsp" />--%>
			<!--这是列表模块结束-->
		</div>
		<!--End CONTENT-->
	</div>
	<!--右侧内容 end-->
</div>
<div style="display: none;">
	<div>
		<form id="ibl" action="#">
			<input type="file" name="customerBlackFile" id="customerBlackFile">
		</form>
	</div>
</div>

<div id="showConfirm" class="table-list" style="display:none;">
	<table style="width: 100%">
		<tr>
			<td align="right" height="35px" class="red" style="text-align: left;">
				<p id="out" style="color: green;font-size: 20px"></p>
				<p id="sysOut" style="color:black;font-size: 20px"></p>
				<p id="sysErr" style="color: red;font-size: 20px"></p>
				<input type="button" id="cBtn" value="关闭" class="btn btn-primary" onclick="closeDialog()">
			</td>
		</tr>
	</table>
</div>

</body >

</html>
