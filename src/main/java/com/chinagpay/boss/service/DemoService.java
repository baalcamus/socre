package com.chinagpay.boss.service;

import com.chinagpay.boss.model.demo.Demo;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface DemoService {

    List<Demo> getAllDemos(Demo demo, PageInfo<Demo> page);
}
