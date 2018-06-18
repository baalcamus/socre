package com.chinagpay.boss.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chinagpay.boss.dao.zboss.MerchantEntryRecordMapper;
import com.chinagpay.boss.service.MerchantEntryRecordService;

/**
 * Created by hanbinyu on 2016/7/22.
 */
@Service("merchantEntryRecordService")
public class MerchantEntryRecordServiceImpl implements MerchantEntryRecordService{
    @Resource(name = "merchantEntryRecordMapper")
    private MerchantEntryRecordMapper merchantEntryRecordMapper;
}
