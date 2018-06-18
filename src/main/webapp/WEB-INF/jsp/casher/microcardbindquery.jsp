<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>智慧生活订单查询</title>
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
                    <li>智慧生活&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li>智慧生活商户绑定&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
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
                        <form id="queryForm" action="<%=request.getContextPath()%>/static/casher/mcbquery" method="post"
                              enctype="multipart/form-data" class="form-horizontal ">
                            <input type="hidden" name="pageNum" value="${page.pageNum }"/>
                            <input type="hidden" name="pageSize" value="${page.pageSize }"/>
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <table width="100%" class="product_detail_list">
                                        <tr>
                                            <td width="110" class="text-right">商户编号</td>
                                            <td>
                                                <input type="text" maxlength="32" name="microMerNo"
                                                       value="${microCardBind.microMerNo}" class="form-control">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <table width="100%" class="product_detail_list">
                                        <tr>
                                            <td width="110" class="text-right">汇智卡商编</td>
                                            <td>
                                                <input type="text" maxlength="32" name="cardMerNo"
                                                       value="${microCardBind.cardMerNo}" class="form-control">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <table width="100%" class="product_detail_list">
                                        <tr>
                                            <td width="110" class="text-right">汇智卡终端号</td>
                                            <td>
                                                <input type="text" maxlength="32" name="cardMerTerNo"
                                                       value="${microCardBind.cardMerTerNo}" class="form-control">
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
                            
                            <div class="row">
                                
                            </div>
                        </form>
                    </div>
                </div>
                <div class="panel panel-default clearfix">
						<header class="panel-heading clearfix">
							<h2 class="panel-inner-title02">
								列表
								<button onclick="newBind();"
									class="pull-right btn btn-primary">新增</button>
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
											<th>商户编号</th>
											<th>汇智卡商编</th>
											<th>汇智卡终端号</th>
											<th>商户微信号</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${page.list}" var="microCardBind">
											<tr>
												<td><a href="#" onclick='modifyBind(${fns:toJson(microCardBind)});'>修改</a></td>
												<td>${microCardBind.microMerNo}</td>
												<td>${microCardBind.cardMerNo}</td>
												<td>${microCardBind.cardMerTerNo}</td>
												<td>${microCardBind.wxOpenId}</td>
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
<div id="bindDiv" style="display: none;">
	<form name="bindForm" action="#" class="form-group">
		<table>
			<tr>
				<td>商户编号</td>
				<td><input type="text" size="40" name="microMerNo" class="form-control"></td>
			</tr>
			<tr>
				<td>汇智卡商编</td>
				<td><input type="text"  size="40" name="cardMerNo" class="form-control"></td>
			</tr>
			<tr>
				<td>汇智卡终端号</td>
				<td><input type="text"  size="40" name="cardMerTerNo" class="form-control"></td>
			</tr>
			<tr>
				<td>商户微信号</td>
				<td><input type="text"  size="40" name="wxOpenId" class="form-control"></td>
			</tr>
		</table>
	</form>
</div>
</body>
<script type="text/javascript">
	function isNull(str){
		return str==null||str=='';
	}
	function newBind(){
		document.bindForm.reset();
		$("#bindDiv").dialog({
			autoOpen:true,
			title:"商户绑定设置",
			modal:true,
			width:"390px",
			buttons:{
				"取消":function(){
					$("#bindDiv").dialog("close");
				},
				"确认":function(){
					var microMerNo=document.bindForm.microMerNo.value;
					var cardMerNo=document.bindForm.cardMerNo.value;
					var cardMerTerNo=document.bindForm.cardMerTerNo.value;
					var wxOpenId=document.bindForm.wxOpenId.value;
					if(isNull(microMerNo)){
						alert("请输入商户编号");
						return;
					}
					if(isNull(cardMerNo)){
						alert("请输入汇智卡商户编号");
						return;
					}
					if(isNull(cardMerTerNo)){
						alert("请输入汇智卡商户终端号");
						return;
					}
					$.post("<%=request.getContextPath()%>/static/casher/mcbadd",{
						microMerNo:microMerNo,cardMerNo:cardMerNo,cardMerTerNo:cardMerTerNo,wxOpenId:wxOpenId
					},function(res){
						if(res.err==false){
							alert("新增成功");
							formSubmit();
						}else{
							alert(res.msg);
						}
					});
				}
			}
		});
	}
	function modifyBind(obj){
		document.bindForm.reset();
		document.bindForm.microMerNo.value=obj.microMerNo;
		document.bindForm.cardMerNo.value=obj.cardMerNo;
		document.bindForm.cardMerTerNo.value=obj.cardMerTerNo;
		document.bindForm.wxOpenId.value=obj.wxOpenId;
		$("#bindDiv").dialog({
			autoOpen:true,
			title:"商户绑定设置",
			modal:true,
			width:"390px",
			buttons:{
				"取消":function(){
					$("#bindDiv").dialog("close");
				},
				"确认":function(){
					var id = obj.id;
					var microMerNo=document.bindForm.microMerNo.value;
					var cardMerNo=document.bindForm.cardMerNo.value;
					var cardMerTerNo=document.bindForm.cardMerTerNo.value;
					var wxOpenId=document.bindForm.wxOpenId.value;
					if(isNull(microMerNo)){
						alert("请输入商户编号");
						return;
					}
					if(isNull(cardMerNo)){
						alert("请输入汇智卡商户编号");
						return;
					}
					if(isNull(cardMerTerNo)){
						alert("请输入汇智卡商户终端号");
						return;
					}
					$.post("<%=request.getContextPath()%>/static/casher/mcbmodify",{
						id:id,microMerNo:microMerNo,cardMerNo:cardMerNo,cardMerTerNo:cardMerTerNo,wxOpenId:wxOpenId
					},function(res){
						if(res.err==false){
							alert("修改成功");
							formSubmit();
						}else{
							alert(res.msg);
						}
					});
				}
			}
		});
	}
</script>
</html>
