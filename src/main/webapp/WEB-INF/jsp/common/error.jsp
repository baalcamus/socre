<%--
  Created by IntelliJ IDEA.
  User: hanbinyu
  Date: 2016/7/26
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp" %>
<html lang="en">
<html>
<head>
    <title>ERROR</title>
</head>
<body>
<jsp:include page="../include/top.jsp"/>
<div id="wrapper">
    <jsp:include page="../include/bottom.jsp"/>
    <!-- 左侧内容 -->
    <jsp:include page="../include/left.jsp"/>
    <!--右侧内容 start-->
    <div id="page-wrapper">
    	<div class="form-group has-error">
    		 <h3 style="color: red;">${message}</h3>
    	</div>
        <div class="form-group">
	        <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	        <a class="btn btn-primary" href="javascript:history.back(-1);">点击返回</a>
        </div>
    </div>
</div>
</body>
</html>
