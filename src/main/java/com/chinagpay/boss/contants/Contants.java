package com.chinagpay.boss.contants;

import java.io.IOException;
import java.util.Properties;

import org.apache.log4j.LogManager;

public final class Contants {
	private static final org.apache.log4j.Logger logger = LogManager.getLogger(Contants.class);
	private static String mctRemitNotifyVoucherDir;//跨境汇款文件凭证所在文件夹
	private static String cy2UsdFileDir;//折算美元汇率文件夹
	private static String forexOrderTempletFileDir;
	private static String payClearTyshxxFileDir;  //特约商户信息文件导入地址
	private static String forexRemitPetitionsavepath;//汇款申请书保存目录
	private static String ADD_CUSTOMERLIST_URL;
	private static String UPDATE_CUSTOMERLIST_URL;
	private static String DELETE_CUSTOMERLIST_URL;
	private static String ADD_USERLIST_URL;
	private static String UPDATE_USERLIST_URL;
	private static String DELETE_USERLIST_URL;
	private static String ecsAppId,ecsAppKey,ecsAppUrl,ecsAppVersion;
	static{
		init();
	}
	/**
	 * 初始化
	 */
	public static void init(){
//		Properties pros = PropertiesUtil.getProperties("/config/forpay-web.properties");
		Properties pros = new Properties();
		try {
			pros.load(Contants.class.getResourceAsStream("/config/forpay-web.properties"));
		
			cy2UsdFileDir=(String) pros.get("cbbank.currency2usd.savepath");
			mctRemitNotifyVoucherDir=(String) pros.get("cbtrade.account.remitcert.savepath");
			forexOrderTempletFileDir=(String) pros.get("forex.order.templet.savepath");
			payClearTyshxxFileDir=(String) pros.get("pay.clearing.association.tyshxx.savepath");
			forexRemitPetitionsavepath=(String) pros.get("forex.remit.petition.savepath");
			ecsAppId=(String) pros.get("cb.ecs.appId");
			ecsAppKey=(String) pros.get("cb.ecs.appKey");
			ecsAppUrl=(String) pros.get("cb.ecs.appUrl");
			ecsAppVersion=(String) pros.get("cb.ecs.appVersion");
			ADD_CUSTOMERLIST_URL = (String)pros.get("ADD_CUSTOMERLIST_URL");
			UPDATE_CUSTOMERLIST_URL = (String)pros.get("UPDATE_CUSTOMERLIST_URL");
			DELETE_CUSTOMERLIST_URL = (String)pros.get("DELETE_CUSTOMERLIST_URL");
			ADD_USERLIST_URL = (String)pros.get("ADD_USERLIST_URL");
			UPDATE_USERLIST_URL = (String)pros.get("UPDATE_USERLIST_URL");
			DELETE_USERLIST_URL = (String)pros.get("DELETE_USERLIST_URL");
		} catch (IOException e) {
			logger.error("加载配置文件异常",e);
		}
	}
	/**
	 * @return 跨境汇款通知凭证路径
	 */
	public static String getMctRemitNotifyVoucherDir() {
		return mctRemitNotifyVoucherDir;
	}
	public static String getCy2UsdFileDir() {
		return cy2UsdFileDir;
	}
	public static void main(String[] args) {
		System.out.println(Contants.getCy2UsdFileDir());
	}
	public static String getADD_CUSTOMERLIST_URL() {
		return ADD_CUSTOMERLIST_URL;
	}
	public static void setADD_CUSTOMERLIST_URL(String aDD_CUSTOMERLIST_URL) {
		ADD_CUSTOMERLIST_URL = aDD_CUSTOMERLIST_URL;
	}
	public static String getUPDATE_CUSTOMERLIST_URL() {
		return UPDATE_CUSTOMERLIST_URL;
	}
	public static void setUPDATE_CUSTOMERLIST_URL(String uPDATE_CUSTOMERLIST_URL) {
		UPDATE_CUSTOMERLIST_URL = uPDATE_CUSTOMERLIST_URL;
	}
	public static String getDELETE_CUSTOMERLIST_URL() {
		return DELETE_CUSTOMERLIST_URL;
	}
	public static void setDELETE_CUSTOMERLIST_URL(String dELETE_CUSTOMERLIST_URL) {
		DELETE_CUSTOMERLIST_URL = dELETE_CUSTOMERLIST_URL;
	}
	public static String getADD_USERLIST_URL() {
		return ADD_USERLIST_URL;
	}
	public static void setADD_USERLIST_URL(String aDD_USERLIST_URL) {
		ADD_USERLIST_URL = aDD_USERLIST_URL;
	}
	public static String getUPDATE_USERLIST_URL() {
		return UPDATE_USERLIST_URL;
	}
	public static void setUPDATE_USERLIST_URL(String uPDATE_USERLIST_URL) {
		UPDATE_USERLIST_URL = uPDATE_USERLIST_URL;
	}
	public static String getDELETE_USERLIST_URL() {
		return DELETE_USERLIST_URL;
	}
	public static void setDELETE_USERLIST_URL(String dELETE_USERLIST_URL) {
		DELETE_USERLIST_URL = dELETE_USERLIST_URL;
	}
	public static void setMctRemitNotifyVoucherDir(String mctRemitNotifyVoucherDir) {
		Contants.mctRemitNotifyVoucherDir = mctRemitNotifyVoucherDir;
	}
	public static void setCy2UsdFileDir(String cy2UsdFileDir) {
		Contants.cy2UsdFileDir = cy2UsdFileDir;
	}
	public static String getForexOrderTempletFileDir() {
		return forexOrderTempletFileDir;
	}
	public static String getForexRemitPetitionsavepath() {
		return forexRemitPetitionsavepath;
	}
	public static org.apache.log4j.Logger getLogger() {
		return logger;
	}
	public static String getEcsAppId() {
		return ecsAppId;
	}
	public static String getEcsAppKey() {
		return ecsAppKey;
	}
	public static String getEcsAppUrl() {
		return ecsAppUrl;
	}
	public static String getEcsAppVersion() {
		return ecsAppVersion;
	}
	public static String getPayClearTyshxxFileDir() {
		return payClearTyshxxFileDir;
	}
	public static void setPayClearTyshxxFileDir(String payClearTyshxxFileDir) {
		Contants.payClearTyshxxFileDir = payClearTyshxxFileDir;
	}
	
}
