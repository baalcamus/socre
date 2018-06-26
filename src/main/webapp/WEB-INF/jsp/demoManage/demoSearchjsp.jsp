<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户查询</title>
</head>
<script type="text/javascript">	
function modifi(loginName,status) {
	$.post( "<%=request.getContextPath()%>/systemManage/toModifiUser.do",{
		loginName:loginName,
		status:status,
	},
	function (data){
		if(data=="ok"){
			alert("修改成功");
			window.location.reload();
		}else{
			alert("修改失败");
			window.location.reload();
		}
	}

	);
}
	function formSubmit(){
 		$("#queryForm").submit();
 	}
</script>

<body class=" ">
<!-- 头部 -->
<jsp:include page="../include/top.jsp" />
  <div id="wrapper">
	<div>
		<jsp:include page="../include/bottom.jsp" />
		<!-- 左侧内容 -->
		<jsp:include page="../include/left.jsp" />
		<!--右侧内容 start-->
    	<div id="page-wrapper">
                <!--BEGIN TITLE & BREADCRUMB PAGE-->
                <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                    <ol class="breadcrumb page-breadcrumb">
                        <li><i class="fa fa-home"></i>&nbsp;<a href="<%=request.getContextPath()%>/main/toMain.do">首页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li>系统管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li>用户管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="active">用户查询</li>
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
            <form id="queryForm" action="${ctx}/demoManage/toDemoSearch.do" method="post" enctype="multipart/form-data" class="form-horizontal ">
               <input type="hidden" name="pageNum" value="${page.pageNum }"/>
               <input type="hidden" name="pageSize" value="${page.pageSize }"/>
                      <div class="row">
                      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                         <table width="100%" class="product_detail_list">
                                      <tr>
                                      <td width="110" class="text-right">用户账号</td>
                            <td>
                              <input type="text" maxlength="32" id="loginName" name="loginName" value="${demo.loginName}" class="form-control" >
                           </td>
                           </tr>
                           </table>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                         <table width="100%" class="product_detail_list">
                                      <tr>
                                      <td width="110" class="text-right">用户昵称</td>
                            <td>
                              <input type="text"  maxlength="64" id="realName" name="realName" value="${demo.realName}" class="form-control" >
                           </td>
                           </tr>
                           </table>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                         <table width="100%" class="product_detail_list">
                                      <tr>
                                      <td width="110" class="text-right">所属部门</td>
                            <td>
                              <select class="form-control" tabindex="10" name="consoleDepId" id="consoleDepId">
                                    <option <c:if test="${demo.consoleDepId=='' }">selected="selected"</c:if> value=""> 全部 </option>
                                    <option <c:if test="${demo.consoleDepId=='2' }">selected="selected"</c:if>value="2"> 运营部 </option>
                                    <option <c:if test="${demo.consoleDepId=='3' }">selected="selected"</c:if>value="3"> 财务部 </option>
                                    <option <c:if test="${demo.consoleDepId=='4' }">selected="selected"</c:if>value="4"> 技术部 </option>
                                    <option <c:if test="${demo.consoleDepId=='5' }">selected="selected"</c:if>value="5"> 市场部 </option>
                                    <option <c:if test="${demo.consoleDepId=='6' }">selected="selected"</c:if>value="6"> 产品部 </option>
                                    <option <c:if test="${demo.consoleDepId=='7' }">selected="selected"</c:if>value="7"> 风控部 </option>
                           		    <option <c:if test="${demo.consoleDepId=='8' }">selected="selected"</c:if>value="8"> 清算部 </option>
                            	    <option <c:if test="${demo.consoleDepId=='9' }">selected="selected"</c:if>value="9"> 银行合作部 </option>
                                    <option <c:if test="${demo.consoleDepId=='10' }">selected="selected"</c:if>value="10"> 销售部 </option>
                                	<option <c:if test="${demo.consoleDepId=='11' }">selected="selected"</c:if>value="1"> 法务部 </option>
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
                            <td >

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
            <h2 class="panel-inner-title02">列表<a href="javascript:formSubmit()" class="pull-right"><i class="fa fa-refresh" ></i>刷新</a></h2>
          </header>
          <div class=" panel-body clearfix">
            <div class="table-responsive border0">
              <table class="table table-hover">
                <thead>
                  <tr>
                  <th><span>操作</span></th>
                    <th><span>用户账号</span></th>
                    <th><span>用户昵称</span></th>
                    <th><span>所属部门</span></th>
                    <th><span>创建人</span></th>
                    <th><span>创建时间</span></th>
                     <th><span>更新人</span></th>
                     <th><span>更新时间</span></th>
                  </tr>
                </thead>
                <tbody>
                 <c:forEach items="${page.list}" var="user" varStatus="status">
                  <tr>
                 	 <td>
                 	 	<c:if test="${user.status==0}"><a  href="javascript:modifi('${user.loginName}','1')">开启</a></c:if>
                 	 	<c:if test="${user.status==1}"><a  href="javascript:modifi('${user.loginName}','0')">关闭</a></c:if>
                 	 &nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/systemManage/toUserChange.do?loginName=${user.loginName}&realName=${user.realName}" >修改</a>&nbsp;&nbsp;&nbsp;
                 	 </td>
                  	 <td>${user.loginName}</td>
                  	 <td>${user.realName}</td>
                  	 <td>
                  	 	<c:if test="${user.consoleDepId==2}">运营部</c:if>
                 	 	<c:if test="${user.consoleDepId==3}">财务部</c:if>
                 	 	<c:if test="${user.consoleDepId==4}">技术部</c:if>
                 	 	<c:if test="${user.consoleDepId==5}">市场部</c:if>
                 	 	<c:if test="${user.consoleDepId==6}">产品部</c:if>
                 	 	<c:if test="${user.consoleDepId==7}">风控部</c:if>
                 	 	<c:if test="${user.consoleDepId==8}">清算部</c:if>
                 	 	<c:if test="${user.consoleDepId==9}">银行合作部</c:if>
                 	 	<c:if test="${user.consoleDepId==10}">销售部</c:if>
                 	 	<c:if test="${user.consoleDepId==1}">法务部</c:if>
                  	 </td>
                  	 <td>${user.createLoginName}</td>
                  	 <td><fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                  	 <td>${user.updateLoginName}</td>
                   	 <td><fmt:formatDate value="${user.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
            </div>
          </div>
        

        <jsp:include page="../include/page.jsp" />
        </div>
        <!--这是列表模块结束--> 
                </div>
                <!--End CONTENT-->
           </div>
    <!--右侧内容 end-->
  </div>

    
</body>
</html>
