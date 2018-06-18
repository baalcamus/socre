<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<html lang="en">
<head>
<title>汇款通知审核</title>
<style type="text/css">
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
	function showCover(){$("#cover").css("display",'');}
	function hideCover(){$("#cover").css("display",'none');}
</script>
</head>
<body class="">
	<div id="cover" style="display: none;">
	 	<img src="<%=request.getContextPath() %>/statics/v2/images/wait_processing.gif">
	</div>
	<jsp:include page="../include/top.jsp" />
	<div id="wrapper">
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
					<li>账户管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li>跨境账户汇款通知&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>
					<li>审核&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;
					</li>

				</ol>
				<div class="clearfix"></div>
			</div>
			<!--END TITLE & BREADCRUMB PAGE-->
			<!--BEGIN CONTENT-->
			<div class="page-content">
				<div class="panel panel-default  withoutbottom clearfix">
					<header class="panel-heading clearfix">
						<h2 class="panel-title">汇款通知明细</h2>
					</header>
				</div>
				<div>
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td><label>商户账户[爱农]</label></td>
								<td><span>${account.accountNo}</span></td>
							</tr>
							<tr>
								<td><label>商户账户币种[爱农]</label></td>
								<td><span>${fns:getCurrency(account.currencyEnum)}</span></td>
								<td><label>账户余额[爱农]</label></td>
								<td><span><fmt:formatNumber
											value="${account.balance}" pattern="#,##0.00" /></span></td>
							</tr>
							<tr>
								<th colspan="4">
									<hr>
								</th>
							</tr>
							<tr>
								<td><label>商户编号</label></td>
								<td><span>${mctRemitNotify.merchantNo}</span></td>
								<td><label>通知流水</label></td>
								<td><span>${mctRemitNotify.notifySerialNo}</span></td>
							</tr>
							<tr>
								<td><label>通知时间</label></td>
								<td><span><fmt:formatDate
											value="${mctRemitNotify.notifyTime}"
											pattern="yyyy-MM-dd HH:mm:ss" /></span></td>
								<td><label>通知状态</label></td>
								<td><span><c:choose>
											<c:when test="${mctRemitNotify.notifyStatus=='PROCESSING'}">处理中</c:when>
											<c:when test="${mctRemitNotify.notifyStatus=='SUCCESS'}">处理成功</c:when>
											<c:when test="${mctRemitNotify.notifyStatus=='FAIL'}">处理失败</c:when>
											<c:when
												test="${mctRemitNotify.notifyStatus=='WAIT_EXG_SETTLE'}">待收结汇</c:when>
											<c:when
												test="${mctRemitNotify.notifyStatus=='EXG_SETTLE_PRO'}">结汇处理中</c:when>
											<c:otherwise>${mctRemitNotify.notifyStatus}</c:otherwise>
										</c:choose></span></td>
							</tr>
							<tr>
								<td><label>汇款帐户名</label></td>
								<td><span>${mctRemitNotify.accountName}</span></td>
								<td><label>汇款账户号</label></td>
								<td><span>${mctRemitNotify.accountNo}</span></td>
							</tr>
							<tr>
								<td><label>开户行</label></td>
								<td><span>${mctRemitNotify.bankName}</span></td>
								<td><label>汇款日期</label></td>
								<td><span><fmt:formatDate
											value="${mctRemitNotify.remitDate}" pattern="yyyy-MM-dd" /></span></td>

							</tr>
							<tr>
								<td><label>汇款币种</label></td>
								<td><span>${fns:getCurrency(mctRemitNotify.remitCurrency)}</span></td>
								<td><label>通知汇款金额</label></td>
								<td><span><fmt:formatNumber
											value="${mctRemitNotify.remitAmount}" pattern="#,##0.00" /></span></td>
							</tr>
							<tr>
								<th colspan="4">
									<hr>
								</th>
							</tr>
							<tr>
								<td><label>汇款到账金额</label></td>
								<td><span><fmt:formatNumber
											value="${mctRemitNotify.realAmount}" pattern="#,##0.00" /></span></td>
								<td><label>备注</label></td>
								<td><p>${mctRemitNotify.comments}</p></td>
							</tr>
							<c:if test="${mctRemitNotify.notifyStatus=='PROCESSING'}">
								<tr>
									<td>
										<button id="btn_show_check" class="btn btn-danger"
											onclick="javascript:showCheckPop();">审核</button>
									</td>
								</tr>
							</c:if>
						</tbody>
					</table>
					<!-- 下载_汇款凭证 -->
					<div id="notifyCert">
					</div>
				</div>
			</div>
			<div id="check_panel">
				<form id="checkForm">
					  <input type="hidden" name="notifySerialNo" value="${mctRemitNotify.notifySerialNo}">
					  <div class="form-group">
					  	<label for="result">审核结果</label>
					  	<select name="checkResult" id="check_result" class="form-control">
					  		<option value="" selected="selected">审核结果</option>
					  		<option value="SUCCESS">审核通过</option>
					  		<option value="FAIL">审核未通过</option>
					  	</select>
					  </div>
					  <div class="form-group" id="realAmount_div">
					    <label for="realAmount">汇款到账金额</label>
					    <input type="number" class="form-control" id="check_realAmount" name="realAmount" placeholder="请输入汇款到账金额">
  					  </div>
  					  <div class="form-group">
					    <label for="comment">备注</label>
					    <textarea class="form-control" id="check_comment" name="comment" placeholder="请认真填写审核结果原因" rows="" cols=""></textarea>
  					  </div>
  					  <div class="form-group center-block container-fluid">
  					  	<div class="row">
	  					  	<button id="btn_check_submit" type="button" class="btn btn-danger col-md-6">提交审核</button>
	  					  	<button type="reset" class="btn btn-success col-md-6">重置</button>
  					  	</div>
  					  </div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function showCheckPop(){
			 $('#check_panel').dialog("open");
		}
		function showVouchers(){
			var vvv="${mctRemitNotify.voucher}";
			if(vvv==null||vvv==undefined||vvv==''){
				return false;
			}
			var vouchers = vvv.split(",");
			for(var i=0;i<vouchers.length;i++){
				var v = vouchers[i];
				var remitDate="${mctRemitNotify.notifyTime}".substring(0,10);
				var _href="<%=request.getContextPath()%>/static/cbTrade/mctRemitNotifyQuery/cert/"+remitDate+"/"+v+".do";
				var _ind = v.lastIndexOf(".");
				$('#notifyCert').append("<br><label>凭证["+(i+1)+"]</label><br>");
				if(_ind!=-1){
					var ext = v.substring(_ind).toUpperCase();
					if(ext=='.BMP'||ext=='.PNG'||ext=='.GIF'||ext=='.JPG'||ext=='.JPEG'){
						$('#notifyCert').append("<img class='img-responsive' alt='' title="+v+" src='"+_href+"'>");
					}else{
						$('#notifyCert').append("<a class='btn btn-info' href='"+_href+"'>点击下载凭证["+(i+1)+"]</a>");
					}
				}else{
					$('#notifyCert').append("<a class='btn btn-info' href='"+_href+"'>点击下载凭证["+(i+1)+"]</a>");
				}
			}
		}
		function isEmpty(obj){
			if(obj==undefined||obj==null||obj==''){
				return true;
			}
			return false;
		}
		function btnCheckSubmit(){
			//验证值
			var res = $('#check_result').val();
			if(isEmpty(res)){
				alert("请选择审核结果");
				return;
			}
			if(res=='FAIL'){
				$('#check_realAmount').val('0');
			}
			var amount = $('#check_realAmount').val();
			if(isEmpty(amount)){
				alert("请输入汇款金额");
				return;
			}
			var comment=$("#check_comment").val();
			if(isEmpty(comment)){
				alert("请输入审核备注");
				return;
			}
			var param = $('#checkForm').serialize();
			var url = "<%=request.getContextPath()%>/cbTrade/mctRemitNotify/verify.do";
			showCover();
			$.post(url,param,function(data){
				hideCover();
				if(data.err){
					alert(data.msg);
				}else{
					alert("调账成功");
					window.location.reload();
				}
			});
		}
		function init(){
			$('#check_result').change(function(){
				if($(this).val()=='SUCCESS'){
					$("#realAmount_div").show();
				}else{
					$("#realAmount_div").hide();
				}
			});
			$('#check_panel').dialog({
				  title:"商户汇款通知审核录入",
				  closeText:"hide",
				  autoOpen:false,
				  modal:true,
				  height:380,
				  width:400
			});
			$('#btn_check_submit').click(btnCheckSubmit);
			showVouchers();
		}
		$(document).ready(function() {
			  init();
		});
	</script>
</body>
</html>
