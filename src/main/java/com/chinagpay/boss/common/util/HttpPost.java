/**   
 * Copyright © 2016 爱农支付. All rights reserved.
 * 
 * @Title: HttpPost.java 
 * @Prject: op-boss
 * @Package: com.chinagpay.boss.common.util 
 * @Description: TODO
 * @author: lw
 * @date: 2016年8月25日 下午6:34:05 
 * @version: V1.0   
 */
package com.chinagpay.boss.common.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Component;


/** 
 * @ClassName: HttpPost 
 * @Description: TODO
 * @author: lw
 * @date: 2016年8月25日 下午6:34:05  
 */
@Component
public class HttpPost {
	
	public static String Post(String jsonString, String urlAddress) throws Exception { 
        //创建连接 
        URL url = new URL(urlAddress); 
        HttpURLConnection connection = (HttpURLConnection) url.openConnection(); 
        connection.setDoOutput(true); 
        connection.setDoInput(true); 
        connection.setRequestMethod("POST"); 
        connection.setUseCaches(false); 
        connection.setInstanceFollowRedirects(true); 
        connection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");             
        connection.setRequestProperty("Accept-Charset", "utf-8");
        connection.setRequestProperty("contentType", "utf-8");
        connection.connect(); 
        //POST请求 
        DataOutputStream out = new DataOutputStream(connection.getOutputStream()); 
        out.write(jsonString.getBytes("utf-8"));
        out.flush(); 
        out.close(); 
        //读取响应 
        BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream())); 
        String lines; 
        StringBuffer sb = new StringBuffer(""); 
        while ((lines = reader.readLine()) != null) { 
            lines = new String(lines.getBytes(), "utf-8"); 
            sb.append(lines); 
        }
         reader.close(); 
        // 断开连接 
        connection.disconnect(); 
        System.out.println(sb); 
        return sb.toString();

	}
	
	public static String PostJson(String jsonString, String urlAddress) throws Exception { 
	    //创建连接 
	    URL url = new URL(urlAddress); 
	    HttpURLConnection connection = (HttpURLConnection) url.openConnection(); 
	    connection.setDoOutput(true); 
	    connection.setDoInput(true); 
	    connection.setRequestMethod("POST"); 
	    connection.setUseCaches(false); 
	    connection.setInstanceFollowRedirects(true); 
	    connection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");             
	    connection.setRequestProperty("Accept-Charset", "utf-8");
	    connection.setRequestProperty("contentType", "utf-8");
	    connection.setConnectTimeout(20000);
	    connection.setReadTimeout(200000);
	    connection.connect(); 
	    //POST请求 
	    DataOutputStream out = new DataOutputStream(connection.getOutputStream()); 
	    out.write(jsonString.getBytes("utf-8"));
	    out.flush(); 
	    out.close(); 
	    //读取响应 
	    BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8")); 
	    String lines; 
	    StringBuffer sb = new StringBuffer(""); 
	    while ((lines = reader.readLine()) != null) { 
	        lines = new String(lines.getBytes()); 
	        sb.append(lines); 
	    }
	     reader.close(); 
	    // 断开连接 
	    connection.disconnect(); 
	    System.out.println(sb); 
	    return sb.toString();
	} 
	public static final String ADD_CustomerList_URL = "http://localhost:8081/risk-control/CustomerListController/AddListPost"; 

	public static void main(String[] args) throws Exception {
		/*    	 CustomerListRequest customerListRequest = new CustomerListRequest();
		         customerListRequest.setType("0");
		         customerListRequest.setOrgInsCode("123");
		         String jsonString = JsonUtil.objectToJson(customerListRequest);
		         String urlAdderss = ADD_CustomerList_URL;*/
		/*    	CustomerListRequest customerListRequest = new CustomerListRequest();
		        customerListRequest.setType("0");
		        customerListRequest.setOrgInsCode("456");
		        customerListRequest.setCustomerName("1123");
		        customerListRequest.setId(Long.valueOf(8));
		        String urlAdderss = UPDATE_CustomerList_URL;*/
		        

		        String urlAdderss = ADD_CustomerList_URL;

		        Post("123123我的", urlAdderss);

			}
}
