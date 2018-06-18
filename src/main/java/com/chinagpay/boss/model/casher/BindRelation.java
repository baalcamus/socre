package com.chinagpay.boss.model.casher;

import java.util.Date;

public class BindRelation
{
    private Long   id;
    //卡号
    private String cardNo;

    //微信open_id
    private String   openId;

    //加密后的登陆密码
    private String encryptPassword;

    //卡号后四位
    private String shortCardNo;

    //支付密码
    private String payPassword;

    //手机号
    private String mobile;

    //状态，0 未绑定 1 已绑定 2 解除绑定
    private int    state;

    //创建时间
    private Date   createTime;

    //修改时间
    private Date   updateTime;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public String getEncryptPassword() {
		return encryptPassword;
	}

	public void setEncryptPassword(String encryptPassword) {
		this.encryptPassword = encryptPassword;
	}

	public String getShortCardNo() {
		return shortCardNo;
	}

	public void setShortCardNo(String shortCardNo) {
		this.shortCardNo = shortCardNo;
	}

	public String getPayPassword() {
		return payPassword;
	}

	public void setPayPassword(String payPassword) {
		this.payPassword = payPassword;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

}
