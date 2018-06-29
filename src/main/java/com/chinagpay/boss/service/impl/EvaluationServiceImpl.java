package com.chinagpay.boss.service.impl;

import com.chinagpay.boss.model.score.Evaluation;
import com.chinagpay.boss.service.EvaluationService;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EvaluationServiceImpl implements EvaluationService {
    @Override
    public List<Evaluation> findListByUserid(String id) {
        //TODO 调用 MAPPER实现
        return null;
    }

    @Override
    public void update(Evaluation evaluation) {

    }

    @Override
    public List<Evaluation> findList(String id, PageInfo<Evaluation> page, Evaluation evaluation) {
        return null;
    }
}
