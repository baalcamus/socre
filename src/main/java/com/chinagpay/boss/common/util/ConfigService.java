package com.chinagpay.boss.common.util;

import org.springframework.stereotype.Service;

import java.util.Properties;

/**
 * 配置信息
 * @author 
 * @date 2015年8月21日
 */
//@Service
public class ConfigService {

	private Properties properties;
	
	public ConfigService() {
		properties = PropertiesUtil
				.getProperties("/config/forpay-web.properties");
	}
	
	public String getProperty(String key){
		return properties.getProperty(key);
	}
	
	public static void main(String[] args) {
		
	}
}
