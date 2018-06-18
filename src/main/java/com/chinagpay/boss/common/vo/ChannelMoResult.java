package com.chinagpay.boss.common.vo;

public class ChannelMoResult {
	private Object cmList;
	private String channelID;
	private Object bizList;
	private String bizName;
	
	
	
	public String getBizName() {
		return bizName;
	}
	public void setBizName(String bizName) {
		this.bizName = bizName;
	}
	public Object getBizList() {
		return bizList;
	}
	public void setBizList(Object bizList) {
		this.bizList = bizList;
	}
	public Object getCmList() {
		return cmList;
	}
	public void setCmList(Object cmList) {
		this.cmList = cmList;
	}
	public String getChannelID() {
		return channelID;
	}
	public void setChannelID(String channelID) {
		this.channelID = channelID;
	}
	
}
