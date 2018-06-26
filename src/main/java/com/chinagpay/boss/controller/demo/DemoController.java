package com.chinagpay.boss.controller.demo;


import com.chinagpay.boss.common.sessionuser.SessionUser;
import com.chinagpay.boss.controller.systemManage.SystemController;
import com.chinagpay.boss.model.User;
import com.chinagpay.boss.model.demo.Demo;
import com.chinagpay.boss.service.DemoService;
import com.github.pagehelper.PageInfo;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/demoManage")
public class DemoController {

    private static final Logger logger = LogManager.getLogger(SystemController.class);

    @Autowired
    private DemoService demoService;
    /**
     * 去用户查询
     *
     * @return
     */

    //left 中配置的/demoManage/toDemoSearchController.do   与 该类的 /demoManage/toDemoSearchController 想关联匹配
    @RequestMapping(value = "/toDemoSearchController")
    public  String toUserSearch(HttpSession session, Model model, Demo demo, PageInfo<Demo> page) {

        logger.info("去用户查询");
        SessionUser sessionUser = SessionUser.get(session);
        if(!"admin".equals(sessionUser.getLoginName()))
        {
            demo.setCreateLoginName(sessionUser.getLoginName());
        }
        demo.setType("00");
        if (page.getPageSize() == 0) {
            page.setPageSize(10);
            page.setPageNum(1);
        }
        List<Demo> demoList = demoService.getAllDemos(demo, page);  //调用service逻辑层代码 查询数据库
        page = new PageInfo<>(demoList);   //分页工具
        model.addAttribute("page", page);  //向页面输入要显示的数据
        return "/demoManage/demoSearchjsp";    //调用显示的页面     webapp/WEN-INF/jsp/demoManage/demoSearchjsp.jsp
    }
}
