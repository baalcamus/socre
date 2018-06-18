package com.chinagpay.boss.model.casher;

import java.util.Date;

public class Order {
	private Long id;
	private String orderNo;
	private String merchantNo;
	private String userId;
	private String merNotifyStatus;
	private Integer merNotifyCount;
	private Integer state;

	private String orderAmt;

	private String actualAmt;

	private String payment;

	private Date createTime;

	private Date updateTime;

	private Date notifyTime;
	private String clientType;

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

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getOrderAmt() {
		return orderAmt;
	}

	public void setOrderAmt(String orderAmt) {
		this.orderAmt = orderAmt;
	}

	public String getActualAmt() {
		return actualAmt;
	}

	public void setActualAmt(String actualAmt) {
		this.actualAmt = actualAmt;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Date getNotifyTime() {
		return notifyTime;
	}

	public void setNotifyTime(Date notifyTime) {
		this.notifyTime = notifyTime;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getMerNotifyStatus() {
		return merNotifyStatus;
	}

	public void setMerNotifyStatus(String merNotifyStatus) {
		this.merNotifyStatus = merNotifyStatus;
	}

	public Integer getMerNotifyCount() {
		return merNotifyCount;
	}

	public void setMerNotifyCount(Integer merNotifyCount) {
		this.merNotifyCount = merNotifyCount;
	}

	public String getClientType() {
		return clientType;
	}

	public void setClientType(String clientType) {
		this.clientType = clientType;
	}

}
