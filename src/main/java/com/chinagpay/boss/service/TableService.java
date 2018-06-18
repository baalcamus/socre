package com.chinagpay.boss.service;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;

/** 
	*@author  作者liws  
	*@date    创建时间：2016年7月20日 下午2:03:09 
	*@version 1.0 
	*@parameter  
	*@since  
	*@return  
*/
public interface TableService {
	

	/**
	 * 根据taskId(相当于批次号)查询该批次的明细数据
	 * @param taskId
	 * @param form 判断查询Table中的哪个表
	 * @return
	 */
	public List queryTableDetail(String taskId,String form, PageInfo page);

	/**
	 * 向相应报备文件表中插入数据
	 * @param params
	 * @return
	 */
	public String addTbale(Map<String, String> params);

	/**
	 * 根据form判断查询哪张表中id对应的唯一数据
	 * @param id
	 * @return
	 */
	public Object getTableById(String id, String form);

	/**
	 * 修改相应报备文件表中的数据
	 * @param paramMap
	 * @return
	 */
	public String modifyTbale(Map<String, String> paramMap);

	/**
	 * 根据id删除相应的Table数据
	 * @param id
	 * @return
	 */
	public String deleteTbale(String id, String form);

}
