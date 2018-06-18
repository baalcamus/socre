package com.chinagpay.boss.model.trade;

import java.sql.Timestamp;
/**
 * 收款人信息model
 * @author cgp11
 *
 */
public class CommonReceiver {
	/**id*/
	private String id;    
	/**商户编号*/
	private String merchantNo;    
	/**收款人主体类型*/
	private String receiverType;   
	/**收款人组织机构代码*/
	private String receiverAgencyCode; 
	/**收款人证件号*/
	private String receiverIdNo;    
	/**收款人联系方式*/
	private String receiverPhoneNo;   
	/**收款人名称*/
	private String receiverName;     
	/**收款人国别*/
	private String receiverCountry;    
	 /**收款人地址*/
	private String receiverAddr;       
	/**收款人账号*/
	private String receiverAccountNo;  
	 /**收款行地址*/
	private String receiverBankAddr;   
	/**收款行名称*/
	private String receiverBankName;   
	/**收款行swift代码*/
	private String revBankSwiftCode;   
	/**代理行地址*/
	private String agentBankAddr;     
	/**代理行名称*/
	private String agentBankName;      
	/**收款行swift代码*/
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
	public String getReceiverType() {
		return receiverType;
	}
	public void setReceiverType(String receiverType) {
		this.receiverType = receiverType;
	}
	public String getReceiverAgencyCode() {
		return receiverAgencyCode;
	}
	public void setReceiverAgencyCode(String receiverAgencyCode) {
		this.receiverAgencyCode = receiverAgencyCode;
	}
	public String getReceiverIdNo() {
		return receiverIdNo;
	}
	public void setReceiverIdNo(String receiverIdNo) {
		this.receiverIdNo = receiverIdNo;
	}
	public String getReceiverPhoneNo() {
		return receiverPhoneNo;
	}
	public void setReceiverPhoneNo(String receiverPhoneNo) {
		this.receiverPhoneNo = receiverPhoneNo;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getReceiverCountry() {
		return receiverCountry;
	}
	public void setReceiverCountry(String receiverCountry) {
		this.receiverCountry = receiverCountry;
	}
	public String getReceiverAddr() {
		return receiverAddr;
	}
	public void setReceiverAddr(String receiverAddr) {
		this.receiverAddr = receiverAddr;
	}
	public String getReceiverAccountNo() {
		return receiverAccountNo;
	}
	public void setReceiverAccountNo(String receiverAccountNo) {
		this.receiverAccountNo = receiverAccountNo;
	}
	public String getReceiverBankAddr() {
		return receiverBankAddr;
	}
	public void setReceiverBankAddr(String receiverBankAddr) {
		this.receiverBankAddr = receiverBankAddr;
	}
	public String getReceiverBankName() {
		return receiverBankName;
	}
	public void setReceiverBankName(String receiverBankName) {
		this.receiverBankName = receiverBankName;
	}
	public String getRevBankSwiftCode() {
		return revBankSwiftCode;
	}
	public void setRevBankSwiftCode(String revBankSwiftCode) {
		this.revBankSwiftCode = revBankSwiftCode;
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
	
	

}
