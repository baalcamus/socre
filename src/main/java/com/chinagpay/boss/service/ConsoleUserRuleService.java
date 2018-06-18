package com.chinagpay.boss.service;

import com.chinagpay.boss.model.ConsoleUserRule;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface ConsoleUserRuleService {


    List<ConsoleUserRule> selectConsoleUserRule(ConsoleUserRule consoleUserRule, PageInfo<ConsoleUserRule> page);

    int insertConsoleUserRule(ConsoleUserRule consoleUserRule);

    int deleteByUserIdAndRuleId(ConsoleUserRule consoleUserRule);
}