package com.chinagpay.boss.model.ztrade;

import java.math.BigDecimal;
import java.util.Date;

public class CheckAccountResult {
	private String id;
	private String checkDate;
	private String channelNo;
	private Integer platformBusinessCount;
	private BigDecimal platformBusinessAmount;
	private Integer channelBusinessCount;
	private BigDecimal channelBusinessAmount;
	private String checkResult;
	private Integer platformUnilateralCount;
	private Integer channelUnilateralCount;
	private Integer amountInconsistentCount;
	private String operator;
	private String remark;
	private String createStaff;
	private Date createTime;
	private String updateStaff;
	private Date updateTime;
	private String description;
	//其他vo参赛
	private String beginDate;
	private String endDate;
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}

	public String getChannelNo() {
		return channelNo;
	}

	public void setChannelNo(String channelNo) {
		this.channelNo = channelNo;
	}

	public Integer getPlatformBusinessCount() {
		return platformBusinessCount;
	}

	public void setPlatformBusinessCount(Integer platformBusinessCount) {
		this.platformBusinessCount = platformBusinessCount;
	}

	public BigDecimal getPlatformBusinessAmount() {
		return platformBusinessAmount;
	}

	public void setPlatformBusinessAmount(BigDecimal platformBusinessAmount) {
		this.platformBusinessAmount = platformBusinessAmount;
	}

	public Integer getChannelBusinessCount() {
		return channelBusinessCount;
	}

	public void setChannelBusinessCount(Integer channelBusinessCount) {
		this.channelBusinessCount = channelBusinessCount;
	}

	public BigDecimal getChannelBusinessAmount() {
		return channelBusinessAmount;
	}

	public void setChannelBusinessAmount(BigDecimal channelBusinessAmount) {
		this.channelBusinessAmount = channelBusinessAmount;
	}

	public String getCheckResult() {
		return checkResult;
	}

	public void setCheckResult(String checkResult) {
		this.checkResult = checkResult;
	}

	public Integer getPlatformUnilateralCount() {
		return platformUnilateralCount;
	}

	public void setPlatformUnilateralCount(Integer platformUnilateralCount) {
		this.platformUnilateralCount = platformUnilateralCount;
	}

	public Integer getChannelUnilateralCount() {
		return channelUnilateralCount;
	}

	public void setChannelUnilateralCount(Integer channelUnilateralCount) {
		this.channelUnilateralCount = channelUnilateralCount;
	}

	public Integer getAmountInconsistentCount() {
		return amountInconsistentCount;
	}

	public void setAmountInconsistentCount(Integer amountInconsistentCount) {
		this.amountInconsistentCount = amountInconsistentCount;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getCreateStaff() {
		return createStaff;
	}

	public void setCreateStaff(String createStaff) {
		this.createStaff = createStaff;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getUpdateStaff() {
		return updateStaff;
	}

	public void setUpdateStaff(String updateStaff) {
		this.updateStaff = updateStaff;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
