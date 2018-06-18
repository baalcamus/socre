package com.chinagpay.boss.service;

import java.io.File;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.chinagpay.boss.common.exception.BossException;
import com.chinagpay.boss.model.Currency2UsdRate;
import com.github.pagehelper.PageInfo;

public interface Currency2UsdRateService {
	/**
	 * 多条件分页查询
	 * @param currency2UsdRate
	 * @param page
	 * @return
	 */
	public List<Currency2UsdRate> findList(Currency2UsdRate currency2UsdRate, PageInfo<Currency2UsdRate> page);
	/**
	 * 导入文件
	 * @param string
	 * @param effectMonth
	 */
	public void importRate(String string, String effectMonth);
	/**
	 * 查询当前时间的交易汇率
	 * 
	 * @param currency
	 * @return
	 * @throws BossException 
	 */
	Currency2UsdRate findByCurrency(String currency) throws BossException;
	/**
	 * 查询某一时间的交易汇率
	 * 
	 * @param currency
	 * @return
	 * @throws BossException 
	 */
	List<Currency2UsdRate> findByEffectMonth(String effectMonth) throws BossException;
	
	/**
	 * 按月份分组
	 * @return 
	 */
	public List<Currency2UsdRate> findListGroupByMonth();
}
