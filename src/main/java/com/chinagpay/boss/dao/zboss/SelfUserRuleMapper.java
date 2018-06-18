package com.chinagpay.boss.dao.zboss;


import com.chinagpay.boss.model.UserRule;

import java.util.List;

public interface SelfUserRuleMapper {
	/**
	 * 查询用户所有权限
	 * @param userRule
	 * @return
	 */
	List<UserRule> getUserRule(UserRule userRule);
	
	/**
	 * 创建用户权限关联
	 * @param userRule
	 * @return
	 */
	int insertUserRule(UserRule userRule);
	
	
	/**
	 * 删除权限关联表
	 */
	void deleteUserRule(UserRule userRule);
}
