package com.chinagpay.boss.dao.zboss;


import com.chinagpay.boss.model.User;

import java.util.List;


public interface SelfUserMapper {
	
	/**
	 * 创建用户
	 * @param user
	 * @return
	 */
	int insertUser(User user);
	
	
	/**
	 * 查询用户
	 * @param user
	 * @return
	 */
	User getUser(User user);
	
	/**
	 * 修改用户状态
	 * @param user
	 */
	void updateStatus(User user);
	
	/**
	 * 修改密码
	 * @param user
	 */
	void updatePwd(User user);
	
	/**
	 * 查询用户数量
	 * @param user
	 * @return
	 */
	Integer getUserCount(User user);
	
	/**
	 * 查询用户
	 * @param user
	 * @return
	 */
	List<User> findUserList(User user);
	
	
	void updateUser(User user);
	
	User selectByLoginName(String loginName);
	
	void updateUserById(User user);
	
}