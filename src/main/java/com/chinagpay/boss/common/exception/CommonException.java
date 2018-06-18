package com.chinagpay.boss.common.exception;

/**
 * 通用异常
 * @author liuxi
 */
public class CommonException extends RuntimeException{
	
	private static final long serialVersionUID = -2409606069171261066L;

	/**
	 * 异常消息
	 */
	private String message;
	
	/**
	 * 抛出该异常的代码点信息：类，方法，行数
	 */
	private String throwAt;
	
	public CommonException( String msg ){
		this.message = msg;
		this.throwAt = getThreadStackTrace();
	}
	
	/**
	 * 获取踪迹信息
	 */
	private String getThreadStackTrace() {
		StackTraceElement[] stes = Thread.currentThread().getStackTrace();
		StackTraceElement tgt = stes[3];
		return "class:" + tgt.getClassName() + ", method:" + tgt.getMethodName() + "(.), line:" + tgt.getLineNumber();
	}

	public String getMessage() {
		return message;
	}

	public String getThrowAt() {
		return throwAt;
	}
}
