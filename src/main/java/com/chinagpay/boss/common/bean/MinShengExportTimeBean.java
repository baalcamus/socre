package com.chinagpay.boss.common.bean;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class MinShengExportTimeBean {//
	
	public String getTime(Timestamp time,String formatType){
		SimpleDateFormat df = new SimpleDateFormat(formatType);//"yyyy-MM-dd"
		String str = df.format(time);
		return str;	
	}
	
	/**商户订单请求时间**/ //将ForexBizOrder中的该字段转化了格式
	private String merchantRequestTime1;     //yyyyMMddHHmmss
	private String merchantRequestTime2;     //yyyyMMdd
	private String merchantRequestTime3;   	//HHmmss
	

	/**收款金额**/
	private BigDecimal sumGatherAmount;
	/**汇款金额**/
	private BigDecimal sumRemitAmount;
	/**明细笔数**/
	private Integer detailCount;
	/**收款币种**/
	private String gatherCurrency;
	/**汇款币种**/
	private String remitCurrency;
	

	
	public String getMerchantRequestTime1() {
		return merchantRequestTime1;
	}
	public void setMerchantRequestTime1(String merchantRequestTime1) {
		this.merchantRequestTime1 = merchantRequestTime1;
	}
	public String getMerchantRequestTime2() {
		return merchantRequestTime2;
	}
	public void setMerchantRequestTime2(String merchantRequestTime2) {
		this.merchantRequestTime2 = merchantRequestTime2;
	}
	public String getMerchantRequestTime3() {
		return merchantRequestTime3;
	}
	public void setMerchantRequestTime3(String merchantRequestTime3) {
		this.merchantRequestTime3 = merchantRequestTime3;
	}

	public BigDecimal getSumGatherAmount() {
		return sumGatherAmount;
	}
	public void setSumGatherAmount(BigDecimal sumGatherAmount) {
		this.sumGatherAmount = sumGatherAmount;
	}
	public BigDecimal getSumRemitAmount() {
		return sumRemitAmount;
	}
	public void setSumRemitAmount(BigDecimal sumRemitAmount) {
		this.sumRemitAmount = sumRemitAmount;
	}	
	
	public Integer getDetailCount() {
		return detailCount;
	}
	public void setDetailCount(Integer detailCount) {
		this.detailCount = detailCount;
	}
	public String getGatherCurrency() {
		return gatherCurrency;
	}
	public void setGatherCurrency(String gatherCurrency) {
		this.gatherCurrency = gatherCurrency;
	}
	public String getRemitCurrency() {
		return remitCurrency;
	}
	public void setRemitCurrency(String remitCurrency) {
		this.remitCurrency = remitCurrency;
	}

}
