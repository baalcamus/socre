/**   
 * Copyright © 2017 爱农支付. All rights reserved.
 * 
 * @Title: ElectronicReceiptInfoVo.java 
 * @Prject: op-boss
 * @Package: com.chinagpay.boss.model.trade.vo 
 * @Description: TODO
 * @author: lw
 * @date: 2017年5月9日 上午10:43:23 
 * @version: V1.0   
 */
package com.chinagpay.boss.model.trade.vo;

import java.math.BigDecimal;
import java.sql.Date;


/** 
 * @ClassName: ElectronicReceiptInfoVo 
 * @Description: TODO
 * @author: lw
 * @date: 2017年5月9日 上午10:43:23  
 */
public class ElectronicReceiptInfoVo {
	
	//付款人
	private String payerName;
	//收款人
	private String receiverName;
	//付款人 账号
	private String payerAccountNo;
	//收款人 账号
	private String receiverAccountNo;
	//汇款金额
	private BigDecimal bankGatherAmount;
	/**汇款币种**/
	private String gatherCurrency;
	/**银行执行汇率**/
	private Double bankRate;
	//购汇人民币
	private BigDecimal bankRemitAmount;
	//手续费费率
	private Double feeRate;
	//手续费
	private BigDecimal charge;
	//合计
	private BigDecimal total;
	//账户余额
	private BigDecimal balance;
	//受理日期
	private Date acceptDate;
	/**执行汇率**/
	private Double exchangeRate;
	
	/**汇款金额**/
	private BigDecimal sumRemitAmount;
	
	
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
	public BigDecimal getBankGatherAmount() {
		return bankGatherAmount;
	}
	public void setBankGatherAmount(BigDecimal bankGatherAmount) {
		this.bankGatherAmount = bankGatherAmount;
	}

	public Double getBankRate() {
		return bankRate;
	}
	public void setBankRate(Double bankRate) {
		this.bankRate = bankRate;
	}
	public BigDecimal getBankRemitAmount() {
		return bankRemitAmount;
	}
	public void setBankRemitAmount(BigDecimal bankRemitAmount) {
		this.bankRemitAmount = bankRemitAmount;
	}

	public BigDecimal getTotal() {
		return total;
	}
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	public BigDecimal getBalance() {
		return balance;
	}
	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}
	public Date getAcceptDate() {
		return acceptDate;
	}
	public void setAcceptDate(Date acceptDate) {
		this.acceptDate = acceptDate;
	}
	public Double getFeeRate() {
		return feeRate;
	}
	public void setFeeRate(Double feeRate) {
		this.feeRate = feeRate;
	}
	public BigDecimal getCharge() {
		return charge;
	}
	public void setCharge(BigDecimal charge) {
		this.charge = charge;
	}
	public String getGatherCurrency() {
		return gatherCurrency;
	}
	public void setGatherCurrency(String gatherCurrency) {
		this.gatherCurrency = gatherCurrency;
	}
	public Double getExchangeRate() {
		return exchangeRate;
	}
	public void setExchangeRate(Double exchangeRate) {
		this.exchangeRate = exchangeRate;
	}
	public BigDecimal getSumRemitAmount() {
		return sumRemitAmount;
	}
	public void setSumRemitAmount(BigDecimal sumRemitAmount) {
		this.sumRemitAmount = sumRemitAmount;
	}
	
	
	
}
