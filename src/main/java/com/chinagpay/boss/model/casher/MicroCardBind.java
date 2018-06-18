package com.chinagpay.boss.model.casher;

public class MicroCardBind {
	private Long id;
	private String microMerNo;
	private String cardMerNo;//智慧卡商户号
	private String cardMerTerNo;//商户终端号
	private String wxOpenId;//微信号
	public String getMicroMerNo() {
		return microMerNo;
	}

	public void setMicroMerNo(String microMerNo) {
		this.microMerNo = microMerNo;
	}

	public String getCardMerNo() {
		return cardMerNo;
	}

	public void setCardMerNo(String cardMerNo) {
		this.cardMerNo = cardMerNo;
	}

	public String getCardMerTerNo() {
		return cardMerTerNo;
	}

	public void setCardMerTerNo(String cardMerTerNo) {
		this.cardMerTerNo = cardMerTerNo;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getWxOpenId() {
		return wxOpenId;
	}

	public void setWxOpenId(String wxOpenId) {
		this.wxOpenId = wxOpenId;
	}

}
