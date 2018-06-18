package com.chinagpay.boss.common.util;

import com.google.gson.Gson;

public class JsonUtilObj {
	private static Gson gson;
	private static Gson getGson(){
		if(gson == null){
			gson = new Gson();
		}
		return gson;
	}
	
	
	/**
	 * json 串转换为obj
	 * @param jsonString
	 * @param cla
	 * @return
	 */
	public static Object jsonToObject(String jsonString, Class cla){
		Gson gson = getGson();
		Object obj = gson.fromJson(jsonString, cla);
		return obj;
	}
	
	/**
	 * obj转换为json �?
	 * @param obj
	 * @return
	 */
	public static String objectToJson(Object obj){
		Gson gson = getGson();
		return gson.toJson(obj);
	}
	

	
	
}
