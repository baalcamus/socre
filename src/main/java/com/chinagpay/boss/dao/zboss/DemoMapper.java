package com.chinagpay.boss.dao.zboss;

import com.chinagpay.boss.model.demo.Demo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DemoMapper {

	List<Demo> getAllDemos(Demo demo);
}