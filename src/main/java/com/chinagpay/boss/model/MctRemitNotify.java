package com.chinagpay.boss.model;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;

/**
 * 商户账户汇款通知
 * 
 * @author likun
 *
 */
public class MctRemitNotify {
	private String id;
	private String merchantNo;
	private String notifySerialNo;
	private Timestamp notifyTime;
	private String accountName;
	private String accountNo;
	private String bankName;
	private BigDecimal remitAmount;
	private Date remitDate;
	private String notifyStatus;
	private String voucher;
	private String comments;
	private String notifyType;
	private String remitCurrency;
	private BigDecimal realAmount;
	private String payerId;
	private String frozenSerialNo;
	
	public BigDecimal getRealAmount() {
		return realAmount;
	}
	public void setRealAmount(BigDecimal realAmount) {
		this.realAmount = realAmount;
	}
	public String getNotifyType() {
		return notifyType;
	}
	public void setNotifyType(String notifyType) {
		this.notifyType = notifyType;
	}
	public String getRemitCurrency() {
		return remitCurrency;
	}
	public void setRemitCurrency(String remitCurrency) {
		this.remitCurrency = remitCurrency;
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

	public String getNotifySerialNo() {
		return notifySerialNo;
	}

	public void setNotifySerialNo(String notifySerialNo) {
		this.notifySerialNo = notifySerialNo;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public Timestamp getNotifyTime() {
		return notifyTime;
	}

	public void setNotifyTime(Timestamp notifyTime) {
		this.notifyTime = notifyTime;
	}

	public BigDecimal getRemitAmount() {
		return remitAmount;
	}
	public void setRemitAmount(BigDecimal remitAmount) {
		this.remitAmount = remitAmount;
	}

	public Date getRemitDate() {
		return remitDate;
	}

	public void setRemitDate(Date remitDate) {
		this.remitDate = remitDate;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getNotifyStatus() {
		return notifyStatus;
	}

	public void setNotifyStatus(String notifyStatus) {
		this.notifyStatus = notifyStatus;
	}

	public String getVoucher() {
		return voucher;
	}

	public void setVoucher(String voucher) {
		this.voucher = voucher;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getPayerId() {
		return payerId;
	}
	public void setPayerId(String payerId) {
		this.payerId = payerId;
	}
	public String getFrozenSerialNo() {
		return frozenSerialNo;
	}
	public void setFrozenSerialNo(String frozenSerialNo) {
		this.frozenSerialNo = frozenSerialNo;
	}
}
