package com.chinagpay.boss.model.trade.vo;
/** 
	* @author  liws  
	* @date    2017年8月16日 下午5:23:21  
*/
public class TblRepeatCheckRecordVo {

	private String forexOrderId;
	
	private String transportNo;
	
	private String merchantNo;
	
	private String merchantOrderNo;
	
	private String merchantOriginalOrderNo;

	public String getForexOrderId() {
		return forexOrderId;
	}

	public void setForexOrderId(String forexOrderId) {
		this.forexOrderId = forexOrderId;
	}

	public String getTransportNo() {
		return transportNo;
	}

	public void setTransportNo(String transportNo) {
		this.transportNo = transportNo;
	}

	public String getMerchantNo() {
		return merchantNo;
	}

	public void setMerchantNo(String merchantNo) {
		this.merchantNo = merchantNo;
	}

	public String getMerchantOrderNo() {
		return merchantOrderNo;
	}

	public void setMerchantOrderNo(String merchantOrderNo) {
		this.merchantOrderNo = merchantOrderNo;
	}

	public String getMerchantOriginalOrderNo() {
		return merchantOriginalOrderNo;
	}

	public void setMerchantOriginalOrderNo(String merchantOriginalOrderNo) {
		this.merchantOriginalOrderNo = merchantOriginalOrderNo;
	}
}
