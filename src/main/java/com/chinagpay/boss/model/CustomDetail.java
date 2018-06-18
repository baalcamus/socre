package com.chinagpay.boss.model;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;

public class CustomDetail {
	private Character idPassFlag;
    private String id;

    private String merchantNo;

    private Timestamp createTime;

    private String appType;

    private String appStatus;

    private String orderNo;

    private String goodsDes;

    private Short goodsCount;

    private String payerName;

    private String payerIdtype;

    private String payerCode;

    private String payerPhone;

    private String payFlow;

    private String payTime;

    private String payCry;

    private BigDecimal payAmt;

    private String ebpCode;

    private String ebpName;

    private String payenCode;

    private String payenName;

    private String status;

    private String returnTime;

    private String returnCode;

    private String returnMsg;

    private String customId;
    
    private String detailNo;
    
    private String payAccountNo;
    
    private String payBankName;
    
    private String payBankAddr;
    
    private String remark;
    
    private String payType;
    
    private String batchNo;
    private String beginDate;
	private String endDate;
    public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getMerchantNo() {
        return merchantNo;
    }

    public void setMerchantNo(String merchantNo) {
        this.merchantNo = merchantNo == null ? null : merchantNo.trim();
    }


    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public String getAppType() {
        return appType;
    }

    public void setAppType(String appType) {
        this.appType = appType == null ? null : appType.trim();
    }

    public String getAppStatus() {
        return appStatus;
    }

    public void setAppStatus(String appStatus) {
        this.appStatus = appStatus == null ? null : appStatus.trim();
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo == null ? null : orderNo.trim();
    }

   
    public String getGoodsDes() {
        return goodsDes;
    }

    public void setGoodsDes(String goodsDes) {
        this.goodsDes = goodsDes == null ? null : goodsDes.trim();
    }

    public Short getGoodsCount() {
        return goodsCount;
    }

    public void setGoodsCount(Short goodsCount) {
        this.goodsCount = goodsCount;
    }

    public String getPayerName() {
        return payerName;
    }

    public void setPayerName(String payerName) {
        this.payerName = payerName == null ? null : payerName.trim();
    }

    public String getPayerIdtype() {
        return payerIdtype;
    }

    public void setPayerIdtype(String payerIdtype) {
        this.payerIdtype = payerIdtype == null ? null : payerIdtype.trim();
    }

    public String getPayerCode() {
        return payerCode;
    }

    public void setPayerCode(String payerCode) {
        this.payerCode = payerCode == null ? null : payerCode.trim();
    }

    public String getPayerPhone() {
        return payerPhone;
    }

    public void setPayerPhone(String payerPhone) {
        this.payerPhone = payerPhone == null ? null : payerPhone.trim();
    }

    public String getPayFlow() {
        return payFlow;
    }

    public void setPayFlow(String payFlow) {
        this.payFlow = payFlow == null ? null : payFlow.trim();
    }

    public String getPayTime() {
        return payTime;
    }

    public void setPayTime(String payTime) {
        this.payTime = payTime;
    }

    public String getPayCry() {
        return payCry;
    }

    public void setPayCry(String payCry) {
        this.payCry = payCry == null ? null : payCry.trim();
    }

    public BigDecimal getPayAmt() {
        return payAmt;
    }

    public void setPayAmt(BigDecimal payAmt) {
        this.payAmt = payAmt;
    }

    public String getEbpCode() {
        return ebpCode;
    }

    public void setEbpCode(String ebpCode) {
        this.ebpCode = ebpCode == null ? null : ebpCode.trim();
    }

    public String getEbpName() {
        return ebpName;
    }

    public void setEbpName(String ebpName) {
        this.ebpName = ebpName == null ? null : ebpName.trim();
    }

    public String getPayenCode() {
        return payenCode;
    }

    public void setPayenCode(String payenCode) {
        this.payenCode = payenCode == null ? null : payenCode.trim();
    }

    public String getPayenName() {
        return payenName;
    }

    public void setPayenName(String payenName) {
        this.payenName = payenName == null ? null : payenName.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getReturnTime() {
        return returnTime;
    }

    public void setReturnTime(String returnTime) {
        this.returnTime = returnTime == null ? null : returnTime.trim();
    }

    public String getReturnCode() {
        return returnCode;
    }

    public void setReturnCode(String returnCode) {
        this.returnCode = returnCode == null ? null : returnCode.trim();
    }

    public String getReturnMsg() {
        return returnMsg;
    }

    public void setReturnMsg(String returnMsg) {
        this.returnMsg = returnMsg == null ? null : returnMsg.trim();
    }

    public String getCustomId() {
        return customId;
    }

    public void setCustomId(String customId) {
        this.customId = customId == null ? null : customId.trim();
    }

	public String getDetailNo() {
		return detailNo;
	}

	public void setDetailNo(String detailNo) {
		this.detailNo = detailNo;
	}

	public String getPayAccountNo() {
		return payAccountNo;
	}

	public void setPayAccountNo(String payAccountNo) {
		this.payAccountNo = payAccountNo;
	}

	public String getPayBankName() {
		return payBankName;
	}

	public void setPayBankName(String payBankName) {
		this.payBankName = payBankName;
	}

	public String getPayBankAddr() {
		return payBankAddr;
	}

	public void setPayBankAddr(String payBankAddr) {
		this.payBankAddr = payBankAddr;
	}

	public String getBatchNo() {
		return batchNo;
	}

	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo;
	}

	public Character getIdPassFlag() {
		return idPassFlag;
	}

	public void setIdPassFlag(Character idPassFlag) {
		this.idPassFlag = idPassFlag;
	}

	public String getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
    
    
}