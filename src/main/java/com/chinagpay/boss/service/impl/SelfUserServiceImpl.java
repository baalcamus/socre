package com.chinagpay.boss.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chinagpay.boss.dao.zboss.SelfUserMapper;
import com.chinagpay.boss.dao.zboss.SelfUserRuleMapper;
import com.chinagpay.boss.model.User;
import com.chinagpay.boss.model.UserRule;
import com.chinagpay.boss.service.SelfUserService;

@Service
@Transactional
public class SelfUserServiceImpl implements SelfUserService {
	
	@Autowired
	SelfUserMapper selfUserMapper;
	@Autowired
	SelfUserRuleMapper selfuserRuleMapper;
	/* (non Javadoc) 
	 * @Title: saveSelfUser
	 * @Description: TODO
	 * @param user
	 * @param ruleId
	 * @throws Exception 
	 * @see com.chinagpay.boss.service.SelfUserService#saveSelfUser(com.chinagpay.boss.model.User, java.util.List) 
	 */
	@Override
	public void saveSelfUser(User user, String[] ruleArr) throws Exception {
		try {

	                int insertUser = selfUserMapper.insertUser(user);
	                if (insertUser <= 0) {
	                    System.out.println("添加失败");
	                }
	                //权限
//	                Long id = selfUserMapper.getUser(user).getId();
//	                UserRule userRule = new UserRule();
//	                userRule.setUserId(id);
//	                userRule.setRuleId("1");
//	                int insertUserRule = 0;
//	                for (int i = 0; i < ruleArr.length; i++) {
//	                    userRule.setRuleId(ruleArr[i]);
//	                    selfuserRuleMapper.insertUserRule(userRule);
//	                    insertUserRule++;
//	                }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
