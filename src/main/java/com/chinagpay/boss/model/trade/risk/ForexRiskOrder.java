package com.chinagpay.boss.model.trade.risk;

import java.sql.Timestamp;

public class ForexRiskOrder {
	private String id;//风控审核表主键
    private String riskStatus;//审核状态 初始化init 成功 失败     待人工确认
    private String singleResult;//单笔明细等值校验结果
    private String unitPriceResult;//单笔明细单价校验结果
    private String maximumMounthResult;//个人月度累计购汇校验结果
    private String realNameResult;//明细实名认证校验结果
    private String waybillResult;//明细运单号校验结果
    private Timestamp createTime;//创建时间
    private String detailCount;//需查询明细的笔数
    private Timestamp reqTime;//商户时间请求
    private String merchantNo;//商编
    private String merchantOrderNo;//商户订单号
    private String merchantListResult;
    private String maximumMounthCode;
    private String merchantListCode;
    private String realNameCode;
    private String singleCode;
    private String unitPriceCode;
    private String waybillCode;
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getRiskStatus() {
        return riskStatus;
    }

    public void setRiskStatus(String riskStatus) {
        this.riskStatus = riskStatus == null ? null : riskStatus.trim();
    }

    public String getSingleResult() {
        return singleResult;
    }

    public void setSingleResult(String singleResult) {
        this.singleResult = singleResult == null ? null : singleResult.trim();
    }

    public String getUnitPriceResult() {
        return unitPriceResult;
    }

    public void setUnitPriceResult(String unitPriceResult) {
        this.unitPriceResult = unitPriceResult == null ? null : unitPriceResult.trim();
    }

    public String getMaximumMounthResult() {
        return maximumMounthResult;
    }

    public void setMaximumMounthResult(String maximumMounthResult) {
        this.maximumMounthResult = maximumMounthResult == null ? null : maximumMounthResult.trim();
    }

    public String getRealNameResult() {
        return realNameResult;
    }

    public void setRealNameResult(String realNameResult) {
        this.realNameResult = realNameResult == null ? null : realNameResult.trim();
    }

    public String getWaybillResult() {
        return waybillResult;
    }

    public void setWaybillResult(String waybillResult) {
        this.waybillResult = waybillResult == null ? null : waybillResult.trim();
    }

    public Object getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public String getDetailCount() {
        return detailCount;
    }

    public void setDetailCount(String detailCount) {
        this.detailCount = detailCount == null ? null : detailCount.trim();
    }

    public Object getReqTime() {
        return reqTime;
    }

    public void setReqTime(Timestamp reqTime) {
        this.reqTime = reqTime;
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

	public String getMerchantListResult() {
		return merchantListResult;
	}

	public void setMerchantListResult(String merchantListResult) {
		this.merchantListResult = merchantListResult;
	}

	public String getMaximumMounthCode() {
		return maximumMounthCode;
	}

	public void setMaximumMounthCode(String maximumMounthCode) {
		this.maximumMounthCode = maximumMounthCode;
	}

	public String getMerchantListCode() {
		return merchantListCode;
	}

	public void setMerchantListCode(String merchantListCode) {
		this.merchantListCode = merchantListCode;
	}

	public String getRealNameCode() {
		return realNameCode;
	}

	public void setRealNameCode(String realNameCode) {
		this.realNameCode = realNameCode;
	}

	public String getSingleCode() {
		return singleCode;
	}

	public void setSingleCode(String singleCode) {
		this.singleCode = singleCode;
	}

	public String getUnitPriceCode() {
		return unitPriceCode;
	}

	public void setUnitPriceCode(String unitPriceCode) {
		this.unitPriceCode = unitPriceCode;
	}

	public String getWaybillCode() {
		return waybillCode;
	}

	public void setWaybillCode(String waybillCode) {
		this.waybillCode = waybillCode;
	}
}