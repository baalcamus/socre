package com.chinagpay.boss.common.bean;


public class RiskOrderDetailExportBean {
	
	private String id;
	/** 商户编号 **/
	private String merchantNo;
	/** 商户订单号-商户传递 **/
	private String merchantOrderNo;
	/** 商户订单明细号-商户传递 **/
	private String merchantOriginalOrderNo;
	/** 买家姓名 **/
	private String buyerName;
	/** 买家证件号 **/
	private String buyerIdNo;
	/** 错误原因 **/
	private String errorReason;
	
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
	public String getMerchantOrderNo() {
		return merchantOrderNo;
	}
	public void setMerchantOrderNo(String merchantOrderNo) {
		this.merchantOrderNo = merchantOrderNo;
	}
	public String getMerchantOriginalOrderNo() {
		return merchantOriginalOrderNo;
	}
	public void setMerchantOriginalOrderNo(String merchantOriginalOrderNo) {
		this.merchantOriginalOrderNo = merchantOriginalOrderNo;
	}
	public String getBuyerName() {
		return buyerName;
	}
	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}
	public String getBuyerIdNo() {
		return buyerIdNo;
	}
	public void setBuyerIdNo(String buyerIdNo) {
		this.buyerIdNo = buyerIdNo;
	}
	public String getErrorReason() {
		return errorReason;
	}
	public void setErrorReason(String errorReason) {
		this.errorReason = errorReason;
	}
	

}
