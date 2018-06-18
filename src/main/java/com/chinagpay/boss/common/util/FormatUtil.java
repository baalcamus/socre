package com.chinagpay.boss.common.util;

import org.apache.commons.lang3.StringUtils;

import java.math.BigDecimal;
import java.text.*;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class FormatUtil
{
  private static Map digitMap = new HashMap();

  public static final BigDecimal percent = new BigDecimal("100");

  public static BigDecimal toYuan(String s) {
    return new BigDecimal(s.trim()).divide(percent, 2, 4);
  }

  public static String toFen(BigDecimal c) {
    return c.multiply(percent).setScale(0, 4).toString();
  }

  public static String formatFenToYuan(String amt)
  {
	 if (StringUtils.isBlank(amt)) {
		return "0.00";
	}
    return toYuan(amt).toString();
  }

  public static String formatYuanToFen(String amt)
  {
    return StringUtils.isEmpty(amt) ? "" : new BigDecimal(amt.trim()).multiply(percent).setScale(0, 4).toString();
  }

  public static String formatFenAmt(String str)
  {
    if (StringUtils.isEmpty(str)) {
      return "0.00";
    }
    return format(toYuan(str));
  }

  public static String formatHtmlText(String str)
  {
    if (str == null) {
      return "";
    }
    str = str.replaceAll("[&]", "&amp;");
    str = str.replaceAll("[>]", "&gt;");
    str = str.replaceAll("[<]", "&lt;");
    str = str.replaceAll("[\"]", "&quot;");
    return str;
  }

  private static synchronized String getNumbetFormatType(int digit) {
    String s = (String)digitMap.get(String.valueOf(digit));
    if (s == null) {
      StringBuffer buf = new StringBuffer("#");
      for (int i = 0; i < digit; i++) {
        buf.append("0");
      }
      s = buf.toString();
      digitMap.put(String.valueOf(digit), s);
    }
    return s;
  }

  public static String format(Date date, String pattern)
  {
    DateFormat format = new SimpleDateFormat(pattern);
    return format.format(date);
  }

  public static String format(Date date)
  {
    return format(date, "yyyy-MM-dd");
  }

  public static String formatDataTime(Date date)
  {
    return format(date, "yyyy-MM-dd HH:mm:ss");
  }

  public static String format(double value, String pattern)
  {
    NumberFormat format = new DecimalFormat(pattern);
    return format.format(value);
  }

  public static String format(BigDecimal value, String pattern)
  {
    DecimalFormat format = new DecimalFormat(pattern);
    return format.format(value);
  }

  public static String format(BigDecimal value)
  {
    return format(value, "#,##0.00");
  }

  public static String format(double value)
  {
    return format(value, "#,##0.00");
  }

  public static String format(long value, int digit)
  {
    return format(value, getNumbetFormatType(digit));
  }

  public static String format(BigDecimal value, int digit)
  {
    return format(value, getNumbetFormatType(digit));
  }

  public static String format(long value, String pattern)
  {
    NumberFormat format = new DecimalFormat(pattern);
    return format.format(value);
  }

  public static String format(long value)
  {
    return format(value, "#,###");
  }

  public static Date parse(String str, String pattern)
    throws ParseException
  {
    DateFormat format = new SimpleDateFormat(pattern);
    return format.parse(str);
  }

  public static Date parse(String str)
    throws ParseException
  {
    return parse(str, "yyyy-MM-dd HH:mm:ss");
  }

  public static double parseDouble(String str)
    throws NumberFormatException
  {
    return Double.parseDouble(str);
  }

  public static long parseLong(String str)
    throws NumberFormatException
  {
    return parseLong(str, 10);
  }

  public static long parseLong(String str, int radix)
    throws NumberFormatException
  {
    return Long.parseLong(str, radix);
  }

  public static int parseInt(String str)
    throws NumberFormatException
  {
    return parseInt(str, 10);
  }

  public static int parseInt(String str, int radix)
    throws NumberFormatException
  {
    return Integer.parseInt(str, radix);
  }

  public static BigDecimal parseBigDecimal(String str)
    throws NumberFormatException
  {
    return StringUtils.isEmpty(str) ? null : new BigDecimal(str);
  }
}