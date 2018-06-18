package com.chinagpay.boss.model;

public final class Currency2UsdRate {
	private String id;
	private String currencyCode;
	private String currencyName;
	private String effectMonth;
	private Integer unit;
	private Double exchangeRate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCurrencyCode() {
		return currencyCode;
	}
	public void setCurrencyCode(String currencyCode) {
		this.currencyCode = currencyCode;
	}
	public String getCurrencyName() {
		return currencyName;
	}
	public void setCurrencyName(String currencyName) {
		this.currencyName = currencyName;
	}
	public Integer getUnit() {
		return unit;
	}
	public void setUnit(Integer unit) {
		this.unit = unit;
	}

	public Double getExchangeRate() {
		return exchangeRate;
	}
	public void setExchangeRate(Double exchangeRate) {
		this.exchangeRate = exchangeRate;
	}
	public String getEffectMonth() {
		return effectMonth;
	}
	public void setEffectMonth(String effectMonth) {
		this.effectMonth = effectMonth;
	}
}
