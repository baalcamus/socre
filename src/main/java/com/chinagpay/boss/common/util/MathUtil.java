package com.chinagpay.boss.common.util;

import java.math.BigDecimal;

/**
 * MathUtil
 * 
 * @author 唐延波
 * @date 2015年8月19日
 */
public class MathUtil {

	/**
	 * 元转分
	 * 
	 * @author 唐延波
	 * @date 2015年8月19日
	 * @param yuan
	 * @return
	 */
	public static String yuanToFen(BigDecimal yuan) {
		BigDecimal mul = new BigDecimal("100");
		long fen = yuan.multiply(mul).longValue();
		return String.valueOf(fen);
	}

	/**
	 * 分转元
	 * 
	 * @author 唐延波
	 * @date 2015年8月19日
	 * @param yuan
	 * @return
	 */
	public static String fenToYuan(BigDecimal fen) {
		return fenToYuan(fen, 2);
	}

	/**
	 * 分转元
	 * 
	 * @author 唐延波
	 * @date 2015年8月19日
	 * @param yuan
	 * @return
	 */
	public static String fenToYuan(BigDecimal fen, Integer scale) {
		BigDecimal mul = new BigDecimal("100");
		BigDecimal yuan = fen.divide(mul, scale, BigDecimal.ROUND_DOWN);
		return String.valueOf(yuan);
	}

	public static String setScale(BigDecimal src, Integer scale) {
		return src.setScale(scale).toString();
	}

	public static String setScale(String src, Integer scale) {
		return new BigDecimal(src).setScale(scale).toString();
	}

	public static String multiply(Integer scale, Number... val) {
		BigDecimal result = null;
		for (Number m : val) {
			if (result == null) {
				result = BigDecimal.valueOf(m.doubleValue());
			} else {
				result = result.multiply(BigDecimal.valueOf(m.doubleValue()));
			}
		}
		return result.setScale(scale,BigDecimal.ROUND_HALF_DOWN).toString();
	}
	//比较两个数大小
	public static int compare(String n1, String n2) {
		return new BigDecimal(n1).compareTo(new BigDecimal(n2));
	}
	public static void main(String[] args) {
		BigDecimal a = new BigDecimal("12345678900");
		String yuanToFen = fenToYuan(a);
		System.out.println(yuanToFen);
	}
}
