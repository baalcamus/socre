package com.chinagpay.boss.model;

import java.util.Date;

public class ConsoleRule {
	
private String id;
	
	private Date createTime;
	
	private Date updateTime;
	
	private String code;
	
	private String mark;
	
	private String ruleLevel;
	
	private String ruleLevelParent;
	
	private String type;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public String getRuleLevel() {
		return ruleLevel;
	}

	public void setRuleLevel(String ruleLevel) {
		this.ruleLevel = ruleLevel;
	}

	public String getRuleLevelParent() {
		return ruleLevelParent;
	}

	public void setRuleLevelParent(String ruleLevelParent) {
		this.ruleLevelParent = ruleLevelParent;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}