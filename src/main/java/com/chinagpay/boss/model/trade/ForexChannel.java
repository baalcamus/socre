package com.chinagpay.boss.model.trade;

import java.math.BigDecimal;
import java.sql.Timestamp;
/**
 * 渠道表
 * @author cgp11
 *
 */
public class ForexChannel {
	/**id*/
	private String id;    
	/**渠道编号*/
	private String channelNo;    
	/**渠道名称*/
	private String channelName;   
	/**所属银行id*/
	private String bankId; 
	/**渠道特征*/
	private String channelFeature;    
	/**币种类型*/
	private String currencyType;  
	/**收付汇类型*/
	private String channelBizRange;
	
	/**支持币种*/
	private String currencySuport;     
	/**支持业务状态字*/
	private String bizMode;    
	 /**数据模板*/
	private String dataTemplate;       
	/**单笔业务最小金额*/
	private BigDecimal singleMinAmount;  
	/**单笔业务限额*/
	private BigDecimal singleMaxAmount;  
	/**单笔业务最大明细笔数*/
	private Integer singleMaxDtlCount;  
	/**单日业务累计限额*/
	private BigDecimal dayMaxAmount;  
	/**单日业务最大累计笔数*/
	private Integer dayMaxCount;  
	/**渠道业务累计限额*/
	private BigDecimal totalMaxAmount;  
	/**渠道状态*/
	private String status;
	
	/**创建人*/
	private String createStaff;
	
	/**修改人*/
	private String updateStaff;
	
	/**创建时间*/
	private Timestamp createTime;
	
	/**修改时间*/
	private Timestamp updateTime;
	
	
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
	public String getBankId() {
		return bankId;
	}
	public void setBankId(String bankId) {
		this.bankId = bankId;
	}
	public String getChannelFeature() {
		return channelFeature;
	}
	public void setChannelFeature(String channelFeature) {
		this.channelFeature = channelFeature;
	}
	public String getCurrencyType() {
		return currencyType;
	}
	public void setCurrencyType(String currencyType) {
		this.currencyType = currencyType;
	}
	public String getCurrencySuport() {
		return currencySuport;
	}
	public void setCurrencySuport(String currencySuport) {
		this.currencySuport = currencySuport;
	}
	public String getBizMode() {
		return bizMode;
	}
	public void setBizMode(String bizMode) {
		this.bizMode = bizMode;
	}
	public String getDataTemplate() {
		return dataTemplate;
	}
	public void setDataTemplate(String dataTemplate) {
		this.dataTemplate = dataTemplate;
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
	public Integer getSingleMaxDtlCount() {
		return singleMaxDtlCount;
	}
	public void setSingleMaxDtlCount(Integer singleMaxDtlCount) {
		this.singleMaxDtlCount = singleMaxDtlCount;
	}
	public BigDecimal getDayMaxAmount() {
		return dayMaxAmount;
	}
	public void setDayMaxAmount(BigDecimal dayMaxAmount) {
		this.dayMaxAmount = dayMaxAmount;
	}
	public Integer getDayMaxCount() {
		return dayMaxCount;
	}
	public void setDayMaxCount(Integer dayMaxCount) {
		this.dayMaxCount = dayMaxCount;
	}
	public BigDecimal getTotalMaxAmount() {
		return totalMaxAmount;
	}
	public void setTotalMaxAmount(BigDecimal totalMaxAmount) {
		this.totalMaxAmount = totalMaxAmount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getChannelBizRange() {
		return channelBizRange;
	}
	public void setChannelBizRange(String channelBizRange) {
		this.channelBizRange = channelBizRange;
	}
	public String getCreateStaff() {
		return createStaff;
	}
	public void setCreateStaff(String createStaff) {
		this.createStaff = createStaff;
	}
	public String getUpdateStaff() {
		return updateStaff;
	}
	public void setUpdateStaff(String updateStaff) {
		this.updateStaff = updateStaff;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public Timestamp getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	} 
	
	
	
	
}








