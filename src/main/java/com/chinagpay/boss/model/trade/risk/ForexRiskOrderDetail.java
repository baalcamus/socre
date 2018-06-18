package com.chinagpay.boss.model.trade.risk;

import java.sql.Timestamp;

public class ForexRiskOrderDetail {
    private String id;//
    private String forexDetailId;//明细表主键
    private String riskType;//类型（单笔金额 单价 月限额 实名 运单）
    private String errorReason;//错误原因'
    private String single;// '金额最大';
    private String unitPrice;//'单价';
    private String name;//'名称';
    private String identityCard;//'身份证号';
    private String waybillNo;//'运单号';
    private String singleMonthForexCount;//个人单月购汇次数';
    private Timestamp createTime;//'创建时间';
    private String merchantNo;//'商编';
    private String merchantOrderNo;//'商户订单号';
    private Timestamp reqTime;//'订单请求时间';

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getForexDetailId() {
        return forexDetailId;
    }

    public void setForexDetailId(String forexDetailId) {
        this.forexDetailId = forexDetailId == null ? null : forexDetailId.trim();
    }

    public String getRiskType() {
        return riskType;
    }

    public void setRiskType(String riskType) {
        this.riskType = riskType == null ? null : riskType.trim();
    }

    public String getErrorReason() {
        return errorReason;
    }

    public void setErrorReason(String errorReason) {
        this.errorReason = errorReason == null ? null : errorReason.trim();
    }

    public String getSingle() {
        return single;
    }

    public void setSingle(String single) {
        this.single = single == null ? null : single.trim();
    }

    public String getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(String unitPrice) {
        this.unitPrice = unitPrice == null ? null : unitPrice.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getIdentityCard() {
        return identityCard;
    }

    public void setIdentityCard(String identityCard) {
        this.identityCard = identityCard == null ? null : identityCard.trim();
    }

    public String getWaybillNo() {
        return waybillNo;
    }

    public void setWaybillNo(String waybillNo) {
        this.waybillNo = waybillNo == null ? null : waybillNo.trim();
    }

    public String getSingleMonthForexCount() {
        return singleMonthForexCount;
    }

    public void setSingleMonthForexCount(String singleMonthForexCount) {
        this.singleMonthForexCount = singleMonthForexCount == null ? null : singleMonthForexCount.trim();
    }

    public Object getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public String getMerchantNo() {
        return merchantNo;
    }

    public void setMerchantNo(String merchantNo) {
        this.merchantNo = merchantNo == null ? null : merchantNo.trim();
    }

    public String getMerchantOrderNo() {
        return merchantOrderNo;
    }

    public void setMerchantOrderNo(String merchantOrderNo) {
        this.merchantOrderNo = merchantOrderNo == null ? null : merchantOrderNo.trim();
    }

    public Object getReqTime() {
        return reqTime;
    }

    public void setReqTime(Timestamp reqTime) {
        this.reqTime = reqTime;
    }
}