package com.chinagpay.boss.model.micropay;

import java.sql.Timestamp;

public class ZpayChannel {
    private String id;
    private String channelNo;//通道编号
    private String channelName;//通道名称
    private String payMethodMode;//支付方式（按位处理,微信、支付宝、快捷）
    private String payProductMode;//支付产品（按位处理,微信刷卡支付，微信扫码支付。。。支付宝刷卡支付，支付宝扫码支付。。）
    private String bankCardMode;//支持银行卡（按位处理,借记卡,信用卡）
    private String status;//通道状态
    private String needReport;//是否需要报备
    private String singleMerchantKeyFlag;//商户独立秘钥标志
    
    private String createStaff;
    private Timestamp createTime;
    private String updateStaff;
    private Timestamp updateTime;
    private String description;
    private String feeRule;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFeeRule() {
		return feeRule;
	}
	public void setFeeRule(String feeRule) {
		this.feeRule = feeRule;
	}
	public String getChannelNo() {
		return channelNo;
	}
	public void setChannelNo(String channelNo) {
		this.channelNo = channelNo;
	}
	public String getChannelName() {
		return channelName;
	}
	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}
	public String getNeedReport() {
		return needReport;
	}
	public void setNeedReport(String needReport) {
		this.needReport = needReport;
	}
	public String getPayMethodMode() {
		return payMethodMode;
	}
	public void setPayMethodMode(String payMethodMode) {
		this.payMethodMode = payMethodMode;
	}
	public String getPayProductMode() {
		return payProductMode;
	}
	public void setPayProductMode(String payProductMode) {
		this.payProductMode = payProductMode;
	}
	public String getBankCardMode() {
		return bankCardMode;
	}
	public void setBankCardMode(String bankCardMode) {
		this.bankCardMode = bankCardMode;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	public String getSingleMerchantKeyFlag() {
		return singleMerchantKeyFlag;
	}
	public void setSingleMerchantKeyFlag(String singleMerchantKeyFlag) {
		this.singleMerchantKeyFlag = singleMerchantKeyFlag;
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
