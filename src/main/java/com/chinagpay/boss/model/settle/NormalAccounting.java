package com.chinagpay.boss.model.settle;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class NormalAccounting {
    private String id;

    private String merchantNo;

    private String spMerchantNo;

    private String accountingSerialNo;

    private String direction;

    private String payMethod;

    private String payProduct;

    private String accountingType;

    private String accountingStatus;

    private String feePayType;

    private String chargeType;

    private String countFeeType;

    private BigDecimal accountingAmount;

    private String accountingCurrency;

    private Timestamp accountingTime;

    private String orderNo;

    private String merchantOrderNo;

    private String bizNo;

    private BigDecimal tradeAmount;

    private BigDecimal tradeFee;

    private BigDecimal spFee;

    private String splitData;

    private String systemFrom;

    private String createStaff;

    private Timestamp createTime;

    private String updateStaff;

    private Timestamp updateTime;

    private String description;

    private String accountingReturnCode;

    private String accountingReturnMsg;

    private Integer callBackCount;

    private String callBackResult;

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

    public String getSpMerchantNo() {
        return spMerchantNo;
    }

    public void setSpMerchantNo(String spMerchantNo) {
        this.spMerchantNo = spMerchantNo;
    }

    public String getAccountingSerialNo() {
        return accountingSerialNo;
    }

    public void setAccountingSerialNo(String accountingSerialNo) {
        this.accountingSerialNo = accountingSerialNo;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
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

    public String getAccountingType() {
        return accountingType;
    }

    public void setAccountingType(String accountingType) {
        this.accountingType = accountingType;
    }

    public String getAccountingStatus() {
        return accountingStatus;
    }

    public void setAccountingStatus(String accountingStatus) {
        this.accountingStatus = accountingStatus;
    }

    public String getFeePayType() {
        return feePayType;
    }

    public void setFeePayType(String feePayType) {
        this.feePayType = feePayType;
    }

    public String getChargeType() {
        return chargeType;
    }

    public void setChargeType(String chargeType) {
        this.chargeType = chargeType;
    }

    public String getCountFeeType() {
        return countFeeType;
    }

    public void setCountFeeType(String countFeeType) {
        this.countFeeType = countFeeType;
    }

    public BigDecimal getAccountingAmount() {
        return accountingAmount;
    }

    public void setAccountingAmount(BigDecimal accountingAmount) {
        this.accountingAmount = accountingAmount;
    }

    public String getAccountingCurrency() {
        return accountingCurrency;
    }

    public void setAccountingCurrency(String accountingCurrency) {
        this.accountingCurrency = accountingCurrency;
    }

    public Timestamp getAccountingTime() {
        return accountingTime;
    }

    public void setAccountingTime(Timestamp accountingTime) {
        this.accountingTime = accountingTime;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getMerchantOrderNo() {
        return merchantOrderNo;
    }

    public void setMerchantOrderNo(String merchantOrderNo) {
        this.merchantOrderNo = merchantOrderNo;
    }

    public String getBizNo() {
        return bizNo;
    }

    public void setBizNo(String bizNo) {
        this.bizNo = bizNo;
    }

    public BigDecimal getTradeAmount() {
        return tradeAmount;
    }

    public void setTradeAmount(BigDecimal tradeAmount) {
        this.tradeAmount = tradeAmount;
    }

    public BigDecimal getTradeFee() {
        return tradeFee;
    }

    public void setTradeFee(BigDecimal tradeFee) {
        this.tradeFee = tradeFee;
    }

    public BigDecimal getSpFee() {
        return spFee;
    }

    public void setSpFee(BigDecimal spFee) {
        this.spFee = spFee;
    }

    public String getSplitData() {
        return splitData;
    }

    public void setSplitData(String splitData) {
        this.splitData = splitData;
    }

    public String getSystemFrom() {
        return systemFrom;
    }

    public void setSystemFrom(String systemFrom) {
        this.systemFrom = systemFrom;
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

    public String getAccountingReturnCode() {
        return accountingReturnCode;
    }

    public void setAccountingReturnCode(String accountingReturnCode) {
        this.accountingReturnCode = accountingReturnCode;
    }

    public String getAccountingReturnMsg() {
        return accountingReturnMsg;
    }

    public void setAccountingReturnMsg(String accountingReturnMsg) {
        this.accountingReturnMsg = accountingReturnMsg;
    }

    public Integer getCallBackCount() {
        return callBackCount;
    }

    public void setCallBackCount(Integer callBackCount) {
        this.callBackCount = callBackCount;
    }

    public String getCallBackResult() {
        return callBackResult;
    }

    public void setCallBackResult(String callBackResult) {
        this.callBackResult = callBackResult;
    }
}