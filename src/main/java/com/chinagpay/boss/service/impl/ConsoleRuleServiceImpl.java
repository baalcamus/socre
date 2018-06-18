package com.chinagpay.boss.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.chinagpay.boss.dao.zboss.ConsoleRuleMapper;
import com.chinagpay.boss.dao.zboss.ConsoleUserRuleMapper;
import com.chinagpay.boss.model.ConsoleRule;
import com.chinagpay.boss.model.ConsoleUserRule;
import com.chinagpay.boss.service.ConsoleRuleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


@Service
public class ConsoleRuleServiceImpl implements ConsoleRuleService {
	
	@Autowired
	private ConsoleRuleMapper consoleRuleMapper;
	
	@Autowired
	private ConsoleUserRuleMapper consoleUserRuleMapper;
	
	@Override
	public List<ConsoleRule> selectConsoleRule(ConsoleRule consoleRule, PageInfo<ConsoleRule> page) {
		
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		List<ConsoleRule> list=consoleRuleMapper.selectConsoleRule(consoleRule);
		return list;
	}
	
	@Override
	public int insertConsoleRule(ConsoleRule consoleRule) {
		return consoleRuleMapper.insertConsoleRule(consoleRule);
	}
	
	@Override
	public List<ConsoleRule> selectConsoleRule1(ConsoleRule consoleRule) {
		return consoleRuleMapper.selectConsoleRule(consoleRule);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public int deleteByPrimaryKey(ConsoleRule consoleRule) {
		int a=consoleRuleMapper.deleteByPrimaryKey(consoleRule);
		ConsoleUserRule consoleUserRule= new ConsoleUserRule();
		consoleUserRule.setUserId("13");
		consoleUserRule.setRuleId(consoleRule.getId());
		int b=consoleUserRuleMapper.deleteByUserIdAndRuleId(consoleUserRule);
		return a;
	}
}
