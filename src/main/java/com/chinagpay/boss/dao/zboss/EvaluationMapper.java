package com.chinagpay.boss.dao.zboss;

import com.chinagpay.boss.model.score.Evaluation;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EvaluationMapper {

    List<Evaluation> findList(Evaluation evaluation);
}
