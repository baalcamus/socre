package com.chinagpay.boss.model.trade;

import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 * 汇款订单表model
 * 
 * @author cgp11
 *
 */
public class ForexOrder {
	private String fileName2;
	/** 贸易种类业务范围 **/
	private String businessRange;
	/** 汇款订单表主键 */
	private String id;
	/** 商户编号 */
	private String merchantNo;
	/** 商户简称 */
	private String merchantShortName;
	/** 处理模式-实时 非实时 */
	private String processMode;
	/** 代理商 */
	private String agentMerchantNo;
	/** 商户结算类型 */
	private String mctSettleType;
	/** 收款金额 */
	private BigDecimal sumGatherAmount;
	/** 收款币种 */
	private String gatherCurrency;
	/** 商户收汇款类型 */
	private String exchangeType;
	/** 商户订单号 */
	private String merchantOrderNo;
	/** 订单来源 */
	private String orderSource;
	/** 商户订单请求时间 */
	private Timestamp merchantRequestTime;
	/** 付款金额 */
	private BigDecimal sumRemitAmount;
	/** 付款币种 */
	private String remitCurrency;
	/** 明细笔数 */
	private Integer detailCount;
	/** 跨境业务附言 */
	private String remitComment;
	/** 贸易类型 */
	private String tradeType;
	/** 收款业务 GATHER_结算行ID */
	private String relateReceiverId;
	/** 付款业务 REMIT_上述表ID */
	private String relatePayerId;
	/** 商户IP */
	private String merchantIpAddr;
	/** 汇率 */
	private Double exchangeRate;
	/** 平台订单号 */
	private String orderNo;
	/** 订单状态 */
	private String orderStatus;
	/** 平台返回码 */
	private String sysErrorCode;
	/** 平台返回信息 */
	private String sysErrorMsg;
	/** 商户手续费 */
	private BigDecimal merchantFee;
	/** 商户回调地址 */
	private String callbackUrl;
	/** 备注 */
	private String comments;
	/** 创建时间 */
	private Timestamp createTime;
	/** 创建人 */
	private String createStaff;
	/** 更新时间 */
	private Timestamp updateTime;
	/** 更新人 */
	private String updateStaff;
	/** 付款通知流水 **/
	private String accountingSerialNo;
	
	//订单有一个通道
	private ForexChannel forexChannel;
	
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

	public String getProcessMode() {
		return processMode;
	}

	public void setProcessMode(String processMode) {
		this.processMode = processMode;
	}

	public String getAgentMerchantNo() {
		return agentMerchantNo;
	}

	public void setAgentMerchantNo(String agentMerchantNo) {
		this.agentMerchantNo = agentMerchantNo;
	}

	public String getMctSettleType() {
		return mctSettleType;
	}

	public void setMctSettleType(String mctSettleType) {
		this.mctSettleType = mctSettleType;
	}

	public BigDecimal getSumGatherAmount() {
		return sumGatherAmount;
	}

	public void setSumGatherAmount(BigDecimal sumGatherAmount) {
		this.sumGatherAmount = sumGatherAmount;
	}

	public String getGatherCurrency() {
		return gatherCurrency;
	}

	public void setGatherCurrency(String gatherCurrency) {
		this.gatherCurrency = gatherCurrency;
	}

	public String getExchangeType() {
		return exchangeType;
	}

	public void setExchangeType(String exchangeType) {
		this.exchangeType = exchangeType;
	}

	public String getMerchantOrderNo() {
		return merchantOrderNo;
	}

	public void setMerchantOrderNo(String merchantOrderNo) {
		this.merchantOrderNo = merchantOrderNo;
	}

	public String getOrderSource() {
		return orderSource;
	}

	public void setOrderSource(String orderSource) {
		this.orderSource = orderSource;
	}

	public Timestamp getMerchantRequestTime() {
		return merchantRequestTime;
	}

	public void setMerchantRequestTime(Timestamp merchantRequestTime) {
		this.merchantRequestTime = merchantRequestTime;
	}

	public BigDecimal getSumRemitAmount() {
		return sumRemitAmount;
	}

	public void setSumRemitAmount(BigDecimal sumRemitAmount) {
		this.sumRemitAmount = sumRemitAmount;
	}

	public String getRemitCurrency() {
		return remitCurrency;
	}

	public void setRemitCurrency(String remitCurrency) {
		this.remitCurrency = remitCurrency;
	}

	public Integer getDetailCount() {
		return detailCount;
	}

	public void setDetailCount(Integer detailCount) {
		this.detailCount = detailCount;
	}

	public String getRemitComment() {
		return remitComment;
	}

	public void setRemitComment(String remitComment) {
		this.remitComment = remitComment;
	}

	public String getTradeType() {
		return tradeType;
	}

	public void setTradeType(String tradeType) {
		this.tradeType = tradeType;
	}

	public String getRelateReceiverId() {
		return relateReceiverId;
	}

	public void setRelateReceiverId(String relateReceiverId) {
		this.relateReceiverId = relateReceiverId;
	}

	public String getRelatePayerId() {
		return relatePayerId;
	}

	public void setRelatePayerId(String relatePayerId) {
		this.relatePayerId = relatePayerId;
	}

	public String getMerchantIpAddr() {
		return merchantIpAddr;
	}

	public void setMerchantIpAddr(String merchantIpAddr) {
		this.merchantIpAddr = merchantIpAddr;
	}

	public Double getExchangeRate() {
		return exchangeRate;
	}

	public void setExchangeRate(Double exchangeRate) {
		this.exchangeRate = exchangeRate;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getSysErrorCode() {
		return sysErrorCode;
	}

	public void setSysErrorCode(String sysErrorCode) {
		this.sysErrorCode = sysErrorCode;
	}

	public String getSysErrorMsg() {
		return sysErrorMsg;
	}

	public void setSysErrorMsg(String sysErrorMsg) {
		this.sysErrorMsg = sysErrorMsg;
	}

	public BigDecimal getMerchantFee() {
		return merchantFee;
	}

	public void setMerchantFee(BigDecimal merchantFee) {
		this.merchantFee = merchantFee;
	}

	public String getCallbackUrl() {
		return callbackUrl;
	}

	public void setCallbackUrl(String callbackUrl) {
		this.callbackUrl = callbackUrl;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public String getCreateStaff() {
		return createStaff;
	}

	public void setCreateStaff(String createStaff) {
		this.createStaff = createStaff;
	}

	public Timestamp getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	public String getUpdateStaff() {
		return updateStaff;
	}

	public void setUpdateStaff(String updateStaff) {
		this.updateStaff = updateStaff;
	}

	public String getAccountingSerialNo() {
		return accountingSerialNo;
	}

	public void setAccountingSerialNo(String accountingSerialNo) {
		this.accountingSerialNo = accountingSerialNo;
	}

	public String getBusinessRange() {
		return businessRange;
	}

	public void setBusinessRange(String businessRange) {
		this.businessRange = businessRange;
	}

	public ForexChannel getForexChannel() {
		return forexChannel;
	}

	public void setForexChannel(ForexChannel forexChannel) {
		this.forexChannel = forexChannel;
	}

	public String getFileName2() {
		return fileName2;
	}

	public void setFileName2(String fileName2) {
		this.fileName2 = fileName2;
	}
}
