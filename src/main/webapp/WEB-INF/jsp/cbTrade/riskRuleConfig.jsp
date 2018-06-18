<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>跨境风控配置</title>
    <style type="text/css">
    	.red{
    		color: red;
    	}
    </style>
</head>
<script type="text/javascript">
    function formSubmit() {
        $("#queryForm").submit();
    }
</script>

<body class=" ">
<!-- 头部 -->
<jsp:include page="../include/top.jsp"/>
<div id="wrapper">
    <div>
        <jsp:include page="../include/bottom.jsp"/>
        <!-- 左侧内容 -->
        <jsp:include page="../include/left.jsp"/>
        <!--右侧内容 start-->
        <div id="page-wrapper">
            <!--BEGIN TITLE & BREADCRUMB PAGE-->
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <ol class="breadcrumb page-breadcrumb">
                    <li><i class="fa fa-home"></i>&nbsp;<a href="<%=request.getContextPath()%>/main/toMain.do">首页</a>&nbsp;&nbsp;<i
                            class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li>风控管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li>风控规则配置&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
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
                        <form id="queryForm" action="<%=request.getContextPath()%>/cbTrade/riskRuleConfigQuery" method="post"
                              enctype="multipart/form-data" class="form-horizontal ">
                            <input type="hidden" name="pageNum" value="${page.pageNum }"/>
                            <input type="hidden" name="pageSize" value="${page.pageSize }"/>
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <table width="100%" class="product_detail_list">
                                        <tr>
                                            <td width="110" class="text-right">商户编号</td>
                                            <td>
                                                <input type="text" maxlength="32" name="merchantNo"
                                                       value="${riskRuleConfig.merchantNo}" class="form-control">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                               <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <table width="100%" class="product_detail_list">
                                        <tr>
                                            <td width="110" class="text-right">业务范围</td>
                                            <td>
                                               <select name="businessRange">
                                               			<option value="">所有</option>
                                              	 	<c:forEach var="_biz_range_" items="${fns:getEnumValues(\"com.chinagpay.common.constant.BusinessConstant\",\"ForexBusinessRangeEnum2\")}">
                                               				<option  <c:if test="${riskRuleConfig.businessRange==_biz_range_.value }"> selected="selected"</c:if> value="${_biz_range_.value }">${_biz_range_.des }</option>
                                               		</c:forEach>
                                               </select>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <table width="100%" class="product_detail_list">
                                        <tr>
                                            <td>
                                                <button type="submit" id="btnSubmit" class="btn btn-primary">
                                                    <i class="fa fa-search"></i> 查询
                                                </button>
                                            </td>
                                            <td>

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
                        <h2 class="panel-inner-title02">列表<a href="javascript:formSubmit()" class="pull-right"><i
                                class="fa fa-refresh"></i>刷新</a></h2>
                    </header>
                    <div class=" panel-body clearfix">
                        <div class="table-responsive border0">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th><span>操作</span></th>
                                    <th><span>风控项目</span></th>
                                    <th><span>商户编号</span></th>
                                    <th><span>业务范围</span></th>
                                    <th><span>单笔限额(美元)</span></th>
                                    <th><span>单价限额(人民币)</span></th>
                                    <th><span>个人买家次数/月</span></th>
                                    <th><span>运单号抽取比率(表达式)</span></th>
                                    <th><span>运单号抽取通过比率(百分比)</span></th>
                                    <th><span>实名认证抽取比率(表达式)</span></th>
                                    <th><span>实名认证抽取通过比率(百分比)</span></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${page.list}" var="config" >
                                    <tr>
                                        <td>
                                            <a href="#" onclick='showDetail(${fns:toJson(config)});return false;'>修改</a>
                                            &nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td>${config.product}</td>
                                        <td>${config.merchantNo}</td>
                                        <td>${fns:getEnumFieldValue("com.chinagpay.common.constant.BusinessConstant","ForexBusinessRangeEnum2",config.businessRange,"des") }</td>
                                       <!--  <td>${config.businessRange}</td> -->
                                        <td><fmt:formatNumber value="${config.singleMaxAmount}" pattern="#,##0.00"/></td>
                                        <td><fmt:formatNumber value="${config.unitPrice}" pattern="#,##0.00"/></td>
                                        <td>${config.personFrequency}</td>
                                        <td>${config.transportNoRate}</td>
                                        <td><fmt:formatNumber value="${config.transportPassRate*100}" pattern="0.00"/></td>
                                        <td>${config.idNoRate}</td>
                                        <td><fmt:formatNumber value="${config.idNoPassRate*100}" pattern="0.00"/></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>


                <jsp:include page="../include/page.jsp"/>
            </div>
            <!--这是列表模块结束-->
        </div>
        <!--End CONTENT-->
    </div>
    <!--右侧内容 end-->
</div>
<div id="dtl" style="display:none">
	<form id="dtl_modify_form" name="dtl_modify_form">
	  <input type="hidden" id="dtl_id" name="id">
	  <div class="form-inline">
	    <label for="dtl_product" class="col-lg-5">风控项目</label>
	    <input type="text" class="form-control" id="dtl_product" name="product" placeholder="风控项目" readonly="readonly">
	  </div>
	  <div class="form-inline">
	    <label for="dtl_product" class="col-lg-5">商户编号</label>
	    <input type="text" class="form-control" id="dtl_merchantNo" name="merchantNo" placeholder="商户编号" readonly="readonly">
	  </div>
	  <div class="form-inline">
	    <label for="dtl_product" class="col-lg-5">业务范围</label>
	    <input type="text" class="form-control" id="dtl_businessRange" name="businessRange" placeholder="业务范围" readonly="readonly">
	  </div>
	  <div class="form-inline">
	    <label for="dtl_singleMaxAmount" class="col-lg-5">单笔限额(美元)</label>
	    <input onblur="checkAmount(this);" type="number" class="form-control" id="dtl_singleMaxAmount" name="singleMaxAmount" placeholder="单笔限额(美元)">
	  </div>
	  <div class="form-inline">
	    <label for="dtl_unitPrice" class="col-lg-5">单价限额(人民币)</label>
	    <input  onblur="checkAmount(this);" type="number" class="form-control" id="dtl_unitPrice" name="unitPrice" placeholder="单价限额(人民币)">
	  </div>
	  <div class="form-inline">
	    <label for="dtl_personFrequency" class="col-lg-5">个人买家次数/月</label>
	    <input onblur="checkPersonFrequency(this);" type="number" class="form-control" id="dtl_personFrequency" name="personFrequency" placeholder="个人买家次数/月">
	  </div>
	  <div class="form-inline">
	    <label for="dtl_transportNoRate" class="col-lg-5">运单号抽取比率(表达式)</label>
	    <input onblur="checkOgnl(this);" type="text" class="form-control" id="dtl_transportNoRate" name="transportNoRate" placeholder="运单号抽取比率">
	  </div>
	  <div class="form-inline">
	    <label for="dtl_transportPassRate" class="col-lg-5">运单号抽取通过比率(百分比)</label>
	    <input onblur="checkPercentage(this);" type="number" class="form-control" id="dtl_transportPassRate" name="transportPassRate" placeholder="运单号抽取通过比率">%
	  </div>
	  <div class="form-inline">
	    <label for="dtl_idNoRate" class="col-lg-5">实名认证抽取比率(表达式)</label>
	    <input onblur="checkOgnl(this);" type="text" class="form-control" id="dtl_idNoRate" name="idNoRate" placeholder="实名认证抽取比率">
	  </div>
	  <div class="form-inline">
	    <label for="dtl_idNoPassRate" class="col-lg-5">实名认证抽取通过比率(百分比)</label>
	    <input onblur="checkPercentage(this);" type="number" class="form-control" id="dtl_idNoPassRate" name="idNoPassRate" placeholder="实名认证抽取通过比率">%
	  </div>
	</form>
</div>
<script type="text/javascript">
	function showDetail(config){
		var id=config.id;
		var merchantNo=config.merchantNo;
		var businessRange=config.businessRange;
		var product=config.product;//产品
		var singleMaxAmount=config.singleMaxAmount;//单笔限额
		var unitPrice=config.unitPrice;//单价限额
		var personFrequency=config.personFrequency;//个人买家月频率
		var transportNoRate=config.transportNoRate;//运单号抽取比率
		var transportPassRate=config.transportPassRate*100;//运单号抽取通过比率
		var idNoRate=config.idNoRate;//实名认证抽取比率
		var idNoPassRate=config.idNoPassRate*100;//实名认证抽取通过比率
		$("#dtl_id").val(id);
		$("#dtl_merchantNo").val(merchantNo);
		$("#dtl_businessRange").val(businessRange);
		$("#dtl_product").val(product);
		$("#dtl_singleMaxAmount").val(singleMaxAmount);
		$("#dtl_unitPrice").val(unitPrice);
		$("#dtl_personFrequency").val(personFrequency);
		$("#dtl_transportNoRate").val(transportNoRate);
		$("#dtl_transportPassRate").val(transportPassRate);
		$("#dtl_idNoRate").val(idNoRate);
		$("#dtl_idNoPassRate").val(idNoPassRate);
		
		$("#dtl").dialog({
			autoOpen:true,
			width:500,
			modal:true,
			buttons:{
				"提交":function(){
					if(		  checkAmount($("#dtl_singleMaxAmount").get(0))
							&&checkAmount($("#dtl_unitPrice").get(0))
							&&checkPersonFrequency($("#dtl_personFrequency").get(0))
							&&$("#dtl_transportNoRate").get(0)
							&&checkPercentage($("#dtl_transportPassRate").get(0))
							&&$("#dtl_idNoRate").get(0)
							&&checkPercentage($("#dtl_idNoPassRate").get(0))
					){
						var param = $('#dtl_modify_form').serializeArray();
						var url = '<%=request.getContextPath() %>/cbTrade/riskRuleConfigUpdate';
						$.post(url,param,function(data){
							if(data.err){
								alert(data.msg);
							}else{
								alert("配置成功!");
								formSubmit();
							}
						});
					}else{
						alert("请仔细检查填写信息!");
					}
				},
				"取消":function(){
					
					$("#dtl").dialog("close");
				},
				"检测":function(){
					
				}
				
			}
		});
	}
	function isNull(val){
		return val==undefined||val==null||val.length==0;
	}
	function checkOgnl(form){
		var error="";
		if(!isNull($(form).val())){
			$(form).val($(form).val());
			$(form).parent().children("#error").remove();
			return true;
		}else{
			error="表达式格式错误!";
			try{
				$(form).parent().children("#error").remove();
			}catch(e){
			}
			$(form).parent().append("<i class='red' id='error'>"+error+"</i>");
			return false;
		}
	}
	function formatMoney(money){
		if(checkNumber(money,2)){
			var index = money.indexOf(".");
			if(index==-1){
				money=money+".00";
				return money;
			}
			while(money.substring(index).length<3){
				money=money+"0";
			}
			return money;
		}
	}
	function checkAmount(form){
		var error="";
		if(checkNumber($(form).val(),2)){
			$(form).val(formatMoney($(form).val()));
			$(form).parent().children("#error").remove();
			return true;
		}else{
			error="金额格式错误!";
			try{
				$(form).parent().children("#error").remove();
			}catch(e){
			}
			$(form).parent().append("<i class='red' id='error'>"+error+"</i>");
			return false;
		}
	}
	function checkPercentage(form){
		var error="";
		if(!checkNumber($(form).val(),4)){
			error="格式错误!"
			try{
				$(form).parent().children("#error").remove();
			}catch(e){
			}
			$(form).parent().append("<i class='red' id='error'>"+error+"</i>");
			return false;
		}else{
			$(form).parent().children("#error").remove();
			return true;
		}
	}
	function checkPersonFrequency(form){
		var error="";
		if(!checkNumber($(form).val(),0)){
			error="格式错误!"
			try{
				$(form).parent().children("#error").remove();
			}catch(e){
			}
			$(form).parent().append("<i class='red' id='error'>"+error+"</i>");
			return false;
		}else{
			$(form).parent().children("#error").remove();
			return true;
		}
	}
	function checkNumber(number,scale){
		var reg = eval("/^[\\d]+[\\.]{0,1}[\\d]{0,"+scale+"}$/");
		return reg.test(number);
	}
</script>
</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/statics/v2/js/jquery.acronymword.js"></script>
<script type="text/javascript">
    function ContractWord(){
		$('#result_tab tr td,:nth-of-type(8),:nth-of-type(10)').each(function(){
			$(this).AcronymWord({
				delay:1500,
				acronymChar:'...',
				len:15
			});
		});
	}
	$(document).ready(function(){
		ContractWord();
	});
</script>
</html>
