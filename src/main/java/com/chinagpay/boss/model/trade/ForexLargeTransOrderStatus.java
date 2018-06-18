package com.chinagpay.boss.model.trade;

import java.math.BigDecimal;
import java.sql.Timestamp;

////    大额交易主订单状态表  页面展示状态
public class ForexLargeTransOrderStatus {
	/** 大额交易主订单状态表 主键 **/
	private String id;
	//月份
	private String largeTransMonth;
	//类型  个人D  机构C
	private String personAgencyType;
	//状态
	private String largeTransOrderStatus;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLargeTransMonth() {
		return largeTransMonth;
	}
	public void setLargeTransMonth(String largeTransMonth) {
		this.largeTransMonth = largeTransMonth;
	}
	public String getPersonAgencyType() {
		return personAgencyType;
	}
	public void setPersonAgencyType(String personAgencyType) {
		this.personAgencyType = personAgencyType;
	}
	public String getLargeTransOrderStatus() {
		return largeTransOrderStatus;
	}
	public void setLargeTransOrderStatus(String largeTransOrderStatus) {
		this.largeTransOrderStatus = largeTransOrderStatus;
	}

	
	
}
