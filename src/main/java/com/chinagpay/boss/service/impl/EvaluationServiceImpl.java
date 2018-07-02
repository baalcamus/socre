package com.chinagpay.boss.service.impl;

import com.chinagpay.boss.dao.zboss.EvaluationMapper;
import com.chinagpay.boss.model.ConsoleUserRule;
import com.chinagpay.boss.model.score.Evaluation;
import com.chinagpay.boss.service.EvaluationService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EvaluationServiceImpl implements EvaluationService {


    @Autowired  //自动注入
    private EvaluationMapper evaluationMapper;

    @Override
    public List<Evaluation> findListByUserid(String id) {
        //TODO 调用 MAPPER实现
        return null;
    }

    @Override
    public void update(Evaluation evaluation) {

    }

    @Override
    public List<Evaluation> findList( PageInfo<Evaluation> page, Evaluation evaluation) {
        PageHelper.startPage(page.getPageNum(), page.getPageSize());
        List<Evaluation> list=evaluationMapper.findList(evaluation);
        return list;
    }
}
