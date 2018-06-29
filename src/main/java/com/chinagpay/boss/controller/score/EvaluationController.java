package com.chinagpay.boss.controller.score;

import com.chinagpay.boss.model.score.Evaluation;
import com.chinagpay.boss.service.EvaluationService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * 审核表Controller  接收审核相关的业务请求
 */
@Controller
public class EvaluationController {

    @Autowired
    private EvaluationService evaluationService;


    @RequestMapping(value = "/evaluation/toEvaluation.do")
    public String toEvaluation(HttpSession session, Model model,Evaluation evaluation, PageInfo<EvaluationService> page) {
        if (page.getPageSize() == 0) {
            page.setPageSize(10);
            page.setPageNum(1);
        }


//        List<ConsoleRule> consoleRuleList = consoleRuleService.selectConsoleRule(consoleRule, page);
//        page = new PageInfo<>(consoleRuleList);
//        model.addAttribute("page", page);
//        model.addAttribute("consoleRule", consoleRule);
//        model.addAttribute("consoleRuleList", consoleRuleList);
        return "";
    }
}
