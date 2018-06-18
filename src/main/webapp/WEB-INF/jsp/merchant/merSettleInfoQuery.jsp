<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>商户结算信息查询</title>
</head>
    <style>
		.listMain{
            padding:14px;
            
        }
		.listMain{padding-left:14px;}
        .listBox ul{
            border-bottom:1px #eee solid;
            line-height: 40px;
        }

        .listBox ul li{
            width: 200px;
            float:left;
        }
        
		.listBox ul li:first-child{width:100px}
		
		.listBox ul li:nth-child(2){width:564px}
		
		.listBox ul li:nth-child(3){width:100px}


        .detail{
            display: none;
        }
		.red{
			color: red;
		}
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
<script type="text/javascript">
	function formSubmit() {
		$("#queryForm").submit();
	}
</script>

<body class=" ">
	<div id="cover" style="display: none;">
	 	<img src="<%=request.getContextPath() %>/statics/v2/images/wait_processing.gif">
	</div>
	<!-- 头部 -->
	<jsp:include page="../include/top.jsp" />
	<div id="wrapper">
		<div>
			<jsp:include page="../include/bottom.jsp" />
			<!-- 左侧内容 -->
			<jsp:include page="../include/left.jsp" />
			<!--右侧内容 start-->
			<div id="page-wrapper">
				<!--BEGIN TITLE & BREADCRUMB PAGE-->
				<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
					<ol class="breadcrumb page-breadcrumb">
						<li><i class="fa fa-home"></i>&nbsp;<a
							href="<%=request.getContextPath()%>/main/toMain.do">首页</a>&nbsp;&nbsp;<i
							class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li>商户管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
						<li>商户结算信息查询&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
						</li>
					</ol>

					<div class="clearfix"></div>
				</div>
				<!--END TITLE & BREADCRUMB PAGE-->
				<!--BEGIN CONTENT-->
				<div class="page-content">
					<!--这是查询模块开始-->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h2 class="panel-title">查询</h2>
						</div>
						<div class="panel-body">
							<form id="queryForm"
								action="<%=request.getContextPath()%>/mersettleinfo/query"
								method="post" enctype="multipart/form-data"
								class="form-horizontal ">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />
								<div class="form-inline">
									<label>商户编号</label> <input type="text" name="merchantNo"
										value="${merchantSettleInfo.merchantNo}" class="form-control" /> 
									
									<button type="submit" id="btnSubmit" class="btn btn-primary">
										<i class="fa fa-search"></i> 查询
									</button>
								</div>
							</form>
						</div>
					</div>
					<!--这是查询模块结束-->
					<!--这是列表模块开始-->
					<div class="panel panel-default clearfix">
						<header class="panel-heading clearfix">
							<h2 class="panel-inner-title02">
								列表
								<a href="<%=request.getContextPath() %>/mersettleinfo/toAdd" class="pull-right btn btn-primary">新增</a>
								<span class="pull-right">&nbsp;&nbsp;&nbsp;</span> <a
									href="javascript:formSubmit()" class="pull-right"><i
									class="fa fa-refresh"></i>刷新</a>
							</h2>
						</header>
						<div class="panel-body clearfix">
							<div class="table-responsive border0">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>操作</th>
											<th>商户简称</th>
											<th>商户编号</th>
											<th>开户行编码</th>
											<th>开户行地址</th>
											<th>结算账户状态</th>
											<th>上次结算日期</th>
											<th>上次结算金额</th>
											<th>资金账户余额</th>
											<th>结算次数</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${page.list}" var="_settle_info__">
											<tr>
												<td><a href="#" onclick='changemsi(${fns:toJson(_settle_info__)});'>修改</a></td>
												<td>${_settle_info__.merchantNo }</td>
												<td>${_settle_info__.merchantNo}</td>
												<td>${_settle_info__.bankId}</td>
												<td>${_settle_info__.bankAddress }</td>
												<td>${_settle_info__.status }</td>
												<td>${_settle_info__.lastSettleDate }</td>
												<td>${_settle_info__.lastSettleAmount }</td>
												<td>${_settle_info__.lastSettleAmount }</td>
												<td>${_settle_info__.lastSettledAccBalance }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<jsp:include page="../include/page.jsp" />
				</div>
				<!--这是列表模块结束-->
			</div>
			<!--End CONTENT-->
		</div>
		<!--右侧内容 end-->
	</div>
	<!-- 信息新增div 开始-->
	<div id="_newmsi_div_" style="display: none">
		
		
	</div>
	<!-- 信息新增div 结束 -->
	
	
	<!-- 信息修改div 开始-->
	<div id="_changemsi_div_" style="display: none">
		
		
	</div>
	<!-- 信息修改div 结束 -->
	
</body>
<script type="text/javascript">
	function changemsi(obj){
		$("#_changemsi_div_").dialog({
			autoOpen:true,
			modal:true,
			buttons:{
				"确定":function(){
					alert("确定");
				},
				"取消":function(){
					alert("取消");
				}
			}
		});
	}
	///////////////////
	$(function(){
		//changemsi({});
	});
</script>
</html>
