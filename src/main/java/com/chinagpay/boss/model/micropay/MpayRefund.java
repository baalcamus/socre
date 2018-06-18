package com.chinagpay.boss.model.micropay;

import java.math.BigDecimal;
import java.sql.Timestamp;

/** 
*@author  lixu    
*/
public class MpayRefund {
	private String id;
	private String merchantNo;//商户编号-
	private Timestamp merchantReqTime;//订单请求时间-
	private String orgMerchantOrderNo;//原商户订单号-
	private String orgTradeOrderNo;//原交易订单号-
	private Timestamp refundReqTime;//退款请求时间=
	private String refundReqNo;//退款请求号=
	private String refundReason;//退款原因=
	private String channelNo;//渠道编号=
	private String orgPayMethod;//原始支付方式-
	private String orgPayProduct;//原始支付产品-
	private String orderAmount;//订单金额=
	private BigDecimal refundAmount;//退款金额-
	private BigDecimal refundFee;//退款收取手续费-
	private BigDecimal refundReturnFee;//退款退回手续费-
	private String isWholeRefund;//
	private String refundCurrency;//币种-
	private String refundStatus;//退款状态-
	private String refundChannel;//退款渠道=
	private String errorCode;//-
	private String errorMessage;//=
	private String bankErrorCode;//=
	private String bankErrorMessage;//=
	private String bankRespSerialNo;//
	private String createStaff;//
	private Timestamp createTime;//-
	private String updateStaff;//
	private Timestamp updateTime;//
	private String description;//描述信息=
	private String tradeRefundNo;//
	
	private Timestamp beginTime;
	private Timestamp endTime;
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
	public String getOrgMerchantOrderNo() {
		return orgMerchantOrderNo;
	}
	public void setOrgMerchantOrderNo(String orgMerchantOrderNo) {
		this.orgMerchantOrderNo = orgMerchantOrderNo;
	}
	public String getOrgTradeOrderNo() {
		return orgTradeOrderNo;
	}
	public void setOrgTradeOrderNo(String orgTradeOrderNo) {
		this.orgTradeOrderNo = orgTradeOrderNo;
	}
	public Timestamp getRefundReqTime() {
		return refundReqTime;
	}
	public void setRefundReqTime(Timestamp refundReqTime) {
		this.refundReqTime = refundReqTime;
	}
	public String getRefundReqNo() {
		return refundReqNo;
	}
	public void setRefundReqNo(String refundReqNo) {
		this.refundReqNo = refundReqNo;
	}
	public String getRefundReason() {
		return refundReason;
	}
	public void setRefundReason(String refundReason) {
		this.refundReason = refundReason;
	}
	public String getChannelNo() {
		return channelNo;
	}
	public void setChannelNo(String channelNo) {
		this.channelNo = channelNo;
	}
	public String getOrgPayMethod() {
		return orgPayMethod;
	}
	public void setOrgPayMethod(String orgPayMethod) {
		this.orgPayMethod = orgPayMethod;
	}
	public String getOrgPayProduct() {
		return orgPayProduct;
	}
	public void setOrgPayProduct(String orgPayProduct) {
		this.orgPayProduct = orgPayProduct;
	}
	public String getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(String orderAmount) {
		this.orderAmount = orderAmount;
	}
	public BigDecimal getRefundAmount() {
		return refundAmount;
	}
	public void setRefundAmount(BigDecimal refundAmount) {
		this.refundAmount = refundAmount;
	}
	public BigDecimal getRefundFee() {
		return refundFee;
	}
	public void setRefundFee(BigDecimal refundFee) {
		this.refundFee = refundFee;
	}
	public BigDecimal getRefundReturnFee() {
		return refundReturnFee;
	}
	public void setRefundReturnFee(BigDecimal refundReturnFee) {
		this.refundReturnFee = refundReturnFee;
	}
	public String getIsWholeRefund() {
		return isWholeRefund;
	}
	public void setIsWholeRefund(String isWholeRefund) {
		this.isWholeRefund = isWholeRefund;
	}
	public String getRefundCurrency() {
		return refundCurrency;
	}
	public void setRefundCurrency(String refundCurrency) {
		this.refundCurrency = refundCurrency;
	}
	public String getRefundStatus() {
		return refundStatus;
	}
	public void setRefundStatus(String refundStatus) {
		this.refundStatus = refundStatus;
	}
	public String getRefundChannel() {
		return refundChannel;
	}
	public void setRefundChannel(String refundChannel) {
		this.refundChannel = refundChannel;
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
	public String getTradeRefundNo() {
		return tradeRefundNo;
	}
	public void setTradeRefundNo(String tradeRefundNo) {
		this.tradeRefundNo = tradeRefundNo;
	}
	public Timestamp getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(Timestamp beginTime) {
		this.beginTime = beginTime;
	}
	public Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	
	

}
