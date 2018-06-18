package com.chinagpay.boss.model;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by hanbinyu on 2016/7/28.
 */
public class BusinessReport {
    private Long id ;
    private Date statisticsDate;
    private String statisticsYear;
    private Integer addMerCount;
    private Integer sumMerCount;
    private BigDecimal totalTrade;
    private BigDecimal totalAmount;
    private BigDecimal totalAmount2;
    private String businessType;
    private String fundFlow;

    //显示字段
    private Date beginDate;
    private Date endDate;
    private Integer beginAddMerCount;
    private Integer endAddMerCount;
    private Integer beginSumMerCount;
    private Integer endSumMerCount;
    private BigDecimal beginTotalTrade;
    private BigDecimal endTotalTrade;
    private BigDecimal beginTotalAmount;
    private BigDecimal endTotalAmount;
    private BigDecimal payAnotherAmount;

    public BigDecimal getPayAnotherAmount() {
        return payAnotherAmount;
    }

    public void setPayAnotherAmount(BigDecimal payAnotherAmount) {
        this.payAnotherAmount = payAnotherAmount;
    }

    public Date getBeginDate() {
        return beginDate;
    }

    public BigDecimal getTotalAmount2() {
        return totalAmount2;
    }

    public void setTotalAmount2(BigDecimal totalAmount2) {
        this.totalAmount2 = totalAmount2;
    }

    public void setBeginDate(Date beginDate) {
        this.beginDate = beginDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Integer getBeginAddMerCount() {
        return beginAddMerCount;
    }

    public void setBeginAddMerCount(Integer beginAddMerCount) {
        this.beginAddMerCount = beginAddMerCount;
    }

    public Integer getEndAddMerCount() {
        return endAddMerCount;
    }

    public void setEndAddMerCount(Integer endAddMerCount) {
        this.endAddMerCount = endAddMerCount;
    }

    public Integer getBeginSumMerCount() {
        return beginSumMerCount;
    }

    public void setBeginSumMerCount(Integer beginSumMerCount) {
        this.beginSumMerCount = beginSumMerCount;
    }

    public Integer getEndSumMerCount() {
        return endSumMerCount;
    }

    public void setEndSumMerCount(Integer endSumMerCount) {
        this.endSumMerCount = endSumMerCount;
    }

    public BigDecimal getBeginTotalTrade() {
        return beginTotalTrade;
    }

    public void setBeginTotalTrade(BigDecimal beginTotalTrade) {
        this.beginTotalTrade = beginTotalTrade;
    }

    public BigDecimal getEndTotalTrade() {
        return endTotalTrade;
    }

    public void setEndTotalTrade(BigDecimal endTotalTrade) {
        this.endTotalTrade = endTotalTrade;
    }

    public BigDecimal getBeginTotalAmount() {
        return beginTotalAmount;
    }

    public void setBeginTotalAmount(BigDecimal beginTotalAmount) {
        this.beginTotalAmount = beginTotalAmount;
    }

    public BigDecimal getEndTotalAmount() {
        return endTotalAmount;
    }

    public void setEndTotalAmount(BigDecimal endTotalAmount) {
        this.endTotalAmount = endTotalAmount;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getStatisticsDate() {
        return statisticsDate;
    }

    public void setStatisticsDate(Date statisticsDate) {
        this.statisticsDate = statisticsDate;
    }

    public String getStatisticsYear() {
        return statisticsYear;
    }

    public void setStatisticsYear(String statisticsYear) {
        this.statisticsYear = statisticsYear;
    }

    public Integer getAddMerCount() {
        return addMerCount;
    }

    public void setAddMerCount(Integer addMerCount) {
        this.addMerCount = addMerCount;
    }

    public Integer getSumMerCount() {
        return sumMerCount;
    }

    public void setSumMerCount(Integer sumMerCount) {
        this.sumMerCount = sumMerCount;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public BigDecimal getTotalTrade() {
        return totalTrade;
    }

    public void setTotalTrade(BigDecimal totalTrade) {
        this.totalTrade = totalTrade;
    }

    public String getBusinessType() {
        return businessType;
    }

    public void setBusinessType(String businessType) {
        this.businessType = businessType;
    }

    public String getFundFlow() {
        return fundFlow;
    }

    public void setFundFlow(String fundFlow) {
        this.fundFlow = fundFlow;
    }
}
