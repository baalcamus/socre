package com.chinagpay.boss.model.casher;

import java.util.Date;

public class AcountForbidden
{
    //卡号
    private String cardNo;

    //封禁时间
    private Date   overTime;

    //账户密码输入错误次数
    private int    errorTime;

    //更新时间
    private Date   updateTime;

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public Date getOverTime() {
		return overTime;
	}

	public void setOverTime(Date overTime) {
		this.overTime = overTime;
	}

	public int getErrorTime() {
		return errorTime;
	}

	public void setErrorTime(int errorTime) {
		this.errorTime = errorTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

}
