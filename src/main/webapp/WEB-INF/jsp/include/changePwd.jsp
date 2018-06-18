<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>修改密码</title>
<script type="text/javascript">	
function changePwd() {
	document.getElementById("newPwdSpan").style.display="none";
	document.getElementById("newPwdSpan").style.display="none";
	document.getElementById("newPwdAgainSpan").style.display="none";
	var oldPwd = $("#oldPwd").val();
	var newPwd = $("#newPwd").val();
	var newPwdAgain = $("#newPwdAgain").val();
	
	var regPwd =/^[\@A-Za-z0-9\_\*]{6,20}$/;
	if(!regPwd.test(oldPwd)){
		document.getElementById("oldPwdSpan").style.display="";
    	$("#oldPwd").focus();
      	return false;
	}
	
	if(!regPwd.test(newPwd)){    
	    	document.getElementById("newPwdSpan").style.display="";
	    	$("#newPwd").focus();
	      	return false;
	    }   

	
	if(newPwd!=newPwdAgain){
			document.getElementById("newPwdAgainSpan").style.display="";
			$("#newPwdAgain").focus();
			return false;
		}


	$.post( "<%=request.getContextPath()%>/main/changePwd.do",{
		oldPwd:$("#oldPwd").val(),
        newPwd:$("#newPwd").val(),

	},
	function (data){
		if(data=="ok"){
			alert("修改成功");
			window.location.href='<%=request.getContextPath()%>/main/toChangeLoginPwd.do';
		}else if(data=="repeat"){
			alert("修改失败!原始密码不正确！");
			window.location.reload();
		}else{
			alert("修改失败!");
			window.location.reload();
		}
	});
	
}



</script>

</head>

<body class=" ">
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
                        <li><i class="fa fa-home"></i>&nbsp;<a href="Organization_management.html">首页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="active">修改密码</li>
                    </ol>
                   
                    <div class="clearfix"></div>
                </div>
                <!--END TITLE & BREADCRUMB PAGE-->
                <!--BEGIN CONTENT-->
                <div class="page-content">
                  <div class="row clearfix">
              <div class="col-lg-12">
                <div class="panel panel-default">
                  <div class="panel-heading">
                    <h2 class="panel-title">修改密码</h2>
                  </div>
                  <div class="panel-body">
                    <form method="post" enctype="multipart/form-data" class="form-horizontal">
                      <div class="row">
                        <div class="col-lg-12 col-lg-offset-3 col-md-12 col-md-offset-3 col-sm-12 col-xs-12">
                          
                                      <table width="100%" class="product_detail_list">
                                      <tr>
                                      <td width="120" class="text-right">原始密码<span>*</span></td>
                             <td width="200">
                             <input type="password"  name="oldPwd" id="oldPwd" class="form-control" >
                             </td>
                             <td><span id="oldPwdSpan" style="display:none" class="colorhui">原始密码不能为空，为必填项</span></td>
                             </tr>
                             </table>
                          </div>
                          </div>
                      <div class="row">
                        <div class="col-lg-12 col-lg-offset-3 col-md-12 col-md-offset-3 col-sm-12 col-xs-12">
                          
                                      <table width="100%" class="product_detail_list">
                                      <tr>
                                      <td width="120" class="text-right">新密码<span>*</span></td>
                            <td width="200"><input type="password" id="newPwd" name="newPwd" class="form-control" ></td>
                            <td><span id="newPwdSpan" style="display:none" class="colorhui">用户密码不能为空，密码为6-20个字符包括（英文、数字、下划线、*）</span></td>
                         </tr>
                         </table>
                        </div>
                        </div>
                        <div class="row">
                        <div class="col-lg-12 col-lg-offset-3 col-md-12 col-md-offset-3 col-sm-12 col-xs-12">
                          
                                      <table width="100%" class="product_detail_list">
                                      <tr>
                                      <td width="120" class="text-right">确认新密码<span>*</span></td>
                            <td width="200"><input type="password" id="newPwdAgain" name="newPwdAgain" class="form-control" ></td>
                            <td><span id="newPwdAgainSpan" style="display:none" class="colorhui">重复密码需与用户密码相同，为必填项</span></td>
                         </tr>
                         </table>
                        </div>
                      </div>
                      <div class="row">
                      <div class="col-lg-12 col-lg-offset-3 col-md-12 col-md-offset-3 col-sm-12 col-xs-12">
                                      <table width="100%" class="product_detail_list">
                                      <tr>
                                      <td width="120" class="text-right"></td>
                            <td>
                            <input type="button" value="提交"  id="btn"  onclick="changePwd()"  class="btn btn-primary margin30" />  
                            </td>
                         </tr>
                         </table>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
                   
                </div>
                <!--End CONTENT-->
           </div>
    <!--右侧内容 end-->
  </div>
<jsp:include page="../include/bottom.jsp" />
    
    
</body>
</html>
