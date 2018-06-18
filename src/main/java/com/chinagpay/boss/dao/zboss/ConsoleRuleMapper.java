package com.chinagpay.boss.dao.zboss;


import com.chinagpay.boss.model.ConsoleRule;

import java.util.List;

public interface ConsoleRuleMapper {

	  List<ConsoleRule> selectConsoleRule(ConsoleRule consoleRule);
		
	  int insertConsoleRule(ConsoleRule consoleRule);
	  
	  int deleteByPrimaryKey(ConsoleRule consoleRule);
}