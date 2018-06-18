package com.chinagpay.boss.service;

public interface UserRoleService {
	
	/**
	 * 
	 * @param userId 用户id
	 * @param merNo 商户编号
	 * @param item 角色id
	 */
	void insertOrUpdateUserRole(String userId,String merNo,String item[]);
}
