package com.chinagpay.boss.dao.zboss;


import java.util.List;

import com.chinagpay.boss.model.User;
import com.chinagpay.boss.model.UserRule;

public interface UserRuleMapper {
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
	
	
	/**
	 * 根据id删除指定角色关系记录
	 * @param id
	 */
	void deleteUserRuleById(Long id);
	
}
