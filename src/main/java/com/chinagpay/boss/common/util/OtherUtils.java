package com.chinagpay.boss.common.util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

import com.chinagpay.boss.common.bean.CurrencyEnum;

/**
 * 各种小的杂项工具方法类
 * 
 * @time 2016年7月22日 下午5:53:19
 * @author likun
 *
 */
public class OtherUtils {
	/**
	 * 根据币种英文编码获取中文名
	 * @param code
	 * @return
	 */
	public static String getCurrency(String code) {
		try {
			return CurrencyEnum.valueOf(code).getUnit();
		} catch (Exception e) {
			return code;
		}
	}
	/**
	 * 获取所有币种
	 * @param code
	 * @return
	 */
	public static CurrencyEnum[] getCurrencys() {
		try {
			return CurrencyEnum.values();
		} catch (Exception e) {
			return null;
		}
	}
	/**
	 * 获取enum字段的值
	 * @param className	枚举类的名称【eg:com.chinagpay.enumName】,如果枚举是内部类则在类名和内部类enum之间加【$】符号【eg:com.chinagpay.enumConstants$enumName】
	 * @param enumName	如果是类内部枚举没有在className中加$enumName,则为空
	 * @param valueName	枚举valuesOf(valueNmae)的值
	 * @param fieldName	要获取的字段的值
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static String getEnumFieldValue(String className,String enumName,String valueName,String fieldName){
		try {
			if(enumName!=null&&enumName.length()>0){
				className=className+"$"+enumName;
			}
			Class clazz = Class.forName(className);
			Field field =clazz.getDeclaredField(fieldName);
			field.setAccessible(true);
			Enum enumObject = Enum.valueOf(clazz, valueName);
			return field.get(enumObject).toString();
		} catch (Exception e) {
		}
		return "<b style='color:red'>未定义<b>";
	}
	/**
	 * 获取enum字段的值
	 * @param className	枚举类的名称【eg:com.chinagpay.enumName】,如果枚举是内部类则在类名和内部类enum之间加【$】符号【eg:com.chinagpay.enumConstants$enumName】
	 * @param enumName	如果是类内部枚举没有在className中加$enumName,则为空
	 * @param valueName	枚举valuesOf(valueNmae)的值
	 * @param fieldName	要获取的字段的值
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static Enum[] getEnumValues(String className,String enumName){
		try {
			if(enumName!=null&&enumName.length()>0){
				className=className+"$"+enumName;
			}
			Class<?> clazz = Class.forName(className);
			return (Enum[]) clazz.getEnumConstants();
		} catch (Exception e) {
		}
		return null;
	}
	
	/** 
	 * @Description: 根据枚举中非name获取 枚举
	 * @param className 类名
	 * @param enumName 枚举名称
	 * @param valueName 需要找的值
	 * @param methodName 用到找的方法
	 * @param returnName  返回字段的名称
	 * @return 
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static String getEnumField(String className,String enumName,String valueName,String methodName,String returnMethod){
		try {
			if(enumName!=null&&enumName.length()>0){
				className=className+"$"+enumName;
			}
			Class clazz = Class.forName(className);
			Method getCode = clazz.getMethod(methodName); 
			Method method = clazz.getMethod(returnMethod); 
		    Object[] objs = clazz.getEnumConstants(); 
		    for (Object obj : objs) {
		      if(((String)getCode.invoke(obj)).equals(valueName)){
		    	  return (String)method.invoke(obj);
		      }
	        } 
		} catch (Exception e) {
			System.out.println(e);
		}
		return "error";
	}
	
	
	public static void main(String[] args) {
		//Enum[] b = getEnumValues("com.chinagpay.ries.enumtype.RiseEnum","ValidityEnum");
		String s = getEnumField("com.chinagpay.ries.enumtype.RiseEnum","ValidityEnum","01","getCode","getDes");
		System.out.println(s);
//		if(enumName!=null&&enumName.length()>0){
//			className=className+"$"+enumName;
//		}
//		Class clazz = Class.forName(className);
//		Field field =clazz.getDeclaredField(fieldName);
//		field.setAccessible(true);
//		System.out.println(s);
//		for (Enum enum1 : b) {
//			enum1.getDeclaringClass();
//		}
	}
	
}
