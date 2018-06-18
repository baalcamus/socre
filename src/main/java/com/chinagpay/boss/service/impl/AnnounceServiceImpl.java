package com.chinagpay.boss.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinagpay.boss.dao.zboss.AnnounceMapper;
import com.chinagpay.boss.model.Announce;
import com.chinagpay.boss.service.AnnounceService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


@Service
public class AnnounceServiceImpl implements AnnounceService {
	
	@Autowired
	private AnnounceMapper announceMapper;
	
	@Override
	public List<Announce> selectAnnounce(Announce announce, PageInfo<Announce> page) {
		
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		List<Announce> list=announceMapper.selectAnnounce(announce);
		return list;
	}
	
	@Override
	public int insertAnnounce(Announce announce) {
		return announceMapper.insertAnnounce(announce);
	}
	
	@Override
	public List<Announce> selectAnnounce1(Announce announce) {
		return announceMapper.selectAnnounce(announce);
	}

	@Override
	public int deleteByPrimaryKey(Announce announce) {
		return announceMapper.deleteByPrimaryKey(announce);
	}

	@Override
	public Announce selectByPrimaryKey(String id) {
		return announceMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateStatusByPrimaryKey(Announce announce) {
		return announceMapper.updateStatusByPrimaryKey(announce);
	}

	@Override
	public int updateByPrimaryKey(Announce announce) {
		return announceMapper.updateByPrimaryKey(announce);
	}
}
