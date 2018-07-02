<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page import="com.chinagpay.boss.common.sessionuser.SessionUser,java.util.*" %>
<%@ include file="../include/taglibs.jsp" %>
<!--左侧导航栏 start-->
<nav id="sidebar" role="navigation" class="navbar-default navbar-static-side">
    <div class="sidebar-collapse menu-scroll">
        <ul id="side-menu" class="nav">

            <li class="menu_js"><a class="menu_js" href="<%=request.getContextPath()%>/main/toMain.do"><i
                    class="fa fa-home fa-fw">
                <div class="icon-bg bg-green"></div>
            </i>
                <span class="menu-title">首 页</span></a>
            </li>


            <c:if test="${sessionScope.systemManage}">
                <li class="menu_js">
                    <a href="javascript:void(0)"><i class="fa fa-cogs fa-fw">
                        <div class="icon-bg bg-orange"></div>
                    </i>
                        <span class="menu-title">系统管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${sessionScope.systemManageUserManage}">
                            <li><a href="javascript:void(0)"><i class="fa nav-icon-risk fa-fw">
                                <div class="icon-bg bg-pink"></div>
                            </i><span class="submenu-title">用户管理</span><span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <c:if test="${sessionScope.systemManageToUserManage}">
                                        <li><a name="thirdLevel" class="menu_js"
                                               href="<%=request.getContextPath()%>/systemManage/toUserManage.do"> <i
                                                class="fa fa-file-o"></i><span class="submenu-title">用户创建</span></a>
                                        </li>
                                    </c:if>
                                    <c:if test="${sessionScope.systemManageToUserSearch}">
                                        <li><a name="thirdLevel" class="menu_js"
                                               href="<%=request.getContextPath()%>/systemManage/toUserSearch.do"><i
                                                class="fa fa-search"></i><span class="submenu-title">用户查询</span></a>
                                        </li>
                                    </c:if>
                                   <%--根据mainController 的demoManageLeft 来判断权限显示  并且调用相关的controller--%>
                                    <c:if test="${sessionScope.demoManageLeft}">
                                        <li><a name="thirdLevel" class="menu_js"
                                               href="<%=request.getContextPath()%>/demoManage/toDemoSearchController.do"><i
                                                class="fa fa-search"></i><span class="submenu-title">demo查询</span></a>
                                        </li>
                                    </c:if>
                                </ul>
                            </li>
                        </c:if>

                        <c:if test="${sessionScope.moduleAddManage}">
                        <li><a href="javascript:void(0)"><i class="fa fa-sitemap">
                            <div class="icon-bg bg-pink"></div>
                        </i><span class="submenu-title">模块管理</span><span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <c:if test="${sessionScope.toModuleAddManage}">
                                    <li><a name="thirdLevel" class="menu_js"
                                           href="<%=request.getContextPath()%>/console/toModuleAdd.do"> <i
                                            class="fa fa-file-o"></i><span class="submenu-title">模块创建</span></a>
                                    </li>
                                </c:if>
                                <c:if test="${sessionScope.toModuleList}">
                                    <li><a name="thirdLevel" class="menu_js"
                                           href="<%=request.getContextPath()%>/console/toModuleList.do"><i
                                            class="fa fa-search"></i><span class="submenu-title">模块查询</span></a>
                                    </li>
                                </c:if>
                            </ul>
                        </li>
                    </c:if>



                        <c:if test="${sessionScope.moduleAddManage}">
                            <li><a href="javascript:void(0)"><i class="fa fa-sitemap">
                                <div class="icon-bg bg-pink"></div>
                            </i><span class="submenu-title">模块管理</span><span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <c:if test="${sessionScope.toModuleAddManage}">
                                        <li><a name="thirdLevel" class="menu_js"
                                               href="<%=request.getContextPath()%>/console/toModuleAdd.do"> <i
                                                class="fa fa-file-o"></i><span class="submenu-title">模块创建</span></a>
                                        </li>
                                    </c:if>
                                    <c:if test="${sessionScope.toModuleList}">
                                        <li><a name="thirdLevel" class="menu_js"
                                               href="<%=request.getContextPath()%>/console/toModuleList.do"><i
                                                class="fa fa-search"></i><span class="submenu-title">模块查询</span></a>
                                        </li>
                                    </c:if>
                                </ul>
                            </li>
                        </c:if>




                        <%--<c:if test="${sessionScope.announceAddManage}">--%>
                            <%--<li><a href="javascript:void(0)"><i class="fa fa-bullhorn fa-fw">--%>
                                <%--<div class="icon-bg bg-pink"></div>--%>
                            <%--</i><span class="submenu-title">公告管理</span><span class="fa arrow"></span></a>--%>
                                <%--<ul class="nav nav-third-level">--%>
                                    <%--<c:if test="${sessionScope.toAnnounceAddManage}">--%>
                                        <%--<li><a name="thirdLevel" class="menu_js"--%>
                                               <%--href="<%=request.getContextPath()%>/announce/toAnnounceAdd.do"> <i--%>
                                                <%--class="fa fa-file-o"></i><span class="submenu-title">公告创建</span></a>--%>
                                        <%--</li>--%>
                                    <%--</c:if>--%>
                                    <%--<c:if test="${sessionScope.toAnnounceList}">--%>
                                        <%--<li><a name="thirdLevel" class="menu_js"--%>
                                               <%--href="<%=request.getContextPath()%>/announce/toAnnounceList.do"><i--%>
                                                <%--class="fa fa-search"></i><span class="submenu-title">公告查询</span></a>--%>
                                        <%--</li>--%>
                                    <%--</c:if>--%>
                                <%--</ul>--%>
                            <%--</li>--%>
                        <%--</c:if>--%>
                        <%--<c:if test="${sessionScope.importExcel}">--%>
                            <%--<li><a href="<%=request.getContextPath()%>/excelController/exportExcel.do"><i class="fa fa-bullhorn fa-fw">--%>
                                <%--<div class="icon-bg bg-pink"></div>--%>
                            <%--</i><span class="submenu-title">导入excel</span><span class="fa arrow"></span></a>--%>
                            <%--</li>--%>
                        <%--</c:if>--%>
                    </ul>
                </li>
            </c:if>

<c:if test="${sessionScope.evaManageLeft}">
    <li class="menu_js">
    <a href="javascript:void(0)"><i class="fa fa-cogs fa-fw">
    <div class="icon-bg bg-orange"></div>
    </i>
    <span class="menu-title">评审</span><span class="fa arrow"></span></a>
    <ul class="nav nav-second-level">

        <li><a name="thirdLevel" class="menu_js"
               href="<%=request.getContextPath()%>/static/evaluation/toEvaluation"><i
                class="fa fa-search"></i><span class="submenu-title">待评审项目查询</span></a>
        </li>
    </ul>
    </li>
</c:if>

        </ul>
    </div>
</nav>
<script type="text/javascript">
    $(function () {
        $('a.menu_js').each(function () {
            var menu_href = $(this).attr('href');
            var id = $(this).attr('name');

            if (menu_href == window.location.pathname || menu_href==window.location.pathname+window.location.search) {
                if (name = 'thirdLevel') {
                    $(this).parent().addClass('active');
                    $(this).closest('ul').addClass('nav nav-third-level collapse in');
                    $(this).parents('ul').addClass('nav nav-second-level collapse in');
                    $(this).closest('li.menu_js').addClass('active');

                } else {
                    $(this).parent().addClass('active');
                    $(this).closest('ul').addClass('nav nav-second-level collapse in');
                    $(this).closest('li.menu_js').addClass('active');
                }
            }
        });

    });
</script>