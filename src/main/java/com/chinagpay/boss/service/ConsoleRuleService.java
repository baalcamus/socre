package com.chinagpay.boss.service;

import com.chinagpay.boss.model.ConsoleRule;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface ConsoleRuleService {
  
	  
	List<ConsoleRule> selectConsoleRule(ConsoleRule consoleRule, PageInfo<ConsoleRule> page);
	 
	 int insertConsoleRule(ConsoleRule consoleRule);
	 
	 List<ConsoleRule> selectConsoleRule1(ConsoleRule consoleRule);
	 
	 int deleteByPrimaryKey(ConsoleRule consoleRule);
	  
}