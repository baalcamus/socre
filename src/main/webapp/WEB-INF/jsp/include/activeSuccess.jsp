<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>404 Page | Extras</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Loading bootstrap css-->
    <link type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,800italic,400,700,800">
    <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Oswald:400,700,300">
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/statics/v2/vendors/jquery-ui-1.10.3.custom/css/ui-lightness/jquery-ui-1.10.3.custom.css">
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/statics/v2/vendors/font-awesome/css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/statics/v2/vendors/bootstrap/css/bootstrap.min.css">
    <!--Loading style vendors-->
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/statics/v2/vendors/animate.css/animate.css">
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/statics/v2/vendors/iCheck/skins/all.css">
    <!--Loading style-->
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/statics/v2/css/themes/style1/pink-violet.css" id="theme-change" class="style-change color-change">
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/statics/v2/css/style-responsive.css">
</head>

<body id="error-page" class="animated bounceInLeft">
    <div id="error-page-content">
       <h1>SUCCESS!</h1>
        <h4>激活成功！</h4>
        <p></p>
      
    </div>
    <script src="<%=request.getContextPath()%>/statics/v2/js/jquery-1.9.1.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/js/jquery-ui.js"></script>
    <!--loading bootstrap js-->
    <script src="<%=request.getContextPath()%>/statics/v2/vendors/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/vendors/bootstrap-hover-dropdown.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/js/html5shiv.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/js/respond.min.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/vendors/iCheck/icheck.min.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/vendors/iCheck/custom.min.js"></script>
    <script>
        //BEGIN CHECKBOX & RADIO
        $('input[type="checkbox"]').iCheck({
            checkboxClass: 'icheckbox_minimal-grey',
            increaseArea: '20%' // optional
        });
        $('input[type="radio"]').iCheck({
            radioClass: 'iradio_minimal-grey',
            increaseArea: '20%' // optional
        });
        //END CHECKBOX & RADIO
    </script>
</body>

</html>