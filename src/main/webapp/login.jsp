<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>登录</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="Thu, 19 Nov 1900 08:52:00 GMT">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/statics/v2/images/icons/favicon.ico">
    <link rel="apple-touch-icon" href="<%=request.getContextPath()%>/statics/v2/images/icons/favicon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="<%=request.getContextPath()%>/statics/v2/images/icons/favicon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="<%=request.getContextPath()%>/statics/v2/images/icons/favicon-114x114.png">
    <!--图标样式-->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/statics/v2/vendors/font-awesome/css/font-awesome.min.css">
<!--页面布局和通用样式-->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/statics/v2/vendors/bootstrap/css/bootstrap.min.css">
<!--日期控件css--->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/statics/v2/vendors/bootstrap-switch/css/bootstrap-switch.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/statics/v2/vendors/bootstrap-datepicker/css/datepicker.css">
<!--时间控件css--->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/statics/v2/vendors/bootstrap-timepicker/css/bootstrap-timepicker.min.css">
<!--单选框和复选框样式-->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/statics/v2/vendors/iCheck/skins/all.css">
<!--弹出框效果-->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/statics/v2/css/libs/magnific-popup.css">
<!--动画效果-->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/statics/v2/vendors/animate.css/animate.css">
<!--后添加样式-->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/statics/v2/css/compiled/theme_styles.css" class="default-style">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/statics/v2/css/compiled/theme_styles.css" id="theme-change" class="style-change color-change">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/statics/v2/css/compiled/myself_styles.css" class="default-style">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/statics/v2/css/lrtk.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/statics/v2/js/login/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/statics/v2/js/login/nbw-parallax.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/statics/v2/js/login/jquery.localscroll-1.2.7-min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/statics/v2/js/login/jquery.scrollTo-1.4.2-min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/statics/v2/js/login/jquery.inview.js"></script>


<script type="text/javascript">
		function refresh(){  
			document.getElementById("authImg").src="authImg?now="+new Date();
		}  
</script> 
<script type="text/javascript">
function keyLogin(et){
	 if(et.keyCode){  
	        if (et.keyCode==13)  
	        	document.getElementById("loginBtn").click(); //调用登录按钮的登录事件
	      }else{  
	        if (et.which==13)  
	        	document.getElementById("loginBtn").click(); //调用登录按钮的登录事件
	      }  

}
</script>



<script type="text/javascript">
		var autFlag = 0;
		
	function login(){
		var loginName = $("#loginName").val();
		var loginPwd = $("#loginPwd").val();	
		var aut =  $("#aut").val(); 
		
		if(autFlag == 0){
			aut = "000000";
			}
		
		if(loginName == ""){
			$("#errorMsg").html("请输入用户名");
			$("#errorMsg").show();
			return false;
		}
		
		if(loginPwd == ""){
			$("#errorMsg").html("请输入密码");
			$("#errorMsg").show();
			return false;
		}
		
		if(aut == ""){
			$("#errorMsg").html("请输入验证码");
			$("#errorMsg").show();
			return false;
		}
		
		var regLoginName =/^[A-Za-z0-9]{3,16}$/;
   	    if(!regLoginName.test(loginName)){   
   	    	$("#loginName").focus();
   	    	$("#errorMsg").html("用户账号由英文和数字组成，长度为3-16个字符");
			$("#errorMsg").show();
   	      	return false;
   	    }   
		
    	var regLoginPwd =/^[\@A-Za-z0-9\_\*]{6,20}$/;
   	    if(!regLoginPwd.test(loginPwd)){    
   	    	$("#loginPwd").focus();
   	    	$("#errorMsg").html("密码为6-20个字符包括（英文、数字、下划线、*）");
			$("#errorMsg").show();
   	      	return false;
   	    }  
		
		
		$.post(
				"<%=request.getContextPath()%>/login/toLogin.do",{	
				 loginName: loginName,
				 loginPwd:loginPwd,
				 aut:aut,
				 redirectUrl:$("#redirectUrl").val(),	
				 autFlag:autFlag,	
				},
				function(data){
					if(data.status){
						if("redirectUrl" in data){
							window.location.href = "<%=request.getContextPath()%>"+data.redirectUrl;
						}else{
							window.location.href = "<%=request.getContextPath()%>/main/toMain.do";
						}
					}else{
						$("#errorMsg").html(data.msg);
						$("#errorMsg").show();
						document.getElementById("autDiv").style.display="";
						autFlag = 2;
					}
					
				}
		)
	}
</script>
</head>

<body onkeydown="keyLogin(event)">
<div id="login-box">
	<header id="login-header">
     	<div class="login-top"></div> 
	</header>
              <div id="login-box-inner">
                <form method="post" id="loginForm">
                <input type="hidden" name="redirectUrl" id="redirectUrl" value="${redirectUrl}" />
                    <div class="login-input-box">
                          <div class="input-group"> 
                          	<span class="input-group-addon"><img src="<%=request.getContextPath()%>/statics/v2/img/people_10.png" ></span>
                            <input class="form-control" type="text" maxlength="32"  id="loginName" name="loginName" placeholder="请输入用户名" >
                          </div>
                          <div class="input-group"> 
                          	<span class="input-group-addon"><img src="<%=request.getContextPath()%>/statics/v2/img/mima_13.png"></span>
                            <input class="form-control" type="password" maxlength="40"   id="loginPwd" name="loginPwd" placeholder="请输入密码" >
                          </div>
                          
                          	<div class="input-group" id="autDiv" style="display: none" > 
                            	<input class="form-control yanzhengma" maxlength="5" type="text" placeholder="请输入验证码" id="aut" name="aut" >
                            	<span class="yanzhengma-img"><img src="authImg" id="authImg" style="cursor:hand" title="点击刷新" onclick="refresh()"></span>
                          	</div>
                          
                            <div class="input-group">
                              <button type="button" id="loginBtn" class="btn btn-danger col-xs-12" onclick="login()">登录</button>
                            </div>
                          <div class="danger red" id="errorMsg" style="display:none"></div>
                      </div>
                </form>
        </div>
        <div id="login-box-footer">
          <div class="row">
            <div class="col-xs-12"> <p class="gray"> 版权所有©北京爱农驿站科技服务有限公司</p></div>
          </div>
        </div>
      </div>
<ul id="nav">
	<li><a href="#intro" title="Next Section"><img src="<%=request.getContextPath()%>/statics/v2/images/dot.png" alt="Link" /></a></li>
    <li><a href="#second" title="Next Section"><img src="<%=request.getContextPath()%>/statics/v2/images/dot.png" alt="Link" /></a></li>
    <li><a href="#third" title="Next Section"><img src="<%=request.getContextPath()%>/statics/v2/images/dot.png" alt="Link" /></a></li>
    <li><a href="#fourth" title="Next Section"><img src="<%=request.getContextPath()%>/statics/v2/images/dot.png" alt="Link" /></a></li>
    <li><a href="#fifth" title="Next Section"><img src="<%=request.getContextPath()%>/statics/v2/images/dot.png" alt="Link" /></a></li>
</ul>
<div id="intro">
	<div class="story">
    	
    </div> <!--.story-->
</div> <!--#intro-->

<div id="second">
	<div class="story"><div class="bg"></div>
    	<div class="float-right">
            <h2></h2>
            <p></p>
           
        </div>
    </div> <!--.story-->
    
</div> <!--#second-->

<div id="third">
	<div class="story">
    	<div class="float-left">
        	<h2></h2>
            <p></p>
        </div>
    </div> <!--.story-->
</div> <!--#third-->

<div id="fourth">
	<div class="story">
    	<div class="float-left">
            <h2></h2>
            <p><em></em></p>
            
        </div>
    </div> <!--.story-->
</div> <!--#fourth-->

<div id="fifth">
	<div class="story">
		<h2></h2>
            <p></p>
    </div> <!--.story-->
</div> <!--#fifth-->
<script type="text/javascript">
$(document).ready(function(){
	$('#nav').localScroll();
})
</script>
<!-- 代码 结束 -->    
</body>
</html>
