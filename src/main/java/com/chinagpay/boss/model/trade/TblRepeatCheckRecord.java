package com.chinagpay.boss.model.trade;
/** 
	* @author  liws  
	* @date    2017年8月16日 下午5:23:21  
*/
public class TblRepeatCheckRecord {

	private String forexOrderId;
	
	private String checkResult;
	
	private String fileName;
	private String checkType;
	

	public String getCheckType() {
		return checkType;
	}

	public void setCheckType(String checkType) {
		this.checkType = checkType;
	}

	public String getForexOrderId() {
		return forexOrderId;
	}

	public void setForexOrderId(String forexOrderId) {
		this.forexOrderId = forexOrderId;
	}

	public String getCheckResult() {
		return checkResult;
	}

	public void setCheckResult(String checkResult) {
		this.checkResult = checkResult;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
}
