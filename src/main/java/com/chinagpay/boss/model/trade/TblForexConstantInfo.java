package com.chinagpay.boss.model.trade;

public class TblForexConstantInfo {
	
    private String id;

    private String constantType;   //银行    bank

    private String constantStatus; //是否可用  valid

    private String constantName;  //银行名称：  民生银行

    private String constantId;   //银行的简称    CMBC...

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getConstantType() {
        return constantType;
    }

    public void setConstantType(String constantType) {
        this.constantType = constantType == null ? null : constantType.trim();
    }

    public String getConstantStatus() {
        return constantStatus;
    }

    public void setConstantStatus(String constantStatus) {
        this.constantStatus = constantStatus == null ? null : constantStatus.trim();
    }

    public String getConstantName() {
        return constantName;
    }

    public void setConstantName(String constantName) {
        this.constantName = constantName == null ? null : constantName.trim();
    }

    public String getConstantId() {
        return constantId;
    }

    public void setConstantId(String constantId) {
        this.constantId = constantId == null ? null : constantId.trim();
    }
}