<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>反洗钱管理</title>
<script type="text/javascript">
	function detail() {
		$("#detail_panel").dialog({
			title:"批次详情",
			autoOpen:true,
			modal:true,
			width:800,
			height:500,
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
		<div id="page-wrapper">
			<!--BEGIN TITLE & BREADCRUMB PAGE-->
			<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
				<ol class="breadcrumb page-breadcrumb">
					<li><i class="fa fa-home"></i>&nbsp;<a
						href="Organization_management.html">首页</a>&nbsp;&nbsp;<i
						class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
					<li>风控管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li>反洗钱管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li class="active">批次主体详情</li>
				</ol>

				<div class="clearfix"></div>
			</div>
			<!--END TITLE & BREADCRUMB PAGE-->
			<!--BEGIN CONTENT-->
			<div class="page-content">
				<!--这是查询模块开始-->
				<%--<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title">查询</h2>
					</div>
					<div class="panel-body">
						<div class="row">
							<form action="" method="post"  id="queryForm" class="queryForm" enctype="multipart/form-data" class="form-horizontal ">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" >
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="55" class="text-right">商户类型</td>
											<td width="200">
												<select class="form-control" tabindex="10" id="customerType" name="customerType">
													<option <c:if test="${customerBlackList.customerType=='' }">selected="selected"</c:if> value="">全部</option>
													<option <c:if test="${customerBlackList.customerType=='C' }">selected="selected"</c:if> value="C">对公</option>
													<option <c:if test="${customerBlackList.customerType=='D' }">selected="selected"</c:if> value="D">对私</option>
												</select>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="55" class="text-right">商户名称</td>
											<td width="200">
												<div >
													<input type="text" class="form-control" id="customerName" name="customerName" value="${customerBlackList.customerName}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
							   <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="55" class="text-right">商户编号</td>
											<td width="200">
												<div >
													<input type="text" class="form-control" id="customerNumber" name="customerNumber" value="${customerBlackList.customerNumber}"/>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</form>
							<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
								<table width="100%" class="product_detail_list">
									<tr>
										<td></td>
										<td >
											<button  type="submit" class="btn btn-danger" onclick="query();">
												<i class="fa fa-search"></i> 查询
											</button>
										</td>
									</tr>
								</table>
							</div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
								<table width="100%" class="product_detail_list">
									<tr>
										<td></td>
										<td >
											<button  type="submit" class="btn btn-danger" onclick="add();">
												 +添加商户
											</button>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>--%>
				<!--这是查询模块结束-->
				<!--这是列表模块开始-->
				<div class="panel panel-default clearfix">
					<header class="panel-heading clearfix">
						<h2 class="panel-inner-title02">
							列表
						</h2>
					</header>
					<div class=" panel-body clearfix">
						<div class="table-responsive border0">
							<table class="table table-hover">
								<thead>
								<tr>
									<th>操作</th>
									<th><span>批次信息编号</span></th>
									<th><span>批次主体信息编号</span></th>
									<th><span>可疑主体姓名/名称</span></th>
									<th><span>主体特约商户编号</span></th>
									<th><span>可疑主体身份证件/证明文件类型</span></th>
									<th><span>可疑主体身份证件/证明文件号码</span></th>
									<th><span>详细住址</span></th>
									<th><span>联系电话</span></th>
									<th><span>电子邮件</span></th>
									<th><span>可疑主体的职业/行业类别</span></th>
									<th><span>可疑主体的法定代表人姓名</span></th>
									<th><span>可疑主体的法定代表人身份证件类型</span></th>
									<th><span>可疑主体的法定代表人身份证件号码</span></th>
									<th><span>描述</span></th>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${infos}" var="ctifsInfo">
									<tr>
										<td hidden= true>${ctifsInfo.id}</td>
										<td>
											<div><a href="#" onclick='update(${fns:toJson(ctifsInfo)});'>修改</a></div>
										</td>
										<td>${ctifsInfo.cbifBatchNo}</td>
										<td>${ctifsInfo.ctifsSeqNo}</td>
										<td>${ctifsInfo.ctnm}</td>
										<td>${ctifsInfo.smid}</td>
										<td>${ctifsInfo.citp}</td>
										<td>${ctifsInfo.ctid}</td>
										<td>${ctifsInfo.ctar}</td>
										<td>${ctifsInfo.cctl}</td>
										<td>${ctifsInfo.ceml}</td>
										<td>${ctifsInfo.ctvc}</td>
										<td>${ctifsInfo.crnm}</td>
										<td>${ctifsInfo.crit}</td>
										<td>${ctifsInfo.crid}</td>
										<td>${ctifsInfo.description}</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<jsp:include page="../include/page.jsp" />
				<!--这是列表模块结束-->
				<div class="row">
					<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
						<table width="100%" class="product_detail_list">
							<tr>
								<td width="120" class="text-right"></td>
								<td>
									<input type="button" value="返回" id="btn3" onclick="javascript:history.back(-1);" class="btn btn-primary margin30" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>

			<div  style="display: none;" >
				<form action="#" id="mainUpdate">
					<input type="hidden" name="id" id="id">
					<table style="width:100%;">
						<tr>
							<td>批次信息编号</td>
							<td><input type="text" disabled="disabled"  class="form-control" name="cbifBatchNo" id="cbifBatchNo"></td>
						</tr>
						<tr>
							<td>批次主体信息编号</td>
							<td><input type="text"  disabled="disabled" class="form-control" name="ctifsSeqNo" id="ctifsSeqNo"></td>
						</tr>
						<tr>
							<td>可疑主体姓名/名称</td>
							<td><input type="text"  disabled="disabled"  class="form-control" name="ctnm" id="ctnm" ></td>
						</tr>
						<tr>
							<td>主体特约商户编号</td>
							<td><input type="text"  class="form-control" name="smid" id="smid" ></td>
						</tr>
						<tr>
							<td>可疑主体身份证件/证明文件类型</td>
							<td><input type="text"  class="form-control" name="citp" id="citp" ></td>
						</tr>
						<tr>
							<td>可疑主体身份证件/证明文件号码</td>
							<td><input type="text"  class="form-control" name="ctid" id="ctid" ></td>
						</tr>
						<tr>
							<td>详细住址</td>
							<td><input type="text"  class="form-control"
									   name="ctar" id="ctar" ></td>
						</tr>
						<tr>
							<td>联系电话</td>
							<td><input type="text"  class="form-control"
									   name="cctl" id="cctl"></td>
						</tr>

						<tr>
							<td>电子邮件</td>
							<td><input type="text" class="form-control"
									   name="ceml" id="ceml"></td>
						</tr>
						<tr>
							<td>可疑主体的职业/行业类别</td>
							<td><input type="text" class="form-control"
									   name="ctvc" id="ctvc" ></td>
						</tr>
						<tr>
							<td>可疑主体的法定代表人姓名</td>
							<td><input type="text" class="form-control"
									   name="crnm" id="crnm"></td>
						</tr>

						<tr>
							<td>可疑主体的法定代表人身份证件类型</td>
							<td><input type="text" class="form-control"
									   name="crit" id="crit"></td>
						</tr>
						<tr>
							<td>可疑主体的法定代表人身份证件号码</td>
							<td><input type="text" class="form-control"
									   name="crid" id="crid"></td>
						</tr>
						<tr>
							<td>描述</td>
							<td><input type="text" class="form-control"
									   name="description" id="description"></td>
						</tr>
					</table>
				</form>

			</div>

			<!--End CONTENT-->
		</div>
		<!--右侧内容 end-->
	</div>

</body>
<script type="text/javascript">
	function format(str){
		return str==undefined?"":str;
	}

	function hideCover() {
		$("#cover").css("display", 'none');
	}

	function update(ri){
		$("#mainUpdate")[0].reset();
		//赋值
		$("#id").val(format(ri.id));
		$("#cbifBatchNo").val(format(ri.cbifBatchNo));
		$("#ctifsSeqNo").val(format(ri.ctifsSeqNo));
		$("#ctnm").val(format(ri.ctnm));
		$("#smid").val(format(ri.smid));
		$("#citp").val(format(ri.citp));
		$("#ctid").val(format(ri.ctid));
		$("#ctar").val(format(ri.ctar));
		$("#cctl").val(format(ri.cctl));
		$("#ceml").val(format(ri.ceml));
		$("#ctvc").val(format(ri.ctvc));
		$("#crnm").val(format(ri.crnm));
		$("#crit").val(format(ri.crit));
		$("#cpba").val(format(ri.cpba));
		$("#description").val(format(ri.description));



		$("#mainUpdate").dialog({
			title:"修改可疑主体信息",
			autoOpen:true,
			modal:true,
			width:500,
			height:500,
			buttons:{
				"确定":function(){
					//校验
//					showCover();
					var dialog=$(this);
					//submit
					var url="<%=request.getContextPath()%>/risk/updateMain";
					var params=$("#mainUpdate").serialize();
					$.post(url,params,function(res){
						if(res='success'){
							alert("修改成功");
							window.location.reload();
						}else{
							alert("修改失败");
						}
						dialog.dialog("close");
						window.location.reload();
					});
				},
				"取消":function(){
					$(this).dialog("close");
				}
			},
			close:function(){
//				hideCover();
			}
		});
	}




</script>
</html>
