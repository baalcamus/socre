/**   
 * Copyright © 2016 爱农支付. All rights reserved.
 * 
 * @Title: SelfException.java 
 * @Prject: self-service
 * @Package: com.chinagpay.service.common.exception 
 * @Description: TODO
 * @author: lw
 * @date: 2016年9月8日 下午2:59:42 
 * @version: V1.0   
 */
package com.chinagpay.boss.common.exception;

/** 
 * @ClassName: SelfException 
 * @Description: TODO
 * @author: lw
 * @date: 2016年9月8日 下午2:59:42  
 */
public class BossException extends Exception {

	/**
	 * @Description: 
	 */
	private static final long serialVersionUID = -7425069798446547031L;
	/** 
	 * @Description:TODO  
	 */
	public BossException() {
		super();
	}
	
	public BossException(String message, Throwable cause) {
		super(message, cause);
	}
	
	public BossException(Throwable cause) {
		super(cause);
	}

	public BossException(String message) {
		super(message);
	}
	
}
