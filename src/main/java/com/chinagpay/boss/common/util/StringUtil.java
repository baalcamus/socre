package com.chinagpay.boss.common.util;

import org.apache.commons.lang.StringUtils;

public class StringUtil {
	private static final String[] codeArray = { "a", "b", "c", "d", "e", "f", "g", "h", "j", "k", "m", "n", "p", "r",
			"s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "J", "K", "M", "N", "P",
			"R", "S", "T", "U", "V", "W", "X", "Y", "Z", "2", "3", "4", "5", "6", "7", "8", "9" };

	/**
	 * 生成key3-mer_info表
	 * @param size
	 * @param includeTs
	 * @return
	 */
	public static String getSerialId(int size, boolean includeTs) {
		String perfix = includeTs ? Long.toString(System.currentTimeMillis(), 32) : "";
		StringBuffer code = new StringBuffer(perfix.toUpperCase());

		for (int i = size; i > 0; i--) {
			int pos = (int) (Math.random() * (codeArray.length - 1));
			code.append(codeArray[pos]);
		}
		return code.toString();
	}
	
	
	/**
	 * 银行卡号脱敏-前6******后4
	 * @param bankCard
	 * @return
	 */
	public static String bankCardSensitive(String bankCard){
		if(StringUtils.isNotEmpty(bankCard)){
			int length=bankCard.length();
			if(length>15){//年1987显示87,同时少最后一位校验码
				bankCard=bankCard.substring(0, 6)+"*****"+bankCard.substring(bankCard.length()-4);
			}
		}
		return bankCard;
	}
	
	/**
	 * 身份证号脱敏-年月日*显示
	 * 前6位为地址码，第7至14位为出生日期码，第15至17位为顺序码，第18位为校验码
	 * @param bankCard
	 * @return
	 */
	public static String idCardSensitive(String idCard){
		if(StringUtils.isNotEmpty(idCard)){
			int length=idCard.length();
			if(length==15){//年1987显示87,同时少最后一位校验码
				idCard=idCard.substring(0, 6)+"********"+idCard.substring(idCard.length()-3);
			}else if(length==18){
				idCard=idCard.substring(0, 6)+"*******"+idCard.substring(idCard.length()-4);
			}else{//错误身份证号码
				
			}
		}
		return idCard;
	}
	
}
