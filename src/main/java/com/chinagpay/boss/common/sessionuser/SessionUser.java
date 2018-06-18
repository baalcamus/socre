package com.chinagpay.boss.common.sessionuser;


import com.chinagpay.boss.common.vo.BankBehalfMerConfig;

import javax.servlet.http.HttpSession;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 保存于session中的用户信息
 * @author 
 */
public class SessionUser implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -6929392601061504764L;

	/**
	 * 存放于session中的用户信息，key
	 */
	private static final String SESSION_USER = "SESSION_USER";
	
	/**
	 * 用户id
	 */
	private Long userId;
	/**
	 * 商户
	 */
	private BankBehalfMerConfig bankBehalfMerConfig;
	
  /**
	 * 用户名登录名/账号名
	 */
	private String loginName;
	
	private List ruleList;
	
	/**
	 * 昵称/真名/显示名称
	 */
	private String realName;
	
	/**
	 * 商户id
	 */
	private Long merID;
	
	public Long getMerID() {
		return merID;
	}

	public void setMerID(Long merID) {
		this.merID = merID;
	}

	/**
	 * 管理员标志
	 */
	private Boolean adminFlag = false;
	
	/**
	 * 权限信息
	 */
	private Map<String, String> ruleMap = new HashMap<String, String>();
	
	/**
	 * (额外)数据对象
	 */
	private Object extObj; 
	
	/**
	 * 存放到session中
	 */
	public static void put( HttpSession session, SessionUser sessionUser ){
		session.setAttribute( SESSION_USER, sessionUser );
	}
	
	/**
	 * 存放到session中
	 */
	public static SessionUser get( HttpSession session ){
		Object o = session.getAttribute( SESSION_USER );
		return o == null? null : (SessionUser)o;
	}
	
	/**
	 * 移除用户
	 */
	public static void remove( HttpSession session ){
		session.removeAttribute( SESSION_USER );
	}
	
	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}



	

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public Boolean getAdminFlag() {
		return adminFlag;
	}

	public void setAdminFlag(Boolean adminFlag) {
		this.adminFlag = adminFlag;
	}

	public Map<String, String> getRuleMap() {
		return ruleMap;
	}

	public void setRuleMap(Map<String, String> ruleMap) {
		this.ruleMap = ruleMap;
	}

	public Object getExtObj() {
		return extObj;
	}

	public void setExtObj(Object extObj) {
		this.extObj = extObj;
	}

  public BankBehalfMerConfig getBankBehalfMerConfig() {
    return bankBehalfMerConfig;
  }

  public void setBankBehalfMerConfig(BankBehalfMerConfig bankBehalfMerConfig) {
    this.bankBehalfMerConfig = bankBehalfMerConfig;
  }

  public List getRuleList() {
	  return ruleList;
  }

  public void setRuleList(List ruleList) {
	  this.ruleList = ruleList;
  }
	
}
