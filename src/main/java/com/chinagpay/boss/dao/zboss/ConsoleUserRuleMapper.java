package com.chinagpay.boss.dao.zboss;


import com.chinagpay.boss.model.ConsoleUserRule;

import java.util.List;

public interface ConsoleUserRuleMapper {

    List<ConsoleUserRule> selectConsoleUserRule(ConsoleUserRule consoleUserRule);

    int insertConsoleUserRule(ConsoleUserRule consoleUserRule);

    int deleteByUserIdAndRuleId(ConsoleUserRule consoleUserRule);
}