package com.chinagpay.boss.common.util;

import com.alibaba.fastjson.JSON;

/**
 * json工具
 * @author liuxi
 */
public class JsonUtil {
	
	/**
	 * 对象转json
	 */
	public static String toJson( Object o ){
		return JSON.toJSONString( o );
	}
	
	/**
	 * json转对象
	 */
	public static <T> T toObject( String json, Class<T> clazz ){
		return JSON.parseObject( json, clazz );
	}
	
}
