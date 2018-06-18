package com.chinagpay.boss.model.bank;

import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 * 银行订单表
 * @author cgp11
 *
 */
public class BankForexOrder {
	/**贸易种类业务范围**/
	private String businessRange;
	/**银行订单主键*/
	private String id;
	/**外汇类型*/
	private String exchangeType;
	/**商户结算模式[固定人民币,固定外币]*/
	private String mctSettleType;
	/**贸易种类，货物-服务贸易*/
	private String tradeType;
	/**贸易子类*/
	private String tradeChildType;
	/**明细笔数*/
	private Integer detailCount;
	/**总目标金额*/
	private BigDecimal sumTargetAmount;
	/**目标币种*/
	private String targetCurrency;
	/**总原始金额*/
	private BigDecimal sumOrgAmount;
	/**原始币种*/
	private String orgCurrency;
	/**平台订单号-trade系统传递*/
	private String orderNo;
	/**平台订单时间*/
	private Timestamp orderTime;
	/**银行请求流水*/
	private String bankReqSerialNo;
	/**银行编码*/
	private String bankId;
	/**文件路径*/
	private String filePath;
	/**文件名称*/
	private String fileName;
	/**汇率*/
	private Double forexRate;
	/**订单状态*/
	private String orderStatus;
	/**银行流水号*/
	private String bankTraceNo;
	/**银行返回时间*/
	private Timestamp bankReturnTime;
	/**银行返回码*/
	private String bankReturnCode;
	/**银行返回信息*/
	private String bankReturnMsg;
	/**平台返回码*/
	private String sysErrorCode;
	/**平台返回信息*/
	private String sysErrorMsg;
	/**渠道手续费*/
	private BigDecimal channelFee;
	/**代理行手续费*/
	private BigDecimal agentBankFee;
	/**电汇汇款编号*/
	private String postNo;
	/**电汇手续费*/
	private BigDecimal postFee;
	/**备注*/
	private String comments;
	/**通过笔数*/
	private Integer checkCount;
	/**通过金额*/
	private BigDecimal checkAmount;
	/**购汇类型*/
	private String rateType;
	public String getRateType() {
		return rateType;
	}
	public void setRateType(String rateType) {
		this.rateType = rateType;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getExchangeType() {
		return exchangeType;
	}
	public void setExchangeType(String exchangeType) {
		this.exchangeType = exchangeType;
	}
	public String getMctSettleType() {
		return mctSettleType;
	}
	public void setMctSettleType(String mctSettleType) {
		this.mctSettleType = mctSettleType;
	}
	public String getTradeType() {
		return tradeType;
	}
	public void setTradeType(String tradeType) {
		this.tradeType = tradeType;
	}
	public String getTradeChildType() {
		return tradeChildType;
	}
	public void setTradeChildType(String tradeChildType) {
		this.tradeChildType = tradeChildType;
	}
	public Integer getDetailCount() {
		return detailCount;
	}
	public void setDetailCount(Integer detailCount) {
		this.detailCount = detailCount;
	}
	public BigDecimal getSumTargetAmount() {
		return sumTargetAmount;
	}
	public void setSumTargetAmount(BigDecimal sumTargetAmount) {
		this.sumTargetAmount = sumTargetAmount;
	}
	public String getTargetCurrency() {
		return targetCurrency;
	}
	public void setTargetCurrency(String targetCurrency) {
		this.targetCurrency = targetCurrency;
	}
	public BigDecimal getSumOrgAmount() {
		return sumOrgAmount;
	}
	public void setSumOrgAmount(BigDecimal sumOrgAmount) {
		this.sumOrgAmount = sumOrgAmount;
	}
	public String getOrgCurrency() {
		return orgCurrency;
	}
	public void setOrgCurrency(String orgCurrency) {
		this.orgCurrency = orgCurrency;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public Timestamp getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Timestamp orderTime) {
		this.orderTime = orderTime;
	}
	public String getBankReqSerialNo() {
		return bankReqSerialNo;
	}
	public void setBankReqSerialNo(String bankReqSerialNo) {
		this.bankReqSerialNo = bankReqSerialNo;
	}
	
	public String getBankId() {
		return bankId;
	}
	public void setBankId(String bankId) {
		this.bankId = bankId;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Double getForexRate() {
		return forexRate;
	}
	public void setForexRate(Double forexRate) {
		this.forexRate = forexRate;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getBankTraceNo() {
		return bankTraceNo;
	}
	public void setBankTraceNo(String bankTraceNo) {
		this.bankTraceNo = bankTraceNo;
	}
	public Timestamp getBankReturnTime() {
		return bankReturnTime;
	}
	public void setBankReturnTime(Timestamp bankReturnTime) {
		this.bankReturnTime = bankReturnTime;
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
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
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
	public String getBusinessRange() {
		return businessRange;
	}
	public void setBusinessRange(String businessRange) {
		this.businessRange = businessRange;
	}
	
	
	
	

}
