package com.chinagpay.boss.model.trade;

import java.sql.Timestamp;
/**
 * 付款人信息model
 * @author cgp11
 *
 */
public class CommonPayer {
	/**ID*/
	 private String id;      
	 /**商户编号*/
	 private String merchantNo;  
	 /**商户收汇款类型*/
	 private String payerCountryArea;  
	 /**付款人主体类型----D  C*/
	 private String payerType;  
	 /**付款人组织机构代码*/
	 private String payerAgencyCode; 
	 /**付款人证件号*/
	 private String payerIdNo;   
	 /**付款人联系方式*/
	 private String payerPhoneNo;  
	 /**付款人名称*/
	 private String payerName; 
	 /**付款人国别*/
	 private String payerCountry;  
	 /**付款人地址*/
	 private String payerAddr; 
	 /**付款人账号*/
	 private String payerAccountNo; 
	 /**付款行地址*/
	 private String payerBankAddr; 
	 /**付款行名称*/
	 private String payerBankName;   
	 /**付款行swift代码*/
	 private String payBankSwiftCode;
	 /**代理行地址*/
	 private String agentBankAddr;   
	 /**代理行名称*/
	 private String agentBankName;   
	 /**代理行swift代码*/
	 private String agentBankSwiftCode;
	 /**创建时间*/
	 private Timestamp createTime;   
	 /**状态*/
	 private String status;      
	 /**使用次数*/
	 private Integer usageCount;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMerchantNo() {
		return merchantNo;
	}
	public void setMerchantNo(String merchantNo) {
		this.merchantNo = merchantNo;
	}
	public String getPayerType() {
		return payerType;
	}
	public void setPayerType(String payerType) {
		this.payerType = payerType;
	}
	public String getPayerAgencyCode() {
		return payerAgencyCode;
	}
	public void setPayerAgencyCode(String payerAgencyCode) {
		this.payerAgencyCode = payerAgencyCode;
	}
	public String getPayerIdNo() {
		return payerIdNo;
	}
	public void setPayerIdNo(String payerIdNo) {
		this.payerIdNo = payerIdNo;
	}
	public String getPayerPhoneNo() {
		return payerPhoneNo;
	}
	public void setPayerPhoneNo(String payerPhoneNo) {
		this.payerPhoneNo = payerPhoneNo;
	}
	public String getPayerName() {
		return payerName;
	}
	public void setPayerName(String payerName) {
		this.payerName = payerName;
	}
	public String getPayerCountry() {
		return payerCountry;
	}
	public void setPayerCountry(String payerCountry) {
		this.payerCountry = payerCountry;
	}
	public String getPayerAddr() {
		return payerAddr;
	}
	public void setPayerAddr(String payerAddr) {
		this.payerAddr = payerAddr;
	}
	public String getPayerAccountNo() {
		return payerAccountNo;
	}
	public void setPayerAccountNo(String payerAccountNo) {
		this.payerAccountNo = payerAccountNo;
	}
	public String getPayerBankAddr() {
		return payerBankAddr;
	}
	public void setPayerBankAddr(String payerBankAddr) {
		this.payerBankAddr = payerBankAddr;
	}
	public String getPayerBankName() {
		return payerBankName;
	}
	public void setPayerBankName(String payerBankName) {
		this.payerBankName = payerBankName;
	}
	public String getPayBankSwiftCode() {
		return payBankSwiftCode;
	}
	public void setPayBankSwiftCode(String payBankSwiftCode) {
		this.payBankSwiftCode = payBankSwiftCode;
	}
	public String getAgentBankAddr() {
		return agentBankAddr;
	}
	public void setAgentBankAddr(String agentBankAddr) {
		this.agentBankAddr = agentBankAddr;
	}
	public String getAgentBankName() {
		return agentBankName;
	}
	public void setAgentBankName(String agentBankName) {
		this.agentBankName = agentBankName;
	}
	public String getAgentBankSwiftCode() {
		return agentBankSwiftCode;
	}
	public void setAgentBankSwiftCode(String agentBankSwiftCode) {
		this.agentBankSwiftCode = agentBankSwiftCode;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Integer getUsageCount() {
		return usageCount;
	}
	public void setUsageCount(Integer usageCount) {
		this.usageCount = usageCount;
	}
	public String getPayerCountryArea() {
		return payerCountryArea;
	}
	public void setPayerCountryArea(String payerCountryArea) {
		this.payerCountryArea = payerCountryArea;
	}

	 

}
