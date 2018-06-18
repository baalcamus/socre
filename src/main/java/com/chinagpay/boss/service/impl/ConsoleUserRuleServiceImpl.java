package com.chinagpay.boss.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinagpay.boss.dao.zboss.ConsoleUserRuleMapper;
import com.chinagpay.boss.model.ConsoleUserRule;
import com.chinagpay.boss.service.ConsoleUserRuleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


@Service
public class ConsoleUserRuleServiceImpl implements ConsoleUserRuleService {
	
	@Autowired
	private ConsoleUserRuleMapper consoleUserRuleMapper;
	
	@Override
	public List<ConsoleUserRule> selectConsoleUserRule(ConsoleUserRule consoleUserRule, PageInfo<ConsoleUserRule> page) {
		
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		List<ConsoleUserRule> list=consoleUserRuleMapper.selectConsoleUserRule(consoleUserRule);
		return list;
	}
	
	@Override
	public int insertConsoleUserRule(ConsoleUserRule consoleUserRule) {
		return consoleUserRuleMapper.insertConsoleUserRule(consoleUserRule);
	}

	@Override
	public int deleteByUserIdAndRuleId(ConsoleUserRule consoleUserRule) {
		return consoleUserRuleMapper.deleteByUserIdAndRuleId(consoleUserRule);
	}
	
}
