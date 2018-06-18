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

                        <c:if test="${sessionScope.announceAddManage}">
                            <li><a href="javascript:void(0)"><i class="fa fa-bullhorn fa-fw">
                                <div class="icon-bg bg-pink"></div>
                            </i><span class="submenu-title">公告管理</span><span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <c:if test="${sessionScope.toAnnounceAddManage}">
                                        <li><a name="thirdLevel" class="menu_js"
                                               href="<%=request.getContextPath()%>/announce/toAnnounceAdd.do"> <i
                                                class="fa fa-file-o"></i><span class="submenu-title">公告创建</span></a>
                                        </li>
                                    </c:if>
                                    <c:if test="${sessionScope.toAnnounceList}">
                                        <li><a name="thirdLevel" class="menu_js"
                                               href="<%=request.getContextPath()%>/announce/toAnnounceList.do"><i
                                                class="fa fa-search"></i><span class="submenu-title">公告查询</span></a>
                                        </li>
                                    </c:if>
                                </ul>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.importExcel}">
                            <li><a href="<%=request.getContextPath()%>/excelController/exportExcel.do"><i class="fa fa-bullhorn fa-fw">
                                <div class="icon-bg bg-pink"></div>
                            </i><span class="submenu-title">导入excel</span><span class="fa arrow"></span></a>
                            </li>
                        </c:if>
                    </ul>
                </li>
            </c:if>

            <c:if test="${sessionScope.provisionsManage}">
                <li class="menu_js">
                    <a href="javascript:void(0)"><i class="fa fa-th-large fa-fw">
                        <div class="icon-bg bg-orange"></div>
                    </i>
                        <span class="menu-title">备付金管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${sessionScope.toBankManageList}">
                            <li><a name="thirdLevel" class="menu_js"
                                   href="<%=request.getContextPath()%>/provisions/toBankManageList.do"> <i
                                    class="fa fa-file-o"></i><span class="submenu-title">备付金银行管理</span></a></li>
                        </c:if>
                        <c:if test="${sessionScope.toFileManageList}">
                            <li><a name="thirdLevel" class="menu_js"
                                   href="<%=request.getContextPath()%>/provisions/toFileManageList.do"><i
                                    class="fa fa-search"></i><span class="submenu-title">报备文件管理</span></a></li>
                        </c:if>
                    </ul>
                </li>
            </c:if>
            <c:if test="${accountManager}">
                <li class="menu_js">
                    <a href="javascript:void(0)"><i class="fa fa-th-large fa-fw">
                        <div class="icon-bg bg-orange"></div>
                    </i>
                        <span class="menu-title">账户管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${cbAccountList}">
                            <li><a class="menu_js" href="<%=request.getContextPath()%>/cbAccount/selectCbAccountList.do?source=left_list"><i
                                    class="fa fa-pencil-square-o"></i><span class="submenu-title">跨境账户查询</span></a></li>
                        </c:if>
                    </ul>
                    <ul class="nav nav-second-level">
                        <c:if test="${mctRemitNotifyQuery}">
                            <li><a class="menu_js" href="<%=request.getContextPath()%>/cbTrade/mctRemitNotifyQuery.do"><i
                                    class="fa fa-pencil-square-o"></i><span class="submenu-title">账户汇款通知</span></a></li>
                        </c:if>
                    </ul>
                </li>
            </c:if>
            <c:if test="${sessionScope.crossBorderResourceManager}">
                <li class="menu_js">
                    <a href="javascript:void(0)"><i class="fa fa-th-large fa-fw"><div class="icon-bg bg-orange"></div></i>
                        <span class="menu-title">跨境资源管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${sessionScope.currency2Usd}">
                        	<li><a class="menu_js" href="<%=request.getContextPath()%>/cbBank/currency2Usd/query.do"><i class="fa fa-pencil-square-o"></i><span class="submenu-title">折算美元汇率</span></a> </li>
                        </c:if>
                    </ul>
                </li>
            </c:if>
            
            <c:if test="${sessionScope.crossBorderTradeManager}">
                <li class="menu_js">
                    <a href="javascript:void(0)"><i class="fa fa-th-large fa-fw"><div class="icon-bg bg-orange"></div></i>
                        <span class="menu-title">跨境交易管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${sessionScope.exchangeRateQuery}">
                        	<li><a class="menu_js" href="<%=request.getContextPath()%>/crossBorderTradeManager/exchangeRateQuery.do"><i class="fa fa-pencil-square-o"></i><span class="submenu-title">牌价查询</span></a> </li>
                        	<li><a class="menu_js" href="<%=request.getContextPath()%>/static/cbTrade/forex/ConstantInfoQuery"><i class="fa fa-pencil-square-o"></i><span class="submenu-title">渠道管理</span></a> </li>
                        	<li><a class="menu_js" href="<%=request.getContextPath()%>/static/cbTrade/forex/LargeTransactionOrder"><i class="fa fa-pencil-square-o"></i><span class="submenu-title">跨境大额交易</span></a> </li>
                        </c:if>
                    	<c:if test="${sessionScope.remitManage }">
                    		<li>
                    			<a href="javascript:void(0)">
	                    			<i class="fa nav-icon-risk fa-fw"><div class="icon-bg bg-pink"></div></i>
	                    			<span class="submenu-title">付款管理</span><span class="fa arrow"></span>
                    			</a>
                                <ul class="nav nav-third-level">
                                    <c:if test="${sessionScope.remitOrderQuery}">
                                        <li><a name="thirdLevel" class="menu_js"
                                               href="<%=request.getContextPath()%>/cbTrade/forex/remit/query"> <i
                                                class="fa fa-file-o"></i><span class="submenu-title">付款订单查询</span></a>
                                        </li>
                                    </c:if>
                                </ul>
                            </li>
                    	</c:if>
                    	<c:if test="${sessionScope.gatherManage }">
                    		<li>
                    			<a href="javascript:void(0)">
	                    			<i class="fa nav-icon-risk fa-fw"><div class="icon-bg bg-pink"></div></i>
	                    			<span class="submenu-title">收款管理</span><span class="fa arrow"></span>
                    			</a>
                                <ul class="nav nav-third-level">
                                    <c:if test="${sessionScope.gatherOrderQuery}">
                                        <li><a name="thirdLevel" class="menu_js"
                                               href="<%=request.getContextPath()%>/cbTrade/forex/gather/query"> <i
                                                class="fa fa-file-o"></i><span class="submenu-title">收款订单查询</span></a>
                                        </li>
                                    </c:if>
                                </ul>
                            </li>
                    	</c:if>
                    	<c:if test="${sessionScope.trialManage}">
                    		<li>
                    			<a href="javascript:void(0)">
	                    			<i class="fa nav-icon-risk fa-fw"><div class="icon-bg bg-pink"></div></i>
	                    			<span class="submenu-title">跨境试算</span><span class="fa arrow"></span>
                    			</a>
                                <ul class="nav nav-third-level">
                                    <c:if test="${sessionScope.remitTrial}">
                                        <li><a name="thirdLevel" class="menu_js"
                                               href="<%=request.getContextPath()%>/cbTrade/forex/trial/remitTrial"> <i
                                                class="fa fa-file-o"></i><span class="submenu-title">付款试算</span></a>
                                        </li>
                                    </c:if>
                                </ul>
                            </li>
                    	</c:if>
                    	<c:if test="${crossBorderMerchantReportList}">
                            <li><a class="menu_js" href="${ctx}/cbTrade/forex/crossBorderMerchantReportList"><i class="fa fa-folder-open-o"></i><span class="submenu-title">跨境商户报备</span></a> </li>
                        </c:if>
                    </ul>
                </li>
            </c:if>

            <c:if test="${merchantManager}">
                <li class="menu_js">
                    <a href="javascript:void(0)"><i class="fa fa-folder"><div class="icon-bg bg-yellow"></div></i>
                        <span class="menu-title">商户管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                    	<c:if test="${toCreateMerchant}">
                            <li><a class="menu_js" href="${ctx}/merchant/toCreateMerchant"><i class="fa fa-folder-open-o"></i><span class="submenu-title">商户入网</span></a> </li>
                        </c:if>
                        <c:if test="${toQueryCbMerchant}">
                            <li><a class="menu_js" href="${ctx}/cbMerchant/queryMerchant.do"><i class="fa fa-folder-open-o"></i><span class="submenu-title">商户信息查询</span></a> </li>
                        </c:if>
                        
                        <c:if test="${mersettleinfoQuery}">
                            <li><a class="menu_js" href="${ctx}/mersettleinfo/query"><i class="fa fa-folder-open-o"></i><span class="submenu-title">商户结算设置查询</span></a> </li>
                        </c:if>
                        
                        <!-- 
                        <c:if test="${toCreateCbMerchant}">
                            <li><a class="menu_js" href="${ctx}/cbMerchant/toCreateCbMerchant.do"><i class="fa fa-folder-open-o"></i><span class="submenu-title">商户录入</span></a> </li>
                        </c:if>
                         -->
                        <c:if test="${merchantFeeRuleQuery}">
                            <li><a class="menu_js" href="${ctx}/cbMerchant/merchantFeeRule/query.do"><i class="fa fa-folder-open-o"></i><span class="submenu-title">商户手续费管理</span></a> </li>
                        </c:if>
                        
                        <c:if test="${toMerchantPieceSearch}">
                            <li><a class="menu_js" href="${ctx}/cbMerchant/toMerchantPieceSearch"><i class="fa fa-folder-open-o"></i><span class="submenu-title">进件信息查询</span></a> </li>
                        </c:if>

						<c:if test="${cbMerchantOperatorManage}">
                            <li><a class="menu_js" href="${ctx}/cbMerchant/cbMerchantOperatorManageList"><i class="fa fa-folder-open-o"></i><span class="submenu-title">跨境商户操作员管理</span></a> </li>
                        </c:if>
                    </ul>
                </li>
            </c:if>
            
            <!-- 新商户运营管理ljs -->
            
            
            <c:if test="${newmanagerMer}">
                <li class="menu_js">
                    <a href="javascript:void(0)"><i class="fa fa-folder"><div class="icon-bg bg-yellow"></div></i>
                        <span class="menu-title">新商户管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                    	<c:if test="${new_managerMer_insert}">
                            <li><a class="menu_js" href="${ctx}/merchant/toNewCreateMerchant"><i class="fa fa-folder-open-o"></i><span class="submenu-title">商户入网</span></a> </li>
                        </c:if>
                        <c:if test="${new_managerMer_query}">
                            <li><a class="menu_js" href="${ctx}/merchant/queryMerchant"><i class="fa fa-folder-open-o"></i><span class="submenu-title">商户信息查询</span></a> </li>
                        </c:if>
                        <c:if test="${new_managerMer_opa_insert}">
                            <li><a class="menu_js" href="${ctx}/merchant/cbMerchantOperatorManageList"><i class="fa fa-folder-open-o"></i><span class="submenu-title">商户超级管理员查询</span></a> </li>
                        </c:if>
                         <c:if test="${merchantFeeRule}">
                            <li><a class="menu_js" href="${ctx}/cbMerchant/merchantFeeRule/query"><i class="fa fa-folder-open-o"></i><span class="submenu-title">商户手续费管理</span></a> </li>
                        </c:if>
                    </ul>
                </li>
            </c:if>
            
            
            
               <c:if test="${customerApply}">
                <li class="menu_js">
                    <a href="javascript:void(0)"><i class="fa fa-folder"><div class="icon-bg bg-yellow"></div></i>
                        <span class="menu-title">海关申报管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${customerSearch}">
                            <li><a class="menu_js" href="${ctx}/cbCustomer/customerSearch.do"><i class="fa fa-folder-open-o"></i><span class="submenu-title">海关申报审核</span></a> </li>
                        </c:if>
                        <li><a class="menu_js" href="${ctx}/static/cbCustomer/queryDetail"><i class="fa fa-folder-open-o"></i><span class="submenu-title">海关明细查询</span></a> </li>
                    </ul>
                </li>
            </c:if>

            <c:if test="${reportStatistics}">
                <li class="menu_js"><a href="javascript:void(0)"><i class="fa fa-shield"><div class="icon-bg bg-yellow"></div></i>
                    <span class="menu-title">报表统计</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${selectYearReportOfBusinessList}"><li><a  class="menu_js" href="${ctx}/reportStatistics/selectYearReportOfBusinessList"><i class="fa fa-bomb"></i><span class="submenu-title">业务统计年报</span></a> </li></c:if>
                    </ul>
                </li>
            </c:if>
            
            <c:if test="${riskManage}">
                <li class="menu_js"><a href="javascript:void(0)"><i class="fa fa-shield"><div class="icon-bg bg-yellow"></div></i>
                    <span class="menu-title">风控管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${riskCustomerWhiteList}"><li><a  class="menu_js" href="${ctx}/riskManage/riskCustomerWhiteList"><i class="fa fa-bomb"></i><span class="submenu-title">商户白名单</span></a> </li></c:if>
                        <c:if test="${riskCustomerBlackList}"><li><a  class="menu_js" href="${ctx}/riskManage/riskCustomerBlackList"><i class="fa fa-bomb"></i><span class="submenu-title">商户黑名单</span></a> </li></c:if>
                        <c:if test="${riskUserWhiteList}"><li><a  class="menu_js" href="${ctx}/riskManage/riskUserWhiteList"><i class="fa fa-bomb"></i><span class="submenu-title">个人白名单</span></a> </li></c:if>
                        <c:if test="${riskUserBlackList}"><li><a  class="menu_js" href="${ctx}/riskManage/riskUserBlackList"><i class="fa fa-bomb"></i><span class="submenu-title">个人黑名单</span></a> </li></c:if>
                        <c:if test="${riskRuleConfigItem}"><li><a  class="menu_js" href="${ctx}/cbTrade/riskRuleConfigQuery"><i class="fa fa-bomb"></i><span class="submenu-title">风控配置</span></a> </li></c:if>
                        <c:if test="${riskAMLPage}"><li><a  class="menu_js" href="${ctx}/risk/toAMLPage"><i class="fa fa-bomb"></i><span class="submenu-title">反洗钱管理</span></a> </li></c:if>
                        <c:if test="${risklimitrules}"><li><a  class="menu_js" href="${ctx}/riskManage/limitrules"><i class="fa fa-bomb"></i><span class="submenu-title">微支付风控配置</span></a> </li></c:if>
                        <c:if test="${realNameAuth}"><li><a  class="menu_js" href="${ctx}/static/realNameAuthControl/toRealNameAuth"><i class="fa fa-bomb"></i><span class="submenu-title">身份证查询</span></a> </li></c:if>
                    </ul>
                </li>
            </c:if>
            
            
             <c:if test="${riesManage}">
                <li class="menu_js"><a href="javascript:void(0)"><i class="fa fa-shield"><div class="icon-bg bg-yellow"></div></i>
                    <span class="menu-title">支付风险信息管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${riskPRList}"><li><a  class="menu_js" href="${ctx}/riesManage/riesPRGetList"><i class="fa fa-bomb"></i><span class="submenu-title">个人风险信息上报</span></a> </li></c:if>
                        <c:if test="${riskMRList}"><li><a  class="menu_js" href="${ctx}/riesManage/riesMRGetList"><i class="fa fa-bomb"></i><span class="submenu-title">商户风险信息上报</span></a> </li></c:if>
                        <c:if test="${riskEditPQ}"><li><a  class="menu_js" href="${ctx}/riesManage/riesEditPQ"><i class="fa fa-bomb"></i><span class="submenu-title">个人风险信息变更</span></a> </li></c:if>
                        <c:if test="${riskEditMQ}"><li><a  class="menu_js" href="${ctx}/riesManage/riesEditMQ"><i class="fa fa-bomb"></i><span class="submenu-title">商户风险信息变更</span></a> </li></c:if>
                    	<c:if test="${riskInfoPQ}"><li><a  class="menu_js" href="${ctx}/riesManage/riesPQPage"><i class="fa fa-bomb"></i><span class="submenu-title">个人风险信息查询</span></a> </li></c:if>
                    	<c:if test="${riskInfoMQ}"><li><a  class="menu_js" href="${ctx}/riesManage/riesMQPage"><i class="fa fa-bomb"></i><span class="submenu-title">商户风险信息查询</span></a> </li></c:if>
                    	<c:if test="${riskPool}"><li><a  class="menu_js" href="${ctx}/riesManage/riesPoolPage"><i class="fa fa-bomb"></i><span class="submenu-title">商户汇总信息查询</span></a> </li></c:if>
                    	<li><a  class="menu_js" href="${ctx}/riesManage/riesEMIReportPage"><i class="fa fa-bomb"></i><span class="submenu-title">特约商户信息管理</span></a> </li>
                    	<li><a  class="menu_js" href="${ctx}/riesManage/riesGetBlackList"><i class="fa fa-bomb"></i><span class="submenu-title">清算协会黑名单查询</span></a> </li>

                     </ul>
                </li>
            </c:if>
            
            <c:if test="${settleManage}">
                <li class="menu_js"><a href="javascript:void(0)"><i class="fa fa-shield"><div class="icon-bg bg-yellow"></div></i>
                    <span class="menu-title">结算管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${querySettleOrderList}"><li><a  class="menu_js" href="${ctx}/settle/querySettleOrderList"><i class="fa fa-bomb"></i><span class="submenu-title">结算订单查询</span></a> </li></c:if>
                        <c:if test="${selectLedgerList}"><li><a  class="menu_js" href="${ctx}/ledger/selectLedgerList"><i class="fa fa-bomb"></i><span class="submenu-title">账务查询</span></a> </li></c:if>
                    </ul>
                </li>
            </c:if>
            
            <c:if test="${micropayManage}">
                <li class="menu_js"><a href="javascript:void(0)"><i class="fa fa-shield"><div class="icon-bg bg-yellow"></div></i>
                    <span class="menu-title">微支付管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${queryMpayOrderList}"><li><a  class="menu_js" href="${ctx}/micropay/mpayOrder/queryMpayOrderList?beginDate=today&endDate=today"><i class="fa fa-bomb"></i><span class="submenu-title">订单查询</span></a> </li></c:if>
                    	 <c:if test="${queryMpayOrderList}"><li><a  class="menu_js" href="${ctx}/static/micropay/mpayPayment/queryMpayPaymentList?beginDate=today&endDate=today"><i class="fa fa-bomb"></i><span class="submenu-title">支付记录查询</span></a> </li></c:if>
                    	<c:if test="${queryMpayRefundList}"><li><a  class="menu_js" href="${ctx}/micropay/mpayRefund/queryMpayRefundList"><i class="fa fa-bomb"></i><span class="submenu-title">退款查询</span></a> </li></c:if>
                   		<c:if test="${CheckFile}"><li><a  class="menu_js" href="${ctx}/micropay/check/Check"><i class="fa fa-bomb"></i><span class="submenu-title">对账管理</span></a> </li></c:if>
                        <c:if test="${zpayReportInfoManage}">
                            <li><a href="javascript:void(0)"><i class="fa nav-icon-risk fa-fw">
                                <div class="icon-bg bg-pink"></div>
                            </i><span class="submenu-title">商户报备信息管理</span><span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                <c:if test="${zpayReportInfoQuery}"><li><a  class="menu_js" href="${ctx}/ztrade/zpayReportInfoQuery"><i class="fa fa-bomb"></i><span class="submenu-title">报备信息管理</span></a> </li></c:if>
                                <c:if test="${toImportExcelForReport}"><li><a  class="menu_js" href="${ctx}/ztrade/toImportExcelForReport"><i class="fa fa-bomb"></i><span class="submenu-title">导入excel报备商户信息</span></a> </li></c:if>
                                <c:if test="${checkReportInfo}"><li><a  class="menu_js" href="${ctx}/micropay/checkReportInfo"><i class="fa fa-bomb"></i><span class="submenu-title">检查报备信息回执</span></a> </li></c:if>
                                </ul>
                            </li>
                        </c:if>
                        <c:if test="${queryWxPayOrderList}"><li><a  class="menu_js" href="${ctx}/wxpay/queryWxPayOrderList?beginDate=today&endDate=today"><i class="fa fa-bomb"></i><span class="submenu-title">老系统订单查询</span></a> </li></c:if>
                        <c:if test="${toRouteList}"><li><a  class="menu_js" href="${ctx}/micropay/toRouteList"><i class="fa fa-bomb"></i><span class="submenu-title">哗啦啦修改通道路由</span></a> </li></c:if>
                        <c:if test="${toRouteListSpMerchantNo}"><li><a  class="menu_js" href="${ctx}/micropay/toRouteListSpMerchantNo"><i class="fa fa-bomb"></i><span class="submenu-title">哗啦啦修改通道路由(服务商模式)</span></a> </li></c:if>
                        <c:if test="${queryMicroPayRouteList }"><li><a  class="menu_js" href="${ctx }/micropay/route/queryRouteList"><i class="fa fa-bomb"></i><span class="submenu-title">路由信息查询</span></a> </li></c:if>

                        <c:if test="${queryMicroPayAreaCodeList}"><li><a  class="menu_js" href="${ctx }/static/micropay/route/queryAreaCodeList"><i class="fa fa-bomb"></i><span class="submenu-title">地区编码设置</span></a> </li></c:if>
                        <c:if test="${queryChannelmatchingList}"><li><a  class="menu_js" href="${ctx }/static/micropay/route/ChannelmatchingList"><i class="fa fa-bomb"></i><span class="submenu-title">通道匹配</span></a> </li></c:if>
                        

                   		<c:if test="${outOrderList }"><li><a  class="menu_js" href="${ctx }/micropay/outOrderList"><i class="fa fa-bomb"></i><span class="submenu-title">外部订单管理</span></a> </li></c:if>
                        <c:if test="${findZpayReportChannelList }"><li><a  class="menu_js" href="${ctx }/microPay/findReportChannelList"><i class="fa fa-bomb"></i><span class="submenu-title">报备通道管理</span></a> </li></c:if>

                    </ul>
                </li>
            </c:if>
            
            <c:if test="${zpayGatherInfoManage}">
                <li class="menu_js"><a href="javascript:void(0)"><i class="fa fa-shield"><div class="icon-bg bg-yellow"></div></i>
                    <span class="menu-title">业务数据汇总</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${queryZpayGatherInfoList}"><li><a  class="menu_js" href="${ctx}/micropay/zpayGatherInfo/queryZpayGatherInfoList?beginDate=today&endDate=today"><i class="fa fa-bomb"></i><span class="submenu-title">业务数据汇总查询</span></a> </li></c:if>
                    	<li><a  class="menu_js" href="${ctx}/static/ztrade/check/queryCheckAccountResult"><i class="fa fa-bomb"></i><span class="submenu-title">对账结果查询</span></a> </li>
                    </ul>
                </li>
            </c:if>
            
            <c:if test="${zhsh}">
                <li class="menu_js"><a href="javascript:void(0)"><i class="fa fa-shield"><div class="icon-bg bg-yellow"></div></i>
                    <span class="menu-title">智慧生活</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${zhshtoorderquery}"><li><a  class="menu_js" href="${ctx}/static/casher/orderquery"><i class="fa fa-bomb"></i><span class="submenu-title">订单查询</span></a> </li></c:if>
                        <c:if test="${zhshtoorderquery}"><li><a  class="menu_js" href="${ctx}/static/casher/mcbquery"><i class="fa fa-bomb"></i><span class="submenu-title">商户绑定</span></a> </li></c:if>
                    </ul>
                </li>
          </c:if>

            <c:if test="${serverOperation}">
                <li class="menu_js"><a href="javascript:void(0)"><i class="fa fa-shield"><div class="icon-bg bg-yellow"></div></i>
                    <span class="menu-title">运维管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${operationquery}"><li><a  class="menu_js" href="${ctx}/static/serverOperation/getOperationList?type=NORMAL"><i class="fa fa-bomb"></i><span class="submenu-title">微支付应用管理</span></a> </li></c:if>
                    </ul>
                </li>
            </c:if>
            <!-- 如果添加新菜单请写在上面 ,样式可以从下面菜单中找-->
            <!--  废弃菜单-->
            <%--
            <c:if test="${sessionScope.merManager}">
                <li class="menu_js">
                    <a href="javascript:void(0)"><i class="fa fa-th-large fa-fw"><div class="icon-bg bg-orange"></div></i>
                        <span class="menu-title">商户管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${sessionScope.merManagerToInsert}"><li><a class="menu_js" href="<%=request.getContextPath()%>/merManager/toInsert.do"><i class="fa fa-pencil-square-o"></i><span class="submenu-title">商户录入</span></a> </li></c:if>
                        <c:if test="${sessionScope.merManagerMerSearch}"><li><a class="menu_js" href="<%=request.getContextPath()%>/merManager/merSearch.do"> <i class="fa fa-search"></i><span class="submenu-title">商户信息查询</span></a> </li></c:if>
                        <c:if test="${sessionScope.merManagerMerUserAdd}"><li><a class="menu_js" href="<%=request.getContextPath()%>/merManager/merUserAdd.do"> <i class="fa fa-file-o"></i><span class="submenu-title">商户用户创建</span></a> </li></c:if>
                        <c:if test="${sessionScope.merManagerMerUserSearch}"><li><a class="menu_js" href="<%=request.getContextPath()%>/merManager/merUserSearch.do"> <i class="fa fa-group"></i><span class="submenu-title">商户用户查询</span></a> </li></c:if>

                    </ul>
                </li>
            </c:if>


            <c:if test="${sessionScope.workCenter}">
                <li class="menu_js">
                    <a href="javascript:void(0)"><i class="fa fa-laptop"><div class="icon-bg bg-yellow"></div></i>
                        <span class="menu-title">工作中心</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${sessionScope.workCenterToAuditMerList}">
                            <li><a class="menu_js" href="${ctx}/workCenter/toAuditMerList.do"><i class="fa fa-eye"></i><span class="submenu-title">商户入网信息审核</span></a> </li>
                        </c:if>
                        <c:if test="${sessionScope.workCenterFindMerContractInfoList}">
                            <li><a class="menu_js" href="${ctx}/workCenter/findMerContractInfoList.do"><i class="fa fa-file-text-o"></i><span class="submenu-title">商户合同审核</span></a> </li>
                        </c:if>

                        <c:if test="${sessionScope.workCenterTochangeToCheckMer}">
                            <li><a class="menu_js" href="${ctx}/workCenter/tochangeToCheckMer.do"><i class="fa fa-eye"></i><span class="submenu-title">商户变更审核</span></a> </li>
                        </c:if>
                    </ul>
                </li>
            </c:if>

            <c:if test="${sessionScope.openService}">
                <li class="menu_js">
                    <a href="javascript:void(0)"><i class="fa fa-folder"><div class="icon-bg bg-yellow"></div></i>
                        <span class="menu-title">商户开通服务管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${sessionScope.openServiceToOpenServiceList}">
                            <li><a class="menu_js" href="${ctx}/openService/toOpenServiceList.do"><i class="fa fa-folder-open-o"></i><span class="submenu-title">商户服务开通</span></a> </li>
                        </c:if>
                    </ul>
                </li>
            </c:if>

            <c:if test="${sessionScope.accountsmanager}">
                <li><a href="javascript:void(0)"><i class="fa fa-refresh">
                    <div class="icon-bg bg-yellow"></div>
                </i><span class="menu-title">账务管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">

                        <c:if test="${sessionScope.toAccBalanceLogList}">
                            <li><a href="${ctx}/accountsmanager/toAccBalanceLogList.do"><i
                                    class="fa fa-edit"></i><span class="submenu-title">账务调账申请</span></a></li>
                        </c:if>
                        <c:if test="${sessionScope.toAccBlanceLogReviewList}">
                            <li><a
                                    href="${ctx}/accountsmanager/toAccBlanceLogReviewList.do"><i
                                    class="fa fa-pencil"></i><span class="submenu-title">账务调账审核</span></a></li>
                        </c:if>

                    </ul></li>
            </c:if>

            <c:if test="${sessionScope.riskManage}">
                <li class="menu_js"><a href="javascript:void(0)"><i class="fa fa-shield"><div class="icon-bg bg-yellow"></div></i>
                    <span class="menu-title">风控管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${sessionScope.riskManageToBlankCardNumManage}"><li><a  class="menu_js" href="${ctx}/riskManage/toBlankCardNumManage.do"><i class="fa fa-bomb"></i><span class="submenu-title">银行卡黑名单</span></a> </li></c:if>
                        <c:if test="${sessionScope.riskManageToBlackCardBinManage}"><li><a  class="menu_js" href="${ctx}/riskManage/toBlackCardBinManage.do"><i class="fa fa-ellipsis-h"></i><span class="submenu-title">卡bin黑名单</span></a> </li></c:if>
                        <c:if test="${sessionScope.riskManageToBlackMerManage}"><li><a  class="menu_js" href="${ctx}/riskManage/toBlackMerManage.do"><i class="fa fa-user"></i><span class="submenu-title">商户黑名单</span></a> </li></c:if>
                    </ul>
                </li>
            </c:if>

            <c:if test="${sessionScope.database}">
                <li><a href="javascript:void(0)"><i class="fa fa-archive">
                    <div class="icon-bg bg-yellow"></div>
                </i><span class="menu-title">数据仓库</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${sessionScope.channelInfoList}"><li><a href="${ctx}/channelInfo/channelInfoList.do"><i class="fa fa-search"></i><span class="submenu-title">通道信息查询</span></a> </li></c:if>
                    </ul>
                </li>
            </c:if>

            <c:if test="${sessionScope.authRoute}">
                <li><a href="javascript:void(0)"><i class="fa fa-tasks">
                    <div class="icon-bg bg-yellow"></div>
                </i><span class="menu-title">路由管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${sessionScope.toWY}"> <li><a href="${ctx}/authRouteUploadWY/toWY.do"><i class="fa fa-credit-card"></i><span class="submenu-title">网银</span></a> </li></c:if>
                        <c:if test="${sessionScope.toKJ}"><li><a href="${ctx}/authRouteUploadKJ/toKJ.do"><i class="fa nav-icon-kj"></i><span class="submenu-title">快捷</span></a> </li></c:if>
                        <c:if test="${sessionScope.toDK}"><li><a href="${ctx}/authRouteUploadDK/toDK.do"><i class="fa nav-icon-ds"></i><span class="submenu-title">代收</span></a> </li></c:if>
                        <c:if test="${sessionScope.toDF}"> <li><a href="${ctx}/authRouteUploadDF/toDF.do"><i class="fa nav-icon-df"></i><span class="submenu-title">代付</span></a> </li></c:if>
                        <c:if test="${sessionScope.routUploadInfoList}"><li><a href="${ctx}/routUploadInfo/routUploadInfoList.do"><i class="fa fa-search"></i><span class="submenu-title">上传日志查询</span></a> </li></c:if>
                    </ul>
                </li>
            </c:if>

            <li><a href="javascript:void(0)"><i class="fa fa-send-o fa-fw">
            <div class="icon-bg bg-yellow"></div>
            </i><span class="menu-title">通道管理</span><span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">
            <li><a href="tdgl_tdds.html"><i class="fa fa-download"></i><span class="submenu-title">通道代收文件下载</span></a> </li>
            <li><a href="tdgl_shhp.html"><i class="fa fa-arrow-down"></i><span class="submenu-title">商户回盘文件下载</span></a> </li>
            </ul>
            </li>
            <c:if test="${sessionScope.trans}">
                <li class="menu_js">
                    <a href="javascript:void(0)"><i class="fa fa-credit-card"><div class="icon-bg bg-yellow"></div></i>
                        <span class="menu-title">交易结算</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${sessionScope.transTotransSettle}">
                            <li><a class="menu_js"  href="${ctx}/trans/totransSettle.do"><i class="fa fa-list-ul"></i><span class="submenu-title">交易结算明细</span></a> </li>
                        </c:if>
                        <c:if test="${sessionScope.transTotransStatis}">
                            <li><a class="menu_js" href="${ctx}/trans/totransStatis.do"><i class="fa fa-list-alt"></i><span class="submenu-title">交易结算汇总</span></a> </li>
                        </c:if>
                              <c:if test="${sessionScope.transAccDetailTota}">
                                   <li><a class="menu_js"  href="${ctx}/trans/accDetailTota.do"><i class="fa fa-list-alt"></i><span class="submenu-title">账户明细查询</span></a> </li>
                            </c:if>
                    </ul>
                </li>
                <li><a href="javascript:void(0)"><i class="fa fa-files-o">
                    <div class="icon-bg bg-yellow"></div>
                </i><span class="menu-title">对账管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="dzgl_jytddz.html"><i class="fa fa-columns"></i><span class="submenu-title">交易通道对账</span></a> </li>
                    </ul>
                </li>
            </c:if>
            <c:if test="${sessionScope.statis}">
                <li class="menu_js">
                    <a href="javascript:void(0)"><i class="fa fa-credit-card"><div class="icon-bg bg-yellow"></div></i>
                        <span class="menu-title">账户余额管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${sessionScope.transAccDetailTota}">
                            <li><a class="menu_js"  href="${ctx}/trans/accDetailTota.do"><i class="fa fa-list-alt"></i><span class="submenu-title">账户余额查询</span></a> </li>
                        </c:if>
                        <c:if test="${sessionScope.transAccDetailList}">
                            <li><a class="menu_js"  href="${ctx}/trans/accDetailList.do"><i class="fa fa-list-alt"></i><span class="submenu-title">账务明细查询</span></a> </li>
                        </c:if>

                    </ul>
                </li>
            </c:if>

                  <li>
          	<a href="javascript:void(0)"><i class="fa fa-files-o"><div class="icon-bg bg-yellow"></div></i>
          	<span class="menu-title">对账管理</span><span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">
              <li><a href="<%=request.getContextPath()%>/tradingchannelmanage/toquerytradechannel.do"><i class="fa fa-columns"></i><span class="submenu-title">交易通道对账</span></a> </li>
            </ul>
          </li>



            <c:if test="${sessionScope.financial}">
                <li class="menu_js">
                    <a href="javascript:void(0)"><i class="fa fa-jpy"><div class="icon-bg bg-yellow"></div></i>
                        <span class="menu-title">财务管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${sessionScope.financialFinancialIncome}">
                            <li><a class="menu_js" href="${ctx}/financial/financialIncome.do"><i class="fa fa-search"></i><span class="submenu-title">收益报表查询</span></a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.toAccountDetailList}">
                            <li><a href="${ctx}/financial/toAccountDetailList.do"><i class="fa fa-exclamation"></i><span class="submenu-title">账务差错处理</span></a> </li>
                        </c:if>
                    </ul>
                </li>
            </c:if>


            <c:if test="${sessionScope.monitor}">
                <li class="menu_js">
                    <a href="javascript:void(0)"><i class="fa fa-compass"><div class="icon-bg bg-yellow"></div></i>
                        <span class="menu-title">监控管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${sessionScope.monitorToMonitoringProduct}"><li><a class="menu_js" href="${ctx}/monitor/toMonitoringProduct.do"><i class="fa fa-compass"></i><span class="submenu-title">产品监控</span></a> </li></c:if>
                        <c:if test="${sessionScope.monitorToMonitoringStatistics}"><li><a class="menu_js" href="${ctx}/monitor/toMonitoringStatistics.do"><i class="fa fa-money"></i><span class="submenu-title">通道交易监控</span></a> </li></c:if>
                        <c:if test="${sessionScope.monitorAbnormal}"><li><a href="javascript:void(0)"><i class="fa fa-crosshairs"><div class="icon-bg bg-pink"></div></i>
                            <span class="submenu-title">通道异常监控</span><span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <c:if test="${sessionScope.configureToAddChannelConfig}"><li><a name="thirdLevel" class="menu_js" href="${ctx}/configure/toAddChannelConfig.do"> <i class="fa fa-cog"></i><span class="submenu-title">通道异常设置</span></a> </li></c:if>
                                <c:if test="${sessionScope.rateToChannelMonitorData}"><li><a name="thirdLevel" class="menu_js" href="${ctx}/rate/toChannelMonitorData.do"><i class="fa fa-list-ul"></i><span class="submenu-title">通道异常明细</span></a> </li></c:if>
                                <c:if test="${sessionScope.rateToChannelMonitorDataCount}"><li><a name="thirdLevel" class="menu_js" href="${ctx}/rate/toChannelMonitorDataCount.do"><i class="fa fa-bar-chart-o"></i><span class="submenu-title">通道异常统计</span></a> </li></c:if>
                            </ul>
                        </li>
                        </c:if>
                    </ul>
                </li>
            </c:if>

            <c:if test="${sessionScope.channelManage}">
                <li class="menu_js">
                    <a href="javascript:void(0)"><i class="fa fa-jpy"><div class="icon-bg bg-yellow"></div></i>
                        <span class="menu-title">通道管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${sessionScope.toOrderBatchList}">
                            <li><a class="menu_js" href="${ctx}/channelManage/toOrderBatchList.do"><i class="fa fa-search"></i><span
                                    class="submenu-title">通道代收文件下载</span></a></li>
                        </c:if>
                        <c:if test="${sessionScope.refundApplySearch}">
                            <li><a class="menu_js" href="<%=request.getContextPath()%>/channelManage/toDiskDownload.do"><i
                                    class="fa fa-reply-all"></i><span class="submenu-title">商户回盘文件下载</span></a></li>
                        </c:if>
                    </ul>
                </li>
            </c:if>




            <c:if test="${sessionScope.transManage}">
                <li class="menu_js">
                    <a href="javascript:void(0)"><i class="fa fa-jpy"><div class="icon-bg bg-yellow"></div></i>
                        <span class="menu-title">交易管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:if test="${sessionScope.selectTransLogList}">
                            <li><a class="menu_js" href="${ctx}/transManage/selectTransLogList.do"><i class="fa fa-search"></i><span
                                    class="submenu-title">交易查询</span></a></li>
                        </c:if>
                        <c:if test="${sessionScope.refundApplySearch}">
                            <li><a class="menu_js" href="<%=request.getContextPath()%>/refundApplyManage/refundApplySearch.do"><i
                                    class="fa fa-reply-all"></i><span class="submenu-title">退款查询</span></a></li>
                        </c:if>
                    </ul>
                </li>
            </c:if>--%>

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