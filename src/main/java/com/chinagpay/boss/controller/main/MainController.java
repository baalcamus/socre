package com.chinagpay.boss.controller.main;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chinagpay.boss.common.sessionuser.SessionUser;
import com.chinagpay.boss.common.util.Md5Util;
import com.chinagpay.boss.dao.zboss.UserMapper;
import com.chinagpay.boss.model.Rule;
import com.chinagpay.boss.model.User;

@Controller
@RequestMapping(value = "/main")
public class MainController {
	private static Logger logger = LogManager.getLogger(MainController.class);
	@Autowired
	private UserMapper userMapper;

	@RequestMapping(value = "/toMain")
	public String toMain(HttpSession session, ModelMap model) {
		logger.info("主页面初始化");
		SessionUser sessionUser = SessionUser.get(session);
		List<Rule> ruleList = sessionUser.getRuleList();
		List<String> markList = new ArrayList<String>();
		for (int i = 0; i < ruleList.size(); i++) {
			markList.add(ruleList.get(i).getCode());
		}
		logger.info("当前用户权限list:\n" + markList);

		//DEMO  获取rule 中配置的模块地址， 设置left需要的判断
		boolean  demoManageLeft = false;
		if (markList.contains("demoManage/toDemoSearch")) {
			demoManageLeft = true;
		}
		session.setAttribute("demoManageLeft", demoManageLeft); //left中会根据 demoManageLeft判读是否显现相关页签

		// ----------系统管理-------------------
		boolean systemManage = false; // 系统管理
		if (markList.contains("systemManage")) {
			systemManage = true;
		}
		session.setAttribute("systemManage", systemManage);

		boolean systemManageUserManage = false; // 系统管理-用户管理
		if (markList.contains("systemManage/userManage")) {
			systemManageUserManage = true;
		}
		session.setAttribute("systemManageUserManage", systemManageUserManage);

		boolean systemManageToUserManage = false; // 系统管理-用户管理-用户创建
		if (markList.contains("systemManage/toUserManage")) {
			systemManageToUserManage = true;
		}
		session.setAttribute("systemManageToUserManage", systemManageToUserManage);

		boolean systemManageToAdd = false; // 系统管理-用户管理-用户创建-创建
		if (markList.contains("systemManage/toAdd")) {
			systemManageToAdd = true;
		}
		session.setAttribute("systemManageToAdd", systemManageToAdd);

		boolean systemManageToUserSearch = false; // 系统管理-用户管理-用户查询
		if (markList.contains("systemManage/toUserSearch")) {
			systemManageToUserSearch = true;
		}
		session.setAttribute("systemManageToUserSearch", systemManageToUserSearch);

		boolean systemManageToModifiUser = false; // 系统管理-用户管理-用户查询-关闭开启
		if (markList.contains("systemManage/toModifiUser")) {
			systemManageToModifiUser = true;
		}
		session.setAttribute("systemManageToModifiUser", systemManageToModifiUser);

		boolean moduleAddManage = false; // 系统管理-模块管理
		if (markList.contains("console/moduleAddManage")) {
			moduleAddManage = true;
		}
		session.setAttribute("moduleAddManage", moduleAddManage);

		boolean toModuleAddManage = false; // 系统管理-模块管理-模块创建
		if (markList.contains("console/toModuleAdd")) {
			toModuleAddManage = true;
		}
		session.setAttribute("toModuleAddManage", toModuleAddManage);

		boolean moduleAdd = false; // 系统管理-模块管理-模块创建-创建
		if (markList.contains("console/moduleAdd")) {
			moduleAddManage = true;
		}
		session.setAttribute("moduleAdd", moduleAdd);

		boolean toModuleList = false; // 系统管理-模块管理-模块查询
		if (markList.contains("console/toModuleList")) {
			toModuleList = true;
		}
		session.setAttribute("toModuleList", toModuleList);

		boolean deleteConsoleRuleRow = false; // 系统管理-模块管理-模块查询-删除
		if (markList.contains("console/deleteRow")) {
			deleteConsoleRuleRow = true;
		}
		session.setAttribute("deleteConsoleRuleRow", deleteConsoleRuleRow);

		boolean announceAddManage = false; // 系统管理-公告管理-公告创建
		if (markList.contains("announce/announceAdd")) {
			announceAddManage = true;
		}
		session.setAttribute("announceAddManage", announceAddManage);

		boolean toAnnounceAddManage = false; // 系统管理-公告管理-公告创建-创建
		if (markList.contains("announce/toAnnounceAdd")) {
			toAnnounceAddManage = true;
		}
		session.setAttribute("toAnnounceAddManage", toAnnounceAddManage);

		boolean toAnnounceList = false; // 系统管理-公告管理-公告查询
		if (markList.contains("announce/toAnnounceList")) {
			toAnnounceList = true;
		}
		session.setAttribute("toAnnounceList", toAnnounceList);

		boolean importExcel = false;
		if (markList.contains("excelController/exportExcel")) {
			importExcel = true;
		}
		session.setAttribute("importExcel", importExcel);
		// --------------- 账户管理
		boolean accountManager = false;
		if (markList.contains("accountManager")) {
			accountManager = true;
		}
		session.setAttribute("accountManager", accountManager);

		boolean cbAccountList = false; // 账户管理-跨境账户查询
		if (markList.contains("cbAccount/selectCbAccountList")) {
			cbAccountList = true;
		}
		session.setAttribute("cbAccountList", cbAccountList);

		// --------------------- 商户管理
		boolean merchantManager = false;
		if (markList.contains("merchantManager")) {
			merchantManager = true;
		}
		session.setAttribute("merchantManager", merchantManager);

		boolean toCreateCbMerchant = false;
		if (markList.contains("cbMerchant/toCreateCbMerchant")) {
			toCreateCbMerchant = true;
		}
		session.setAttribute("toCreateCbMerchant", toCreateCbMerchant);

		boolean toQueryCbMerchant = false;
		if (markList.contains("cbMerchant/queryMerchant")) {
			toQueryCbMerchant = true;
		}
		session.setAttribute("toQueryCbMerchant", toQueryCbMerchant);

		boolean toMerchantPieceSearch = false;
		if (markList.contains("cbMerchant/toMerchantPieceSearch")) {
			toMerchantPieceSearch = true;
		}
		session.setAttribute("toMerchantPieceSearch", toMerchantPieceSearch);

		boolean toMerchantPieceInfo = false;
		if (markList.contains("cbMerchant/toMerchantPieceInfo")) {
			toMerchantPieceInfo = true;
		}
		session.setAttribute("toMerchantPieceInfo", toMerchantPieceInfo);

		boolean toApprovalMerchantPieceInfo = false;
		if (markList.contains("cbMerchant/toApprovalMerchantPieceInfo")) {
			toApprovalMerchantPieceInfo = true;
		}
		session.setAttribute("toApprovalMerchantPieceInfo", toApprovalMerchantPieceInfo);

		boolean toCreateMerchant = false;
		if (markList.contains("merchant/toCreateMerchant")) {
			toCreateMerchant = true;
		}
		session.setAttribute("toCreateMerchant", toCreateMerchant);

		boolean merbizsetToAdd = false;
		if (markList.contains("merbizset/toAdd")) {
			merbizsetToAdd = true;
		}
		session.setAttribute("merbizsetToAdd", merbizsetToAdd);
		boolean mersettleinfoQuery = false;
		if (markList.contains("mersettleinfo/query")) {
			mersettleinfoQuery = true;
		}
		session.setAttribute("mersettleinfoQuery", mersettleinfoQuery);
		
		boolean cbMerchantOperatorManage = false;
		if (markList.contains("cbMerchantOperatorManage")) {
			cbMerchantOperatorManage = true;
		}
		session.setAttribute("cbMerchantOperatorManage", cbMerchantOperatorManage);

		// -------------------------跨境--------------------------------
		boolean crossBorderTradeManager = false;
		if (markList.contains("crossBorderTradeManager")) {
			crossBorderTradeManager = true;
		}
		session.setAttribute("crossBorderTradeManager", crossBorderTradeManager);
		boolean exchangeRateQuery = false;
		if (markList.contains("crossBorderTradeManager/exchangeRateQuery")) {
			exchangeRateQuery = true;
		}
		session.setAttribute("exchangeRateQuery", exchangeRateQuery);

		boolean accountRemitNotify = false;
		if (markList.contains("cbTrade/mctRemitNotifyQuery")) {
			accountRemitNotify = true;
		}
		session.setAttribute("mctRemitNotifyQuery", accountRemitNotify);
		boolean merchantFeeRuleQuery = false;// cbMerchant/merchantFeeRuleQuery
		if (markList.contains("cbMerchant/merchantFeeRule/query")) {
			merchantFeeRuleQuery = true;
		}
		session.setAttribute("merchantFeeRuleQuery", merchantFeeRuleQuery);

		boolean crossBorderResourceManager = false;// 跨境资源管理
		if (markList.contains("crossBorderResourceManager")) {
			crossBorderResourceManager = true;
		}
		session.setAttribute("crossBorderResourceManager", crossBorderResourceManager);
		boolean currency2Usd = false;// 跨境资源管理——币种折算美元汇率
		if (markList.contains("cbBank/currency2Usd/query")) {
			currency2Usd = true;
		}
		session.setAttribute("currency2Usd", currency2Usd);
		boolean remitManage = false;// 付款管理
		if (markList.contains("cbTrade/forex/remit")) {
			remitManage = true;
		}
		session.setAttribute("remitManage", remitManage);
		boolean remitOrderQuery = false;// 付款管理--订单查询
		if (markList.contains("cbTrade/forex/remit/query")) {
			remitOrderQuery = true;
		}
		session.setAttribute("remitOrderQuery", remitOrderQuery);

		boolean gatherManage = false;// 付款管理
		if (markList.contains("cbTrade/forex/gather")) {
			gatherManage = true;
		}
		session.setAttribute("gatherManage", gatherManage);
		boolean gatherOrderQuery = false;// 付款管理--订单查询
		if (markList.contains("cbTrade/forex/gather/query")) {
			gatherOrderQuery = true;
		}
		session.setAttribute("gatherOrderQuery", gatherOrderQuery);
		
		boolean trialManage = false;// 跨境试算
		if (markList.contains("cbTrade/forex/trial")) {
			trialManage = true;
		}
		session.setAttribute("trialManage", trialManage);
		boolean remitTrial = false;// 付款试算
		if (markList.contains("cbTrade/forex/trial/remitTrial")) {
			remitTrial = true;
		}
		session.setAttribute("remitTrial", remitTrial);
		
		boolean crossBorderMerchantReportList = false;// 跨境商户报备
		if (markList.contains("cbTrade/forex/crossBorderMerchantReportList")) {
			crossBorderMerchantReportList = true;
		}
		session.setAttribute("crossBorderMerchantReportList", crossBorderMerchantReportList);
		
		// ------------------------------ 备付金管理--------------------
		boolean provisionsManage = false;
		if (markList.contains("provisions/provisionsManage")) {
			provisionsManage = true;
		}
		session.setAttribute("provisionsManage", provisionsManage);

		boolean toBankManageList = false; // 备付金银行管理
		if (markList.contains("provisions/toBankManageList")) {
			toBankManageList = true;
		}
		session.setAttribute("toBankManageList", toBankManageList);

		boolean toFileManageList = false; // 报备文件管理
		if (markList.contains("provisions/toFileManageList")) {
			toFileManageList = true;
		}
		session.setAttribute("toFileManageList", toFileManageList);

		boolean toCustomerManageList = false; // 海关申报管理
		if (markList.contains("cbCustomer")) {
			toCustomerManageList = true;
		}
		session.setAttribute("customerApply", toCustomerManageList);

		boolean toCustomerConfirm = false; // 海关申报审核
		if (markList.contains("cbCustomer/customerSearch")) {
			toCustomerConfirm = true;
		}
		session.setAttribute("customerSearch", toCustomerConfirm);

		// ----------------- 报表统计 -------------------------
		boolean reportStatistics = false;
		if (markList.contains("reportStatistics")) {
			reportStatistics = true;
		}
		session.setAttribute("reportStatistics", reportStatistics);

		boolean selectYearReportOfBusinessList = false; // 业务统计年报
		if (markList.contains("reportStatistics/selectYearReportOfBusinessList")) {
			selectYearReportOfBusinessList = true;
		}
		session.setAttribute("selectYearReportOfBusinessList", selectYearReportOfBusinessList);

		// ----------------- 风控管理 -------------------------
		boolean riskManage = false;
		if (markList.contains("riskManage")) {
			riskManage = true;
		}
		session.setAttribute("riskManage", riskManage);
		boolean riskCustomerWhiteList = false; // 商户白名单
		if (markList.contains("riskManage/riskCustomerWhiteList")) {
			riskCustomerWhiteList = true;
		}
		session.setAttribute("riskCustomerWhiteList", riskCustomerWhiteList);
		boolean riskCustomerBlackList = false; // 商户黑名单
		if (markList.contains("riskManage/riskCustomerBlackList")) {
			riskCustomerBlackList = true;
		}
		session.setAttribute("riskCustomerBlackList", riskCustomerBlackList);
		boolean riskUserBlackList = false; // 人员黑名单
		if (markList.contains("riskManage/riskUserBlackList")) {
			riskUserBlackList = true;
		}
		session.setAttribute("riskUserBlackList", riskUserBlackList);
		boolean riskUserWhiteList = false; // 人员白名单
		if (markList.contains("riskManage/riskUserWhiteList")) {
			riskUserWhiteList = true;
		}
		session.setAttribute("riskUserWhiteList", riskUserWhiteList);

		boolean riskRuleConfigItem = false; // 人员白名单
		if (markList.contains("cbTrade/riskRuleConfigQuery")) {
			riskRuleConfigItem = true;
		}
		session.setAttribute("riskRuleConfigItem", riskRuleConfigItem);

		boolean riskAMLPage = false;
		if (markList.contains("risk/toAMLPage")){
			riskAMLPage = true;
		}
		session.setAttribute("riskAMLPage",riskAMLPage);
		
		boolean risklimitrules=false;
		if (markList.contains("riskManage/limitrules")){
			risklimitrules = true;
		}
		session.setAttribute("risklimitrules",risklimitrules);
		
		boolean realNameAuth=false;
		if (markList.contains("riskManage/realNameAuth")){
			realNameAuth = true;
		}
		session.setAttribute("realNameAuth",realNameAuth);

		// ----------------- 结算管理 -------------------------
		boolean settleManage = false;
		if (markList.contains("settleManage")) {
			settleManage = true;
		}
		session.setAttribute("settleManage", settleManage);
		boolean querySettleOrderList = false;
		if (markList.contains("settle/querySettleOrderList")) {
			querySettleOrderList = true;
		}
		session.setAttribute("querySettleOrderList", querySettleOrderList);
		
		boolean selectLedgerList = false;
		if (markList.contains("ledger/selectLedgerList")) {
			selectLedgerList = true;
		}
		session.setAttribute("selectLedgerList", selectLedgerList);

		// ----------------- 微支付管理 -------------------------
		boolean micropayManage = false;
		if (markList.contains("micropayManage")) {
			micropayManage = true;
		}
		session.setAttribute("micropayManage", micropayManage);
		boolean queryMpayOrderList = false;
		if (markList.contains("micropay/mpayOrder/queryMpayOrderList")) {
			queryMpayOrderList = true;
		}
		session.setAttribute("queryMpayOrderList", queryMpayOrderList);
		boolean queryMpayRefundList = false; // 退款查询
		if (markList.contains("micropay/mpayRefund/queryMpayRefundList")) {
			queryMpayRefundList = true;
		}
		session.setAttribute("queryMpayRefundList", queryMpayRefundList);
		boolean CheckFile = false; // 对账管理
		if (markList.contains("micropay/check/Check")) {
			CheckFile = true;
		}
		session.setAttribute("CheckFile", CheckFile);
		boolean zpayReportInfoQuery = false;
		if (markList.contains("ztrade/zpayReportInfoQuery")) {
			zpayReportInfoQuery = true;
		}
		session.setAttribute("zpayReportInfoQuery", zpayReportInfoQuery);

		boolean queryWxPayOrderList = false;
		if (markList.contains("wxpay/queryWxPayOrderList")) {
			queryWxPayOrderList = true;
		}
		session.setAttribute("queryWxPayOrderList", queryWxPayOrderList);

		boolean zpayReportInfoManage = false;
		if (markList.contains("zpayReportInfoManage")){
			zpayReportInfoManage = true;
		}
		session.setAttribute("zpayReportInfoManage", zpayReportInfoManage);

		boolean toImportExcelForReport = false;
		if (markList.contains("/ztrade/toImportExcelForReport")){
			toImportExcelForReport = true;
		}
		session.setAttribute("toImportExcelForReport", toImportExcelForReport);
		
		boolean checkReportInfo = false;
		if (markList.contains("micropay/checkReportInfo")){
			checkReportInfo = true;
		}
		session.setAttribute("checkReportInfo", checkReportInfo);

		boolean toRouteList = false;
		if (markList.contains("micropay/toRouteList")){
			toRouteList = true;
		}
		session.setAttribute("toRouteList",toRouteList);

		boolean toRouteListSpMerchantNo = false;
		if (markList.contains("micropay/toRouteListSpMerchantNo")){
			toRouteListSpMerchantNo = true;
		}
		session.setAttribute("toRouteListSpMerchantNo",toRouteListSpMerchantNo);
		
		boolean outOrderList=false;
		if(markList.contains("micropay/outOrderList")){
			outOrderList = true;
		}
		session.setAttribute("outOrderList", outOrderList);


		boolean findZpayReportChannelList = false;
		if (markList.contains("microPay/findReportChannelList")){
			findZpayReportChannelList = true;
		}
		session.setAttribute("findZpayReportChannelList",findZpayReportChannelList);

		// ----------------- 微支付管理 -------------------------
		boolean riesManage = false;
		if (markList.contains("riesManage")) {
			riesManage = true;
		}
		session.setAttribute("riesManage", riesManage);
		boolean riskPRList = false;
		if (markList.contains("riesManage/riskPRList")) {
			riskPRList = true;
		}
		session.setAttribute("riskPRList", riskPRList);
		boolean riskMRList = false;
		if (markList.contains("riesManage/riskMRList")) {
			riskMRList = true;
		}
		session.setAttribute("riskMRList", riskMRList);

		boolean riskEditPQ = false;
		if (markList.contains("riesManage/riskEditPQ")) {
			riskEditPQ = true;
		}
		session.setAttribute("riskEditPQ", riskEditPQ);

		boolean riskEditMQ = false;
		if (markList.contains("riesManage/riskEditMQ")) {
			riskEditMQ = true;
		}
		session.setAttribute("riskEditMQ", riskEditMQ);

		boolean riskInfoPQ = false;
		if (markList.contains("riesManage/riskInfoPQ")) {
			riskInfoPQ = true;
		}
		session.setAttribute("riskInfoPQ", riskInfoPQ);

		boolean riskInfoMQ = false;
		if (markList.contains("riesManage/riskInfoMQ")) {
			riskInfoMQ = true;
		}
		session.setAttribute("riskInfoMQ", riskInfoMQ);

		boolean riskPool = false;
		if (markList.contains("riesManage/riskPool")) {
			riskPool = true;
		}
		session.setAttribute("riskPool", riskPool);
		
		// ----------------- 业务数据汇总管理 -------------------------
		boolean zpayGatherInfoManage = false;
		if (markList.contains("zpayGatherInfoManage")) {
			zpayGatherInfoManage = true;
		}
		session.setAttribute("zpayGatherInfoManage", zpayGatherInfoManage);
		boolean queryZpayGatherInfoList = false; // 业务数据汇总查询
		if (markList.contains("micropay/zpayGatherInfo/queryZpayGatherInfoList")) {
			queryZpayGatherInfoList = true;
		}
		session.setAttribute("queryZpayGatherInfoList", queryZpayGatherInfoList);
		
		boolean queryMicroPayRouteList=false;
		if (markList.contains("micropay/route/queryRouteList")) {
			queryMicroPayRouteList = true;
		}
		session.setAttribute("queryMicroPayRouteList", queryMicroPayRouteList);
		session.setAttribute("queryMicroPayAreaCodeList", true);
		session.setAttribute("queryChannelmatchingList", true);
		//-----------------------------ljs新开发商户管理------------------------------------
		
		boolean new_managerMer=false;
		if (markList.contains("newmanagerMer")) {
			new_managerMer = true;
		}
		session.setAttribute("newmanagerMer", new_managerMer);
		
		boolean new_managerMer_query=false;
		if (markList.contains("merchant/queryMerchant")) {
			new_managerMer_query = true;
		}
		session.setAttribute("new_managerMer_query", new_managerMer_query);
		boolean new_managerMer_insert=false;
		if (markList.contains("merchant/toNewCreateMerchant")) {
			new_managerMer_insert = true;
		}
		session.setAttribute("new_managerMer_insert", new_managerMer_insert);
		
		boolean new_managerMer_opa_insert=false;
		if (markList.contains("merchant/cbMerchantOperatorManageList")) {
			new_managerMer_opa_insert = true;
		}
		session.setAttribute("new_managerMer_opa_insert", new_managerMer_opa_insert);
		boolean merchantFeeRule=false;
		if (markList.contains("cbMerchant/merchantFeeRule/query")) {
			merchantFeeRule = true;
		}
		session.setAttribute("merchantFeeRule", merchantFeeRule);
		
		
		
		
		
		
		
		
		// --------------------智慧生活----------------------
		boolean zhsh = false;
		if (markList.contains("casher")) {
			zhsh = true;
		}
		session.setAttribute("zhsh", zhsh);
		boolean zhshtoorderquery = false; // 账户信息列表
		if (markList.contains("casher/toorderquery")) {
			zhshtoorderquery = true;
		}
		session.setAttribute("zhshtoorderquery", zhshtoorderquery);



		boolean serverOperation = false;
		if (markList.contains("serverOperation")) {
			serverOperation = true;
		}
		session.setAttribute("serverOperation", serverOperation);
		boolean operationquery = false; // 账户信息列表
		if (markList.contains("serverOperation/operationquery")) {
			operationquery = true;
		}
		session.setAttribute("operationquery", operationquery);

		return "/include/main";

		/*
		 * boolean toAccBalanceLogList = false; //账务调帐申请
		 * if(markList.contains("accountsmanager/toAccBalanceLogList")){
		 * toAccBalanceLogList = true;
		 * }session.setAttribute("toAccBalanceLogList", toAccBalanceLogList);
		 */
	}

	/**
	 * 去修改密码页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/toChangeLoginPwd")
	public String toChangeLoginPwd() {
		logger.info("去修改密码");
		return "/include/changePwd";
	}

	/**
	 * 修改密码
	 * 
	 * @return
	 */
	@RequestMapping(value = "/changePwd", method = RequestMethod.POST)
	@ResponseBody
	public String changePwd(HttpSession session, String oldPwd, String newPwd) {
		try {
			User user = new User();
			// 验证原始密码是否正确
			SessionUser sessionUser = SessionUser.get(session);
			user.setLoginName(sessionUser.getLoginName());
			user.setLoginPwd(Md5Util.md5Hex(oldPwd.trim()));
			user.setType("00");
			user = userMapper.getUser(user);
			if (user == null) {
				return "repeat";
			}
			// 修改密码
			user.setLoginPwd(Md5Util.md5Hex(newPwd.trim()));
			userMapper.updatePwd(user);
			session.removeAttribute("SESSION_USER");
			return "ok";
		} catch (Exception e) {
			return "fail";
		}
	}

}
