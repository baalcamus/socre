package com.chinagpay.boss.model.settle;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class SplitAccounting {
    private String id;

    private String normalId;

    private String splitMerchantNo;

    private String splitSpMerchantNo;

    private BigDecimal splitAmount;

    private BigDecimal splitFee;

    private BigDecimal splitSpFee;

    private String splitMerchantOrderNo;

    private String createStaff;

    private Timestamp createTime;

    private String updateStaff;

    private Timestamp updateTime;

    private String description;

    private BigDecimal splitAccountingAmount;

    private String splitStatus;

    private String chargeType;

    private String countFeeType;

    private String bizNo;

    private String systemFrom;

    private String accountNo;

    private String flowId;

    public String getFlowId() {
        return flowId;
    }

    public void setFlowId(String flowId) {
        this.flowId = flowId;
    }

    public String getAccountNo() {
        return accountNo;
    }

    public void setAccountNo(String accountNo) {
        this.accountNo = accountNo;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNormalId() {
        return normalId;
    }

    public void setNormalId(String normalId) {
        this.normalId = normalId;
    }

    public String getSplitMerchantNo() {
        return splitMerchantNo;
    }

    public void setSplitMerchantNo(String splitMerchantNo) {
        this.splitMerchantNo = splitMerchantNo;
    }

    public String getSplitSpMerchantNo() {
        return splitSpMerchantNo;
    }

    public void setSplitSpMerchantNo(String splitSpMerchantNo) {
        this.splitSpMerchantNo = splitSpMerchantNo;
    }

    public BigDecimal getSplitAmount() {
        return splitAmount;
    }

    public void setSplitAmount(BigDecimal splitAmount) {
        this.splitAmount = splitAmount;
    }

    public BigDecimal getSplitFee() {
        return splitFee;
    }

    public void setSplitFee(BigDecimal splitFee) {
        this.splitFee = splitFee;
    }

    public BigDecimal getSplitSpFee() {
        return splitSpFee;
    }

    public void setSplitSpFee(BigDecimal splitSpFee) {
        this.splitSpFee = splitSpFee;
    }

    public String getSplitMerchantOrderNo() {
        return splitMerchantOrderNo;
    }

    public void setSplitMerchantOrderNo(String splitMerchantOrderNo) {
        this.splitMerchantOrderNo = splitMerchantOrderNo;
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

    public BigDecimal getSplitAccountingAmount() {
        return splitAccountingAmount;
    }

    public void setSplitAccountingAmount(BigDecimal splitAccountingAmount) {
        this.splitAccountingAmount = splitAccountingAmount;
    }

    public String getSplitStatus() {
        return splitStatus;
    }

    public void setSplitStatus(String splitStatus) {
        this.splitStatus = splitStatus;
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

    public String getBizNo() {
        return bizNo;
    }

    public void setBizNo(String bizNo) {
        this.bizNo = bizNo;
    }

    public String getSystemFrom() {
        return systemFrom;
    }

    public void setSystemFrom(String systemFrom) {
        this.systemFrom = systemFrom;
    }
}