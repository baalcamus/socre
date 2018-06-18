package com.chinagpay.boss.contants;

import java.util.Properties;

import com.chinagpay.boss.common.util.PropertiesUtil;

public final class ContantsSelf {
	private static String ruleArr;//功能列表
	private static String initPassword;//初始密码

	static{
		init();
	}
	/**
	 * 初始化
	 */
	public static void init(){
		Properties pros = PropertiesUtil.getProperties("/config/forpay-web.properties");
		
		initPassword=(String) pros.get("self.initpassword");
		ruleArr=(String) pros.get("self.ruleArr");
	}
	
	public static String getInitPassword() {
		return initPassword;
	}
	
	public static String getRuleArr() {
		return ruleArr;
	}
}
