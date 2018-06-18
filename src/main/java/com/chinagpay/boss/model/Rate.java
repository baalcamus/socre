package com.chinagpay.boss.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Rate {
    private String id;

    private String currency;

    private String bankCode;

    private String merchantNo;

    private String rateDate;

    private String rateType;

    private BigDecimal rate;

    private Timestamp fromLockTime;

    private Timestamp toLockTime;

    private String dataSource;

    private Timestamp updateTime;

    private BigDecimal settleRate;

    private String bankId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency == null ? null : currency.trim();
    }

    public String getBankCode() {
        return bankCode;
    }

    public void setBankCode(String bankCode) {
        this.bankCode = bankCode == null ? null : bankCode.trim();
    }

    public String getMerchantNo() {
        return merchantNo;
    }

    public void setMerchantNo(String merchantNo) {
        this.merchantNo = merchantNo == null ? null : merchantNo.trim();
    }

    public String getRateDate() {
        return rateDate;
    }

    public void setRateDate(String rateDate) {
        this.rateDate = rateDate == null ? null : rateDate.trim();
    }

    public String getRateType() {
        return rateType;
    }

    public void setRateType(String rateType) {
        this.rateType = rateType == null ? null : rateType.trim();
    }

    public BigDecimal getRate() {
        return rate;
    }

    public void setRate(BigDecimal rate) {
        this.rate = rate;
    }

    public String getDataSource() {
        return dataSource;
    }

    public void setDataSource(String dataSource) {
        this.dataSource = dataSource == null ? null : dataSource.trim();
    }

    public BigDecimal getSettleRate() {
        return settleRate;
    }

    public void setSettleRate(BigDecimal settleRate) {
        this.settleRate = settleRate;
    }

    public String getBankId() {
        return bankId;
    }

    public void setBankId(String bankId) {
        this.bankId = bankId == null ? null : bankId.trim();
    }

	public Timestamp getFromLockTime() {
		return fromLockTime;
	}

	public void setFromLockTime(Timestamp fromLockTime) {
		this.fromLockTime = fromLockTime;
	}

	public Timestamp getToLockTime() {
		return toLockTime;
	}

	public void setToLockTime(Timestamp toLockTime) {
		this.toLockTime = toLockTime;
	}

	public Timestamp getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}
}