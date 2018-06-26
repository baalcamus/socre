package com.chinagpay.boss.service.impl;

import com.chinagpay.boss.dao.zboss.DemoMapper;
import com.chinagpay.boss.model.demo.Demo;
import com.chinagpay.boss.service.DemoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DemoServiceImpl implements DemoService {

    @Autowired  //自动注入
    private DemoMapper demoMapper;
    @Override
    public List<Demo> getAllDemos(Demo demo, PageInfo<Demo> page) {
        PageHelper.startPage(page.getPageNum(), page.getPageSize());
        List<Demo> DemoList = demoMapper.getAllDemos(demo);   //调用demoMapper.xml 中id= getAllDemos 的方法查询数据库
        //resource /sqlMapper/zboss/DemoMapper.xml
        //xml 中<mapper namespace="com.chinagpay.boss.dao.zboss.DemoMapper" > 会引用该mapper的地址作为关联
        return DemoList;
    }

}
