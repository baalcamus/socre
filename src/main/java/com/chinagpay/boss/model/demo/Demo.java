package com.chinagpay.boss.model.demo;

import java.util.Date;

public class Demo {
  
    private Long id;

    private Date createTime;

    private Date updateTime;

    /**
     * 用户账号
     */
    private String loginName;

    /**
     * 用户昵称
     */
    private String realName;

    /**
     * 用户密码
     */
    private String loginPwd;

    /**
     * 用户所属部门ID 对应CONSOLE_DEP表
     */
    private String consoleDepId;
    
    /**
     * 创建人
     */
    private String createLoginName;
    
    /**
     * 更新人
     */
    private String updateLoginName;

    /**
     * 状态 1开启  2关闭
     */
    private String status;
    
    
    /**
     * 商户编号
     */
    private String merId;

    /**
     * 权限ids
     */
    private String ruleArr;

    
    private String lockFlag;
    
    private Integer lockNum;
    
    
    public String getLockFlag() {
		return lockFlag;
	}


	public void setLockFlag(String lockFlag) {
		this.lockFlag = lockFlag;
	}


	public Integer getLockNum() {
		return lockNum;
	}


	public void setLockNum(Integer lockNum) {
		this.lockNum = lockNum;
	}


	/**
     * 01表示商户开通服务时添加的系统管理员
     */
    private String type;

    public String getPayPwd() {
		return payPwd;
	}


	public void setPayPwd(String payPwd) {
		this.payPwd = payPwd;
	}


	public String getLastLoginTime() {
		return lastLoginTime;
	}


	public void setLastLoginTime(String lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}


	public String getReservMsg() {
		return reservMsg;
	}


	public void setReservMsg(String reservMsg) {
		this.reservMsg = reservMsg;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getReservedEmail() {
		return reservedEmail;
	}


	public void setReservedEmail(String reservedEmail) {
		this.reservedEmail = reservedEmail;
	}


	public String getReservedPhone() {
		return reservedPhone;
	}


	public void setReservedPhone(String reservedPhone) {
		this.reservedPhone = reservedPhone;
	}


	public String getArea() {
		return area;
	}


	public void setArea(String area) {
		this.area = area;
	}


	/**
     * 支付密码
     */
    private String payPwd;

    private String lastLoginTime;
    
    
    private String reservMsg;//预留信息
    private String phone;//手机号
    
    private String reservedEmail;//预留邮箱
    private String reservedPhone;//预留手机
    private String area;//地区
    

	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getRuleArr() {
		return ruleArr;
	}


	public void setRuleArr(String ruleArr) {
		this.ruleArr = ruleArr;
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public Date getCreateTime() {
		return createTime;
	}


	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}


	public Date getUpdateTime() {
		return updateTime;
	}


	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
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


	public String getLoginPwd() {
		return loginPwd;
	}


	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}


	public String getConsoleDepId() {
		return consoleDepId;
	}


	public void setConsoleDepId(String consoleDepId) {
		this.consoleDepId = consoleDepId;
	}


	public String getCreateLoginName() {
		return createLoginName;
	}


	public void setCreateLoginName(String createLoginName) {
		this.createLoginName = createLoginName;
	}


	public String getUpdateLoginName() {
		return updateLoginName;
	}


	public void setUpdateLoginName(String updateLoginName) {
		this.updateLoginName = updateLoginName;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getMerId() {
		return merId;
	}


	public void setMerId(String merId) {
		this.merId = merId;
	}
    
    
    
    
}