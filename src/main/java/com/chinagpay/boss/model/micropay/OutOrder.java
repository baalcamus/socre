package com.chinagpay.boss.model.micropay;

import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 * 外部订单
 * @author 40666
 *
 */
public class OutOrder {

	private String merchantNo;
	private String merchantOrderNo;
	private String orderType;//QUICK:快捷，WITHHOLD:代扣，GATEWAY:网关，MEMBER：会员，RED_ENVELOPE红包
	private BigDecimal orderAmount;
	private String subject;
	private BigDecimal orderFee;
	private String description;
	private String notifyUrl;
	
	private String outTradeOrderNo;//外部订单系统内订单号
	private String outOrderStatus;//订单审核状态
	private String outOrderAccountedStatus;//外部订单入账状态
	private BigDecimal outOrderAccountedAmount;//外部订单入账金额
	
	private String id;//主键
	private String createStaff;
	private Timestamp createTime;
	private String updateStaff;
	private Timestamp updateTime;
	
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
	public String getMerchantNo() {
		return merchantNo;
	}
	public void setMerchantNo(String merchantNo) {
		this.merchantNo = merchantNo;
	}
	public String getMerchantOrderNo() {
		return merchantOrderNo;
	}
	public void setMerchantOrderNo(String merchantOrderNo) {
		this.merchantOrderNo = merchantOrderNo;
	}
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public BigDecimal getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(BigDecimal orderAmount) {
		this.orderAmount = orderAmount;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public BigDecimal getOrderFee() {
		return orderFee;
	}
	public void setOrderFee(BigDecimal orderFee) {
		this.orderFee = orderFee;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getNotifyUrl() {
		return notifyUrl;
	}
	public void setNotifyUrl(String notifyUrl) {
		this.notifyUrl = notifyUrl;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOutTradeOrderNo() {
		return outTradeOrderNo;
	}
	public void setOutTradeOrderNo(String outTradeOrderNo) {
		this.outTradeOrderNo = outTradeOrderNo;
	}
	public String getOutOrderStatus() {
		return outOrderStatus;
	}
	public void setOutOrderStatus(String outOrderStatus) {
		this.outOrderStatus = outOrderStatus;
	}
	public String getOutOrderAccountedStatus() {
		return outOrderAccountedStatus;
	}
	public void setOutOrderAccountedStatus(String outOrderAccountedStatus) {
		this.outOrderAccountedStatus = outOrderAccountedStatus;
	}
	public BigDecimal getOutOrderAccountedAmount() {
		return outOrderAccountedAmount;
	}
	public void setOutOrderAccountedAmount(BigDecimal outOrderAccountedAmount) {
		this.outOrderAccountedAmount = outOrderAccountedAmount;
	}

	
	
	
}
