package com.chinagpay.boss.controller.score;

import com.chinagpay.boss.common.sessionuser.SessionUser;
import com.chinagpay.boss.model.score.Evaluation;
import com.chinagpay.boss.service.EvaluationService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 审核表Controller  接收审核相关的业务请求
 */
@Controller
public class EvaluationController {

    @Autowired
    private EvaluationService evaluationService;


    @RequestMapping(value = "/static/evaluation/toEvaluation")
    public String toEvaluation(HttpSession session, Model model,Evaluation evaluation, PageInfo<Evaluation> page) {
        if (page.getPageSize() == 0) {
            page.setPageSize(10);
            page.setPageNum(1);
        }
        SessionUser sessionUser = SessionUser.get(session);
        evaluation.setUserId(sessionUser.getUserId().toString());
        List<Evaluation> evaList = evaluationService.findList(page, evaluation);

        page = new PageInfo<>(evaList);
        model.addAttribute("page", page);
        model.addAttribute("evaluation", evaluation);
//        return "/evaluation/userSearch";
        return "/evaluation/evaSearch";
    }

    @RequestMapping(value = "/static/evaluation/reviewProject")
    public String reviewProject(HttpSession session, Model model,HttpServletRequest request) {
        String id = request.getParameter("id"); //审核表ID
        //根据待审核ID 查询所有信息（项目信息， 展示图片 ）

        //查询项目信息

        return "/evaluation/reviewProject";
    }

    @RequestMapping(value = "/static/evaluation/updateEvaluation")
    public String updateEvaluation(HttpSession session, Model model,Evaluation evaluation) {
        //保存审核信息

        return "success";
    }

    //查看该project 是否已全部打分， 如果全部打分 计算分数，修改pro的状态为已评审，并保存分数
    @RequestMapping(value = "/static/evaluation/calculaScore")
    public String calculaScore(HttpSession session, Model model,Evaluation evaluation) {
        //保存审核信息

        //查看所有该项目的 审核信息， 是否已全部审核，
        return "success";
    }
}
