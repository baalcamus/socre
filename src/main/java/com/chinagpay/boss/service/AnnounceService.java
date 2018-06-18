package com.chinagpay.boss.service;

import com.chinagpay.boss.model.Announce;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface AnnounceService {
  
	  
	List<Announce> selectAnnounce(Announce announce, PageInfo<Announce> page);
	 
	 int insertAnnounce(Announce announce);
	 
	 List<Announce> selectAnnounce1(Announce announce);
	 
	 int deleteByPrimaryKey(Announce announce);
	 
	 Announce selectByPrimaryKey(String id);
	 
	 int updateStatusByPrimaryKey(Announce announce);
	 
	 int updateByPrimaryKey(Announce announce);
	  
}