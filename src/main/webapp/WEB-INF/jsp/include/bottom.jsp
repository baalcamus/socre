<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.chinagpay.boss.common.sessionuser.SessionUser,java.util.*"%>
<%@ include file="../include/taglibs.jsp"%>
<!--全局动态--> 
    <script src="<%=request.getContextPath()%>/statics/v2/js/jquery-1.10.2.min.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/js/jquery-ui.js"></script>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/statics/v2/vendors/jquery-ui-1.12.0.custom/jquery-ui.min.css">
    <script src="<%=request.getContextPath()%>/statics/v2/vendors/jquery-validate/jquery.validate.min.js"></script>
    <!--弹框js-->
    <script src="<%=request.getContextPath()%>/statics/v2/vendors/slimScroll/jquery.slimscroll.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/vendors/responsive-tabs/responsive-tabs.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/vendors/calendar/zabuto_calendar.min.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/js/jquery.magnific-popup.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/js/tck.js" type="text/javascript"></script>
    <!--开关按钮js-->
    <script src="<%=request.getContextPath()%>/statics/v2/vendors/bootstrap-switch/js/bootstrap-switch-yesorno.js"></script>
    <!--左侧导航栏-->
    <script src="<%=request.getContextPath()%>/statics/v2/vendors/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/vendors/bootstrap-hover-dropdown/bootstrap-hover-dropdown.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/vendors/metisMenu/jquery.metisMenu.js"></script>
    <!--导航栏展开收起效果-->
    <script src="<%=request.getContextPath()%>/statics/v2/vendors/jquery-cookie/jquery.cookie.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/js/jquery.menu.js"></script>
    <!-- 图片放大 -->
	<script src="<%=request.getContextPath()%>/statics/v2/js/pic.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/js/My97DatePicker_1/WdatePicker.js"></script>

    <!--单选框和复选框样式修改-->
    <script src="<%=request.getContextPath()%>/statics/v2/vendors/iCheck/icheck.min.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/vendors/iCheck/custom.min.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/vendors/jquery-file-upload/js/jquery.fileupload-validate.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/vendors/jquery-file-upload/js/jquery.fileupload-ui.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/vendors/jquery-file-upload/js/jquery.iframe-transport.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/vendors/moment/moment.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/js/main.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/vendors/jquery-file-upload/js/jquery.fileupload-image.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/vendors/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/vendors/jquery-tablesorter/jquery.tablesorter.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/vendors/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/js/table-sample.js"></script>
    <script src="<%=request.getContextPath()%>/statics/v2/kindeditor/kindeditor-all-min.js"></script>
	<!-- 自定义的JS文件-->
	<script type="text/javascript" src="<%=request.getContextPath()%>/statics/v2/js/tabview/tab-view.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/statics/v2/js/tabview/ajax.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/statics/v2/js/tabview/ajaxfileupload.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/statics/v2/js/jquery-form.js"></script>

<%--<link href="${ctxStatic}/v2/vendors/jquery-validation/1.11.0/jquery.validate.min.css" type="text/css" rel="stylesheet" />--%>
	<%--<script src="${ctxStatic}/v2/vendors/jquery-validation/1.11.0/jquery.validate.js" type="text/javascript"></script>--%>
	<%--<script src="${ctxStatic}/v2/vendors/jquery-validation/1.11.0/jquery.validate.method.js" type="text/javascript"></script>--%>

	<link href="${ctxStatic}/v2/vendors/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
	<script src="${ctxStatic}/v2/vendors/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
<!-- 验证插件-->
