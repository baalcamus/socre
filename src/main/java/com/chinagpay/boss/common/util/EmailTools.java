package com.chinagpay.boss.common.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;


/**
* 邮件发送工具类
* @author xxxxx
* @email xxxx@163.com
* @date 2013-3-31 下午5:08:16
* @version 1.0
*/
public class EmailTools {
  /**
   * 邮件发送的方法
   * @param password 寄件人密码
   * @param user 寄件人用户名
   * @param host 寄件邮箱发送邮件服务器
   * @param from 寄件游邮箱
   * @param to 收件人
    * @param subject 主题
    * @param content 内容
   * @return 成功或失败
   */
  public static boolean send(String from,String host,String user,String password,String to, String subject, String content){

       // 第一步：创建Session
       Properties props = new Properties();
       //指定邮件的传输协议，smtp(Simple Mail Transfer Protocol 简单的邮件传输协议)
       props.put("mail.transport.protocol", "smtp");
       //指定邮件服务器
       props.put("mail.host",host);
       //指定邮件的发送人(您用来发送邮件的服务器，比如您的163\sina等邮箱)
       props.put("mail.from", from);
       //163必须开启验证
       props.setProperty("mail.smtp.auth", "true");
       final String passFrom = from;
       final String passPassWord = password;
       Session session = Session.getDefaultInstance(props,new Authenticator(){
           protected PasswordAuthentication getPasswordAuthentication(){
               return new PasswordAuthentication(passFrom,passPassWord);
           }

       });

       // 开启调试模式
//         session.setDebug(true);
       try {
           // 第二步：获取邮件发送对象
           Transport transport = session.getTransport();
           // 连接邮件服务器，链接您的163、sina邮箱，用户名（不带@163.com，登录邮箱的邮箱账号，不是邮箱地址）、密码
           transport.connect(user, password);

           // 第三步：创建邮件消息体
           MimeMessage message = new MimeMessage(session);
           //邮件的主题
           message.setSubject(subject);
           //邮件的内容
           message.setContent(content, "text/html;charset=utf-8");
           //邮件发送时间
           message.setSentDate(new Date());

           // 第四步：发送邮件
           //第一个参数：邮件的消息体
           //第二个参数：邮件的接收人，多个接收人用逗号隔开（test1@163.com,test2@sina.com）
           transport.sendMessage(message, InternetAddress.parse(to));
           return true;
       } catch (Exception e) {
           e.printStackTrace();
       }
       return false;
   }


   public static void main(String[] args) {

       //您要发送给谁，标题，内容
       boolean a = EmailTools.send("operation@chinagpay.com","smtp.ym.163.com","operation","4hXSbX1ZIX","nixd@chinagpay.com", "密码重置", "您好!"
               + "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密码重置成功,新密码为:&nbsp;&nbsp;<span style=\"font-size:18px;\">123456780</span>"
              + "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请您妥善保管您的新密码!"
               + "<br>"
               + "<br>————————————————————————————"
               + "<br><h4>品牌名称:  智惠支付"
               + "<br>公司名称 : 北京爱农驿站科技服务有限公司"
               + "<br>公司官网 : www.chinagpay.com"
               + "<br>办公地址 : 上海市徐汇区古美路1515号凤凰园9号楼10层1008室</h4>");
       System.out.println(a);
   }
}