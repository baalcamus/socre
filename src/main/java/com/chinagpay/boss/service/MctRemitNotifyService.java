package com.chinagpay.boss.service;

import java.util.List;
import java.util.Map;

import com.chinagpay.boss.model.MctRemitNotify;
import com.github.pagehelper.PageInfo;

public interface MctRemitNotifyService {
	/**
	 * 多条件查询汇款通知
	 * @param cbAccount
	 * @param page
	 * @return
	 */
	List<MctRemitNotify> findList(MctRemitNotify cbAccount, PageInfo<MctRemitNotify> page);
	/**
	 * 多条件查询
	 * @param mctRemitNotify
	 * @param page
	 * @return
	 */
	List<MctRemitNotify> findByMap(Map<Object,Object> mctRemitNotify, PageInfo<MctRemitNotify> page);
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	MctRemitNotify findById(String id);
}
