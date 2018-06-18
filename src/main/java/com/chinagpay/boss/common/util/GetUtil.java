package com.chinagpay.boss.common.util;

import java.util.Map;

public class GetUtil {
	/**
	 * 根据key获取map中的值,如果值为空，返回key<br>
	 * 主要是用来解决【编码】->【描述】的转换的，map保存编码与描述的对应关系，如果查询不到则返回编码，从而使页面不会显示空值
	 * 
	 * @param map
	 * @param key
	 * @return
	 */
	public static Object get(Map<Object, Object> map, Object key) {
		Object obj = map.get(key);
		if (obj == null) {
			return key;
		}
		return obj;
	}
}
