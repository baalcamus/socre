package com.chinagpay.boss.common.util;


import org.apache.commons.io.IOUtils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;

/**
 * 通过HttpURLConnection连接服务器,发送报文,获取服务器报文返回
 * 
 * @author xiaoding
 *
 */

public class SendMess {

  /**
   * 
   * @param content
   *          request content
   * @param charset
   * @param postUrl
   *          post URL
   * @return massage from remote server
   */
  public String transferData(String content, Charset charset, String postUrl) {
    HttpURLConnection connection = null;
    BufferedReader reader = null;
    StringBuilder sb = new StringBuilder();
    try {
      // 配置连接
      URL url = new URL(postUrl);

      connection = (HttpURLConnection) url.openConnection();
      connection.setRequestProperty("Content-type", "text/xml");
      connection.setConnectTimeout(20000);
      connection.setReadTimeout(20000);
      connection.setDoInput(true);
      connection.setDoOutput(true);
      connection.setRequestMethod("POST");
      // 发送请求
      connection.getOutputStream().write(content.getBytes(charset));
      connection.getOutputStream().flush();
      connection.getOutputStream().close();
      // 读取响应
      reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), charset));

      char[] buf = new char[1024];
      int length = 0;
      while ((length = reader.read(buf)) > 0) {
        sb.append(buf, 0, length);
      }
    } catch (IOException e) {
      e.printStackTrace();
    } finally {
      if (connection != null) {
        connection.disconnect();
      }
      if (reader != null) {
        IOUtils.closeQuietly(reader);
      }
    }
    return sb.toString();
  }

}
