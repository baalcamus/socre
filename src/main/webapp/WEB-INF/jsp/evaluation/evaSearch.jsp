<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户查询</title>
</head>
<script type="text/javascript">

    function reviewProject(id){
        window.location.href ="<%=request.getContextPath()%>/static/evaluation/reviewProject?id="+id;
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
            <form id="queryForm" action="${ctx}/systemManage/toUserSearch.do" method="post" enctype="multipart/form-data" class="form-horizontal ">
               <input type="hidden" name="pageNum" value="${page.pageNum }"/>
               <input type="hidden" name="pageSize" value="${page.pageSize }"/>
                      <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                         <table width="100%" class="product_detail_list">
                                      <tr>
                                      <td width="110" class="text-right">用户昵称</td>
                            <td>
                              <input type="text"  maxlength="64" id="realName" name="realName" value="${evaluation.proName}" class="form-control" >
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
                    <th><span>项目名称</span></th>
                    <th><span>项目申报人</span></th>
                      <th><span>评审状态</span></th>
                      <th><span>评审类型</span></th>
                    <th><span>项目分数</span></th>

                  </tr>
                </thead>
                <tbody>
                 <c:forEach items="${page.list}" var="user" varStatus="status">
                  <tr>
                      <td>
                          <c:if test="${user.reviewStatus == 'REVIEW_INIT'}"><a  href="javascript:reviewProject('${user.id}')">开启</a></c:if>
                      </td>
                      <td>${user.proName}</td>
                  	  <td>${user.proReportor}</td>
                      <td>
                          <c:if test="${user.reviewStatus== 'REVIEW_INIT'}"> 待评审</c:if>
                          <c:if test="${user.reviewStatus== 'REVIEW_SUCESS'}"> 已评审</c:if>
                      </td>
                      <td>
                          <c:if test="${user.reviewType== 'TECHNOLOGY'}"> 技术类</c:if>
                          <c:if test="${user.reviewType== 'FINANCE'}"> 财务类</c:if>
                      </td>
                  	  <td>${user.score}</td>
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
