package com.chinagpay.boss.model.micropay;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class MpayOrder {
    private String id;
    private String merchantNo;//商户编号
    private String merchantShortName;//商户简称
    private String agentMerchantNo;//所属代理商
    private String merchantStoreNo;//商户门店号
    private String merchantTerminalNo;//商户终端号
    private String merchantBusinessCode;//商户业务码
    private String merchantOrderNo;//商户订单号-商户上送
    private String tradeOrderNo;//交易订单号-系统产生
    private Timestamp merchantReqTime;//商户请求时间
    private String payMethod;//支付方式（微信、支付宝、快捷）
    private String payProduct;//支付产品（刷卡支付、扫码支付、公众号支付、app支付、快捷支付）
    private String graphicCode;//图形码-二维码-条形码-扫码支付时 微信返回
    private String authCode;//授权码-刷卡支付时用户微信的授权码
    private String orderCurrency;//币种
    private BigDecimal orderAmount;//订单金额
    private BigDecimal orderFee;//手续费
    private BigDecimal refundFee;//退款手续费
    private BigDecimal revokeFee;//撤销手续费
    private BigDecimal sumRefundRetFee;//退款退回手续费
    private BigDecimal sumRevokeRetFee;//撤销手续费
    private BigDecimal accountedAmount;//入账金额
    private String accountedType;//入账状态
    private Integer refundSucCount;//退款成功次数
    private BigDecimal refundSucAmount;//退款金额
    private String isRefundOver;//是否已退完
    private String isRevoke;//是否撤销
    private String callbackUrl;//通知地址
    private String merchantIp;//请求服务商IP地址
    private String clientIp;//请求客户端IP地址
    private Timestamp invalidTime;//过期时间
    private String orderStatus;//订单状态
    private String errorCode;//错误码-trade系统错误码
    private String errorMessage;//错误原因
    private String notifyStatus;//支付通知结果
    private String createStaff;//创建人
    private Timestamp createTime;//创建时间
    private String updateStaff;//修改人
    private Timestamp updateTime;//修改时间
    private String description;//描述
    private String companyId;//企业Id
    
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
	public String getMerchantShortName() {
		return merchantShortName;
	}
	public void setMerchantShortName(String merchantShortName) {
		this.merchantShortName = merchantShortName;
	}
	public String getAgentMerchantNo() {
		return agentMerchantNo;
	}
	public void setAgentMerchantNo(String agentMerchantNo) {
		this.agentMerchantNo = agentMerchantNo;
	}
	public String getMerchantStoreNo() {
		return merchantStoreNo;
	}
	public void setMerchantStoreNo(String merchantStoreNo) {
		this.merchantStoreNo = merchantStoreNo;
	}
	public String getMerchantTerminalNo() {
		return merchantTerminalNo;
	}
	public void setMerchantTerminalNo(String merchantTerminalNo) {
		this.merchantTerminalNo = merchantTerminalNo;
	}
	public String getMerchantBusinessCode() {
		return merchantBusinessCode;
	}
	public void setMerchantBusinessCode(String merchantBusinessCode) {
		this.merchantBusinessCode = merchantBusinessCode;
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
	public Timestamp getMerchantReqTime() {
		return merchantReqTime;
	}
	public void setMerchantReqTime(Timestamp merchantReqTime) {
		this.merchantReqTime = merchantReqTime;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getPayProduct() {
		return payProduct;
	}
	public void setPayProduct(String payProduct) {
		this.payProduct = payProduct;
	}
	public String getGraphicCode() {
		return graphicCode;
	}
	public void setGraphicCode(String graphicCode) {
		this.graphicCode = graphicCode;
	}
	public String getAuthCode() {
		return authCode;
	}
	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}
	public String getOrderCurrency() {
		return orderCurrency;
	}
	public void setOrderCurrency(String orderCurrency) {
		this.orderCurrency = orderCurrency;
	}
	public BigDecimal getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(BigDecimal orderAmount) {
		this.orderAmount = orderAmount;
	}
	public BigDecimal getOrderFee() {
		return orderFee;
	}
	public void setOrderFee(BigDecimal orderFee) {
		this.orderFee = orderFee;
	}
	public BigDecimal getRefundFee() {
		return refundFee;
	}
	public void setRefundFee(BigDecimal refundFee) {
		this.refundFee = refundFee;
	}
	public BigDecimal getRevokeFee() {
		return revokeFee;
	}
	public void setRevokeFee(BigDecimal revokeFee) {
		this.revokeFee = revokeFee;
	}
	public BigDecimal getSumRefundRetFee() {
		return sumRefundRetFee;
	}
	public void setSumRefundRetFee(BigDecimal sumRefundRetFee) {
		this.sumRefundRetFee = sumRefundRetFee;
	}
	public BigDecimal getSumRevokeRetFee() {
		return sumRevokeRetFee;
	}
	public void setSumRevokeRetFee(BigDecimal sumRevokeRetFee) {
		this.sumRevokeRetFee = sumRevokeRetFee;
	}
	public BigDecimal getAccountedAmount() {
		return accountedAmount;
	}
	public void setAccountedAmount(BigDecimal accountedAmount) {
		this.accountedAmount = accountedAmount;
	}
	public String getAccountedType() {
		return accountedType;
	}
	public void setAccountedType(String accountedType) {
		this.accountedType = accountedType;
	}
	public Integer getRefundSucCount() {
		return refundSucCount;
	}
	public void setRefundSucCount(Integer refundSucCount) {
		this.refundSucCount = refundSucCount;
	}
	public BigDecimal getRefundSucAmount() {
		return refundSucAmount;
	}
	public void setRefundSucAmount(BigDecimal refundSucAmount) {
		this.refundSucAmount = refundSucAmount;
	}
	public String getIsRefundOver() {
		return isRefundOver;
	}
	public void setIsRefundOver(String isRefundOver) {
		this.isRefundOver = isRefundOver;
	}
	public String getIsRevoke() {
		return isRevoke;
	}
	public void setIsRevoke(String isRevoke) {
		this.isRevoke = isRevoke;
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
	public Timestamp getInvalidTime() {
		return invalidTime;
	}
	public void setInvalidTime(Timestamp invalidTime) {
		this.invalidTime = invalidTime;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
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
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	
}
