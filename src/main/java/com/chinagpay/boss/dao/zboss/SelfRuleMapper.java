package com.chinagpay.boss.dao.zboss;



import com.chinagpay.boss.model.Rule;

import java.util.List;


public interface SelfRuleMapper {
	
	
	/**
	 * 查询权限
	 * @param rule
	 * @return
	 */
	List<Rule> getRule(Rule rule);
	
	/**
	 * 更具用户id查出该用户所有权限
	 * @param userId
	 * @return
	 */
	List<Rule> getRuleByUserId(Long userId);

}
