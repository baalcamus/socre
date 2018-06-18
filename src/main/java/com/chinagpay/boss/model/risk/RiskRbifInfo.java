package com.chinagpay.boss.model.risk;

import java.sql.Timestamp;

public class RiskRbifInfo {
	
    private String id;

    private String cbifBatchNo;

    private String cbifBatchStatus;

    private String applySystem;

    private String transType;

    private String rinm;

    private String firc;

    private String fice;

    private String rfsg;

    private String orxn;

    private String sstm;

    private String stcr;

    private String ssds;

    private String udsi;

    private Integer sctn;

    private Integer ttnm;

    private String description;

    private String createStaff;

    private Timestamp createTime;

    private String updateStaff;

    private Timestamp updateTime;

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

	public String getCbifBatchStatus() {
		return cbifBatchStatus;
	}

	public void setCbifBatchStatus(String cbifBatchStatus) {
		this.cbifBatchStatus = cbifBatchStatus;
	}

	public String getApplySystem() {
		return applySystem;
	}

	public void setApplySystem(String applySystem) {
		this.applySystem = applySystem;
	}

	public String getTransType() {
		return transType;
	}

	public void setTransType(String transType) {
		this.transType = transType;
	}

	public String getRinm() {
		return rinm;
	}

	public void setRinm(String rinm) {
		this.rinm = rinm;
	}

	public String getFirc() {
		return firc;
	}

	public void setFirc(String firc) {
		this.firc = firc;
	}

	public String getFice() {
		return fice;
	}

	public void setFice(String fice) {
		this.fice = fice;
	}

	public String getRfsg() {
		return rfsg;
	}

	public void setRfsg(String rfsg) {
		this.rfsg = rfsg;
	}

	public String getOrxn() {
		return orxn;
	}

	public void setOrxn(String orxn) {
		this.orxn = orxn;
	}

	public String getSstm() {
		return sstm;
	}

	public void setSstm(String sstm) {
		this.sstm = sstm;
	}

	public String getStcr() {
		return stcr;
	}

	public void setStcr(String stcr) {
		this.stcr = stcr;
	}

	public String getSsds() {
		return ssds;
	}

	public void setSsds(String ssds) {
		this.ssds = ssds;
	}

	public String getUdsi() {
		return udsi;
	}

	public void setUdsi(String udsi) {
		this.udsi = udsi;
	}

	public Integer getSctn() {
		return sctn;
	}

	public void setSctn(Integer sctn) {
		this.sctn = sctn;
	}

	public Integer getTtnm() {
		return ttnm;
	}

	public void setTtnm(Integer ttnm) {
		this.ttnm = ttnm;
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