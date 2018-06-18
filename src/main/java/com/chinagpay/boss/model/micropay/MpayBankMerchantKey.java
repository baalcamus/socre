package com.chinagpay.boss.model.micropay;
/** 
	* @author  liws  
	* @date    2017年4月13日 下午5:37:13  
*/
public class MpayBankMerchantKey {

	private String id;
	
	private String reportChannel;//报备渠道
	
	private String bankMerchantCode;//报备商户码
	
	private String bankMerchantKey;//商户报备密钥

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReportChannel() {
		return reportChannel;
	}

	public void setReportChannel(String reportChannel) {
		this.reportChannel = reportChannel;
	}

	public String getBankMerchantCode() {
		return bankMerchantCode;
	}

	public void setBankMerchantCode(String bankMerchantCode) {
		this.bankMerchantCode = bankMerchantCode;
	}

	public String getBankMerchantKey() {
		return bankMerchantKey;
	}

	public void setBankMerchantKey(String bankMerchantKey) {
		this.bankMerchantKey = bankMerchantKey;
	}
	
	
}
