package com.chinagpay.boss.model.trade.vo;

import java.math.BigDecimal;

/** 
	* @author  liws  
	* @date    2017年8月16日 下午5:23:21  
*/
public class TradeLargeTransQueryResultsVo {

	//购付汇的  对应买家id（买家机构号）  总金额
	private BigDecimal remitAm;
	//买家id（买家机构号
	private String buyerId;
	
	//收结汇  对应卖家id（卖家机构号）  总金额
	private BigDecimal gatherAm;
	//卖家id（卖家机构号）
	private String sellerId;
	
	//购汇收汇对应的交易总额
	private BigDecimal sumAmount;
	
	
	
	public BigDecimal getSumAmount() {
		return sumAmount;
	}
	public void setSumAmount(BigDecimal sumAmount) {
		this.sumAmount = sumAmount;
	}
	public BigDecimal getRemitAm() {
		return remitAm;
	}
	public void setRemitAm(BigDecimal remitAm) {
		this.remitAm = remitAm;
	}
	public String getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}
	public BigDecimal getGatherAm() {
		return gatherAm;
	}
	public void setGatherAm(BigDecimal gatherAm) {
		this.gatherAm = gatherAm;
	}
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	

}
