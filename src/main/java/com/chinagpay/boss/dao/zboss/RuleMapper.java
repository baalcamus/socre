package com.chinagpay.boss.dao.zboss;



import com.chinagpay.boss.model.Rule;
import com.chinagpay.boss.model.User;
import com.chinagpay.boss.model.UserRule;

import java.util.List;


public interface RuleMapper {
	
	
	/**
	 * 查询权限
	 * @param rule
	 * @return
	 */
	List<Rule> getRule(Rule rule);
	
	
	
	/**
	 * 根据用户商户id查询角色
	 * @param user
	 * @return
	 */
	List<Rule> getUserRuleByMerId(User user	); 
	
	/**
	 * 更具用户id查出该用户所有权限
	 * @param userId
	 * @return
	 */
	List<Rule> getRuleByUserId(Long userId);

	List<Rule> getAllList();

}
