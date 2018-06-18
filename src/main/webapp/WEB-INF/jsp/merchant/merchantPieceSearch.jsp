<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>商户订单管理</title>
<script type="text/javascript">
	var contextpath = "${ctx}";
	
	function query() {
		
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/cbMerchant/toMerchantPieceSearch");
		$("#queryForm").submit();
	}
	
	function Info(id,type) {
		<%--window.location.href="<%=request.getContextPath()%>/cbMerchant/toMerchantPieceInfo?type="--%>
				<%--+ type + "&id=" + id;--%>
        window.open("<%=request.getContextPath()%>/cbMerchant/toMerchantPieceInfo?type="
            + type + "&id=" + id);
	}

	function exportExcel() {
		$("#tableForm").submit();
    }

    function changeReportFlag(ri){
        var id=ri.id;
        var url="<%=request.getContextPath()%>/cbMerchant/piece/reportFlag";
        var div=$("<div></div>");
        var select = $('<select class="form-control"></select>');
        select.append('<option value="">请选择');
        select.append('<option value="WAIT">待报备');
        select.append('<option value="PROCESSING">报备中');
        select.append('<option value="SUCCESS">报备成功');
        select.append('<option value="FAIL">报备失败');
        div.append(select);
		select.val(ri.reportFlag);

        div.dialog({
            autoOpen:true,
            modal:true,
            buttons:{
                "确认":function(){
                    var dia=$(this);
                    var val=select.val();
                    $.post(url,{id:id,value:val},function(res){
                        if(res=="success"){
                            alert("修改成功");
                            formSubmit();
                        }else{
                            alert(res);
                        }
                        dia.dialog("close");
                    });
                },
                "取消":function(){
                    $(this).dialog("close");
                }
            },
            close:function(){
                $(this).remove();
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
		<div id="page-wrapper">
			<!--BEGIN TITLE & BREADCRUMB PAGE-->
			<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
				<ol class="breadcrumb page-breadcrumb">
					<li><i class="fa fa-home"></i>&nbsp;<a
						href="Organization_management.html">首页</a>&nbsp;&nbsp;<i
						class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
					<li>业务后台管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li>进件信息审批&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li class="active">审批</li>
				</ol>

				<div class="clearfix"></div>
			</div>
			<!--END TITLE & BREADCRUMB PAGE-->
			<!--BEGIN CONTENT-->
			<div class="page-content">
				<!--这是查询模块开始-->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title">审批</h2>
					</div>
					<div class="panel-body">

						<form action="" method="post" id="queryForm" class="queryForm"
							enctype="multipart/form-data" class="form-horizontal ">
							<input type="hidden" name="pageNum" value="${page.pageNum }" />
							<input type="hidden" name="pageSize" value="${page.pageSize }" />
							<div class="row">
								<%--<div class="col-sm-4 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="70" class="text-right">服务商编号</td>
											<td width="200">
												<div>
													<input type="text" class="form-control"
														id="pieceMerchantNo" name="pieceMerchantNo"
														value="${merchantPieceInfo.pieceMerchantNo}" />
												</div>
											</td>
										</tr>
									</table>
								</div>--%>
									<div class="col-sm-4 col-xs-12">
										<table width="100%" class="product_detail_list">
											<tr>
												<td width="70" class="text-right">商户编号</td>
												<td width="200">
													<div>
														<input type="text" class="form-control"
															   id="merchantNo" name="merchantNo"
															   value="${merchantPieceInfo.merchantNo}" />
													</div>
												</td>
											</tr>
										</table>
									</div>
								<div class="col-sm-4 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="70" class="text-right">企业ID</td>
											<td width="200">
												<div>
													<input type="text" class="form-control" id="companyId" name="companyId" value="${merchantPieceInfo.companyId}" />
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-sm-4 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="70" class="text-right">三级商户ID</td>
											<td width="200">
												<div>
													<input type="text" class="form-control" id="thirdMerchantId" name="thirdMerchantId" value="${merchantPieceInfo.thirdMerchantId}" />
												</div>
											</td>
										</tr>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-4 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="70" class="text-right">商户名称</td>
											<td width="200">
												<div>
													<input type="text" class="form-control" id="merchantName"
														name="merchantName"
														value="${merchantPieceInfo.merchantName}" />
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-sm-4 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="70" class="text-right">商户简称</td>
											<td width="200">
												<div>
													<input type="text" class="form-control"
														id="merchantShortName" name="merchantShortName"
														value="${merchantPieceInfo.merchantShortName}" />
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-sm-4 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="70" class="text-right">进件状态</td>
											<td width="200"><select class="form-control"
																	tabindex="10" id="pieceStatus" name="pieceStatus">
												<option
														<c:if test="${merchantPieceInfo.pieceStatus=='' }">selected="selected"</c:if>
														value="">全部</option>
												<option
														<c:if test="${merchantPieceInfo.pieceStatus=='WAIT' }">selected="selected"</c:if>
														value="WAIT">待审核</option>
												<option
														<c:if test="${merchantPieceInfo.pieceStatus=='SUCCESS' }">selected="selected"</c:if>
														value="SUCCESS">入网成功</option>
												<option
														<c:if test="${merchantPieceInfo.pieceStatus=='FAIL' }">selected="selected"</c:if>
														value="FAIL">入网失败</option>
											</select></td>
										</tr>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-4 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="70" class="text-right">报备状态</td>
											<td width="200">
												<select class="form-control"
														tabindex="10" id="reportFlag" name="reportFlag">
													<option
															<c:if test="${merchantPieceInfo.reportFlag=='' }">selected="selected"</c:if>
															value="">全部</option>
													<option
															<c:if test="${merchantPieceInfo.reportFlag=='WAIT' }">selected="selected"</c:if>
															value="WAIT">待报备</option>
													<option
															<c:if test="${merchantPieceInfo.reportFlag=='PROCESSING' }">selected="selected"</c:if>
															value="PROCESSING">报备中</option>
													<option
															<c:if test="${merchantPieceInfo.reportFlag=='SUCCESS' }">selected="selected"</c:if>
															value="SUCCESS">报备成功</option>
													<option
															<c:if test="${merchantPieceInfo.reportFlag=='FAIL' }">selected="selected"</c:if>
															value="FAIL">报备失败</option>
												</select>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-sm-4 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td width="70" class="text-right">签约状态</td>
											<td width="200">
												<select class="form-control"
																	tabindex="10" id="esignStatus" name="esignStatus">
												<option
														<c:if test="${merchantPieceInfo.esignStatus=='' }">selected="selected"</c:if>
														value="">全部</option>
												<option
														<c:if test="${merchantPieceInfo.esignStatus=='WAIT' }">selected="selected"</c:if>
														value="WAIT">待签约</option>
												<option
														<c:if test="${merchantPieceInfo.esignStatus=='SUCCESS' }">selected="selected"</c:if>
														value="SUCCESS">签约成功</option>
												</select>
											</td>
										</tr>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6 col-xs-12">

								</div>
								<div class="col-sm-6 col-xs-12">
									<table width="100%" class="product_detail_list">
										<tr>
											<td></td>
											<td>
												<button type="submit" class="btn btn-danger"
													onclick="query();">
													<i class="fa fa-search"></i> 查询
												</button>
												<%--<button type="button" class="btn btn-danger"
														onclick="exportExcel();">
													<i class="fa fa-search"></i> 导出报备excel
												</button>--%>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</form>

					</div>
				</div>
				<!--这是查询模块结束-->
				<!--这是列表模块开始-->
				<div class="panel panel-default clearfix">
					<header class="panel-heading clearfix">
						<div style="float: left">
							<h4 class="panel-inner-title02">列表</h4>
						</div>
						<div style="float: right">
							<button type="button" class="btn btn-danger"
									onclick="channelReport();">
								<i class="fa fa-search"></i> 通道报备
							</button>
							<button type="button" class="btn btn-danger"
									onclick="exportExcel();">
								<i class="fa fa-search"></i> 导出报备excel
							</button>
						</div>
					</header>
					<div class=" panel-body clearfix">
						<div class="table-responsive border0">
							<table class="table table-hover">
								<form id="tableForm" action="<%=request.getContextPath()%>/cbMerchant/importMicroPayReportExcel">
								<thead>
									<tr>
										<th> </th>
										<th>服务商编号</th>
										<th>企业ID</th>
										<th>三级ID</th>
										<th>进见生成商编</th>
										<th>商户名称</th>
										<th>商户简称</th>
										<th>进件状态</th>
										<th>报备状态</th>
										<th>签约状态</th>
										<th>进件时间</th>
										<th>商户分类</th>
										<th>商户类型</th>

										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${merchantPieceInfoList}"
										var="info">
										<tr>
											<td hidden=true>${info.id}</td>
											<td><input type="Checkbox" id="ids" name="ids" value="${info.id}"/>
												<input type="hidden" value="${info.pieceStatus}"> </td>
											<td>${info.pieceMerchantNo}</td>
											<td>${info.companyId}</td>
											<td>${info.thirdMerchantId}</td>
											<td>${info.merchantNo}</td>
											<td>${info.merchantName}</td>
											<td>${info.merchantShortName}</td>
											<td>${info.pieceStatus=='WAIT'?'待审核':(info.pieceStatus=='SUCCESS'?'入网成功':(info.pieceStatus=='FAIL'?'审核未通过':info.pieceStatus))}</td>
											<td>
												<%--<c:if test="${info.reportFlag=='WAIT'}">待报备</c:if>--%>
												<%--<c:if test="${info.reportFlag=='PROCESSING'}">报备中</c:if>--%>
												<%--<c:if test="${info.reportFlag=='SUCCESS'}">报备成功</c:if>--%>
												<%--<c:if test="${info.reportFlag=='FAIL'}">报备失败</c:if>--%>
												<a href="#" onclick="lookReportStatus('${info.merchantNo}')">查看</a>
											</td>
											<td><c:if test="${info.esignStatus=='WAIT'}">待签约</c:if>
												<c:if test="${info.esignStatus=='SUCCESS'}">已签约</c:if>
											</td>
											<td><fmt:formatDate
													value="${info.createTime}"
													pattern="yyyy-MM-dd HH:mm:ss" /></td>
											<td>${info.merchantClass=='TO_PUBLIC_TYPE'?"对公":(info.merchantClass=='TO_PRIVATE_TYPE'?"对私":(info.merchantClass))}
											</td>
											<td>${info.merchantType=='B2B'?"B2B":(info.merchantType=='B2C'?"B2C":(info.merchantType))}
											</td>

											<td>
												<%--<form action="" method="post" enctype="multipart/form-data"--%>
													<%--class="form-horizontal">--%>
													<input type="hidden" name="id"
														value="${info.id}" />
													<a href="javascript:Info('${info.id}');">
														<c:if test="${info.pieceStatus=='WAIT'}">
															<a
																href="javascript:Info('${info.id}',1);">
																审批 </a>
														</c:if> <c:if
															test="${info.pieceStatus=='SUCCESS'}">
															<a
																href="javascript:Info('${info.id}',2);">
																查看明细 </a>
														</c:if> <c:if test="${info.pieceStatus=='FAIL'}">
															<a
																href="javascript:Info('${info.id}',2);">
																查看明细 </a>

														</c:if>
												<%--</form>--%>
											</td>
										</tr>
									</c:forEach>
								</tbody>
								</form>
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
	<div id="reportDiv" style="display: none">
		<table width="100%" class="product_detail_list">
			<thead>
			<tr>
				<th> 通道名称</th>
				<th> 通道支付方式</th>
				<th> 通道报备状态</th>
			</tr>
			</thead>
			<tbody id="tbodyData">
			<%--<c:forEach items="${reprotInfoList}"--%>
					   <%--var="info">--%>
				<%--<tr>--%>
					<%--<td>${info.channelNo}</td>--%>
					<%--<td>${info.merchantStatus}</td>--%>
				<%--</tr>--%>
			<%--</c:forEach>--%>
			</tbody>
		</table>
	</div>
	<div id="reportChannelDiv" style="display: none ;">
		<form id="reportChannelForm" >

		</form>
	</div>
</body>
<script type="text/javascript">
	function lookReportStatus(merchantNo){
        $.post("<%=request.getContextPath()%>/micropay/findReportInfoByMerchantNo",{merchantNo:merchantNo},function(data){
            $("#tbodyData").empty();//先清空tbody
            var strHTML = "";
            $.each(data,function(InfoIndex,Info){//遍历json里的数据
                strHTML += "<tr>";
//                if(Info["reportChannel"] =='ECITIC1001'){
//                    strHTML += "<td>中信</td>";
//				}else if (Info["reportChannel"] =='ECITIC1002'){
//                    strHTML += "<td>中信零费率</td>";
//                }else if(Info["reportChannel"] =='ECITIC1003'){
//                    strHTML += "<td>中信哗啦啦公众号</td>";
//                }else if(Info["reportChannel"] =='CMB1001'){
//                    strHTML += "<td>招商</td>";
//                }else if(Info["reportChannel"] =='SPDB1002'){
//                    strHTML += "<td>厦门浦发</td>";
//                }
                strHTML += "<td>"+Info["channelName"]+"</td>";
                if(Info["reportPayMethod"]=='WEIXINPAY'){
                    strHTML += "<td>微信支付</td>";
				}else if(Info["reportPayMethod"]=='ALIPAY'){
                    strHTML += "<td>支付宝</td>";
                }else if(Info["reportPayMethod"]=='QQ_WALLET'){
                    strHTML += "<td>QQ钱包</td>";
                }else if(Info["reportPayMethod"]=='JD_WALLET'){
                    strHTML += "<td>京东钱包</td>";
                }else if(Info["reportPayMethod"]=='BAIDU_WALLET'){
                    strHTML += "<td>百度钱包</td>";
                }else if(Info["reportPayMethod"]=='UNION_WALLET'){
                    strHTML += "<td>银联钱包</td>";
                }
                if(Info["merchantStatus"] == 'INIT'){
                    strHTML += "<td>初始化</td>";
				}else if(Info["merchantStatus"] == 'PROCESSING'){
                    strHTML += "<td>报备中</td>";
                }else if(Info["merchantStatus"] == 'SUCCESS'){
                    strHTML += "<td>报备成功</td>";
                }else if(Info["merchantStatus"] == 'FORBID'){
                    strHTML += "<td>冻结</td>";
                }else if(Info["merchantStatus"] == 'ENSURING'){
                    strHTML += "<td>认证中</td>";
                }else if(Info["merchantStatus"] == 'FAIL'){
                    strHTML += "<td>失败</td>";
                }else{
                    strHTML += "<td>其他</td>";
                }
                strHTML += "</tr>";
            });
            $("#tbodyData").html(strHTML);//显示到tbody中
        });
        $("#reportDiv").dialog({
            title:"通道报备状态",
            autoOpen:true,
            modal:true,
            width:"500px",
            buttons:{
                "查看具体报备信息":function () {
					<%--window.location.href='${ctx}/ztrade/zpayReportInfoQuery?merchantNo='+merchantNo;--%>
                    window.open('${ctx}/ztrade/zpayReportInfoQuery?merchantNo='+merchantNo);

                },
                "取消":function(){
                    $("#reportDiv").dialog("close");
                }
            },
			close :function () {
                $("#reportDiv").dialog("close");
			}
        });
	}


	function channelReport(){
	    var winOpenFlag = true ;
        var id_array=new Array();
        $('input[name="ids"]:checked').each(function(){
            id_array.push($(this).val());//向数组中添加元素
        });
        var idss=id_array.join(',');

		$('input[name="ids"]:checked ').each(function(){
            if($(this).next().val()!='SUCCESS'){
                winOpenFlag = false;
                alert("请确认选择的商户状态都是入网！");
            }
        });
		if (winOpenFlag) {
            $("#reportChannelForm").empty();//先清空tbody
            var strHTML = "";
            strHTML += "<input type='hidden'  id='idForm' name='idss' value='" + idss + "'>"
            $.post("<%=request.getContextPath()%>/micropay/findReportChannel", function (data) {
                $.each(data, function (InfoIndex, Info) {//遍历json里的数据
                    strHTML += "<div><input type='checkbox' name='reportChannelCodes' value='" + Info["reportChannelCode"] + "'>" + Info["reportChannelName"] + "<div>";
                });
                $("#reportChannelForm").html(strHTML);//显示到tbody中
            });
            $("#reportChannelDiv").dialog({
                title: "通道报备",
                autoOpen: true,
                modal: true,
                width: "500px",
                buttons: {
                    "提交": function () {
                        var params = $("#reportChannelForm").serialize();
                        $.post("<%=request.getContextPath()%>/micropay/merchantReport", params, function (data) {
							$("#reportChannelDiv").dialog("close");
							alert(data);
                        })
                    },
                    "取消": function () {
                        $("#reportChannelDiv").dialog("close");
                    }
                },
                close: function () {
                    $("#reportChannelDiv").dialog("close");
                }
            });
        }
	}

</script>
</html>
