<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.chinagpay.boss.common.sessionuser.SessionUser,java.util.*"%>
<%@ include file="../include/taglibs.jsp"%>
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
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/statics/v2/css/style-responsive.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/statics/v2/kindeditor/themes/default/default.css" />
   <!--头部 start-->
   <script>
		function exit(){
			$.post("<%=request.getContextPath()%>/login/toExit.do",{
			},
			function (data){
				if(data=="ok"){
					location.href="<%=request.getContextPath()%>/login.jsp";
				}else{
					alert("退出错误!请手动关闭！")
					}
			}
			);
			}

   
   </script>
  <div id="header-topbar-option-demo" class="page-header-topbar">
    <nav id="topbar" role="navigation" style="margin-bottom: 0; z-index: 2;" class="navbar navbar-default navbar-static-top">
      <div class="navbar-header">
        <button type="button" data-toggle="collapse" data-target=".sidebar-collapse" class="navbar-toggle"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span> </button>
        <a id="logo"  class="navbar-brand"><span class="fa fa-rocket"></span><span class="logo-text"><img src="<%=request.getContextPath()%>/statics/v2/img/logo.png" height="34" width="131"></span><span style="display: none" class="logo-text-icon"></span></a> </div>
      <div class="topbar-main"> <a id="menu-toggle" href="#" class="hidden-xs"><i class="fa fa-bars"></i></a>
        <ul class="nav navbar navbar-top-links navbar-right mbn">
          <li><a data-hover="dropdown" href="#" class="dropdown-toggle"><i class="fa fa-user fa-fw"></i><span>Hello,${sessionScope.realName}</span></a></li>
          <li><a data-hover="dropdown" href="<%=request.getContextPath()%>/main/toChangeLoginPwd.do" class="dropdown-toggle"><i class="fa fa-lock fa-fw"></i><span>修改密码</span></a></li>
          <li><a data-hover="dropdown" href="#" onclick="exit()" class="dropdown-toggle"><i class="fa fa-sign-out fa-fw"></i><span>退出</span></a></li>
        </ul>
      </div>
    </nav>
  </div>
  <!--头部 end-->
    <!--左侧导航栏 start-->
    <!--返回顶部箭头 start--><a id="totop" href="#"><i class="fa fa-angle-up"></i></a> 
  <!--返回顶部箭头 end--> 