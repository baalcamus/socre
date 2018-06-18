<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>反洗钱管理</title>
<script type="text/javascript">

	function mainDetail(no) {
		window.location.href="<%=request.getContextPath()%>/risk/toAMLMainDetailPage?cbifBatchNo="+no;
	}

	function detail(no) {
		window.location.href="<%=request.getContextPath()%>/risk/toAMLDetailPage?cbifBatchNo="+no;
	}

    function create(no) {
        $.ajax({
            type:'post',
            url:'<%=request.getContextPath()%>/risk/createAMLFile',
            data:{cbifBatchNo:no,type:'new'},
//            dataType:'text',
            success : function(message){

                alert(message);
				window.location.reload();
            }

        })

	}

    function downFile(no) {
        window.open("<%=request.getContextPath()%>/risk/downAMLFile?cbifBatchNo="+no+"&messageType=common");
    }


	function createRepeat(no) {
		$.ajax({
			type:'post',
			url:'/risk/createAMLFile',
			data:{cbifBatchNo:no,type:'repeat'},
//            dataType:'text',
			success : function(message){

				alert(message);
				window.location.reload();
			}

		})

	}

	function downRepeatFile(no) {
		window.open("<%=request.getContextPath()%>/risk/downAMLFile?cbifBatchNo="+no+"&messageType=repeat");
	}

    function querySendDetail(cbifBatchNo){
    	window.location.href="<%=request.getContextPath()%>/static/risk/querySendDetail?cbifBatchNo="+cbifBatchNo;
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
					<li class="active">查询</li>
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
						<h2>新增[<a href="#" onclick="addBaseInfo()">风险基本</a>&nbsp;&nbsp;<a href="#" onclick="addMainInfo()">风险主体</a>&nbsp;&nbsp;<a href="#" onclick="addTradeInfo()">风险交易</a>]</h2>
					</header>
					<div class=" panel-body clearfix">
						<div class="table-responsive border0">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>操作</th>
										<th><span>批次信息编号</span></th>
										<th><span>批次信息状态</span></th>
										<th><span>申报系统</span></th>
										<th><span>交易类型</span></th>
										<th><span>报告机构名称</span></th>
										<th><span>报告机构所在地区编码</span></th>
										<th><span>报告机构分支机构/网点代码</span></th>
										<th><span>报送次数标志</span></th>
										<th><span>初次报送的可疑交易报文名称</span></th>
										<th><span>可疑交易处理情况</span></th>
										<th><span>可疑交易处理情况</span></th>
										<th><span>可疑交易描述</span></th>
										<th><span>机构自定可疑交易标准编号</span></th>
										<th><span>可疑主体数量</span></th>
										<th><span>可疑交易数量</span></th>
										<th><span>描述</span></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="info">
										<tr>
										    <td hidden= true>${info.id}</td>
											<td>
												<a style="cursor: pointer;color: #003bb3" href="javascript:mainDetail('${info.cbifBatchNo}')">主体详情</a>&nbsp;&nbsp;
												<a style="cursor: pointer;color: #003bb3" href="javascript:detail('${info.cbifBatchNo}')">交易详情</a>&nbsp;&nbsp;
												<a style="cursor: pointer;color: #003bb3" href="javascript:querySendDetail('${info.cbifBatchNo}')">报送详情</a>&nbsp;&nbsp;
												<c:if test="${info.cbifBatchStatus=='INIT'}">
													<a style="cursor: pointer;color: #003bb3" href="javascript:void(0)" onclick="create('${info.cbifBatchNo}')">生成报文</a>
												</c:if>
												<c:if test="${info.cbifBatchStatus=='FILE_CREATED'}">
													<a style="cursor: pointer;color: #003bb3" href="javascript:void(0)" onclick="downFile('${info.cbifBatchNo}')">下载报文</a>
												</c:if>
												<c:if test="${info.cbifBatchStatus=='FAIL'}">
													<a style="cursor: pointer;color: #003bb3" href="javascript:void(0)" onclick="createRepeat('${info.cbifBatchNo}')">生成重发报文</a>
												</c:if>
												<c:if test="${info.cbifBatchStatus=='REPEAT_CREATED'}">
													<a style="cursor: pointer;color: #003bb3" href="javascript:void(0)" onclick="downRepeatFile('${info.cbifBatchNo}')">下载重发报文</a>
												</c:if>
											</td>
											<td>${info.cbifBatchNo}</td>
											<td><c:if test="${info.cbifBatchStatus=='INIT'}">初始化</c:if>
												<c:if test="${info.cbifBatchStatus=='FILE_CREATED'}">文件已创建</c:if>
												<c:if test="${info.cbifBatchStatus=='REPEAT_CREATED'}">补发已创建</c:if>
												<c:if test="${info.cbifBatchStatus=='SUCCESS'}">报送成功</c:if>
												<c:if test="${info.cbifBatchStatus=='FAIL'}">报送失败</c:if>
											</td>
											<td><c:if test="${info.applySystem=='INTERNE'}">互联网系统</c:if>
												<c:if test="${info.applySystem=='CROSS_BORDER'}">跨境系统</c:if>
												<c:if test="${info.applySystem=='PRE_CARD'}">预付卡</c:if>
											</td>
											<td><c:if test="${info.transType=='PAYMENT'}">可疑交易</c:if>
												<c:if test="${info.transType=='BEHAVIOUR'}">可疑行为</c:if>
												<c:if test="${info.transType=='ADD_PAYMENT'}">补充交易</c:if>
											</td>
											<td>${info.rinm}</td>
											<td>${info.firc}</td>
											<td>${info.fice}</td>
											<td>${info.rfsg}</td>
											<td>${info.orxn}</td>
											<td>${info.sstm}</td>
											<td>${info.stcr}</td>
											<td>${info.ssds}</td>
											<td>${info.udsi}</td>
											<td>${info.sctn}</td>
											<td>${info.ttnm}</td>
											<td>${info.description}</td>
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
<div style="display: none;">
	<form id="addMainInfo">
		<table>
			<tr>
				<td>批次信息编号</td>
				<td><input type="text" class="form-control" value="" name="cbifBatchNo"></td>
			</tr>
			<tr>
				<td>批次主体信息编号</td>
				<td><input type="text" class="form-control"  value="" name="ctifsSeqNo"></td>
			</tr>
			<tr>
				<td>可疑主体姓名/名称</td>
				<td><input type="text" class="form-control"  value="" name="ctnm"></td>
			</tr>
			<tr>
				<td>主体特约商户编号</td>
				<td><input type="text" class="form-control"  value="" name="smid"></td>
			</tr>
			<tr>
				<td>可疑主体身份证件/证明文件类型</td>
				<td><input type="text" class="form-control"  value="" name="citp"></td>
			</tr>
			<tr>
				<td>可疑主体身份证件/证明文件号码</td>
				<td><input type="text" class="form-control"  value="" name="ctid"></td>
			</tr>
			<tr>
				<td>详细住址</td>
				<td><input type="text" class="form-control"  value="" name="ctar"></td>
			</tr>
			<tr>
				<td>联系电话</td>
				<td><input type="text" class="form-control"  value="" name="cctl"></td>
			</tr>
			<tr>
				<td>电子邮件</td>
				<td><input type="text" class="form-control"  value="" name="ceml"></td>
			</tr>
			<tr>
				<td>可疑主体的职业/行业类别</td>
				<td><input type="text" class="form-control"  value="" name="ctvc"></td>
			</tr>
			<tr>
				<td>可疑主体的法定代表人姓名</td>
				<td><input type="text" class="form-control"  value="" name="crnm"></td>
			</tr>
			<tr>
				<td>可疑主体的法定代表人身份证件类型</td>
				<td><input type="text" class="form-control"  value="" name="crit"></td>
			</tr>
			<tr>
				<td>可疑主体的法定代表人身份证件号码</td>
				<td><input type="text" class="form-control"  value="" name="crid"></td>
			</tr>
		</table>
	</form>
	<form id="addBaseInfo">
		<table>
			<tr>
				<td>批次信息编号</td>
				<td><input type="text" class="form-control" value="" name="cbifBatchNo"></td>
			</tr>
			<tr>
				<td>批次信息状态</td>
				<td><select class="form-control" name="cbifBatchStatus">
						<option value="">批次信息状态
						<option value="INIT">初始化
						<option value="FILE_CREATED">文件以创建
						<option value="SUCCESS">报送成功
						<option value="FAIL">报送失败
					</select>
				</td>
			</tr>
			<tr>
				<td>申报系统</td>
				<td><select class="form-control" name="applySystem">
						<option value="">申报系统
						<option value="INTERNET">互联网系统
						<option value="CROSS_BORDER">跨境系统
						<option value="PRE_CARD">预付卡
					</select>
				</td>
			</tr>
			<tr>
				<td>交易类型</td>
				<td><select class="form-control" name="transType">
						<option value="">交易类型
						<option value="PAYMENT">可疑交易
						<option value="BEHAVIOUR">可疑行为
						<option value="ADD_PAYMENT">补充交易
					</select>
				</td>
			</tr>
			<tr>
				<td>报告机构名称</td>
				<td><input type="text" class="form-control" value="" name="rinm"></td>
			</tr>
			<tr>
				<td>报告机构所在地区编码</td>
				<td><input type="text" class="form-control" value="" name="firc"></td>
			</tr>
			<tr>
				<td>报告机构分支机构/网点代码</td>
				<td><input type="text" class="form-control" value="" name="fice"></td>
			</tr>
			<tr>
				<td>报送次数标志</td>
				<td><input type="text" class="form-control" value="" name="rfsg"></td>
			</tr>
			<tr>
				<td>初次报送的可疑交易报文名称</td>
				<td><input type="text" class="form-control" value="" name="orxn"></td>
			</tr>
			<tr>
				<td>可疑交易处理情况</td>
				<td><input type="text" class="form-control" value="" name="sstm"></td>
			</tr>
			<tr>
				<td>可疑交易特征</td>
				<td><input type="text" class="form-control" value="" name="stcr"></td>
			</tr>
			<tr>
				<td>可疑交易描述</td>
				<td><input type="text" class="form-control" value="" name="ssds"></td>
			</tr>
			<tr>
				<td>机构自定可疑交易标准编号</td>
				<td><input type="text" class="form-control" value="" name="udsi"></td>
			</tr>
			<tr>
				<td>可疑主体数量</td>
				<td><input type="text" class="form-control" value="" name="sctn"></td>
			</tr>
			<tr>
				<td>可疑交易数量</td>
				<td><input type="text" class="form-control" value="" name="ttnm"></td>
			</tr>
		</table>
	</form>
	<form id="addTradeInfo">
		<table>
			<tr>
				<td>批次信息编号</td>
				<td><input type="text" class="form-control" value="" name="cbifBatchNo"></td>
		
				<td>批次主体信息编号</td>
				<td><input type="text" class="form-control" value="" name="ctifsSeqNo"></td>
			</tr>
			<tr>
				<td>批次可疑交易编号</td>
				<td><input type="text" class="form-control" value="" name="stifsSeqNo"></td>
			
				<td>可疑主体姓名/名称</td>
				<td><input type="text" class="form-control" value="" name="ctnm"></td>
			</tr>
			<tr>
				<td>可疑主体身份证件/证明文件类型</td>
				<td><input type="text" class="form-control" value="" name="citp"></td>
			
				<td>可疑主体身份证件/证明文件号码</td>
				<td><input type="text" class="form-control" value="" name="ctid"></td>
			</tr>
			<tr>
				<td>可疑主体的银行账号种类</td>
				<td><input type="text" class="form-control" value="" name="cbat"></td>
			
				<td>可疑主体的银行账号</td>
				<td><input type="text" class="form-control" value="" name="cbac"></td>
			</tr>
			<tr>
				<td>可疑主体银行账号的开户银行名称</td>
				<td><input type="text" class="form-control" value="" name="cabm"></td>
			
				<td>可疑主体的支付账户种类</td>
				<td><input type="text" class="form-control" value="" name="ctat"></td>
			</tr>
			
			<tr>
				<td>可疑主体的支付账户账号</td>
				<td><input type="text" class="form-control" value="" name="ctac"></td>
		
				<td>可疑主体所在支付机构的名称</td>
				<td><input type="text" class="form-control" value="" name="cpin"></td>
			</tr>
			<tr>
				<td>可疑主体所在支付机构的银行账号</td>
				<td><input type="text" class="form-control" value="" name="cpba"></td>
			
				<td>可疑主体所在支付机构的银行账号的开户银行名称</td>
				<td><input type="text" class="form-control" value="" name="cpbn"></td>
			</tr>
			<tr>
				<td>可疑主体的交易IP地址</td>
				<td><input type="text" class="form-control" value="" name="ctip"></td>
			
				<td>交易时间</td>
				<td><input type="text" class="form-control" value="" name="tstm"></td>
			</tr>
			<tr>
				<td>货币资金转移方式</td>
				<td><input type="text" class="form-control" value="" name="cttp"></td>
			
				<td>资金收付标志</td>
				<td><input type="text" class="form-control" value="" name="tsdr"></td>
			</tr>
			<tr>
				<td>资金用途</td>
				<td><input type="text" class="form-control" value="" name="crpp"></td>
		
				<td>交易币种</td>
				<td><input type="text" class="form-control" value="" name="crtp"></td>
			</tr>
			<tr>
				<td>交易金额</td>
				<td><input type="text" class="form-control" value="" name="crat"></td>
			
				<td>交易对手姓名/名称</td>
				<td><input type="text" class="form-control" value="" name="tcnm"></td>
			</tr>
			<tr>
				<td>交易对手特约商户编号</td>
				<td><input type="text" class="form-control" value="" name="tsmi"></td>
		
				<td>交易对手证件/证明文件类型</td>
				<td><input type="text" class="form-control" value="" name="tcit"></td>
			</tr>
			<tr>
				<td>交易对手证件/证明文件号码</td>
				<td><input type="text" class="form-control" value="" name="tcid"></td>
			
				<td>交易对手的银行账号种类</td>
				<td><input type="text" class="form-control" value="" name="tcat"></td>
			</tr>
			<tr>
				<td>交易对手的银行账号</td>
				<td><input type="text" class="form-control" value="" name="tcba"></td>
		
				<td>交易对手银行账号的开户银行名称</td>
				<td><input type="text" class="form-control" value="" name="tcbn"></td>
			</tr>
			
			<tr>
				<td>交易对手的支付账户种类</td>
				<td><input type="text" class="form-control" value="" name="tctt"></td>
			
				<td>交易对手的支付账户号码</td>
				<td><input type="text" class="form-control" value="" name="tcta"></td>
			</tr>
			
			<tr>
				<td>交易对手所在支付机构的名称</td>
				<td><input type="text" class="form-control" value="" name="tcpn"></td>
			
				<td>交易对手所在支付机构的银行账号</td>
				<td><input type="text" class="form-control" value="" name="tcpa"></td>
			</tr>
			<tr>
				<td>交易对手所在支付机构银行账号的开户银行名称</td>
				<td><input type="text" class="form-control" value="" name="tpbn"></td>
			
				<td>交易对手的交易IP地址</td>
				<td><input type="text" class="form-control" value="" name="tcip"></td>
			</tr>
			<tr>
				<td>交易商品名称</td>
				<td><input type="text" class="form-control" value="" name="tmnm"></td>
		
				<td>银行与支付机构之间的业务交易编码</td>
				<td><input type="text" class="form-control" value="" name="bptc"></td>
			</tr>
			<tr>
				<td>支付机构与商户之间的业务交易编码</td>
				<td><input type="text" class="form-control" value="" name="pmtc"></td>
		
				<td>业务标识号</td>
				<td><input type="text" class="form-control" value="" name="ticd"></td>
			</tr>
		</table>
	</form>
</div>
<script type="text/javascript">
	function addBaseInfo(){
		$("#addBaseInfo")[0].reset();
		$("#addBaseInfo").dialog({
			autoOpen:true,
			title:"风险基本",
			modal:true,
			buttons:{
				"确定":function(){
					var params=$("#addBaseInfo").serialize();
					var url = "<%=request.getContextPath() %>/static/risk/addBaseInfo";
					$.post(url,params,function(res){
						if(res.err==false){
							alert("保存成功!");
							location.reload();
						}else{
							alert(res.msg);
						}
					});
				}
			}
		});
	}
	function addMainInfo(){
		$("#addMainInfo")[0].reset();
		$("#addMainInfo").dialog({
			title:"风险主体",
			autoOpen:true,
			modal:true,
		
			buttons:{
				"确定":function(){
					var params=$("#addMainInfo").serialize();
					var url = "<%=request.getContextPath() %>/static/risk/addMainInfo";
					$.post(url,params,function(res){
						if(res.err==false){
							alert("保存成功!");
							location.reload(); 
						}else{
							alert(res.msg);
						}
					});
					
				}
			}
		});
	}
	function addTradeInfo(){
		$("#addTradeInfo")[0].reset();
		$("#addTradeInfo").dialog({
			title:"风险信息",
			autoOpen:true,
			modal:true,
			width:"900px",
			buttons:{
				"确定":function(){
					var params=$("#addTradeInfo").serialize();
					var url = "<%=request.getContextPath() %>/static/risk/addTradeInfo";
					$.post(url,params,function(res){
						if(res.err==false){
							alert("保存成功!");
							location.reload(); 
						}else{
							alert(res.msg);
						}
					});
					
				}
			}
		});
	}
</script>
</body>
</html>
