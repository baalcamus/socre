package com.chinagpay.boss.service;

import com.chinagpay.boss.model.score.Evaluation;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface EvaluationService {

    /**
     * 根据当前登录人，查找他涉及的待评审列表
     */
    public List<Evaluation> findListByUserid(String id);

    /**
     * 根据ID,修改评审表信息
     */
    void update(Evaluation evaluation);


    /**
     * 根据当前登录人，查找他涉及的待评审列表
     */
    public List<Evaluation> findList(String id, PageInfo<Evaluation> page,Evaluation evaluation);
}
