package com.chinagpay.boss.model.zpay;

public class ZpayAddress {

	private String addressName;
	private String addressCode;
	private String level;
	private String pAddressCode;
	public String getAddressName() {
		return addressName;
	}
	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}
	public String getAddressCode() {
		return addressCode;
	}
	public void setAddressCode(String addressCode) {
		this.addressCode = addressCode;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getpAddressCode() {
		return pAddressCode;
	}
	public void setpAddressCode(String pAddressCode) {
		this.pAddressCode = pAddressCode;
	}
	@Override
	public String toString() {
		return "ZpayAddress [addressName=" + addressName + ", addressCode=" + addressCode + ", level=" + level
				+ ", pAddressCode=" + pAddressCode + "]";
	}
	public ZpayAddress(String addressName, String addressCode, String level, String pAddressCode) {
		super();
		this.addressName = addressName;
		this.addressCode = addressCode;
		this.level = level;
		this.pAddressCode = pAddressCode;
	}
	public ZpayAddress() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
