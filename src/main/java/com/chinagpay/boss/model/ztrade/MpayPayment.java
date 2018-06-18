package com.chinagpay.boss.model.ztrade;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class MpayPayment {
	private Timestamp bankSuccessTime;
    private String id;//主键id
    private String merchantNo;//商户编号
    private Timestamp merchantReqTime;//商户请求时间
    private String merchantOrderNo;//商户订单号-商户上送
    private String tradeOrderNo;//交易订单号-系统产生
    private String paymentSerialNo;//支付流水号-系统产生
    private String channelNo;//银行渠道
    private String payMethod;//支付方式（微信、支付宝、快捷）
    private String payProduct;//支付产品（刷卡支付、扫码支付、公众号支付、app支付、快捷支付）
    private BigDecimal orderAmount;//订单金额
    private BigDecimal payAmount;//支付金额
    private BigDecimal payFee;//支付手续费
    private String payCurrency;//币种
    private String paymentStatus;//支付状态
    
    private String errorCode;//错误码-trade系统错误码
    private String errorMessage;//错误原因
    private String bankErrorCode;//银行错误码-银行原始错误码
    private String bankMerchantCode;//银行商户编码
    private String bankErrorMessage;//银行错误原因
    private String bankRespSerialNo;//银行订单号
    private String bankRespOrderNo;//银行订单号
    private String createStaff;
    private Timestamp createTime;
    private String updateStaff;
    private Timestamp updateTime;
    private String description;
	private String authCode;
	private String graphicCode;
	private String signData;
	private BigDecimal channelFee;//通道成本

	private String terminalNo;

	private String beginTime;
	private String endTime;
	private String tableName;
	
	//temp值
	private String d_paymentStatus;//支付状态描述
	private String d_channelNo;//支付状态描述
	private String d_payMethod;//支付方式
	private String d_payProduct;//支付产品
	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}


	public String getBankMerchantCode() {
		return bankMerchantCode;
	}

	public void setBankMerchantCode(String bankMerchantCode) {
		this.bankMerchantCode = bankMerchantCode;
	}

	public BigDecimal getChannelFee() {
		return channelFee;
	}

	public void setChannelFee(BigDecimal channelFee) {
		this.channelFee = channelFee;
	}
	public String getTerminalNo() {
		return terminalNo;
	}

	public void setTerminalNo(String terminalNo) {
		this.terminalNo = terminalNo;
	}

	public String getAuthCode() {
		return authCode;
	}

	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}

	public String getGraphicCode() {
		return graphicCode;
	}

	public void setGraphicCode(String graphicCode) {
		this.graphicCode = graphicCode;
	}

	public String getSignData() {
		return signData;
	}

	public void setSignData(String signData) {
		this.signData = signData;
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
	public String getPaymentSerialNo() {
		return paymentSerialNo;
	}
	public void setPaymentSerialNo(String paymentSerialNo) {
		this.paymentSerialNo = paymentSerialNo;
	}
	public String getChannelNo() {
		return channelNo;
	}
	public void setChannelNo(String channelNo) {
		this.channelNo = channelNo;
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
	public BigDecimal getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(BigDecimal orderAmount) {
		this.orderAmount = orderAmount;
	}
	public BigDecimal getPayAmount() {
		return payAmount;
	}
	public void setPayAmount(BigDecimal payAmount) {
		this.payAmount = payAmount;
	}
	public BigDecimal getPayFee() {
		return payFee;
	}
	public void setPayFee(BigDecimal payFee) {
		this.payFee = payFee;
	}
	public String getPayCurrency() {
		return payCurrency;
	}
	public void setPayCurrency(String payCurrency) {
		this.payCurrency = payCurrency;
	}
	public String getPaymentStatus() {
		return paymentStatus;
	}
	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
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
	public String getBankRespOrderNo() {
		return bankRespOrderNo;
	}
	public void setBankRespOrderNo(String bankRespOrderNo) {
		this.bankRespOrderNo = bankRespOrderNo;
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

	public Timestamp getBankSuccessTime() {
		return bankSuccessTime;
	}

	public void setBankSuccessTime(Timestamp bankSuccessTime) {
		this.bankSuccessTime = bankSuccessTime;
	}

	public String getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getD_paymentStatus() {
		return d_paymentStatus;
	}

	public void setD_paymentStatus(String d_paymentStatus) {
		this.d_paymentStatus = d_paymentStatus;
	}

	public String getD_channelNo() {
		return d_channelNo;
	}

	public void setD_channelNo(String d_channelNo) {
		this.d_channelNo = d_channelNo;
	}

	public String getD_payMethod() {
		return d_payMethod;
	}

	public void setD_payMethod(String d_payMethod) {
		this.d_payMethod = d_payMethod;
	}

	public String getD_payProduct() {
		return d_payProduct;
	}

	public void setD_payProduct(String d_payProduct) {
		this.d_payProduct = d_payProduct;
	}
}
