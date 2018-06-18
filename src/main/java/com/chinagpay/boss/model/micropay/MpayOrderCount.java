package com.chinagpay.boss.model.micropay;

import java.math.BigDecimal;

/** 
	*@author  liws  
	*@date    2017年2月22日 下午1:28:42 
	*订单金额统计类
	*@version 1.0 
	*@parameter  
	*@since  
	*@return  
*/
public class MpayOrderCount {
	
	private int totalCount;//总笔数

	private BigDecimal totalOrderAmount;//订单金额统计
	
	private BigDecimal totalOrderFee;//订单手续费统计

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public BigDecimal getTotalOrderAmount() {
		return totalOrderAmount;
	}

	public void setTotalOrderAmount(BigDecimal totalOrderAmount) {
		this.totalOrderAmount = totalOrderAmount;
	}

	public BigDecimal getTotalOrderFee() {
		return totalOrderFee;
	}

	public void setTotalOrderFee(BigDecimal totalOrderFee) {
		this.totalOrderFee = totalOrderFee;
	}
	
}
