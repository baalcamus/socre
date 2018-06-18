package com.chinagpay.boss.model;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;

public class CustomerInf {
	private String merchantName;
	private String idCheckFlag;
	private String productCode;
	private Integer idPassCount;
	private String id;

	private String merchantNo;

	private String batchNo;

	private String batchFlowNo;

	private String status;

	private Timestamp createTime;

	private BigDecimal sumAmount;

	private String currency;

	private Short count;

	private String custCode;

	private Short custCount;

	private Date beginDate;

	private Date endDate;

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

	public String getBatchNo() {
		return batchNo;
	}

	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo == null ? null : batchNo.trim();
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status == null ? null : status.trim();
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public BigDecimal getSumAmount() {
		return sumAmount;
	}

	public void setSumAmount(BigDecimal sumAmount) {
		this.sumAmount = sumAmount;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency == null ? null : currency.trim();
	}

	public Short getCount() {
		return count;
	}

	public void setCount(Short count) {
		this.count = count;
	}

	public String getCustCode() {
		return custCode;
	}

	public void setCustCode(String custCode) {
		this.custCode = custCode == null ? null : custCode.trim();
	}

	public Short getCustCount() {
		return custCount;
	}

	public void setCustCount(Short custCount) {
		this.custCount = custCount;
	}

	public String getBatchFlowNo() {
		return batchFlowNo;
	}

	public void setBatchFlowNo(String batchFlowNo) {
		this.batchFlowNo = batchFlowNo;
	}

	public Date getBeginDate() {
		return beginDate;
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

	public String getIdCheckFlag() {
		return idCheckFlag;
	}

	public void setIdCheckFlag(String idCheckFlag) {
		this.idCheckFlag = idCheckFlag;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public Integer getIdPassCount() {
		return idPassCount;
	}

	public void setIdPassCount(Integer idPassCount) {
		this.idPassCount = idPassCount;
	}

	public String getMerchantName() {
		return merchantName;
	}

	public void setMerchantName(String merchantName) {
		this.merchantName = merchantName;
	}

}