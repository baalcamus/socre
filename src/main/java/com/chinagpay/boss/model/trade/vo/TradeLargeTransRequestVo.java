package com.chinagpay.boss.model.trade.vo;


/** 
	* @author  liws  
	* @date    2017年8月16日 下午5:23:21  
*/
public class TradeLargeTransRequestVo {

	private String personAgencyType;
	private String monthStart;   // YYYY-MM-DD
	private String monthEnd;
	public String getPersonAgencyType() {
		return personAgencyType;
	}
	public void setPersonAgencyType(String personAgencyType) {
		this.personAgencyType = personAgencyType;
	}
	public String getMonthStart() {
		return monthStart;
	}
	public void setMonthStart(String monthStart) {
		this.monthStart = monthStart;
	}
	public String getMonthEnd() {
		return monthEnd;
	}
	public void setMonthEnd(String monthEnd) {
		this.monthEnd = monthEnd;
	}
	
	
	

	

}
