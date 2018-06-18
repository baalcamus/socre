package com.chinagpay.boss.model.micropay;
/** 
	* @author  liws  
	* @date    2017年4月13日 下午8:54:22  
*/
public class CheckReportInfo {

	private String companyId;
	
	private String thirdMerId;
	
	private String bankMerchantCode;

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getThirdMerId() {
		return thirdMerId;
	}

	public void setThirdMerId(String thirdMerId) {
		this.thirdMerId = thirdMerId;
	}

	public String getBankMerchantCode() {
		return bankMerchantCode;
	}

	public void setBankMerchantCode(String bankMerchantCode) {
		this.bankMerchantCode = bankMerchantCode;
	}
	
}
