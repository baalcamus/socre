package com.chinagpay.boss.model.ztrade;

import java.math.BigDecimal;
import java.util.Date;

public class CheckErrorDetail {
	private String id;
	private String checkDate;
	private String channelNo;
	private String bizSerialNo;
	private String errorType;
	private String tradeType;
	private BigDecimal platformBusAmount;
	private BigDecimal channelBusAmount;
	private String balancePaymentMethod;
	private String errorReason;
	private String operator;
	private String createStaff;
	private Date createTime;
	private String updateStaff;
	private Date updateTime;
	private String description;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}
	public String getChannelNo() {
		return channelNo;
	}
	public void setChannelNo(String channelNo) {
		this.channelNo = channelNo;
	}
	public String getBizSerialNo() {
		return bizSerialNo;
	}
	public void setBizSerialNo(String bizSerialNo) {
		this.bizSerialNo = bizSerialNo;
	}
	public String getErrorType() {
		return errorType;
	}
	public void setErrorType(String errorType) {
		this.errorType = errorType;
	}
	public String getTradeType() {
		return tradeType;
	}
	public void setTradeType(String tradeType) {
		this.tradeType = tradeType;
	}
	public BigDecimal getPlatformBusAmount() {
		return platformBusAmount;
	}
	public void setPlatformBusAmount(BigDecimal platformBusAmount) {
		this.platformBusAmount = platformBusAmount;
	}
	public BigDecimal getChannelBusAmount() {
		return channelBusAmount;
	}
	public void setChannelBusAmount(BigDecimal channelBusAmount) {
		this.channelBusAmount = channelBusAmount;
	}
	public String getBalancePaymentMethod() {
		return balancePaymentMethod;
	}
	public void setBalancePaymentMethod(String balancePaymentMethod) {
		this.balancePaymentMethod = balancePaymentMethod;
	}
	public String getErrorReason() {
		return errorReason;
	}
	public void setErrorReason(String errorReason) {
		this.errorReason = errorReason;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public String getCreateStaff() {
		return createStaff;
	}
	public void setCreateStaff(String createStaff) {
		this.createStaff = createStaff;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getUpdateStaff() {
		return updateStaff;
	}
	public void setUpdateStaff(String updateStaff) {
		this.updateStaff = updateStaff;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

}
