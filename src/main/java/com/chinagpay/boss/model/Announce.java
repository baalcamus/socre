package com.chinagpay.boss.model;

import java.util.Date;

public class Announce {

	private String id;

	private String visibleRange;

	private String title;

	private String upLoadPath;

	private String content;

	private int expiryDate;

	private Date createTime;

	private Date updateTime;

	private String releasePerson;

	private String status;
	
	private String fileName;

	private Date closingTime;
	
	private String termStatus;
	
	
	public String getTermStatus() {
		return termStatus;
	}

	public void setTermStatus(String termStatus) {
		this.termStatus = termStatus;
	}

	public Date getClosingTime() {
		return closingTime;
	}

	public void setClosingTime(Date closingTime) {
		this.closingTime = closingTime;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getVisibleRange() {
		return visibleRange;
	}

	public void setVisibleRange(String visibleRange) {
		this.visibleRange = visibleRange;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}


	public String getUpLoadPath() {
		return upLoadPath;
	}

	public void setUpLoadPath(String upLoadPath) {
		this.upLoadPath = upLoadPath;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(int expiryDate) {
		this.expiryDate = expiryDate;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getReleasePerson() {
		return releasePerson;
	}

	public void setReleasePerson(String releasePerson) {
		this.releasePerson = releasePerson;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

}