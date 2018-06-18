package com.chinagpay.boss.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class MerchantInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5904316465436887019L;

	private Long id;

	private String merchantNo;

	private String merchantName;

	private String merchantShortName;

	private String merchantClass;

	private String merchantType;

	private String merchantIndustry;

	private String websiteDomain;

	private String merchantBusCode;

	private String merchantFeature;

	private String belongAgentMctNo;

	private String registerAddress;

	private String contactAddress;

	private String ipList;

	private String salesman;

	private String salesmanPhone;

	private String legalPerson;

	private String legalPerPhoneNo;

	private String legalPerCtfType;

	private String legalPerCtfNo;

	private String legalPerCtfDate;

	private String merchantContactPerson;

	private String merchantContactPhone;

	private String merchantContactEmail;

	private String busLicenceNo;

	private String taxRegCtfNo;

	private String orgCode;

	private String speIndusLicenceNo;

	private String icpRecordNumber;

	private String legalPerCtfPath;

	private String busLicenceCftPath;

	private String taxRegCtfPath;

	private String orgCodeCtfPath;

	private String accountOpenCtfPath;

	private String speIndusLicenceCtfPath;

	private String riskLever;

	private String status;

	private String createOperator;

	private Timestamp createTime;

	private String updateOperator;

	private Timestamp updateTime;

	private String virtualAccCurrency;

	private String feePayType;

	private String accountOpenBank;

	private String bankAddress;

	private String accountType;

	private String accountName;

	private String accountOpenCtfType;

	private String accountOpenCtfNo;

	private String accountRemainPhone;

	private String settleType;

	private String settleCycle;

	private byte[] reportData;

	private byte[] feeData;

	private String accountNo;

	private String isITSptByAgent;
	private String openBusinessInfo;
	private String openSettleInfo;
	private String interNo;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getMerchantNo() {
		return merchantNo;
	}

	public void setMerchantNo(String merchantNo) {
		this.merchantNo = merchantNo;
	}

	public String getMerchantName() {
		return merchantName;
	}

	public void setMerchantName(String merchantName) {
		this.merchantName = merchantName;
	}

	public String getMerchantShortName() {
		return merchantShortName;
	}

	public void setMerchantShortName(String merchantShortName) {
		this.merchantShortName = merchantShortName;
	}

	public String getMerchantClass() {
		return merchantClass;
	}

	public void setMerchantClass(String merchantClass) {
		this.merchantClass = merchantClass;
	}

	public String getMerchantType() {
		return merchantType;
	}

	public void setMerchantType(String merchantType) {
		this.merchantType = merchantType;
	}

	public String getMerchantIndustry() {
		return merchantIndustry;
	}

	public void setMerchantIndustry(String merchantIndustry) {
		this.merchantIndustry = merchantIndustry;
	}

	public String getWebsiteDomain() {
		return websiteDomain;
	}

	public void setWebsiteDomain(String websiteDomain) {
		this.websiteDomain = websiteDomain;
	}

	public String getMerchantBusCode() {
		return merchantBusCode;
	}

	public void setMerchantBusCode(String merchantBusCode) {
		this.merchantBusCode = merchantBusCode;
	}

	public String getMerchantFeature() {
		return merchantFeature;
	}

	public void setMerchantFeature(String merchantFeature) {
		this.merchantFeature = merchantFeature;
	}

	public String getBelongAgentMctNo() {
		return belongAgentMctNo;
	}

	public void setBelongAgentMctNo(String belongAgentMctNo) {
		this.belongAgentMctNo = belongAgentMctNo;
	}

	public String getRegisterAddress() {
		return registerAddress;
	}

	public void setRegisterAddress(String registerAddress) {
		this.registerAddress = registerAddress;
	}

	public String getContactAddress() {
		return contactAddress;
	}

	public void setContactAddress(String contactAddress) {
		this.contactAddress = contactAddress;
	}

	public String getIpList() {
		return ipList;
	}

	public void setIpList(String ipList) {
		this.ipList = ipList;
	}

	public String getSalesman() {
		return salesman;
	}

	public void setSalesman(String salesman) {
		this.salesman = salesman;
	}

	public String getSalesmanPhone() {
		return salesmanPhone;
	}

	public void setSalesmanPhone(String salesmanPhone) {
		this.salesmanPhone = salesmanPhone;
	}

	public String getLegalPerson() {
		return legalPerson;
	}

	public void setLegalPerson(String legalPerson) {
		this.legalPerson = legalPerson;
	}

	public String getLegalPerPhoneNo() {
		return legalPerPhoneNo;
	}

	public void setLegalPerPhoneNo(String legalPerPhoneNo) {
		this.legalPerPhoneNo = legalPerPhoneNo;
	}

	public String getLegalPerCtfType() {
		return legalPerCtfType;
	}

	public void setLegalPerCtfType(String legalPerCtfType) {
		this.legalPerCtfType = legalPerCtfType;
	}

	public String getLegalPerCtfNo() {
		return legalPerCtfNo;
	}

	public void setLegalPerCtfNo(String legalPerCtfNo) {
		this.legalPerCtfNo = legalPerCtfNo;
	}

	public String getLegalPerCtfDate() {
		return legalPerCtfDate;
	}

	public void setLegalPerCtfDate(String legalPerCtfDate) {
		this.legalPerCtfDate = legalPerCtfDate;
	}

	public String getMerchantContactPerson() {
		return merchantContactPerson;
	}

	public void setMerchantContactPerson(String merchantContactPerson) {
		this.merchantContactPerson = merchantContactPerson;
	}

	public String getMerchantContactPhone() {
		return merchantContactPhone;
	}

	public void setMerchantContactPhone(String merchantContactPhone) {
		this.merchantContactPhone = merchantContactPhone;
	}

	public String getMerchantContactEmail() {
		return merchantContactEmail;
	}

	public void setMerchantContactEmail(String merchantContactEmail) {
		this.merchantContactEmail = merchantContactEmail;
	}

	public String getBusLicenceNo() {
		return busLicenceNo;
	}

	public void setBusLicenceNo(String busLicenceNo) {
		this.busLicenceNo = busLicenceNo;
	}

	public String getTaxRegCtfNo() {
		return taxRegCtfNo;
	}

	public void setTaxRegCtfNo(String taxRegCtfNo) {
		this.taxRegCtfNo = taxRegCtfNo;
	}

	public String getOrgCode() {
		return orgCode;
	}

	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}

	public String getSpeIndusLicenceNo() {
		return speIndusLicenceNo;
	}

	public void setSpeIndusLicenceNo(String speIndusLicenceNo) {
		this.speIndusLicenceNo = speIndusLicenceNo;
	}

	public String getIcpRecordNumber() {
		return icpRecordNumber;
	}

	public void setIcpRecordNumber(String icpRecordNumber) {
		this.icpRecordNumber = icpRecordNumber;
	}

	public String getLegalPerCtfPath() {
		return legalPerCtfPath;
	}

	public void setLegalPerCtfPath(String legalPerCtfPath) {
		this.legalPerCtfPath = legalPerCtfPath;
	}

	public String getBusLicenceCftPath() {
		return busLicenceCftPath;
	}

	public void setBusLicenceCftPath(String busLicenceCftPath) {
		this.busLicenceCftPath = busLicenceCftPath;
	}

	public String getTaxRegCtfPath() {
		return taxRegCtfPath;
	}

	public void setTaxRegCtfPath(String taxRegCtfPath) {
		this.taxRegCtfPath = taxRegCtfPath;
	}

	public String getOrgCodeCtfPath() {
		return orgCodeCtfPath;
	}

	public void setOrgCodeCtfPath(String orgCodeCtfPath) {
		this.orgCodeCtfPath = orgCodeCtfPath;
	}

	public String getAccountOpenCtfPath() {
		return accountOpenCtfPath;
	}

	public void setAccountOpenCtfPath(String accountOpenCtfPath) {
		this.accountOpenCtfPath = accountOpenCtfPath;
	}

	public String getSpeIndusLicenceCtfPath() {
		return speIndusLicenceCtfPath;
	}

	public void setSpeIndusLicenceCtfPath(String speIndusLicenceCtfPath) {
		this.speIndusLicenceCtfPath = speIndusLicenceCtfPath;
	}

	public String getRiskLever() {
		return riskLever;
	}

	public void setRiskLever(String riskLever) {
		this.riskLever = riskLever;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCreateOperator() {
		return createOperator;
	}

	public void setCreateOperator(String createOperator) {
		this.createOperator = createOperator;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public String getUpdateOperator() {
		return updateOperator;
	}

	public void setUpdateOperator(String updateOperator) {
		this.updateOperator = updateOperator;
	}

	public Timestamp getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	public String getVirtualAccCurrency() {
		return virtualAccCurrency;
	}

	public void setVirtualAccCurrency(String virtualAccCurrency) {
		this.virtualAccCurrency = virtualAccCurrency;
	}

	public String getFeePayType() {
		return feePayType;
	}

	public void setFeePayType(String feePayType) {
		this.feePayType = feePayType;
	}

	public String getAccountOpenBank() {
		return accountOpenBank;
	}

	public void setAccountOpenBank(String accountOpenBank) {
		this.accountOpenBank = accountOpenBank;
	}

	public String getBankAddress() {
		return bankAddress;
	}

	public void setBankAddress(String bankAddress) {
		this.bankAddress = bankAddress;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getAccountOpenCtfType() {
		return accountOpenCtfType;
	}

	public void setAccountOpenCtfType(String accountOpenCtfType) {
		this.accountOpenCtfType = accountOpenCtfType;
	}

	public String getAccountOpenCtfNo() {
		return accountOpenCtfNo;
	}

	public void setAccountOpenCtfNo(String accountOpenCtfNo) {
		this.accountOpenCtfNo = accountOpenCtfNo;
	}

	public String getAccountRemainPhone() {
		return accountRemainPhone;
	}

	public void setAccountRemainPhone(String accountRemainPhone) {
		this.accountRemainPhone = accountRemainPhone;
	}

	public String getSettleType() {
		return settleType;
	}

	public void setSettleType(String settleType) {
		this.settleType = settleType;
	}

	public String getSettleCycle() {
		return settleCycle;
	}

	public void setSettleCycle(String settleCycle) {
		this.settleCycle = settleCycle;
	}

	public byte[] getReportData() {
		return reportData;
	}

	public void setReportData(byte[] reportData) {
		this.reportData = reportData;
	}

	public byte[] getFeeData() {
		return feeData;
	}

	public void setFeeData(byte[] feeData) {
		this.feeData = feeData;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getIsITSptByAgent() {
		return isITSptByAgent;
	}

	public void setIsITSptByAgent(String isITSptByAgent) {
		this.isITSptByAgent = isITSptByAgent;
	}

	public String getOpenBusinessInfo() {
		return openBusinessInfo;
	}

	public void setOpenBusinessInfo(String openBusinessInfo) {
		this.openBusinessInfo = openBusinessInfo;
	}

	public String getOpenSettleInfo() {
		return openSettleInfo;
	}

	public void setOpenSettleInfo(String openSettleInfo) {
		this.openSettleInfo = openSettleInfo;
	}

	public String getInterNo() {
		return interNo;
	}

	public void setInterNo(String interNo) {
		this.interNo = interNo;
	}

}