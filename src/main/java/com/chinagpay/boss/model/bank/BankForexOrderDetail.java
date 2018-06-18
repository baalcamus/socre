package com.chinagpay.boss.model.bank;

import java.math.BigDecimal;

/**
 * 汇款订单明细表
 * @author cgp11
 *
 */
public class BankForexOrderDetail {
	/**主键id*/
	private String id;
	/**汇款订单id*/
	private String bankForexOrderId;
	/**汇款订单明细号*/
	private String orderDetailNo;
	/**银行审核结果*/
	private String checkResult;
	/**银行返回码*/
	private String bankReturnCode;
	/**银行返回信息*/
	private String bankReturnMsg;
	/**申报金额*/
	private BigDecimal forexAmount;
	/**申报币种*/
	private String forexCurrency;
	/**银行流水明细号*/
	private String  bankSerialDetailNo;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBankForexOrderId() {
		return bankForexOrderId;
	}
	public void setBankForexOrderId(String bankForexOrderId) {
		this.bankForexOrderId = bankForexOrderId;
	}
	public String getOrderDetailNo() {
		return orderDetailNo;
	}
	public void setOrderDetailNo(String orderDetailNo) {
		this.orderDetailNo = orderDetailNo;
	}
	public String getCheckResult() {
		return checkResult;
	}
	public void setCheckResult(String checkResult) {
		this.checkResult = checkResult;
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
	public BigDecimal getForexAmount() {
		return forexAmount;
	}
	public void setForexAmount(BigDecimal forexAmount) {
		this.forexAmount = forexAmount;
	}
	public String getForexCurrency() {
		return forexCurrency;
	}
	public void setForexCurrency(String forexCurrency) {
		this.forexCurrency = forexCurrency;
	}
	public String getBankSerialDetailNo() {
		return bankSerialDetailNo;
	}
	public void setBankSerialDetailNo(String bankSerialDetailNo) {
		this.bankSerialDetailNo = bankSerialDetailNo;
	}
	
	
	
	
	
	

}
