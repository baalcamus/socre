package com.chinagpay.boss.common.util.send;

//import com.jnew.bpfront.dubbo.ChannelCallService;
//import com.jnew.bpfront.dubbo.domain.RespBean;
//import com.jnewsdk.dubbo.DubboCustomer;
//import com.jnewsdk.util.StringUtils;

public class SmsUtil {

	/**
	 * 发送渠道监控短信
	 * @param phoneNum 手机号 多个，隔开
	 * @param msg 发送内容
	 * @param account 用户号
	 * @param password 用户密码
	 * @param sign 签名
	 * @return
	 * @throws Exception
	 */
	public static boolean sendNotifyMsg(String phoneNum, String msg,
			String account,String password,String sign,String url) throws Exception {
		// 调用建州短信
//		//LogFactory.getLog().debug(SmsUtil.class, "调用建周短信接口");
//		// 组装短信平台短信发送请求报文
//		Map<String, String> dataMap = new HashMap<String, String>();
//		// 接口用户名
//		dataMap.put("account", account);
//		// 密码
//		dataMap.put("password", password);
//		// 目标手机号
//		dataMap.put("destmobile", phoneNum);
//		msg = msg + sign;
//		dataMap.put("msgText", msg);
//		StringBuffer buff = new StringBuffer("");
//		for (Entry<String, String> entry : dataMap.entrySet()) {
//			buff.append(entry.getKey() + "=" + URLEncoder.encode(entry.getValue(), "UTF-8") + "&");
//		}
//		// String
//		String reqUrl = url;
//		//LogFactory.getLog().debug(SmsUtil.class, "短信发送url：" + reqUrl);
//
//		DubboCustomer dubboCustomer = DubboCustomer.getInstance();
//		dubboCustomer.initService();
//		com.jnew.bpfront.dubbo.domain.ReqBean bpFrontReqBean = new com.jnew.bpfront.dubbo.domain.ReqBean();
//		bpFrontReqBean.setUrl(StringUtils.trim(reqUrl));
//		bpFrontReqBean.setChannel("106901330971");
//		bpFrontReqBean.setTimeout("60000");
//		bpFrontReqBean.setMessage(buff.toString().getBytes("utf-8"));
//		bpFrontReqBean.setRequestMethod("POST");
//		Map<String, String> reqPropMap = new HashMap<String, String>();
//		reqPropMap.put("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
//		bpFrontReqBean.setRequestProperty(reqPropMap);
//		ChannelCallService channelCallService = dubboCustomer.getService(ChannelCallService.class);
//		if (channelCallService == null) {
//			//LogFactory.getLog().error(SmsUtil.class, "渠道前置服务获取失败");
//			return false;
//		}
//		RespBean respBean = channelCallService.call(bpFrontReqBean);
//		byte[] rcvData = respBean.getRcvData();
//		if (rcvData != null) {
//			String rcvMsg = new String(rcvData, "utf-8");
//			int msgCode = Integer.parseInt(rcvMsg);
//			if (msgCode < 0) {
//				switch (msgCode) {
//					case -1:
//						System.err.println("余额不足");
//						break;
//					case -2:
//						System.err.println("帐号或密码错误");
//						break;
//					case -3:
//						System.err.println("连接服务商失败");
//						break;
//					case -4:
//						System.err.println("超时");
//						break;
//					case -5:
//						System.err.println("其他错误，一般为网络问题，IP受限等");
//						break;
//					case -6:
//						System.err.println("短信内容为空");
//						break;
//					case -7:
//						System.err.println("目标号码为空");
//						break;
//					case -8:
//						System.err.println("用户通道设置不对，需要设置三个通道");
//						break;
//					case -9:
//						System.err.println("捕获未知异常");
//						break;
//					case -10:
//						System.err.println("超过最大定时时间限制");
//						break;
//					case -11:
//						System.err.println("目标号码在黑名单里");
//						break;
//					case -12:
//						System.err.println("消息内容包含禁用词语");
//						break;
//					case -13:
//						System.err.println("没有权限使用该网关");
//						break;
//					case -14:
//						System.err.println("找不到对应的Channel ID");
//						break;
//					case -17:
//						System.err.println("没有提交权限，客户端帐号无法使用接口提交");
//						break;
//					case -18:
//						System.err.println("提交参数名称不正确或确少参数");
//						break;
//					case -19:
//						System.err.println("必须为POST提交");
//						break;
//					case -20:
//						System.err.println("超速提交(一般为每秒一次提交)");
//						break;
//					default:
//						break;
//				}
//				return false;
//			}
//			//LogFactory.getLog().debug(SmsUtil.class, "渠道监控短信发送成功！");
//			return true;
//		}
		return false;
	}

}
