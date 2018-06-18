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
					<li class="active">批次详情</li>
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
									<th><span>批次可疑交易编号</span></th>
									<th><span>可疑主体姓名/名称</span></th>
									<th><span>可疑主体身份证件/证明文件类型</span></th>
									<th><span>可疑主体身份证件/证明文件号码</span></th>
									<th><span>可疑主体的银行账号种类</span></th>
									<th><span>可疑主体的银行账号</span></th>
									<th><span>可疑主体银行账号的开户银行名称</span></th>
									<th><span>可疑主体的支付账户种类</span></th>
									<th><span>可疑主体的支付账户账号</span></th>
									<th><span>可疑主体所在支付机构的名称</span></th>
									<th><span>可疑主体所在支付机构的银行账号</span></th>
									<th><span>可疑主体所在支付机构的银行账号的开户银行名称</span></th>
									<th><span>可疑主体的交易IP地址</span></th>
									<th><span>交易时间</span></th>
									<th><span>货币资金转移方式</span></th>
									<th><span>资金收付标志</span></th>
									<th><span>资金用途</span></th>
									<th><span>交易币种</span></th>
									<th><span>交易金额</span></th>
									<th><span>交易对手姓名/名称</span></th>
									<th><span>交易对手特约商户编号</span></th>
									<th><span>交易对手证件/证明文件类型</span></th>
									<th><span>交易对手证件/证明文件号码</span></th>
									<th><span>交易对手的银行账号种类</span></th>
									<th><span>交易对手的银行账号</span></th>
									<th><span>交易对手银行账号的开户银行名称</span></th>
									<th><span>交易对手的支付账户种类</span></th>
									<th><span>交易对手的支付账户号码</span></th>
									<th><span>交易对手所在支付机构的名称</span></th>
									<th><span>交易对手所在支付机构的银行账号</span></th>
									<th><span>交易对手所在支付机构银行账号的开户银行名称</span></th>
									<th><span>交易对手的交易IP地址</span></th>
									<th><span>交易商品名称</span></th>
									<th><span>银行与支付机构之间的业务交易编码</span></th>
									<th><span>支付机构与商户之间的业务交易编码</span></th>
									<th><span>业务标识号</span></th>
									<th><span>描述</span></th>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${infos}" var="stifsiInfo">
									<tr>
										<td hidden= true>${stifsiInfo.id}</td>
											<td>
											<div><a href="#" onclick='update(${fns:toJson(stifsiInfo)});'>修改</a></div>
											</td>
										<td>${stifsiInfo.cbifBatchNo}</td>
										<td>${stifsiInfo.ctifsSeqNo}</td>
										<td>${stifsiInfo.stifsSeqNo}</td>
										<td>${stifsiInfo.ctnm}</td>
										<td>${stifsiInfo.citp}</td>
										<td>${stifsiInfo.ctid}</td>
										<td>${stifsiInfo.cbat}</td>
										<td>${stifsiInfo.cbac}</td>
										<td>${stifsiInfo.cabm}</td>
										<td>${stifsiInfo.ctat}</td>
										<td>${stifsiInfo.ctac}</td>
										<td>${stifsiInfo.cpin}</td>
										<td>${stifsiInfo.cpba}</td>
										<td>${stifsiInfo.cpbn}</td>
										<td>${stifsiInfo.ctip}</td>
										<td>${stifsiInfo.tstm}</td>
										<td>${stifsiInfo.cttp}</td>
										<td>${stifsiInfo.tsdr}</td>
										<td>${stifsiInfo.crpp}</td>
										<td>${stifsiInfo.crtp}</td>
										<td>${stifsiInfo.crat}</td>
										<td>${stifsiInfo.tcnm}</td>
										<td>${stifsiInfo.tsmi}</td>
										<td>${stifsiInfo.tcit}</td>
										<td>${stifsiInfo.tcid}</td>
										<td>${stifsiInfo.tcat}</td>
										<td>${stifsiInfo.tcba}</td>
										<td>${stifsiInfo.tcbn}</td>
										<td>${stifsiInfo.tctt}</td>
										<td>${stifsiInfo.tcta}</td>
										<td>${stifsiInfo.tcpn}</td>
										<td>${stifsiInfo.tcpa}</td>
										<td>${stifsiInfo.tpbn}</td>
										<td>${stifsiInfo.tcip}</td>
										<td>${stifsiInfo.tmnm}</td>
										<td>${stifsiInfo.bptc}</td>
										<td>${stifsiInfo.pmtc}</td>
										<td>${stifsiInfo.ticd}</td>
										<td>${stifsiInfo.description}</td>

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
            <!-- 修改 -->
            <div  style="display: none;" >
				<form action="#" id="dealUpdate">
					<input type="hidden" name="id" id="dealId">
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
							<td>批次可疑交易编号</td>
							<td><input type="text"  disabled="disabled"  class="form-control" name="stifsSeqNo" id="stifsSeqNo" ></td>
						</tr>
						<tr>
							<td>可疑主体姓名/名称</td>
							<td><input type="text"  class="form-control" name="ctnm" id="ctnm" ></td>
						</tr>
						<tr>
							<td>可疑主体身份证件/证明文件类型</td>
							<td><input type="text"  class="form-control" name="citp" id="citp" ></td>
						</tr>
						<tr>
							<td>可疑主体身份证件/证明文件号码</td>
							<td><input type="text"  class="form-control" name="ctid" id="ctid" ></td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td>可疑主体的银行账号种类</td>
							<td><input type="text"  class="form-control"
									   name="cbat" id="cbat" ></td>
						</tr>
						<tr>
							<td>可疑主体的银行账号</td>
							<td><input type="text"  class="form-control"
									   name="cbac" id="cbac"></td>
						</tr>

						<tr>
							<td>可疑主体银行账号的开户银行名称</td>
							<td><input type="text" class="form-control"
									   name="cabm" id="cabm"></td>
						</tr>
						<tr>
							<td>可疑主体的支付账户种类</td>
							<td><input type="text" class="form-control"
									   name="ctat" id="ctat" ></td>
						</tr>
						<tr>
							<td>可疑主体的支付账户账号</td>
							<td><input type="text" class="form-control"
									   name="ctac" id="ctac"></td>
						</tr>

						<tr>
							<td>可疑主体所在支付机构的名称</td>
							<td><input type="text" class="form-control"
									   name="cpin" id="cpin"></td>
						</tr>
						<tr>
							<td>可疑主体所在支付机构的银行账号</td>
							<td><input type="text" class="form-control"
									   name="cpba" id="cpba"></td>
						</tr>
						<tr>
							<td>可疑主体所在支付机构的银行账号的开户银行名称</td>
							<td><input type="text" class="form-control"
									   name="cpbn" id="cpbn"></td>
						</tr>
						<tr>
							<td>可疑主体的交易IP地址</td>
							<td><input type="text" class="form-control"
									   name="ctip" id="ctip"></td>
						</tr>
						<tr>
							<td>交易时间</td>
							<td><input type="text" class="form-control"
									   name="tstm" id="tstm"></td>
						</tr>
						<tr>
							<td>货币资金转移方式</td>
							<td><input type="text" class="form-control"
									   name="cttp" id="cttp"></td>
						</tr>
						<tr>
							<td>资金收付标志</td>
							<td><input type="text" class="form-control"
									   name="tsdr" id="tsdr"></td>
						</tr>
						<tr>
							<td>资金用途</td>
							<td><input type="text" class="form-control"
									   name="crpp" id="crpp"></td>
						</tr>
						<tr>
							<td>交易币种</td>
							<td><input type="text" class="form-control"
									   name="crtp" id="crtp"></td>
						</tr>
						<tr>
							<td>交易金额</td>
							<td><input type="text" class="form-control"
									   name="crat" id="crat"></td>
						</tr>
						<tr>
							<td>交易对手姓名/名称</td>
							<td><input type="text" class="form-control"
									   name="tcnm" id="tcnm"></td>
						</tr>
						<tr>
							<td>交易对手特约商户编号</td>
							<td><input type="text" class="form-control"
									   name="tsmi" id="tsmi"></td>
						</tr>
						<tr>
							<td>交易对手证件/证明文件类型</td>
							<td><input type="text" class="form-control"
									   name="tcit" id="tcit"></td>
						</tr>
						<tr>
							<td>交易对手证件/证明文件号码</td>
							<td><input type="text" class="form-control"
									   name="tcid" id="tcid"></td>
						</tr>
						<tr>
							<td>交易对手的银行账号种类</td>
							<td><input type="text" class="form-control"
									   name="tcat" id="tcat"></td>
						</tr>
						<tr>
							<td>交易对手的银行账号</td>
							<td><input type="text" class="form-control"
									   name="tcba" id="tcba"></td>
						</tr>
						<tr>
							<td>交易对手银行账号的开户银行名称</td>
							<td><input type="text" class="form-control"
									   name="tcbn" id="tcbn"></td>
						</tr>
						<tr>
							<td>交易对手的支付账户种类</td>
							<td><input type="text" class="form-control"
									   name="tctt" id="tctt"></td>
						</tr>
						<tr>
							<td>交易对手的支付账户号码</td>
							<td><input type="text" class="form-control"
									   name="tcta" id="tcta"></td>
						</tr>
						<tr>
							<td>交易对手所在支付机构的名称</td>
							<td><input type="text" class="form-control"
									   name="tcpn" id="tcpn"></td>
						</tr>
						<tr>
							<td>交易对手所在支付机构的银行账号</td>
							<td><input type="text" class="form-control"
									   name="tcpa" id="tcpa"></td>
						</tr>
						<tr>
							<td>交易对手所在支付机构银行账号的开户银行名称</td>
							<td><input type="text" class="form-control"
									   name="tpbn" id="tpbn"></td>
						</tr>
						<tr>
							<td>交易对手的交易IP地址</td>
							<td><input type="text" class="form-control"
									   name="tcip" id="tcip"></td>
						</tr>
						<tr>
							<td>交易商品名称</td>
							<td><input type="text" class="form-control"
									   name="tmnm" id="tmnm"></td>
						</tr>
						<tr>
							<td>银行与支付机构之间的业务交易编码</td>
							<td><input type="text" class="form-control"
									   name="bptc" id="bptc"></td>
						</tr>
						<tr>
							<td>支付机构与商户之间的业务交易编码</td>
							<td><input type="text" class="form-control"
									   name="pmtc" id="pmtc"></td>
						</tr>
						<tr>
							<td>业务标识号</td>
							<td><input type="text" class="form-control"
									   name="ticd" id="ticd"></td>
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
<script  type="text/javascript" >
	function format(str){
		return str==undefined?"":str;
	}

	function hideCover() {
		$("#cover").css("display", 'none');
	}

	function update(ri){
		$("#dealUpdate")[0].reset();
		//赋值
		$("#dealId").val(format(ri.id));
		$("#cbifBatchNo").val(format(ri.cbifBatchNo));
		$("#ctifsSeqNo").val(format(ri.ctifsSeqNo));
		$("#stifsSeqNo").val(format(ri.stifsSeqNo));
		$("#ctnm").val(format(ri.ctnm));
		$("#citp").val(format(ri.citp));
		$("#ctid").val(format(ri.ctid));
		$("#cbat").val(format(ri.cbat));
		$("#cbac").val(format(ri.cbac));
		$("#cabm").val(format(ri.cabm));
		$("#ctat").val(format(ri.ctat));
		$("#ctac").val(format(ri.ctac));
		$("#cpin").val(format(ri.cpin));
		$("#cpba").val(format(ri.cpba));
		$("#cpbn").val(format(ri.cpbn));
		$("#ctip").val(format(ri.ctip));
		$("#tstm").val(format(ri.tstm));
		$("#cttp").val(format(ri.cttp));
		$("#tsdr").val(format(ri.tsdr));
		$("#crpp").val(format(ri.crpp));
		$("#crtp").val(format(ri.crtp));
		$("#crat").val(format(ri.crat));
		$("#tcnm").val(format(ri.tcnm));
		$("#tsmi").val(format(ri.tsmi));
		$("#tcit").val(format(ri.tcit));
		$("#tcid").val(format(ri.tcid));
		$("#tcat").val(format(ri.tcat));
		$("#tcba").val(format(ri.tcba));
		$("#tcbn").val(format(ri.tcbn));
		$("#tctt").val(format(ri.tctt));
		$("#tcta").val(format(ri.tcta));
		$("#tcpn").val(format(ri.tcpn));
		$("#tcpa").val(format(ri.tcpa));
		$("#tpbn").val(format(ri.tpbn));
		$("#tcip").val(format(ri.tcip));
		$("#tmnm").val(format(ri.tmnm));
		$("#bptc").val(format(ri.bptc));
		$("#pmtc").val(format(ri.pmtc));
		$("#ticd").val(format(ri.ticd));
		$("#description").val(format(ri.description));



		$("#dealUpdate").dialog({
			title:"修改可疑交易信息",
			autoOpen:true,
			modal:true,
			width:500,
			height:800,
			buttons:{
				"确定":function(){
					//校验
//					showCover();
					var dialog=$(this);
					//submit
					var url="<%=request.getContextPath()%>/risk/updateDeal";
					var params=$("#dealUpdate").serialize();
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
