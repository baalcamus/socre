package com.chinagpay.boss.common.util.send;

import javax.mail.*;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;


public class MailSender {
	public static boolean send(String protocol, String serverHost, final String userName, final String passWord,
			String fromAddress, String toAddress, String subject, String mailContent) {
		try {
			Properties props = new Properties();
			props.setProperty("mail.smtp.auth", "true");
			props.setProperty("mail.transport.protocol", protocol);
			props.setProperty("mail.host", serverHost);

			Session session = Session.getInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(userName, passWord);
				}
			});
			session.setDebug(true);

			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(fromAddress));
			msg.setSubject(subject);
			// 注意第二个参数要写成"text/html;charset=utf-8"，表明这是一封html邮件
			msg.setContent(mailContent, "text/html;charset=utf-8");
			msg.setRecipients(RecipientType.TO, InternetAddress.parse(toAddress));
			Transport.send(msg);
			return true;
		} catch (Exception e) {
//			LogFactory.getLog().error(MailSender.class, "渠道监控警报邮件发送失败");
			return false;
		}
	}
}
