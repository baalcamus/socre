package com.chinagpay.boss.model.risk;

import java.sql.Timestamp;

public class RiskRbifRecord {
	
    private String id;

    private String cbifBatchNo;

    private String rbifRecordStatus;

    private String messageType;

    private String centerReturnMessage;

    private String description;

    private String createStaff;

    private Timestamp createTime;

    private String updateStaff;

    private Timestamp updateTime;

	private String fileName;

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCbifBatchNo() {
		return cbifBatchNo;
	}

	public void setCbifBatchNo(String cbifBatchNo) {
		this.cbifBatchNo = cbifBatchNo;
	}

	public String getRbifRecordStatus() {
		return rbifRecordStatus;
	}

	public void setRbifRecordStatus(String rbifRecordStatus) {
		this.rbifRecordStatus = rbifRecordStatus;
	}

	public String getMessageType() {
		return messageType;
	}

	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}

	public String getCenterReturnMessage() {
		return centerReturnMessage;
	}

	public void setCenterReturnMessage(String centerReturnMessage) {
		this.centerReturnMessage = centerReturnMessage;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

}