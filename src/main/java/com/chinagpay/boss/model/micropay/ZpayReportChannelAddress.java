package com.chinagpay.boss.model.micropay;

public class ZpayReportChannelAddress {

	private String channelNo;				//通道编码
	private String platformAddressCode;		//地区编码
	private String channelAddressCode;		//通道地区编码
	public String getChannelNo() {
		return channelNo;
	}
	public void setChannelNo(String channelNo) {
		this.channelNo = channelNo;
	}
	public String getPlatformAddressCode() {
		return platformAddressCode;
	}
	public void setPlatformAddressCode(String platformAddressCode) {
		this.platformAddressCode = platformAddressCode;
	}
	public String getChannelAddressCode() {
		return channelAddressCode;
	}
	public void setChannelAddressCode(String channelAddressCode) {
		this.channelAddressCode = channelAddressCode;
	}
	public ZpayReportChannelAddress(String channelNo, String platformAddressCode, String channelAddressCode) {
		super();
		this.channelNo = channelNo;
		this.platformAddressCode = platformAddressCode;
		this.channelAddressCode = channelAddressCode;
	}
	public ZpayReportChannelAddress() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "ZpayReportChannelAddress [channelNo=" + channelNo + ", platformAddressCode=" + platformAddressCode
				+ ", channelAddressCode=" + channelAddressCode + "]";
	}
	
	
	
}
