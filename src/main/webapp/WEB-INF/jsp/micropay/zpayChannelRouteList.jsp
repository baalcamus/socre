<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
.border0 {
	overflow: auto !important;
}

.border0 th, .border0 td {
	white-space: nowrap;
}
</style>
<title>微支付路由管理</title>
<script type="text/javascript">
	var contextpath = "${ctx}";
	
	function query() {
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/micropay/route/queryRouteList");
		$("#queryForm").submit();
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
					<li>微支付管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li>支付记录查询&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li class="active">查询</li>
				</ol>

				<div class="clearfix"></div>
			</div>
			<!--END TITLE & BREADCRUMB PAGE-->
			<!--BEGIN CONTENT-->
			<div class="page-content">
				<!--这是查询模块开始-->
				<div class="panel panel-default" >
					<div class="panel-heading">
						<h2 class="panel-title">查询</h2>
					</div>
					<div class="panel-body" >
						<div>
							<form action="" method="post"  id="queryForm" class="queryForm" enctype="multipart/form-data" class="form-horizontal">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />

								<div class="row">
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<table width="100%" class="product_detail_list">
												<tr>
													<td width="90" class="text-right">通道名称</td>
													<td  width="200"><select class="form-control" id="channelNo" name="channelNo">
														<option <c:if test="${zpayChannelRoute.channelNo==''}">selected='selected'</c:if> value="">全部
														</select>
													</td>
												</tr>
											</table>
										</div>

									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td></td>
												<td>
													<button  class="btn btn-danger" onclick="javascript:query();return false;">
														<i class="fa fa-search"></i> 查询
													</button>
													<button onclick="javascript:down();return false;"class="btn btn-danger"><i class="fa fa-search"></i>下载</button>
												</td>
											</tr>
										</table>
									</div>
								</div>
							</form>
						</div>
						<%--<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" >--%>
							<%--<button onclick="javascript:createChannelRoute();return false;" class="btn btn-danger">创建新路由</button>--%>
						<%--</div>--%>
					</div>

				</div>
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
										<th>路由名称</th>
										<th>通道名称</th>
										<th>支付方式</th>
										<th>付款方式</th>
										<th>状态</th>
										<th>生效时间</th>
										<th>失效时间</th>
										<th>单笔最小金额</th>
										<th>单笔最大金额</th>
										<th>单日最大金额</th>
										<th>通道业务支持最大金额</th>
										<th>限制使用的商编</th>
										<th>限制使用的商户业务码</th>
										<th>固定该渠道的商编</th>
										<th>只固定使用该渠道的支付方式</th>
										<th>小于某金额固定该渠道</th>
										<th>大于某金额固定该渠道</th>
										<th>路由优先级，分5级</th>
										<th>企业ID通道配置</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.list }" var="route">
										<tr>
											<td><input type="button" class="btn btn-success" style="width: 70px;height: 30px;font-size: unset;" onclick='editMerchantNo(this,"${route.id}");' value="修改商编"/>
											<c:if test="${!empty route.fixedMctCompanyId}"><input type="button" class="btn btn-success" style="width: 80px;height: 30px;font-size: unset;" onclick='editCompanyId(this,"${route.id}");' value="修改企业id"/></c:if> </td>
											<td>${route.routeName }</td>
											<td>${route.channelNo }</td>
											<td>${route.payMethodMode }</td>
											<td>${route.payProductMode }</td>
											<td>${route.status=='VALID'?'可用':(route.status=='INVALID'?'不可用':route.status) }
												<c:if test="${route.status=='VALID'}"><a href="" style="color: blue;" onclick="changeChannelStatus(${route.id},'INVALID')">(禁用)</a></c:if>
												<c:if test="${route.status=='INVALID'}"><a  href="" style="color: blue;" onclick="changeChannelStatus(${route.id},'VALID')">(可用)</a></c:if>
											</td>
											<td><fmt:formatDate value="${route.validFromTime }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
											<td><fmt:formatDate value="${route.invalidEndTime }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
											<td><fmt:formatNumber value="${route.singleMinAmount }" pattern="0.00"/></td>
											<td><fmt:formatNumber value="${route.singleMaxAmount }" pattern="0.00"/></td>
											<td><fmt:formatNumber value="${route.dayMaxAmount }" pattern="0.00"/></td>
											<td><fmt:formatNumber value="${route.totalMaxAmount }" pattern="0.00"/></td>
											<td>${route.limitMctNo }</td>
											<td>${route.limitMctBizCode }</td>
											<td><span class="fixedMctNoSpan">${route.fixedMctNo }</span></td>
											<td>${route.fixedPayMethod }</td>
											<td>${route.fixedMinAmount }</td>
											<td>${route.fixedMaxAmount }</td>
											<td>${route.priority }</td>
											<td><span class="fixedMctCompanyIdSpan">${route.fixedMctCompanyId }</span></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<jsp:include page="../include/page.jsp" />
				<!--这是列表模块结束-->
			</div>
			<!--End CONTENT-->
		</div>
		<!--右侧内容 end-->
	</div>
	<form id="editMerchantNoForm" style="display: none;">
		<input id="idValue" type="hidden" name="id">
		<div class="form-group">
			<label class="col-lg-5" style="margin: 4px 0 0">固定该渠道的商编</label> <textarea id="fixMctNoValue"
				class="form-control" style="width: 90% !important;" type="text"
				name="fixMctNo"></textarea>
		</div>
	</form>
	<div id="editCompanyMadal" style="display: none">
		<form name="editCompanyMadalForm">

			<!-- <div class="form-group">
			<label>配置原文</label>
			<br/>
			<span id="mctCompanyIdStr"></span>
			</div> -->

			<div class="form-group">
			<label for="merchantNo">商户编号</label>

			<select class="form-control" id="mctSelect" onchange="changeMctSelect();" name="mctSelect">
				<option value="-1">请选择</option>
			</select>
			<label style="margin-top: 5px">企业ID</label>
			<input class="form-control" type="text" id="queryCompanyId" value=""/>
			<input style="margin-top: 5px" type="button" onclick="changeMctSelect();" value="查询"/>

			<div id="hiddenInputDiv" style="display:none">
			<input type="hidden" name="channerRouteId" value=""/>

			</div>


			</div>
			<input type="button" onclick="addCompanyInput();" value="新增企业ID">
			<div id="addCompanyDiv" >

				<!-- <span onclick="addCompanyInput();" style="margin-top: -10px;color: orange;cursor: pointer;float:right;font-size: x-large;">+</span> -->
				<!-- <div class="form-group">
					<input type="text" style="width:230px" class="form-control" name="companyId" placeholder="请仔细填写企业ID">
					<span style="margin-top: -4px;margin-right: -11px;color: red;cursor: pointer;float:right;font-size: x-large;" onclick="delCompanyInput(this);">-</span>
				</div> -->
			</div>
		</form>
	</div>

	<div id="createChannelRoute" style="display: none" class="">
		<form id="createChannelRouteForm">
			<div>
				<label >路由编号：</label>
				<input id="routeNo" name="routeNo">
			</div>
			<div>
				<label >路由名称：</label>
				<input id="routeName" name="routeName">
			</div>
			<div>
				<label >通道编号：</label>
				<input id="channelNoS" name="channelNo">
			</div>
			<div>
				<label >支付方式：</label>
				<input id="payMethodMode" name="payMethodMode">
			</div>
			<div>
				<label >支付产品：</label>
				<input id="payProductMode" name="payProductMode">
			</div>
			<div>
				<label >支持银行卡：</label>
				<input id="bankCardMode" name="bankCardMode">
			</div>
			<div>
				<label >路由状态：</label>
				<input id="status" name="status">
			</div>
			<div>
				<label >路由优先级：</label>
				<input id="priority" name="priority">
			</div>
			<div>
				<label >生效开始时间：</label>
				<input id="validFromTime" name="validFromTime">
			</div>
			<div>
				<label >失效时间：</label>
				<input id="invalidEndTime" name="invalidEndTime">
			</div>
			<div>
				<label >单笔最小金额：</label>
				<input id="singleMinAmount" name="singleMinAmount">
			</div>
			<div>
				<label >单笔最大金额：</label>
				<input id="singleMaxAmount" name="singleMaxAmount">
			</div>
			<div>
				<label >单日最大金额：</label>
				<input id="dayMaxAmount" name="dayMaxAmount">
			</div>
			<div>
				<label >通道业务支持最大金额：</label>
				<input id="totalMaxAmount" name="totalMaxAmount">
			</div>
			<div>
				<label >限制使用的商编：</label>
				<input id="limitMctNo" name="limitMctNo">
			</div>
			<div>
				<label >限制使用的商户业务码：</label>
				<input id="limitMctBizCode" name="limitMctBizCode">
			</div>
			<div>
				<label >只固定使用该渠道的服务商商编：</label>
				<input id="fixedSpMctNo" name="fixedSpMctNo">
			</div>
			<div>
				<label >只固定使用该渠道的商编：</label>
				<input id="fixedMctNo" name="fixedMctNo">
			</div>
			<div>
				<label >只固定使用该渠道的企业ID：</label>
				<input id="fixedMctCompanyId" name="fixedMctCompanyId">
			</div>
			<div>
				<label >只固定使用该渠道的支付方式：</label>
				<input id="fixedPayMethod" name="fixedPayMethod">
			</div>
			<div>
				<label >小于某金额固定该渠道：</label>
				<input id="fixedMinAmount" name="fixedMinAmount">
			</div>
			<div>
				<label >大于某金额固定该渠道：</label>
				<input id="fixedMaxAmount" name="fixedMaxAmount">
			</div>
			<div>
				<label >描述：</label>
				<input id="description" name="description">
			</div>
		</form>
	</div>
	
	<script type="text/javascript">
	
	function addCompanyInput(){
		
		var html = '<div  class="form-group"><input type="text" style="width:220px" class="form-control" name="companyId" placeholder="请仔细填写企业ID"><span style="margin-top: -4px;color: red;cursor: pointer;font-size: x-large;"  onclick="delCompanyInput(this);" >-</span></div>';
		$("#addCompanyDiv").prepend(html);
	}
	function delCompanyInput(obj){
		$(obj).parent().remove();
	}

	function changeMctSelect(){
		$("[name=companyId]").parent().remove();
		var selected = $("#mctSelect").val();
		var comstr = $("[name="+selected+"_hidden_input]").val();
		var queryCompanyId = $("#queryCompanyId").val();
		if(comstr!=null && comstr!="" && comstr.length>0){
			var comArr = comstr.split(",");
			for(var i in comArr){
			    if ("" != queryCompanyId && comArr[i].indexOf(queryCompanyId) < 0) {
                    var html = '<div  class="form-group"><input type="hidden" style="width:220px" class="form-control" name="companyId" value="'+comArr[i]+'" placeholder="请仔细填写企业ID"><span style="margin-top: -4px;color: red;cursor: pointer;font-size: x-large;"  onclick="delCompanyInput(this);" >-</span></div>';
                    $("#addCompanyDiv").prepend(html);
				} else {
                    var html = '<div  class="form-group"><input type="text" style="width:220px" class="form-control" name="companyId" value="'+comArr[i]+'" placeholder="请仔细填写企业ID"><span style="margin-top: -4px;color: red;cursor: pointer;font-size: x-large;"  onclick="delCompanyInput(this);" >-</span></div>';
                    $("#addCompanyDiv").prepend(html);
				}
			}
		}
	}
	
	function editCompanyId(obj,id){
		var str = $(obj).parents("tr").find(".fixedMctCompanyIdSpan").text();
		//移除所有的 company_id串隐藏域
		$("input[name$='_hidden_input']").remove();
		//$("#mctCompanyIdStr").text(str);
		if(str!=null && str!=""){
			var jsonData = $.parseJSON(str);
			if(jsonData==null){
				alert("通道配置信息异常");
				return ;
			}
			$("#mctSelect").empty();
			$("#mctSelect").append("<option value='-1'>请选择</option>");
			$.each(jsonData,function(n,e){
				if(n!=null&&n!=""){
					/* var oldComstr = "";
					if(e!=null&&e!=""&&e.length>0){
						for(var num in e){
							oldComstr+= e[num]+",";
						}   
					}
					if(oldComstr!=null && oldComstr!="" && oldComstr.indexOf(",")>=0){
						$("#hiddenInputDiv").append('<input type="hidden" name="mctCompanyIdStr" value="'+n+"_"+oldComstr.substring(0,oldComstr.length-1)+'"/>');
					} */
					if(e!=null && e!="" && e.length>0){
						var estr = e.join(",");
						$("#hiddenInputDiv").append('<input type="hidden" name="'+n+'_hidden_input" value="'+estr+'"/>');
					}
					
					$("#mctSelect").append("<option value='"+n+"'>"+n+"</option>");
				}else{
					alert("通道配置信息异常");
					return;
				}
			})
			//changeMctSelect();
			addCompanyIdModal(id);
		}else{
			alert("通道配置信息异常");
		}
	}
	
	function addCompanyIdModal(id){
		$("[name=channerRouteId]").val(id);
		$("[name=companyId]").parent().remove();
		$("#editCompanyMadal").dialog({
			autoOpen:true,
			width:300,
			height:500,
			modal:true,
			buttons:{
				"提交":function(){
					var newcomlen = $("[name=companyId]").length;
					if(newcomlen<=0){
						alert("未新增企业ID信息");
						return;
					}
					var mchidselected = $("#mctSelect").val();
					if(mchidselected==null || mchidselected=="" || mchidselected=="-1" || mchidselected==undefined){
						alert("请选择商户编号");
						return;
					}
					var idFlag = true;
					$("[name=companyId]").each(function(n,e){
						var newid = $(e).val();
						if(newid==null || newid =="" || newid==undefined){
							alert("请完善企业ID信息");
							idFlag = false;
							return false;
						}
						if(newid.indexOf(" ")>=0||newid.indexOf(" ")>=0){
							alert("企业ID不能包含空格");
							idFlag = false;
							return false;
						}
					})
					if(idFlag){
						var params = $(document.editCompanyMadalForm).serialize();
						var url = "<%=request.getContextPath()%>/micropay/route/addCompanyId";
						$.post(url,params,function(result){
							if(result=="fail"){
								alert("修改失败");
							}else if(result=="success"){
								alert("修改完成");
								query();
								$("#editCompanyMadal").dialog("close");
							}else{
								alert(result);
							}
							
						});
					}
				},
				"取消":function(){
					$("#editCompanyMadal").dialog("close");
				}
			}
		});
	}
	
	function loadChannel(){
		var selectedChannelNo="${zpayChannelRoute.channelNo}";
		var url="<%=request.getContextPath()%>/static/micropay/getZpayChannel";
		$.post(url,{},function(channels){
			$("#channelNo option:not(:first)").remove();
			for(var i in channels){
				var channel = channels[i];
				var val=channel.channelNo;
    			var name=channel.channelName;
    			var selected=(selectedChannelNo==channel.channelNo);
    			var disabled=(channel.status!='VALID');
                var stylel=disabled?'color:red':'';
    			$("#channelNo").append("<option style='"+stylel+"' value='"+val+"' "+(disabled?'disabled':'')+(selected?' selected':'')+">"+name);
			}
		});
	}
	$(document).ready(function(){
		loadChannel();
		
    });

	function changeChannelStatus(id,status) {
        var url="<%=request.getContextPath()%>/micropay/route/changeRouteStatus";
        $.post(url,{id:id,status:status},function(res){
            if('SUCCESS'==res){
                alert("修改成功");
                query();
            }else{
                alert(res);
            }
        });
	}

    function editMerchantNo(obj,id) {
        var str = $(obj).parents("tr").find(".fixedMctNoSpan").text();
        $("#fixMctNoValue").val(str);
        $("#idValue").val(id);
        $("#editMerchantNoForm").dialog({
            autoOpen:true,
            modal:true,
            width:400,
            height:500,
            buttons:{
                "取消":function(){
                    $("#editMerchantNoForm").dialog("close");
                    $("#editMerchantNoForm").reset();
                },
                "确定":function(){
                    //请求update
                    var url = "<%=request.getContextPath()%>/micropay/route/editFixMctNo";
                    var params = $("#editMerchantNoForm").serialize();
                    $.post(url,params,function(res){
                        if('SUCCESS'==res){
                            alert("修改成功");
                            query();
                        }else{
                            alert(res);
                        }
                    });
                }
            }
        });
	}

    function createChannelRoute() {

        $("#createChannelRoute").dialog({
            autoOpen:true,
            modal:true,
            width:400,
            height:500,
            buttons:{
                "取消":function(){
                    $("#createChannelRoute").dialog("close");
                    $("#createChannelRoute").reset();
                },
                "确定":function(){
                    //请求update
                    var url = "<%=request.getContextPath()%>/micropay/route/editFixMctNo";
                    var params = $("#editMerchantNoForm").serialize();
                    $.post(url,params,function(res){
                        if('SUCCESS'==res){
                            alert("修改成功");
                            query();
                        }else{
                            alert(res);
                        }
                    });
                }
            }
        });
    }
	</script>
</body>
</html>
