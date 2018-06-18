package com.chinagpay.boss.model.micropay;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class ZpayChannelRoute {
    private String id;
	private String routeNo;//路由编号
	private String routeName;//路由名称
    private String channelNo;//通道编号
    private String payMethodMode;//支付方式（按位处理,微信、支付宝、快捷）
    private String payProductMode;//支付产品（按位处理,微信刷卡支付，微信扫码支付。。。支付宝刷卡支付，支付宝扫码支付。。）
    private String bankCardMode;//支持银行卡（按位处理,借记卡,信用卡）
    private String status;//路由状态
    private String priority;//路由优先级，分5级
    private Timestamp validFromTime;//生效开始时间
    private Timestamp invalidEndTime;//失效时间
    
    //排除规则
	private BigDecimal singleMinAmount;//单笔最小金额
	private BigDecimal singleMaxAmount;//单笔最大金额
	private BigDecimal dayMaxAmount;//单日最大金额
	private BigDecimal totalMaxAmount;//通道业务支持最大金额
	private String limitMctNo;//限制使用的商编
	private String limitMctBizCode;//限制使用的商户业务码，如充值业务，彩票业务等
    
	//指定规则
	private String fixedSpMctNo;//只固定使用该渠道的服务商商编
	private String fixedMctNo;//只固定使用该渠道的商编
	private String fixedMctCompanyId;//只固定使用该渠道的企业ID
	private String fixedPayMethod;//只固定使用该渠道的支付方式
	private BigDecimal fixedMinAmount;//小于某金额固定该渠道
	private BigDecimal fixedMaxAmount;//大于某金额固定该渠道
		
    private String createStaff;
    private Timestamp createTime;
    private String updateStaff;
    private Timestamp updateTime;
    private String description;

	public String getFixedSpMctNo() {
		return fixedSpMctNo;
	}

	public void setFixedSpMctNo(String fixedSpMctNo) {
		this.fixedSpMctNo = fixedSpMctNo;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFixedMctCompanyId() {
		return fixedMctCompanyId;
	}
	public void setFixedMctCompanyId(String fixedMctCompanyId) {
		this.fixedMctCompanyId = fixedMctCompanyId;
	}
	public String getRouteNo() {
		return routeNo;
	}
	public void setRouteNo(String routeNo) {
		this.routeNo = routeNo;
	}
	public String getRouteName() {
		return routeName;
	}
	public void setRouteName(String routeName) {
		this.routeName = routeName;
	}
	public String getChannelNo() {
		return channelNo;
	}
	public void setChannelNo(String channelNo) {
		this.channelNo = channelNo;
	}
	public String getPayMethodMode() {
		return payMethodMode;
	}
	public void setPayMethodMode(String payMethodMode) {
		this.payMethodMode = payMethodMode;
	}
	public String getPayProductMode() {
		return payProductMode;
	}
	public void setPayProductMode(String payProductMode) {
		this.payProductMode = payProductMode;
	}
	public String getBankCardMode() {
		return bankCardMode;
	}
	public void setBankCardMode(String bankCardMode) {
		this.bankCardMode = bankCardMode;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public Timestamp getValidFromTime() {
		return validFromTime;
	}
	public void setValidFromTime(Timestamp validFromTime) {
		this.validFromTime = validFromTime;
	}
	public Timestamp getInvalidEndTime() {
		return invalidEndTime;
	}
	public void setInvalidEndTime(Timestamp invalidEndTime) {
		this.invalidEndTime = invalidEndTime;
	}
	public BigDecimal getSingleMinAmount() {
		return singleMinAmount;
	}
	public void setSingleMinAmount(BigDecimal singleMinAmount) {
		this.singleMinAmount = singleMinAmount;
	}
	public BigDecimal getSingleMaxAmount() {
		return singleMaxAmount;
	}
	public void setSingleMaxAmount(BigDecimal singleMaxAmount) {
		this.singleMaxAmount = singleMaxAmount;
	}
	public BigDecimal getDayMaxAmount() {
		return dayMaxAmount;
	}
	public void setDayMaxAmount(BigDecimal dayMaxAmount) {
		this.dayMaxAmount = dayMaxAmount;
	}
	public BigDecimal getTotalMaxAmount() {
		return totalMaxAmount;
	}
	public void setTotalMaxAmount(BigDecimal totalMaxAmount) {
		this.totalMaxAmount = totalMaxAmount;
	}
	public String getLimitMctNo() {
		return limitMctNo;
	}
	public void setLimitMctNo(String limitMctNo) {
		this.limitMctNo = limitMctNo;
	}
	public String getLimitMctBizCode() {
		return limitMctBizCode;
	}
	public void setLimitMctBizCode(String limitMctBizCode) {
		this.limitMctBizCode = limitMctBizCode;
	}
	public String getFixedMctNo() {
		return fixedMctNo;
	}
	public void setFixedMctNo(String fixedMctNo) {
		this.fixedMctNo = fixedMctNo;
	}
	public String getFixedPayMethod() {
		return fixedPayMethod;
	}
	public void setFixedPayMethod(String fixedPayMethod) {
		this.fixedPayMethod = fixedPayMethod;
	}
	public BigDecimal getFixedMinAmount() {
		return fixedMinAmount;
	}
	public void setFixedMinAmount(BigDecimal fixedMinAmount) {
		this.fixedMinAmount = fixedMinAmount;
	}
	public BigDecimal getFixedMaxAmount() {
		return fixedMaxAmount;
	}
	public void setFixedMaxAmount(BigDecimal fixedMaxAmount) {
		this.fixedMaxAmount = fixedMaxAmount;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
    
}
