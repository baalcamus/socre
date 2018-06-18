package com.chinagpay.boss.common.util;

import org.apache.commons.codec.binary.Base64;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *  
 * 发送短信，生产6位随机数
 * @author zhangzeduan
 *
 */
//发送短信
public class SendMessage {
	
	private String url ="";
	private String id ="";
	private String name ="";
	private String key ="";

	
	public SendMessage(String url, String id,String name,String key) {
		this.url = url;
		this.id = id;
		this.name = name;
		this.key = key;
	}
	//13818414409
//	private String url  ="http://supatm.com/sabp/service.ac";
//	private String id = "10009001";
//	private String name = "百付天下";
//	private String key = "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAIhl6fb9Yd8mpCWtUg4/UI0NsjUofkjCP8DohqpOEGUhs0Io9/eZLUAmljDeyjym4blAv33zlGakPi1W43kNXKcCAwEAAQ=="; 

	public static void main(String[] args) {
		SendMessage sendMessage = new SendMessage("http://supatm.com/sabp/service.ac","10009001","百付天下","MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAIhl6fb9Yd8mpCWtUg4/UI0NsjUofkjCP8DohqpOEGUhs0Io9/eZLUAmljDeyjym4blAv33zlGakPi1W43kNXKcCAwEAAQ==");
		sendMessage.sendMsg("18516111505", "甜瓜好吃吗", "111111112222222211111111");
//		System.out.println(sendMessage.randomNum());
	}
	
	  public String sendMsg(String mobile, String content, String mkey) {


		    StringBuilder xml = new StringBuilder();
		    xml.append("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>");
		    xml.append("<subatm application=\"BizGw.Rsp\" version=\"1.0.0\" sendTime=\"").append(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
		    xml.append("\" channalId=\"").append(id).append("\" channalName=\"")
		        .append(name);
		    xml.append("\" sendSeqId=\"\" transCode=\"1013\"> ");
		    xml.append("<mobileNum>").append(mobile).append("</mobileNum>");
		    xml.append("<vcode>").append(content).append("</vcode>");
		    xml.append("</subatm>");

		    String result = null;
		    try {
		      String strKey = RSACoder.encryptByPublicKey(new String(mkey.getBytes(), "utf-8"), key);
		      String strxml = new String(Base64.encodeBase64(DesedeUtil.encrypt(xml.toString().getBytes("utf-8"), mkey.getBytes())));
		      String returnXml = new String(Base64.encodeBase64(id.getBytes("utf-8"))) + "|" + strKey + "|" + strxml;
		      SendMess sm = new SendMess();
		      result = sm.transferData(returnXml, Charset.forName("utf-8"), url);
		    } catch (UnsupportedEncodingException e) {
		      e.printStackTrace();
		    } catch (Exception e) {
		      e.printStackTrace();
		    }
		    return result;
		  }
	
//生产6位随机数
	  public String randomNum(){
		  int n = 0 ;		
		  while(n < 100000){
		  n = (int)(Math.random()*1000000);
		}
		return n+"";
	  }
//比较时间大小，多长时间超时
	  public boolean compareTime(String createTime,int time){
		  boolean bl = false;
		  Calendar cal = Calendar.getInstance();
		  cal.add(Calendar.MINUTE, -2);
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		  String nowTime = sdf.format(cal.getTime());
		  Long createLong = Long.parseLong(createTime);
		  Long nowLong = Long.parseLong(nowTime);	
		  if(nowLong>createLong){
			  bl = true;
		  }else{
			  bl = false;
		  }
		  return bl;
	  }
	  
	  
	  
		public static String getDateFormatStr(String pattern)
		{
			SimpleDateFormat DATE_FORMAT = new SimpleDateFormat(
					pattern );
			Date date = new  Date();
		    return DATE_FORMAT.format(date);
		}

}
