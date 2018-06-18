package com.chinagpay.boss.model.trade;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class ForexBizOrder {
	private String fileName1;
	private String fileName2;
	private BigDecimal bankRemitAmount;
	private BigDecimal bankGatherAmount;
	private String salesman;
	/**跨境业务附言*/
	private String  remitComment;
	/**贸易种类业务范围**/
	private String businessRange;
	/**收款订单表主键**/
	private String id;
	/**汇款主表主键**/
	private String forexOrderId;
	/**商户编号**/
	private String merchantNo;
	/**商户简称**/
	private String merchantShortName;
	/**处理模式-实时  非实时**/
	private String processMode;
	/**代理商**/
	private String agentMerchantNo;
	/**收款金额**/
	private BigDecimal sumGatherAmount;
	/**收款币种**/
	private String gatherCurrency;
	/**商户订单号**/
	private String merchantOrderNo;
	/**订单来源**/
	private String orderSource;
	/**商户订单请求时间**/
	private Timestamp merchantRequestTime;
	/**汇款金额**/
	private BigDecimal sumRemitAmount;
	/**汇款币种**/
	private String remitCurrency;
	/**明细笔数**/
	private Integer detailCount;
	/**交易类型[付款，收款]**/
	private String exchangeType;
	/**商户结算模式[固定人民币,固定外币]**/
	private String mctSettleType;
	/**贸易种类**/
	private String tradeType;
	/**联系人收款人ID**/
	private String relateReceiverId;
	/**联系人付款人ID**/
	private String relatePayerId;
	/**商户IP地址**/
	private String merchantIpAddr;
	/**执行汇率**/
	private Double exchangeRate;
	/**冻结汇率**/
	private Double frozenRate;
	/**冻结流水**/
	private String frozenSerialNo;
	/**冻结金额**/
	private BigDecimal frozenAmount;
	/**银行渠道ID**/
	private String channelNo;
	/**渠道特征**/
	private String channelFeature;
	/**平台订单号**/
	private String orderNo;
	/**订单状态**/
	private String orderStatus;
	/**业务处理状态**/
	private String businessStatus;
	/**银行流水号**/
	private String bankTraceNo;
	/**银行返回码**/
	private String bankReturnCode;
	/**银行返回信息**/
	private String bankReturnMsg;
	/**平台返回码**/
	private String sysErrorCode;
	/**平台返回信息**/
	private String sysErrorMsg;
	/**商户手续费**/
	private BigDecimal merchantFee;
	/**渠道手续费**/
	private BigDecimal channelFee;
	/**代理行手续费**/
	private BigDecimal agentBankFee;
	/**电汇汇款编号----付款业务可能有**/
	private String postNo;
	/**电汇手续费**/
	private BigDecimal postFee;
	/**商户回调地址**/
	private String callbackUrl;
	/**备注**/
	private String comments;
	/**创建时间**/
	private Timestamp createTime;
	/**创建人**/
	private String createStaff;
	/**更新时间**/
	private Timestamp updateTime;
	/**更新人**/
	private String updateStaff;
	/**回调通知状态**/
	private String notifyStatus;
	/**通过笔数**/
	private Integer checkCount;
	/**通过金额**/
	private BigDecimal checkAmount;
	/**银行执行汇率**/
	private Double bankRate;
	/**购汇类型**/
	private String rateType;
	
	//////新增
	private String channelName;
	private String payerName;
	private String receiverName;
	private String payerAccountNo;
	private String receiverAccountNo;
	private String remitPostscript;
	
	private String payMethod;
	
	private String extend1;
	
	private String extend2;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getForexOrderId() {
		return forexOrderId;
	}
	public void setForexOrderId(String forexOrderId) {
		this.forexOrderId = forexOrderId;
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
	public String getChannelFeature() {
		return channelFeature;
	}
	public void setChannelFeature(String channelFeature) {
		this.channelFeature = channelFeature;
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
	public String getBusinessStatus() {
		return businessStatus;
	}
	public void setBusinessStatus(String businessStatus) {
		this.businessStatus = businessStatus;
	}
	public String getBankTraceNo() {
		return bankTraceNo;
	}
	public void setBankTraceNo(String bankTraceNo) {
		this.bankTraceNo = bankTraceNo;
	}
	public String getBankReturnCode() {
		return bankReturnCode;
	}
	public void setBankReturnCode(String bankReturnCode) {
		this.bankReturnCode = bankReturnCode;
	}
	public String getBankReturnMsg() {
		return bankReturnMsg;
	}
	public void setBankReturnMsg(String bankReturnMsg) {
		this.bankReturnMsg = bankReturnMsg;
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
	public BigDecimal getChannelFee() {
		return channelFee;
	}
	public void setChannelFee(BigDecimal channelFee) {
		this.channelFee = channelFee;
	}
	public BigDecimal getAgentBankFee() {
		return agentBankFee;
	}
	public void setAgentBankFee(BigDecimal agentBankFee) {
		this.agentBankFee = agentBankFee;
	}
	public String getPostNo() {
		return postNo;
	}
	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}
	public BigDecimal getPostFee() {
		return postFee;
	}
	public void setPostFee(BigDecimal postFee) {
		this.postFee = postFee;
	}
	public String getCallbackUrl() {
		return callbackUrl;
	}
	public String getFrozenSerialNo() {
		return frozenSerialNo;
	}
	public void setFrozenSerialNo(String frozenSerialNo) {
		this.frozenSerialNo = frozenSerialNo;
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
	public String getMctSettleType() {
		return mctSettleType;
	}
	public void setMctSettleType(String mctSettleType) {
		this.mctSettleType = mctSettleType;
	}
	public String getExchangeType() {
		return exchangeType;
	}
	public void setExchangeType(String exchangeType) {
		this.exchangeType = exchangeType;
	}
	public Double getFrozenRate() {
		return frozenRate;
	}
	public void setFrozenRate(Double frozenRate) {
		this.frozenRate = frozenRate;
	}
	public BigDecimal getFrozenAmount() {
		return frozenAmount;
	}
	public void setFrozenAmount(BigDecimal frozenAmount) {
		this.frozenAmount = frozenAmount;
	}
	public String getChannelNo() {
		return channelNo;
	}
	public void setChannelNo(String channelNo) {
		this.channelNo = channelNo;
	}
	public String getNotifyStatus() {
		return notifyStatus;
	}
	public void setNotifyStatus(String notifyStatus) {
		this.notifyStatus = notifyStatus;
	}
	public Integer getCheckCount() {
		return checkCount;
	}
	public void setCheckCount(Integer checkCount) {
		this.checkCount = checkCount;
	}
	public BigDecimal getCheckAmount() {
		return checkAmount;
	}
	public void setCheckAmount(BigDecimal checkAmount) {
		this.checkAmount = checkAmount;
	}
	public Double getBankRate() {
		return bankRate;
	}
	public void setBankRate(Double bankRate) {
		this.bankRate = bankRate;
	}
	public String getBusinessRange() {
		return businessRange;
	}
	public void setBusinessRange(String businessRange) {
		this.businessRange = businessRange;
	}
	public String getRateType() {
		return rateType;
	}
	public void setRateType(String rateType) {
		this.rateType = rateType;
	}
	public String getRemitComment() {
		return remitComment;
	}
	public void setRemitComment(String remitComment) {
		this.remitComment = remitComment;
	}
	public String getChannelName() {
		return channelName;
	}
	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}
	public String getPayerName() {
		return payerName;
	}
	public void setPayerName(String payerName) {
		this.payerName = payerName;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getPayerAccountNo() {
		return payerAccountNo;
	}
	public void setPayerAccountNo(String payerAccountNo) {
		this.payerAccountNo = payerAccountNo;
	}
	public String getReceiverAccountNo() {
		return receiverAccountNo;
	}
	public void setReceiverAccountNo(String receiverAccountNo) {
		this.receiverAccountNo = receiverAccountNo;
	}
	public BigDecimal getBankRemitAmount() {
		return bankRemitAmount;
	}
	public void setBankRemitAmount(BigDecimal bankRemitAmount) {
		this.bankRemitAmount = bankRemitAmount;
	}
	public BigDecimal getBankGatherAmount() {
		return bankGatherAmount;
	}
	public void setBankGatherAmount(BigDecimal bankGatherAmount) {
		this.bankGatherAmount = bankGatherAmount;
	}
	public String getFileName1() {
		return fileName1;
	}
	public void setFileName1(String fileName1) {
		this.fileName1 = fileName1;
	}
	public String getFileName2() {
		return fileName2;
	}
	public void setFileName2(String fileName2) {
		this.fileName2 = fileName2;
	}
	public String getSalesman() {
		return salesman;
	}
	public void setSalesman(String salesman) {
		this.salesman = salesman;
	}
	public String getRemitPostscript() {
		return remitPostscript;
	}
	public void setRemitPostscript(String remitPostscript) {
		this.remitPostscript = remitPostscript;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getExtend1() {
		return extend1;
	}
	public void setExtend1(String extend1) {
		this.extend1 = extend1;
	}
	public String getExtend2() {
		return extend2;
	}
	public void setExtend2(String extend2) {
		this.extend2 = extend2;
	}
	
}
