package com.chinagpay.boss.service;

import com.chinagpay.boss.model.User;
import com.chinagpay.boss.model.UserRule;
import com.chinagpay.boss.model.zpay.CbMerchantOperator;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface UserService {
  
	List<User> findUserList(User user, PageInfo<User> page);
	
	User selectByLoginName(String loginName);
	
	void insertUser(User user);
	
	List<User> getAllUsers(User user,PageInfo<User> page);
	
	void editUser(User user);
	
//	List<UserRule> getAllUserRoleMer(User user);

//	void test();
}
