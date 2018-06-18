package com.chinagpay.boss.service;

import com.chinagpay.boss.model.User;

public interface SelfUserService {
  
	public void saveSelfUser(User user,String[] ruleArr) throws Exception;
}
