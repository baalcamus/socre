package com.chinagpay.boss.model.micropay;

public class ZpayReportChannel {

	private String id;//
	private String channelNo;// '--通道编码',
	private String channelName;// '--通道名称',
	private String reportChannelName;// t '--通道报备名称',
	private String reportPayMethod;// '--报备支付方式',
	private String containPayMethod;// 包含支付方式用于做报备数据插入判断(例如:中信的支付宝和微信是统一报备的,所以报备完后需要插入2条报备信息)',
	private String patternMark;// '--报备模式',
	private String reportChannelCode;// '--报备码',
	private String status;// '--状态,VALID-可用,INVALID-不可用,SUSPEND-暂停',
	private String appIdTemplet;// t '--公众号申请模板保存路径',
	private String appPayIdTemplet;// t '--app支付申请模板保存路径',
	private String createStaff;// '--创建人',
	private String createTime;// --创建时间',
	private String updateStaff;// '--更新人',
	private String updateTime;// --更新时间',
	private String description;// t '--描述',

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getChannelNo() {
		return channelNo;
	}

	public void setChannelNo(String channelNo) {
		this.channelNo = channelNo;
	}

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

	public String getReportPayMethod() {
		return reportPayMethod;
	}

	public void setReportPayMethod(String reportPayMethod) {
		this.reportPayMethod = reportPayMethod;
	}

	public String getContainPayMethod() {
		return containPayMethod;
	}

	public void setContainPayMethod(String containPayMethod) {
		this.containPayMethod = containPayMethod;
	}

	public String getPatternMark() {
		return patternMark;
	}

	public void setPatternMark(String patternMark) {
		this.patternMark = patternMark;
	}

	public String getReportChannelCode() {
		return reportChannelCode;
	}

	public void setReportChannelCode(String reportChannelCode) {
		this.reportChannelCode = reportChannelCode;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAppIdTemplet() {
		return appIdTemplet;
	}

	public void setAppIdTemplet(String appIdTemplet) {
		this.appIdTemplet = appIdTemplet;
	}

	public String getAppPayIdTemplet() {
		return appPayIdTemplet;
	}

	public void setAppPayIdTemplet(String appPayIdTemplet) {
		this.appPayIdTemplet = appPayIdTemplet;
	}

	public String getCreateStaff() {
		return createStaff;
	}

	public void setCreateStaff(String createStaff) {
		this.createStaff = createStaff;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdateStaff() {
		return updateStaff;
	}

	public void setUpdateStaff(String updateStaff) {
		this.updateStaff = updateStaff;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getReportChannelName() {
		return reportChannelName;
	}

	public void setReportChannelName(String reportChannelName) {
		this.reportChannelName = reportChannelName;
	}
}
