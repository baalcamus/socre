package com.chinagpay.boss.common.util;


import com.chinagpay.boss.common.exception.CommonsException;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
/**
 * 
 * 
 * @time 2016年7月27日 下午1:06:32
 * @author likun
 *
 */
public class PropertiesUtil {
	/**
	 * 
	 * @param classPath 相对于classpath的路径
	 * @return
	 */
	public static Properties getProperties(String classPath){
		InputStream stream = ResourceUtil.getResourceAsStream(classPath);
		Properties p = new Properties();
		try {
			p.load(stream);
			return p;
		} catch (IOException e) {
			throw new CommonsException(e);
		}		
	}
	
	
//	/**
//	 * 
//	 * @author 唐延波
//	 * @date 2015年8月19日
//	 * @param classPath 相对于classpath的路径
//	 * @return
//	 */
//	public static Properties getProperties(String classPath){
//		InputStream stream = ResourceUtil.getResourceAsStream(classPath);
//		Properties p = new Properties();
//		try {
//			p.load(stream);
//			return p;
//		} catch (IOException e) {
//			throw new CommonsException(e);
//		}		
//	}
	
	/**
	 * filePath
	 * @author 唐延波
	 * @date 2015年8月19日
	 * @param filePath
	 * @return
	 */
	public static Properties getPropertiesByFilePath(String filePath){		
		try {
			File file = new File(filePath);
			InputStream is = new FileInputStream(file);
			Properties p = new Properties();
			p.load(is);
			return p;
		} catch (IOException e) {
			throw new CommonsException(e);
		}		
	}
}
