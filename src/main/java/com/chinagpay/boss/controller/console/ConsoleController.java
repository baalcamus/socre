package com.chinagpay.boss.controller.console;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.chinagpay.boss.common.sessionuser.SessionUser;
import com.chinagpay.boss.dao.zboss.UserMapper;
import com.chinagpay.boss.model.ConsoleRule;
import com.chinagpay.boss.model.ConsoleUserRule;
import com.chinagpay.boss.model.User;
import com.chinagpay.boss.service.ConsoleRuleService;
import com.chinagpay.boss.service.ConsoleUserRuleService;
import com.chinagpay.boss.service.UserService;
import com.github.pagehelper.PageInfo;


@Controller
@RequestMapping(value = "/console")
public class ConsoleController {
	private static final Logger logger = LogManager.getLogger(ConsoleController.class);


    @Autowired
    private ConsoleRuleService consoleRuleService;

    @Autowired
    private ConsoleUserRuleService consoleUserRuleService;

    @Autowired
    private UserService userService;

    @Autowired
    private UserMapper userMapper;

    @RequestMapping(value = "/toModuleList.do")
    public String toModuleList(HttpSession session, Model model, ConsoleRule consoleRule, PageInfo<ConsoleRule> page) {
        if (page.getPageSize() == 0) {
            page.setPageSize(10);
            page.setPageNum(1);
        }
        List<ConsoleRule> consoleRuleList = consoleRuleService.selectConsoleRule(consoleRule, page);
        page = new PageInfo<>(consoleRuleList);
        model.addAttribute("page", page);
        model.addAttribute("consoleRule", consoleRule);
        model.addAttribute("consoleRuleList", consoleRuleList);
        return "/console/moduleList";
    }


    @RequestMapping(value = "/toModuleAdd.do")
    public String toModuleAdd(HttpSession session, Model model, ConsoleRule consoleRule, PageInfo<ConsoleRule> page) {
        logger.info("去模块创建页面");
        List<ConsoleRule> consoleRuleList = consoleRuleService.selectConsoleRule1(consoleRule);
        model.addAttribute("consoleRuleList", consoleRuleList);
        model.addAttribute("consoleRule", consoleRule);
        return "/console/moduleAdd";
    }


    /**
     * 新增模块
     */
    @RequestMapping(value = "/moduleAdd", method = RequestMethod.POST)
    @ResponseBody
    public String moduleAdd(HttpSession session, HttpServletRequest request, ConsoleRule consoleRule) {
        logger.info("新增模块");
        // session 获取登录用户
        SessionUser sessionUser = SessionUser.get(session);
        try {

            consoleRule.setCreateTime(new Date());
            int a = consoleRuleService.insertConsoleRule(consoleRule);

            if (a == 1) {
                // 网CONSOLE_USER_RULE表里面插入数据
                ConsoleUserRule consoleUserRule = new ConsoleUserRule();
                consoleUserRule.setCreateTime(new Date());

                if ("1".equals(consoleRule.getType())) {//如果是添加系统菜单00-则自动分配admin权限
                    User userSys = new User();
                    userSys.setType("00");
                    userSys.setLoginName("admin");
                    userSys = userMapper.getUser(userSys);
                    consoleUserRule.setUserId(userSys.getId().toString());
                } else {
                    User user = userService.selectByLoginName(sessionUser.getLoginName());
                    consoleUserRule.setUserId(Long.toString(user.getId()));
                }

                //特殊处理
                int newConsoleRuleId = Integer.parseInt(consoleRule.getId());
//                consoleUserRule.setRuleId(String.valueOf(newConsoleRuleId - 1));   //不知为何要-1 ，上面拿到的ruleid就是保存的那个id
                consoleUserRule.setRuleId(String.valueOf(newConsoleRuleId ));
                int b = consoleUserRuleService.insertConsoleUserRule(consoleUserRule);
                if (b == 1) {
                    return "ok";
                } else {
                    return "error";
                }
            } else {
                return "error";
            }

        } catch (Exception e) {
            return "error";
        }

    }


    /**
     * 新增模块
     */
    @RequestMapping(value = "/deleteRow")
    @ResponseBody
    public String deleteRow(HttpSession session, HttpServletRequest request, ConsoleRule consoleRule) {
        logger.info("删除模块");

        int a = consoleRuleService.deleteByPrimaryKey(consoleRule);
        if (a == 1) {
            return "ok";
        } else {
            return "error";
        }

    }


    @RequestMapping(value = "/getConsoleRuleList.do")
    public void getConsoleRuleList(HttpSession session, Model model, ConsoleRule consoleRule,
                                   HttpServletResponse response) {
        logger.info("获取上级菜单列表");
        List<ConsoleRule> consoleRuleList = consoleRuleService.selectConsoleRule1(consoleRule);
        String jsonResult = JSON.toJSONString(consoleRuleList);
        renderData(response, jsonResult);
    }

    private void renderData(HttpServletResponse response, String data) {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter printWriter = null;
        try {
            printWriter = response.getWriter();
            printWriter.print(data);
        } catch (IOException ex) {

        } finally {
            if (null != printWriter) {
                printWriter.flush();
                printWriter.close();
            }
        }
    }


}
