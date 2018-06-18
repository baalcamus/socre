package com.chinagpay.boss.controller.login;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chinagpay.boss.common.sessionuser.SessionUser;
import com.chinagpay.boss.common.util.Md5Util;
import com.chinagpay.boss.dao.zboss.RuleMapper;
import com.chinagpay.boss.dao.zboss.UserMapper;
import com.chinagpay.boss.model.Rule;
import com.chinagpay.boss.model.User;
import com.chinagpay.boss.service.UserService;

//import com.chinagpay.boss.dao.ky.datadirectory.DataDirectory;
//import com.chinagpay.boss.dao.ky.datadirectory.DataDirectoryMapper;


@Controller
@RequestMapping(value="/login")
public class LoginController {
	private static final Logger logger = LogManager.getLogger(LoginController.class);

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private RuleMapper ruleMapper;

	@Autowired
	private UserService userService;
//	@Autowired
//	private DataDirectoryMapper dataDirectoryMapper;
	
	/**
	 * 登录动作
	 * @return
	 */
	@RequestMapping(value="/toLogin")
	@ResponseBody
	public Map<String, Object> toLogin(@RequestParam String loginName, @RequestParam String autFlag,@RequestParam String loginPwd, @RequestParam String aut,@RequestParam String redirectUrl, HttpSession session, HttpServletResponse response){
		logger.info("登录操作");
		Map<String, Object> map = new HashMap<String, Object>();
		try {

			//登陆错误验证验证码
			if (!"0".equals(autFlag)) {
				//验证码验证

				if (!aut.equalsIgnoreCase((String) session.getAttribute("code"))) {
					map.put("status", false);
					map.put("msg", "验证码错误");
					return map;
				}
			}

			User user = new User();
			user.setLoginName(loginName);
			user.setLoginPwd(Md5Util.md5Hex(loginPwd));
			user.setType("00");
			user = userMapper.getUser(user);
			if (null == user) {
				map.put("status", false);
				map.put("msg", "用户名或密码有误");
				return map;
			} else {
				if ("0".equals(user.getStatus())) {
					map.put("status", false);
					map.put("msg", "该账户已停用");
					return map;
				}
				map.put("status", true);
				if (StringUtils.isNotBlank(redirectUrl)) {
					try {
						map.put("redirectUrl", URLDecoder.decode(redirectUrl, "UTF-8"));
					} catch (UnsupportedEncodingException e) {
						logger.error("login page, decode url error", e);
					}
				}
				//登录成功，保存所有地区到session
//		    List<DataDirectory> cityList=dataDirectoryMapper.getCityList();
//		    session.setAttribute("cityList", cityList);

				//验证成功  user存入session
				SessionUser sessionUser = new SessionUser();
				sessionUser.setUserId(user.getId());
				sessionUser.setLoginName(user.getLoginName());//登录账号
				sessionUser.setRealName(user.getRealName());//账号昵称
				session.setAttribute("realName", user.getRealName());
				// 列出用户权限
				List<Rule> ruleList = ruleMapper.getRuleByUserId(user.getId());
				Map<String, String> ruleMap = new HashMap<String, String>();
				for (Rule rule : ruleList) {
					ruleMap.put(rule.getCode(), rule.getMark());
				}
				sessionUser.setRuleList(ruleList);
				sessionUser.setRuleMap(ruleMap);
				SessionUser.put(session, sessionUser);
			}
		}catch (Exception e){
			logger.error("login exception",e);
		}
		return map;	
	}
	
	
	@RequestMapping(value="/toExit",method = RequestMethod.POST)
	@ResponseBody
	public String toExit(HttpSession session){
		logger.info("退出");
		session.invalidate();
		return "ok";
	}

	/**
	 * 测试事务的请求方法
	 */
//	@RequestMapping(value = "/test")
//	public void test(){
//
//		userService.test();
//
//
//	}
	

}
