package com.chinagpay.boss.dao.zboss;


import com.chinagpay.boss.model.ConsoleDep;

import java.util.List;


public interface ConsoleDepMapper {

	
	
	/**
	 * 查询部门表
	 * @param consoleDep
	 * @return
	 */
	List<ConsoleDep> findConsoleDepList();
	
}