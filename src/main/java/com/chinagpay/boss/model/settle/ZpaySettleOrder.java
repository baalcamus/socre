package com.chinagpay.boss.model.settle;

import java.math.BigDecimal;
import java.sql.Timestamp;

/** 
	*@author  liws  
	*@date    2016年9月13日 下午1:48:38 
	*@version 1.0 
	*@parameter  
	*@since  
	*@return  
*/
public class ZpaySettleOrder {

	private String id;

    private String merchantNo;

    private Timestamp merchantReqTime;

    private String merchantShortName;

    private String merchantOrderNo;

    private String tradeOrderNo;

    private String settleType;

    private String settleStatus;

    private BigDecimal settleAmount;

    private String settleCurrency;

    private String ppFlag;

    private String certifyType;

    private String certifyNo;

    private String accountNo;

    private String accountName;

    private String phoneNo;

    private String bankFullName;

    private String callbackUrl;

    private String merchantIp;

    private String clientIp;

    private String errorCode;

    private String errorMessage;

    private String bankErrorCode;

    private String bankErrorMessage;

    private String bankRespSerialNo;

    private String notifyStatus;

    private String createStaff;

    private Timestamp createTime;

    private String updateStaff;

    private Timestamp updateTime;

    private String description;
    
    private String auditRemark;

    private String bankId;

	public String getBankId() {
		return bankId;
	}

	public void setBankId(String bankId) {
		this.bankId = bankId;
	}

	public String getAuditRemark() {
		return auditRemark;
	}

	public void setAuditRemark(String auditRemark) {
		this.auditRemark = auditRemark;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMerchantNo() {
		return merchantNo;
	}

	public void setMerchantNo(String merchantNo) {
		this.merchantNo = merchantNo;
	}

	public Timestamp getMerchantReqTime() {
		return merchantReqTime;
	}

	public void setMerchantReqTime(Timestamp merchantReqTime) {
		this.merchantReqTime = merchantReqTime;
	}

	public String getMerchantShortName() {
		return merchantShortName;
	}

	public void setMerchantShortName(String merchantShortName) {
		this.merchantShortName = merchantShortName;
	}

	public String getMerchantOrderNo() {
		return merchantOrderNo;
	}

	public void setMerchantOrderNo(String merchantOrderNo) {
		this.merchantOrderNo = merchantOrderNo;
	}

	public String getTradeOrderNo() {
		return tradeOrderNo;
	}

	public void setTradeOrderNo(String tradeOrderNo) {
		this.tradeOrderNo = tradeOrderNo;
	}

	public String getSettleType() {
		return settleType;
	}

	public void setSettleType(String settleType) {
		this.settleType = settleType;
	}

	public String getSettleStatus() {
		return settleStatus;
	}

	public void setSettleStatus(String settleStatus) {
		this.settleStatus = settleStatus;
	}

	public BigDecimal getSettleAmount() {
		return settleAmount;
	}

	public void setSettleAmount(BigDecimal settleAmount) {
		this.settleAmount = settleAmount;
	}

	public String getSettleCurrency() {
		return settleCurrency;
	}

	public void setSettleCurrency(String settleCurrency) {
		this.settleCurrency = settleCurrency;
	}

	public String getPpFlag() {
		return ppFlag;
	}

	public void setPpFlag(String ppFlag) {
		this.ppFlag = ppFlag;
	}

	public String getCertifyType() {
		return certifyType;
	}

	public void setCertifyType(String certifyType) {
		this.certifyType = certifyType;
	}

	public String getCertifyNo() {
		return certifyNo;
	}

	public void setCertifyNo(String certifyNo) {
		this.certifyNo = certifyNo;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getBankFullName() {
		return bankFullName;
	}

	public void setBankFullName(String bankFullName) {
		this.bankFullName = bankFullName;
	}

	public String getCallbackUrl() {
		return callbackUrl;
	}

	public void setCallbackUrl(String callbackUrl) {
		this.callbackUrl = callbackUrl;
	}

	public String getMerchantIp() {
		return merchantIp;
	}

	public void setMerchantIp(String merchantIp) {
		this.merchantIp = merchantIp;
	}

	public String getClientIp() {
		return clientIp;
	}

	public void setClientIp(String clientIp) {
		this.clientIp = clientIp;
	}

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public String getBankErrorCode() {
		return bankErrorCode;
	}

	public void setBankErrorCode(String bankErrorCode) {
		this.bankErrorCode = bankErrorCode;
	}

	public String getBankErrorMessage() {
		return bankErrorMessage;
	}

	public void setBankErrorMessage(String bankErrorMessage) {
		this.bankErrorMessage = bankErrorMessage;
	}

	public String getBankRespSerialNo() {
		return bankRespSerialNo;
	}

	public void setBankRespSerialNo(String bankRespSerialNo) {
		this.bankRespSerialNo = bankRespSerialNo;
	}

	public String getNotifyStatus() {
		return notifyStatus;
	}

	public void setNotifyStatus(String notifyStatus) {
		this.notifyStatus = notifyStatus;
	}

	public String getCreateStaff() {
		return createStaff;
	}

	public void setCreateStaff(String createStaff) {
		this.createStaff = createStaff;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public String getUpdateStaff() {
		return updateStaff;
	}

	public void setUpdateStaff(String updateStaff) {
		this.updateStaff = updateStaff;
	}

	public Timestamp getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
