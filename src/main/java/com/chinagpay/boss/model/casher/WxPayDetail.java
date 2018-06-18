package com.chinagpay.boss.model.casher;

import java.util.Date;

public class WxPayDetail
{

    private Long id;          //主键微信下单订单号

    private String orderId;     //支付网关订单号

    private int    state;       //状态 0 未支付 1支付成功 

    private String orderAmt;      //金额

    private String actualAmt; //实际支付金额

    private Date createTime;  //创建时间
    
    private Date updateTime;  //更新时间
    
    private Date notifyTime;  //更新时间

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getOrderAmt() {
		return orderAmt;
	}

	public void setOrderAmt(String orderAmt) {
		this.orderAmt = orderAmt;
	}

	public String getActualAmt() {
		return actualAmt;
	}

	public void setActualAmt(String actualAmt) {
		this.actualAmt = actualAmt;
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

	public Date getNotifyTime() {
		return notifyTime;
	}

	public void setNotifyTime(Date notifyTime) {
		this.notifyTime = notifyTime;
	}

}
