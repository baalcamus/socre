package com.chinagpay.boss.service.impl;

import java.util.LinkedList;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chinagpay.boss.dao.zboss.UserMapper;
import com.chinagpay.boss.dao.zboss.UserRuleMapper;
import com.chinagpay.boss.model.User;
import com.chinagpay.boss.model.UserRule;
import com.chinagpay.boss.service.UserRoleService;
//import com.chinagpay.boss.service.zpay.impl.MerMenuServiceImpl;


@Service
@Transactional(rollbackFor=Exception.class)
public class UserRuleServiceImpl implements UserRoleService {
	private static final Logger logger = LogManager.getLogger(UserRuleServiceImpl.class);

	@Autowired
	private UserRuleMapper userRuleMapper;
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public void insertOrUpdateUserRole(String userId, String merNo,String[] item) {

		logger.info("商户超级管理员"+userId+"修改商户系统权限");
		UserRule ur = new UserRule();
		ur.setUserId(Long.parseLong(userId));
		
		//删除当前商户超级管理员所有权限
		userRuleMapper.deleteUserRule(ur);
		//添加最新的权限信息
		for(String rid:item)
		{
			UserRule ur1 = new UserRule();
			ur1.setRuleId(rid);
			ur1.setUserId(Long.parseLong(userId));
			userRuleMapper.insertUserRule(ur1);
		}

		
		
		User user = new User();
		user.setMerId(merNo);
		user.setType("02");//查询商户所有创建子用户
		List<User> users02 = userMapper.selectUserByMerId(user);
		UserRule ur1 = new UserRule();
		for(User user1:users02)//当前商户下所有子用户
		{
			ur1.setUserId(user1.getId());
			List<UserRule> curs = userRuleMapper.getUserRule(ur1);
			for(UserRule ur2:curs)//当前用户下所有权限
			{
				boolean bool = true;
				for(String rule:item)//运营选中当前权限
				{
					if(ur2.getRuleId().equals(rule))//判断当前用户下当前角色是否和运营选中角色一致，一旦不一致，证明运营撤销用户权限，子用户权限删除（无论是子孙后台）
					{
						bool = false;
						break;
					}
				}
				if(bool)
				{
					userRuleMapper.deleteUserRuleById(ur2.getId());//删除权限关系
				}
			}
		}
		
		
	}
}
