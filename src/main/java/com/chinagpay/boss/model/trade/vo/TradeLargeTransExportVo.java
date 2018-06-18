package com.chinagpay.boss.model.trade.vo;

import java.math.BigDecimal;

/** 
	* @author  liws  
	* @date    2017年8月16日 下午5:23:21  
*/
public class TradeLargeTransExportVo {
	
	private String id;
	private String name;
	private String idNumber;//证件号
	/** 订单金额 **/
	private BigDecimal orderAmountUsd;
	/** 明细对应的交易对手国 **/
	private String counterpartyCountry;
	
	private String exchange_type;
	
	//交易项目
	private String businessRange;
	/** 产品名称 **/  //对应备注
	private String productName;
	
	public String getExchange_type() {
		return exchange_type;
	}
	public void setExchange_type(String exchange_type) {
		this.exchange_type = exchange_type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public BigDecimal getOrderAmountUsd() {
		return orderAmountUsd;
	}
	public void setOrderAmountUsd(BigDecimal orderAmountUsd) {
		this.orderAmountUsd = orderAmountUsd;
	}
	public String getCounterpartyCountry() {
		return counterpartyCountry;
	}
	public void setCounterpartyCountry(String counterpartyCountry) {
		this.counterpartyCountry = counterpartyCountry;
	}
	public String getBusinessRange() {
		return businessRange;
	}
	public void setBusinessRange(String businessRange) {
		this.businessRange = businessRange;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	

	

}
