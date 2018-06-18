package com.chinagpay.boss.model;

import java.util.Map;
/**
 * 用来传递页面通过map传递的参数
 * 
 * @time 2016年7月25日 上午9:54:29
 * @author likun
 *
 */
public class ParamVo{
	private Map<Object,Object> map;

	public Map<Object, Object> getMap() {
		return map;
	}

	public void setMap(Map<Object, Object> map) {
		this.map = map;
	}
	
}
