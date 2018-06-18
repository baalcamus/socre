<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>跨境账户查询</title>
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
                    <li>账户管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li>跨境账户管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
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
                        <form id="queryForm" action="<%=request.getContextPath()%>/cbAccount/selectCbAccountList.do" method="post"
                              enctype="multipart/form-data" class="form-horizontal ">
                            <input type="hidden" name="pageNum" value="${page.pageNum }"/>
                            <input type="hidden" name="pageSize" value="${page.pageSize }"/>
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <table width="100%" class="product_detail_list">
                                        <tr>
                                            <td width="110" class="text-right">商户编号</td>
                                            <td>
                                                <input type="text" maxlength="32" id="customerNo" name="customerNo"
                                                       value="${cbAccount.customerNo}" class="form-control">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <table width="100%" class="product_detail_list">
                                        <tr>
                                            <td width="110" class="text-right">币种</td>
                                            <td>
                                                <select class="form-control" tabindex="10" name="currencyEnum"
                                                        id="currencyEnum">
                                                    <option <c:if test="${cbAccount.currencyEnum==''}">selected="selected"</c:if> value=""> 全部
                                                    </option>
                                                    <c:forEach var="currency" items="${fns:getCurrencys() }">
	                                                    <option <c:if test="${cbAccount.currencyEnum==currency}">selected="selected"</c:if> value="${currency }">${currency.unit }
	                                                    </option>
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
                        <h2 class="panel-inner-title02">列表
                       <!--  <button onclick="add();"
									class="pull-right btn btn-primary">新增</button> -->
								<span class="pull-right">&nbsp;&nbsp;&nbsp;</span>
                        <a href="javascript:formSubmit()" class="pull-right"><i
                                class="fa fa-refresh"></i>刷新</a></h2>
                    </header>
                    <div class=" panel-body clearfix">
                        <div class="table-responsive border0">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th><span>操作</span></th>
                                    <th><span>账户编号</span></th>
                                    <th><span>商户编号</span></th>
                                    <th><span>账户状态</span></th>
                                    <th><span>账户类型</span></th>
                                    <th><span>账户余额</span></th>
                                    <th><span>币种</span></th>
                                    <th><span>可提现额度</span></th>
                                    <th><span>冻结额度</span></th>
                                    <th><span>备注</span></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${page.list}" var="cbAccount" >
                                    <tr>
                                        <td>
                                           <a href="#1" onclick='adjustBalance(${fns:toJson(cbAccount)});'>调账</a>
                                        </td>
                                        <td>${cbAccount.accountNo}</td>
                                        <td>${cbAccount.customerNo}</td>
                                        <td>${fns:getEnumFieldValue('com.chinagpay.cb.account.facade.enumtype.AccountStatusEnum','',cbAccount.status,'description') }</td>
                                        <td>${fns:getEnumFieldValue('com.chinagpay.cb.account.facade.enumtype.AccountType','',cbAccount.accountType,'des') }</td>
                                        <td><fmt:formatNumber value="${cbAccount.balance}" pattern="#,##0.00"/></td>
                                        <td>${cbAccount.currencyEnum.unit } </td>
                                        <td><fmt:formatNumber value="${cbAccount.withdrawAmount}" pattern="#,##0.00"/></td>
                                        <td><fmt:formatNumber value="${cbAccount.freezeAmount}" pattern="#,##0.00"/></td>
                                        <td>${cbAccount.remark}</td>
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
		<div id="adjust_panel" style="display: none">
				<form name="adjustForm">
					<div class="form-group" id="accountNo_div">
					    <label for="accountNo">账号</label>
					    <input type="text" class="form-control" id="accountNo" name="accountNo" readonly="readonly">
  					  </div>
					  <div class="form-group">
					  	<label for="result">调账方式</label>
					  	<select name="direction" id="direction" class="form-control">
					  		<option value="" selected="selected">方式</option>
					  		<option value="INCREASE">调增</option>
					  		<option value="DECREASE">调减</option>
					  	</select>
					  </div>
					  <div class="form-group" id="realAmount_div">
					    <label for="ajustAmount">调账金额</label>
					    <input type="number" class="form-control" id="adjustAmount" name="adjustAmount" placeholder="请输入调账金额" onblur="checkAmount(this);"> <label
							style="color:red;" id="error"></label>
  					  </div>
  					  <div class="form-group">
					    <label for="comment">备注</label>
					    <textarea class="form-control" id="adjustComment" name="adjustComment" placeholder="请认真填写调账备注" rows="" cols=""></textarea>
  					  </div>
				</form>
			</div>
			<div id="addAccountPanel" style="display: none">
				<form name="addAccountForm">
					<div class="form-group">
					    <label for="merchantNo">商户编号</label>
					    <input type="text" class="form-control" id="merchantNo" name="merchantNo" placeholder="请仔细填写商户编号">
  					  </div>
					  <div class="form-group">
					  	<label for="result">新增币种</label>
						<div class="form-control">
						 	<label>&nbsp;&nbsp;<input name="currency" type="checkbox" value="CNY" />人民币</label>
							<label>&nbsp;&nbsp;<input name="currency" type="checkbox" value="USD" />美元</label>
							<label>&nbsp;&nbsp;<input name="currency" type="checkbox"  value="GBP">英镑</label>
							<label>&nbsp;&nbsp;<input name="currency" type="checkbox"  value="HKD">港币</label>
							<label>&nbsp;&nbsp;<input name="currency" type="checkbox"  value="CAD">加拿大元</label>
							<label>&nbsp;&nbsp;<input name="currency" type="checkbox"  value="AUD">澳大利亚元</label>
							<label>&nbsp;&nbsp;<input name="currency" type="checkbox"  value="EUR">欧元</label>
							<label>&nbsp;&nbsp;<input name="currency" type="checkbox"  value="JPY">日元</label>
							<label>&nbsp;&nbsp;<input name="currency" type="checkbox"  value="NZD">新西兰元</label>
							<label>&nbsp;&nbsp;<input name="currency" type="checkbox"  value="SGD">新加坡元</label>
							<label>&nbsp;&nbsp;<input name="currency" type="checkbox"  value="KRW">韩国元</label>
							<label>&nbsp;&nbsp;<input name="currency" type="checkbox"  value="MOP">澳门元</label>
							<label>&nbsp;&nbsp;<input name="currency" type="checkbox"  value="THB">泰国铢</label>
							<label>&nbsp;&nbsp;<input name="currency" type="checkbox"  value="CHF">瑞士法郎</label>
							<label>&nbsp;&nbsp;<input name="currency" type="checkbox"  value="SEK">瑞典克郎</label>
							<label>&nbsp;&nbsp;<input name="currency" type="checkbox"  value="DKK">丹麦克朗</label>
							<label>&nbsp;&nbsp;<input name="currency" type="checkbox"  value="NOK">挪威克朗</label>
						</div>
					  </div>
  					  <div class="form-group">
					    <label for="comment">备注</label>
					    <textarea class="form-control" id="comment" name="comment" placeholder="请认真填写调账备注" rows="" cols=""></textarea>
  					  </div>
				</form>
			</div>
</body>
<script type="text/javascript">
function isMoney(money){
	var reg = /^[\d]+[\.]{0,1}[\d]{0,2}$/;
	return reg.test(money);
}
function isRate(rate){
	var reg = /^[\d]+[\.]{0,1}[\d]{0,4}$/;
	return reg.test(rate);
}
function formatMoney(money){
	if(isMoney(money)){
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
	if(isMoney(form.value)){
		form.value=formatMoney(form.value);
	}else{
		error="金额格式错误!";
	}
	$(form).parent().children("#error").text(error);
}
	function adjustBalance(account){
		document.adjustForm.reset();
		$("#accountNo").val(account.accountNo);
		
		$("#adjust_panel").dialog({
			title:"账户调账",
			autoOpen:true,
			modal:true,
			width:300,
			height:400,
			buttons:{
				"提交":function(){
					var direction=$("#direction").val();
					if(direction==""||direction==null||direction==undefined){
						alert("请选择调账方式");
						return false;
					}
					var adjustAmount = $("#adjustAmount").val();
					if(adjustAmount==null||!isMoney(adjustAmount)){
						alert("请填写调账金额");
						return false;
					}
					var ajustComment=$("#adjustComment").val();
					if(ajustComment==null||ajustComment.trim()==""){
						alert("请认真填写调账备注");
						return false;
					}
					var url = "<%=request.getContextPath()%>/cbAccount/ajustAccount";
					var params = $(document.adjustForm).serialize();
					$.post(url,params,function(obj){
						if(obj.err){
							alert(obj.msg);
						}else{
							var msg = obj.msg;
							if(msg==null||msg==''||msg==undefined){
								msg='调账完成';
							}
							alert(msg);
							formSubmit();
						}
						$("#adjust_panel").dialog("close");
					});
				},
				"取消":function(){
					$("#adjust_panel").dialog("close");
				}
			}
		});
		return false;
	}
	function add(){
		$("#addAccountPanel").dialog({
			autoOpen:true,
			width:300,
			height:500,
			modal:true,
			buttons:{
				"提交":function(){
					var params = $(document.addAccountForm).serialize();
					var url = "<%=request.getContextPath()%>/cbAccount/addAccount";
					$.post(url,params,function(obj){
						if(obj.err){
							alert(obj.msg);
						}else{
							var msg = obj.msg;
							if(msg==null||msg==''||msg==undefined){
								msg='创建完成';
							}
							alert(msg);
							formSubmit();
						}
						$("#adjust_panel").dialog("close");
					});
				},
				"取消":function(){
					
				}
			}
		});
	}
</script>
<style type="text/css">
	input[type="checkbox"]{
		background:red;
		opacity:1!important;
	}
</style>
</html>
