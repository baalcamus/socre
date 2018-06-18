package com.chinagpay.boss.model.trade.risk;

import java.math.BigDecimal;

/**
 * 风控规则配置model
 * 
 * @time 2016年10月18日 下午3:08:27
 * @author likun
 *
 */
public class RiskRuleConfig {
	private String id;
	private String product;//产品
	private BigDecimal singleMaxAmount;//单笔限额
	private BigDecimal unitPrice;//单价限额
	private Integer personFrequency;//个人买家月频率
	private String transportNoRate;//运单号抽取比率
	private Double transportPassRate;//运单号抽取通过比率
	private String idNoRate;//实名认证抽取比率
	private Double idNoPassRate;//实名认证抽取通过比率
	private String businessRange;
	private String merchantNo;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public BigDecimal getSingleMaxAmount() {
		return singleMaxAmount;
	}
	public void setSingleMaxAmount(BigDecimal singleMaxAmount) {
		this.singleMaxAmount = singleMaxAmount;
	}
	public BigDecimal getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(BigDecimal unitPrice) {
		this.unitPrice = unitPrice;
	}
	public Integer getPersonFrequency() {
		return personFrequency;
	}
	public void setPersonFrequency(Integer personFrequency) {
		this.personFrequency = personFrequency;
	}
	public Double getTransportPassRate() {
		return transportPassRate;
	}
	public void setTransportPassRate(Double transportPassRate) {
		this.transportPassRate = transportPassRate;
	}
	public Double getIdNoPassRate() {
		return idNoPassRate;
	}
	public void setIdNoPassRate(Double idNoPassRate) {
		this.idNoPassRate = idNoPassRate;
	}
	public String getMerchantNo() {
		return merchantNo;
	}
	public void setMerchantNo(String merchantNo) {
		this.merchantNo = merchantNo;
	}
	public String getBusinessRange() {
		return businessRange;
	}
	public void setBusinessRange(String businessRange) {
		this.businessRange = businessRange;
	}
	public String getTransportNoRate() {
		return transportNoRate;
	}
	public void setTransportNoRate(String transportNoRate) {
		this.transportNoRate = transportNoRate;
	}
	public String getIdNoRate() {
		return idNoRate;
	}
	public void setIdNoRate(String idNoRate) {
		this.idNoRate = idNoRate;
	}
	
}
