package com.chinagpay.boss.common.vo;


/**
 * json返回的结果
 * @author liuxi
 */
public final class JsonResult {
	/**
	 * 返回码，0:成功
	 */
	public static final Integer CODE_SUCCESS = 0;

	/**
	 * 返回码，1:失败
	 */
	public static final Integer CODE_FAIL = 1;

	/**
	 * 返回码
	 */
	private Integer code;
	
	/**
	 * 消息
	 */
	private String msg;
	
	/**
	 * 数据对象
	 */
	private Object data;

	private JsonResult(){
		
	}
	
	/**
	 * 成功的调用
	 */
	public static JsonResult success( Object data ){
		JsonResult ar = new JsonResult();
		ar.code = CODE_SUCCESS;
		ar.data = data;
		return ar;
	}
	
	/**
	 * 成功的调用
	 */
	public static JsonResult success( String msg, Object data ){
		JsonResult ar = new JsonResult();
		ar.code = CODE_SUCCESS;
		ar.setMsg( msg );
		ar.data = data;
		return ar;
	}
	
	/**
	 * 失败的调用
	 */
	public static JsonResult failure( String msg ){
		JsonResult ar = new JsonResult();
		ar.code = CODE_FAIL;
		ar.msg = msg;
		return ar;
	}

	/**
	 * 失败的调用
	 */
	public static JsonResult failure( Integer code, String msg ){
		JsonResult ar = new JsonResult();
		ar.code = code;
		ar.msg = msg;
		return ar;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
}
