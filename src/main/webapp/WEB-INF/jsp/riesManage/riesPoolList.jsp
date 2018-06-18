<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>风险信息汇总查询</title>
<script type="text/javascript">
	var contextpath = "${ctx}";
	
	function query() {
		if($("#CusProperty").val() === ''){
			
			alert("请选择客户属性");
			return false;
		}
		if($("#Info").val() === ''){
			
			alert("请填写关键字信息");
			return false;
		}
		$("#queryForm").attr("action", "<%=request.getContextPath()%>/riesManage/riesPoolPage");
		$("#queryForm").submit();
	}
	var pkeyword ={
			'01':'手机',
			'02':'Imei',
			'03':'MAC',
			'04':'银行账/卡号',
			'05':'证件号码',
			'06':'收款银行账/卡号',
			'07':'邮箱',
			'08': 'IP'
	};
	var cuskeyword = {
			'01':'商户简称',
			//'02':'组织机构代码',
			'03':'法人证件号码',
			'04':'服务器IP',
			'05':'法定代表人(负责人)手机号',
			'06':'商户名称',
			'07':'法定代表人(负责人)证件号码',
			'08':'银行账号',
			'09':'网址',
			'10':'ICP编号'
	};
	
    var personTypeData =
        {
    		'01':'虚假申请（受害人信息）',
    		'02':'虚假申请（嫌疑人信息）',
    		'03':'伪卡（受害人信息）',
    		'04':'失窃卡（受害人信息）',
    		'05':'未达卡（受害人信息）',
    		'06':'银行卡转移（受害人信息）',
    		'07':'盗用银行卡（嫌疑人信息）',
    		'08':'银行卡网络欺诈（受害人信息）',
    		'09':'银行卡网络欺诈（嫌疑人信息）',
    		'10':'虚拟账户被盗（受害人信息）',
    		'11':'盗用虚拟账户（嫌疑人信息）',
    		'12':'套现、套积分（嫌疑人信息）',
    		'13':'协助转移赃款',
    		'14':'买卖或租借银行（支付）账户',
    		'15':'专案风险信息',
    		'16':'买卖银行卡信息',
    		'99':'其他'
        };

    var cumTypeData =
    {
    		'01':'虚假申请',
    		'02':'套现、套积分',
    		'03':'违法经营',
    		'04':'销赃',
    		'05':'买卖或租借银行（支付）账户',
    		'06':'侧录点',
    		'07':'伪卡集中使用点',
    		'08':'泄露账户及交易信息',
    		'09':'恶意倒闭',
    		'10':'恶意分单',
    		'11':'移机',
    		'12':'高风险商户',
    		'13':'商户合谋欺诈',
    		'14':'破产或停业商户',
    		'15':'强迫签单',
    		'17':'频繁变更服务机构',
    		'18':'关联商户涉险',
    		'19':'买卖银行卡信息',
    		'20':'拒刷信用卡',
    		'21':'转嫁手续费',
    		'99':'其他'
        };

    function gradeChange(){
    	
    	$('#RiskType').html('');
    	$('#KeyWord').html('');
        if($("#CusProperty").val() === '01'){

                for(var i in personTypeData){
                    $('#RiskType').append('<option value="'+i+'">'+personTypeData[i]+'</option>');
                }
                for(var i in pkeyword){
                    $('#KeyWord').append('<option value="'+i+'">'+pkeyword[i]+'</option>');
                }
        }

        if($("#CusProperty").val() === '02'){
            for(var i in cumTypeData){
                $('#RiskType').append('<option value="'+i+'">'+cumTypeData[i]+'</option>');
            }
            for(var i in cuskeyword){
                $('#KeyWord').append('<option value="'+i+'">'+cuskeyword[i]+'</option>');
            }
        }
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
					<li>支付风险信息管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li>风险信息汇总查询&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
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
						<h2 class="panel-title">操作</h2>
					</div>
					<div class="panel-body">
						<div class="row">
					<form action="" method="post"  id="queryForm" class="queryForm" enctype="multipart/form-data" class="form-horizontal ">
								<input type="hidden" name="pageNum" value="${page.pageNum }" />
								<input type="hidden" name="pageSize" value="${page.pageSize }" />
								<div class="panel-inner">
																	<div class="panel-inner-body">
										<div class="row" id="agent1">
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">客户属性<span>*</span></td>
														<td><select name="CusProperty" id="CusProperty" class="form-control" onchange="gradeChange()" >
																<option
																	<c:if test="${riskInfoPoolDTO.cusProperty==''}">selected="selected"</c:if>
																	value="">请选择</option>
																<c:forEach var="_value"
																	items="${fns:getEnumValues(\"com.chinagpay.ries.enumtype.RiseEnum\",\"ClientPropertyEnum\")}">
																	<option
																		<c:if test="${riskInfoPoolDTO.cusProperty==_value.code }"> selected="selected"</c:if>
																		value="${_value.code }">${_value.des }</option>
																</c:forEach>
														</select></td>
													</tr>
												</table>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">关键字<span>*</span></td>
														<td>
															
															<select name="KeyWord" id="KeyWord" class="form-control"  >
																<option
																	<c:if test="${riskInfoPoolDTO.keyWord==''}">selected="selected"</c:if>
																	value="">请选择</option>
																													<c:choose>
   <c:when test="${riskInfoPoolDTO.cusProperty== '01' }">  
		<c:forEach var="_value"
			items="${fns:getEnumValues(\"com.chinagpay.ries.enumtype.RiseEnum\",\"PersonKeywordEnum\")}">
			<option
				<c:if test="${riskInfoPoolDTO.keyWord==_value.code }"> selected="selected"</c:if>
				value="${_value.code }">${_value.des }</option>
		</c:forEach>     
   </c:when>
   <c:when test="${riskInfoPoolDTO.cusProperty== '02' }">  
		<c:forEach var="_value"
			items="${fns:getEnumValues(\"com.chinagpay.ries.enumtype.RiseEnum\",\"CustomKeywordEnum\")}">
			<option
				<c:if test="${riskInfoPoolDTO.keyWord==_value.code }"> selected="selected"</c:if>
				value="${_value.code }">${_value.des }</option>
		</c:forEach>     
   </c:when>
</c:choose>		
														</select>
															
															</td>
													</tr>
												</table>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">关键字信息<span>*</span></td>
														<td><input type="text" class="form-control" id="Info"
															name="Info" value="${riskInfoPoolDTO.info}"></td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								
								
									<div class="panel-inner-body">
										<div class="row" id="agent1">
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">风险类型<span>*</span></td>
														<td><select name="RiskType" id="RiskType" class="form-control">
																																				<option
																	<c:if test="${riskInfoPoolDTO.riskType==''}">selected="selected"</c:if>
																	value="">请选择</option>
														<c:choose>
   <c:when test="${riskInfoPoolDTO.cusProperty== '01' }">  
		<c:forEach var="_value"
			items="${fns:getEnumValues(\"com.chinagpay.ries.enumtype.RiseEnum\",\"RiskStatusEnum\")}">
			<option
				<c:if test="${riskInfoPoolDTO.riskType==_value.code }"> selected="selected"</c:if>
				value="${_value.code }">${_value.des }</option>
		</c:forEach>     
   </c:when>
   <c:when test="${riskInfoPoolDTO.cusProperty== '02' }">  
		<c:forEach var="_value"
			items="${fns:getEnumValues(\"com.chinagpay.ries.enumtype.RiseEnum\",\"RiskCumStatusEnum\")}">
			<option
				<c:if test="${riskInfoPoolDTO.riskType==_value.code }"> selected="selected"</c:if>
				value="${_value.code }">${_value.des }</option>
		</c:forEach>     
   </c:when>
</c:choose>
														
												
														</select></td>
													</tr>
												</table>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">风险信息上报开始时间 </td>
														<td>														<input class="form-control" id="StartTime"
										name="StartTime" value="${riskInfoPoolDTO.startTime}"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" /></td>
													</tr>
												</table>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<table width="100%" class="product_detail_list">
													<tr>
														<td width="120" class="text-right">风险信息上报结束时间</td>
														<td>														<input class="form-control" id="EndTime"
										name="EndTime" value="${riskInfoPoolDTO.endTime}"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" /></td>
													</tr>
												</table>
											</div>
										</div>
									</div>
									

									
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
						</div>
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
										<th><span>字段</span></th>
										<th><span>内容</span></th>
										<th><span>出现有效次数</span></th>
										<th><span>涉及机构数量</span></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${riskInfoPoolRespDTOList}" var="Pool">
										<tr>
											<td>${Pool.element}</td>
											<td>${Pool.info}</td>
											<td>${Pool.validNum}</td>
											<td>${Pool.invOrgNum}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!--这是列表模块结束-->
			</div>
			<!--End CONTENT-->
		</div>
		<!--右侧内容 end-->
	</div>
	
	
</body>
</html>
