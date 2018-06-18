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
    <title>Title</title>
</head>
<body>
<jsp:include page="../include/top.jsp"/>
<div id="wrapper">
    <jsp:include page="../include/bottom.jsp"/>
    <!-- 左侧内容 -->
    <jsp:include page="../include/left.jsp"/>
    <!--右侧内容 start-->
    <div id="page-wrapper">
        ${message}<br>
        <a href="<%=request.getContextPath()%>${url}"><div id="timeOver"></div></a>
    </div>
</div>
<script type="text/javascript">
    var seconds = 10;
    var milisec=0;
    setTimeout("load();",100);
    function load(){
        if (milisec<=0){
            milisec=9
            seconds-=1
        }
        if (seconds<=-1){
            milisec=0
            seconds+=1
        }
        else
        {
            if(seconds==0)
            {
                window.location.href = "<%=request.getContextPath()%>${url}"
            }
            milisec-=1
            $("#timeOver").html("["+seconds+"."+milisec+"]后返回到商户，点击直接返回");
            setTimeout("load();",100)
        }
    };

</script>
</body>
</html>
