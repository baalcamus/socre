<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>用户管理</title>

    <script type="text/javascript">
        function add() {
            document.getElementById("loginNameSpan").style.display = "none";
            document.getElementById("loginNameSpan2").style.display = "none";
            document.getElementById("realNameSpan").style.display = "none";
            document.getElementById("loginPwdSpan").style.display = "none";
            document.getElementById("loginPwdAgainSpan").style.display = "none";

            var chk_value = [];
            $('input[name="ruleArr"]:checked').each(function () {
                chk_value.push($(this).val().replace(/^\s\s*/, '').replace(/\s\s*$/, ''));
            });
            if (chk_value.length == 0) {
                alert('请选择权限');
                return false;
            }
            var ruleArr = "";
            for (var i = 0; i < chk_value.length; i++) {
                ruleArr = ruleArr + chk_value[i] + ',';
            }

            var loginName = $("#loginName").val();
            var realName = $("#realName").val();
            var loginPwd = $("#loginPwd").val();
            var loginPwdAgain = $("#loginPwdAgain").val();
            var consoleDepId = $("#consoleDepId").val();


            var regLoginName = /^[A-Za-z0-9]{2,16}$/;
            if (!regLoginName.test(loginName)) {
                document.getElementById("loginNameSpan").style.display = "";
                $("#loginName").focus();
                return false;
            }

            var regRealName = /^[\u4e00-\u9fa5_a-zA-Z0-9_]{2,32}$/;
            if (!regRealName.test(realName)) {
                document.getElementById("realNameSpan").style.display = "";
                $("#realName").focus();
                return false;
            }

            var regLoginPwd = /^[\@A-Za-z0-9\_\*]{6,20}$/;
            if (!regLoginPwd.test(loginPwd)) {
                document.getElementById("loginPwdSpan").style.display = "";
                $("#loginPwd").focus();
                return false;
            }

            if (loginPwd != loginPwdAgain) {
                document.getElementById("loginPwdAgainSpan").style.display = "";
                $("#loginPwdAgain").focus();
                return false;
            }

            $.post("<%=request.getContextPath()%>/systemManage/toAdd.do", {
                        loginName: $("#loginName").val(),
                        realName: $("#realName").val(),
                        loginPwd: $("#loginPwd").val(),
                        consoleDepId: $("#consoleDepId").val(),
                        ruleArr: ruleArr

                    },
                    function (data) {
                        if (data == "ok") {
                            alert("添加成功");
                            window.location.href = "<%=request.getContextPath()%>/systemManage/toUserManage.do";
                        } else if (data == "repeat") {
                            alert("添加失败!用户名已存在！");
                            window.location.reload();
                        } else {
                            alert("添加失败!");
                            window.location.reload();
                        }
                    }
            );

        }
    </script>
    <script type="text/javascript">
        function checkAll() {
            var code_Values = document.getElementsByTagName("input");
            for (i = 0; i < code_Values.length; i++) {
                if (code_Values[i].type == "checkbox") {
                    code_Values[i].checked = true;
                }
            }
        }


        function uncheckAll() {
            var code_Values = document.getElementsByTagName("input");
            for (i = 0; i < code_Values.length; i++) {
                if (code_Values[i].type == "checkbox") {
                    code_Values[i].checked = false;
                }
            }
        }
    </script>


</head>

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
                    <li>系统管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li>用户管理&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li class="active">用户创建</li>
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
                                <h2 class="panel-title">用户创建</h2>
                            </div>
                            <div class="panel-body">
                                <form method="post" enctype="multipart/form-data" class="form-horizontal">
                                    <div class="row">
                                        <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
                                            <table width="100%" class="product_detail_list">
                                                <tr>
                                                    <td width="120" class="text-right">用户账号<span>*</span></td>
                                                    <td width="200"><input type="text" maxlength="32" name="loginName"
                                                                           id="loginName" class="form-control"></td>
                                                    <td><span id="loginNameSpan" style="display:none" class="colorhui">用户账号不能为空，由英文和数字组成，长度为3-16个字符</span>
                                                        <span id="loginNameSpan2" style="display:none" class="colorhui">用户账号已存在</span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
                                            <table width="100%" class="product_detail_list">
                                                <tr>
                                                    <td width="120" class="text-right">用户昵称<span>*</span></td>
                                                    <td width="200"><input type="text" maxlength="64" name="realName"
                                                                           id="realName" class="form-control"></td>
                                                    <td><span id="realNameSpan" style="display:none" class="colorhui">用户昵称用于页面显示的用户名，长度为3-32个字符</span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
                                            <table width="100%" class="product_detail_list">
                                                <tr>
                                                    <td width="120" class="text-right">用户密码<span>*</span></td>
                                                    <td width="200"><input type="password" maxlength="40"
                                                                           name="loginPwd" id="loginPwd"
                                                                           class="form-control"></td>
                                                    <td><span id="loginPwdSpan" style="display:none" class="colorhui">用户密码不能为空，密码为6-20个字符包括（英文、数字、下划线、*）</span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
                                            <table width="100%" class="product_detail_list">
                                                <tr>
                                                    <td width="120" class="text-right">重复密码<span>*</span></td>
                                                    <td width="200"><input type="password" maxlength="40"
                                                                           name="loginPwdAgain" id="loginPwdAgain"
                                                                           class="form-control"></td>
                                                    <td><span id="loginPwdAgainSpan" style="display:none"
                                                              class="colorhui">重复密码需与用户密码相同，为必填项</span></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
                                            <table width="100%" class="product_detail_list">
                                                <tr>
                                                    <td width="120" class="text-right">所属部门<span>*</span></td>
                                                    <td width="200">
                                                        <select class="form-control" tabindex="10" name="consoleDepId"
                                                                id="consoleDepId">
                                                            <c:forEach items="${consoleDepList}" var="consoleDep">
                                                                <option value="${consoleDep.id}">${consoleDep.department}</option>
                                                            </c:forEach>
                                                        </select>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
                                            <table width="100%" class="product_detail_list bghui fa-border">
                                                <tr>

                                                    <td width="160" colspan="2">
                                                    <td>

                                                        <!------- 	权限开始		List<Rule> ruleList		-->
                                                        <script type="text/javascript"
                                                                src="<%=request.getContextPath()%>/statics/v2/js/dtree.js"></script>
                                                        <!-- 引入js脚本 -->
                                                        <div class="dtree">
                                                            <!--创建一个div层，指定class为“dtree”，此时该层就引用了dtree的样式 -->
                                                            <script type="text/javascript">
                                                                d = new dTree('d');//new一个树对象

                                                                d.add(0, -1, '功能*'); //设置树的节点及其相关属性  d.add(id,父节点id,名称);
                                                                <c:forEach items="${dThreeList}" var="obj">
                                                                <%--d.add("${obj.id}", "${obj.pid}", "<input type='CheckBox' class='${obj.pid}'   id='${obj.id}' onclick='checkStatus(${obj.id},this);' name='ruleArr' value='${obj.id}'>${obj.name}");--%>
                                                                if("${ruleSelectList}".indexOf("${obj.id}")==-1){
                                                                    d.add("${obj.id}","${obj.pid}","<input type='CheckBox' class='${obj.pid}'   id='${obj.id}' onclick='checkStatus(${obj.id},this);' name='ruleArr' value='${obj.id}'>${obj.name}");
                                                                }else{
                                                                    d.add("${obj.id}","${obj.pid}","<input type='CheckBox' class='${obj.pid}'  checked='checked' id='${obj.id}' onclick='checkStatus(${obj.id},this);' name='ruleArr' value='${obj.id}'>${obj.name}");
                                                                }
                                                                </c:forEach>
                                                                document.write(d);
                                                                d.openAll();
                                                                function checkStatus(no, chkBox) {
                                                                    checkPar(chkBox);//当子目录选中时,父目录也选中
                                                                    var chks = document.getElementsByTagName('input');//得到所有input
                                                                    for (var i = 0; i < chks.length; i++) {
                                                                        if (chks[i].name.toLowerCase() == 'rulearr') {//得到所名为check的input
                                                                            if (chks[i].className == no) {//ID等于传进父目录ID时
                                                                                chks[i].checked = chkBox.checked;//保持选中状态和父目录一致
                                                                                checkStatus(chks[i].value, chks[i]);//递归保持所有的子目录选中
                                                                            }
                                                                        }
                                                                    }
                                                                }

                                                                function checkPar(chkBox) {
                                                                    if (chkBox.name.toLowerCase() == 'rulearr'/* && chkBox.checked */&& chkBox.className > 0 ) {//判断本单击为选中,并且不是根目录,则选中父目录	                 			       
                                                                        var chkObject = document.getElementById(chkBox.className);//得到父目录对象
                                                                        var chkChilds = document.getElementsByClassName(chkObject.id);
                                                                        var temp = 0;
                                                                        if(chkChilds.length>0){
                                                                            for(var i = 0;i < chkChilds.length;i++){
                                                                                if(chkChilds[i].checked){
                                                                                    temp = temp+1 ;
                                                                                }
                                                                            }
                                                                        }
                                                                        if(temp>0){
                                                                            chkObject.checked = true;
                                                                        }else{
                                                                            chkObject.checked = false;
                                                                        }

                                                                        checkPar(chkObject);
                                                                    }
                                                                }

                                                            </script>
                                                        </div>

                                                        <!--                        权限结束								 -->

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="170" class="text-right"></td>
                                                    <td colspan="2"><a onclick="checkAll();" class="btn btn-default">
                                                        全选 </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                            onclick="uncheckAll();" class="btn btn-default">全不选 </a>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
                                            <table width="100%" class="product_detail_list">
                                                <tr>
                                                    <td width="170" class="text-right"></td>
                                                    <td>
                                                        <input type="button" value="提交" id="btn" onclick="add()"
                                                               class="btn btn-primary margin30"/>
                                                        <input type="button" value="重置" id="btn2" onclick="reset()"
                                                               class="btn btn-dark"/></td>
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
</div>
<jsp:include page="../include/bottom.jsp"/>


</body>
</html>
