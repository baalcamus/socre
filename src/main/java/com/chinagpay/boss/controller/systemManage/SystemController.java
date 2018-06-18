package com.chinagpay.boss.controller.systemManage;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chinagpay.boss.common.sessionuser.SessionUser;
import com.chinagpay.boss.common.util.Dthree;
import com.chinagpay.boss.common.util.Md5Util;
import com.chinagpay.boss.dao.zboss.ConsoleDepMapper;
import com.chinagpay.boss.dao.zboss.RuleMapper;
import com.chinagpay.boss.dao.zboss.UserMapper;
import com.chinagpay.boss.dao.zboss.UserRuleMapper;
//import com.chinagpay.boss.dao.zpay.MerUserInfMapper;
import com.chinagpay.boss.model.ConsoleDep;
import com.chinagpay.boss.model.Rule;
import com.chinagpay.boss.model.User;
import com.chinagpay.boss.model.UserRule;
import com.chinagpay.boss.model.zpay.MerUserInf;
import com.chinagpay.boss.service.UserService;
//import com.chinagpay.boss.service.zpay.util.ZpayUtil;
import com.github.pagehelper.PageInfo;


/**
 * 系统管理
 *
 * @author Administrator
 */
@Controller
@RequestMapping(value = "/systemManage")
public class SystemController {
	private static final Logger logger = LogManager.getLogger(SystemController.class);

    @Autowired
    private UserMapper userMapper;
    
//    @Autowired
//    private MerUserInfMapper merUserInfMapper;
    
    
    @Autowired
    private RuleMapper ruleMapper;
    @Autowired
    private UserRuleMapper userRuleMapper;
    @Autowired
    private ConsoleDepMapper consoleDepMapper;
    @Autowired
    private UserService userService;


    /**
     * 去用户创建页面
     *
     * @return
     */
    @RequestMapping(value = "/toUserManage")
    public String toUserManage(HttpSession session, ModelMap model) {
        logger.info("去用户创建页面");

        //查询现有部门
            List<ConsoleDep> consoleDepList = consoleDepMapper.findConsoleDepList();
        model.put("consoleDepList", consoleDepList);

        //查询权限
//      d.add(1,0,"<input type='checkbox' name='1'>系统管理"); 
//		d.add(2,1,'用户管理'); 
//		d.add(3,2,'用户创建'); 
//		d.add(4,2,'用户查询'); 
//		d.add(5,3,'新增');
//		d.add(6,4,'修改状态');
        SessionUser sessionUser = SessionUser.get(session);
        List<Rule> ruleList = sessionUser.getRuleList();
        List<Dthree> dThreeList = new ArrayList<Dthree>();
        for (int i = 0; i < ruleList.size(); i++) {
            Dthree dThree = new Dthree();
            //----test --------------------------------------------------
            if (ruleList.get(i).getMark() != null & ruleList.get(i).getRuleLevel() != null & ruleList.get(i).getRuleLevelParent() != null) {
                if (ruleList.get(i).getRuleLevel() == "1") {
                    dThree.setId(ruleList.get(i).getId());//节点id
                    dThree.setPid("0");//上级父节点id
                    dThree.setName(ruleList.get(i).getMark());//名字
                } else {
                    dThree.setId(ruleList.get(i).getId());
                    dThree.setPid(ruleList.get(i).getRuleLevelParent());
                    dThree.setName(ruleList.get(i).getMark());
                }
                dThreeList.add(dThree);
            }
        }
        model.put("dThreeList", dThreeList);

//		for(int i=0;i<dThreeList.size();i++){
//			logger.info(dThreeList.get(i).getId()+","+dThreeList.get(i).getPid()+","+dThreeList.get(i).getName());
//			
//		}


        return "/systemManage/userManage";
    }

    /**
     * 新增操作员动作
     */
    @RequestMapping(value = "/toAdd", method = RequestMethod.POST)
    @ResponseBody
    public String toAddUser(HttpSession session, HttpServletRequest request, User user) {
        logger.info("新增操作员");
        //session 获取登录用户
        SessionUser sessionUser = SessionUser.get(session);
        user.setCreateLoginName(sessionUser.getLoginName());
        user.setType("00");
        try {
            int count = userMapper.getUserCount(user);
            if (count > 0) {
                logger.info("重复");
                return "repeat";
            } else {
                user.setStatus("1");
                user.setLoginName(user.getLoginName().trim());
                user.setRealName(user.getRealName().trim());
                user.setLoginPwd(Md5Util.md5Hex(user.getLoginPwd().trim()));
                int insertUser = userMapper.insertUser(user);
                if (insertUser <= 0) {
                    logger.info("添加失败");
                    return "error";
                }
                //权限
                Long id = userMapper.getUser(user).getId();
                user.setRuleArr(user.getRuleArr().substring(0, user.getRuleArr().length() - 1));
                String ruleArr[] = user.getRuleArr().split(",");
                UserRule userRule = new UserRule();
                userRule.setUserId(id);
                int insertUserRule = 0;
                for (int i = 0; i < ruleArr.length; i++) {
                    userRule.setRuleId(ruleArr[i]);
                    userRuleMapper.insertUserRule(userRule);
                    insertUserRule++;
                }
                if (insertUserRule > 0) {
                    logger.info("成功");
                    return "ok";
                } else {
                    return "error";
                }
            }

        } catch (Exception e) {
            return "error";
        }

    }


//	/**
//	 * 检测用户账号唯一性
//	 * @return
//	 */
//	@RequestMapping(value = "/existLoginName")
//	@ResponseBody  
//	public String existLoginName(HttpServletRequest request,User user,ModelMap model) {
//			SessionUser ssUser = SessionUser.get( request.getSession() );
//			Long mids=Long.parseLong(String.valueOf(ssUser.getBankBehalfMerConfig().getMerId()));
//			if (null != user) {
//				user.setMerId(mids);
//				user = userMapper.getByIUser(user);
//			}
//			logger.info("验证唯一");
//			user.setMerId("10000010");
//			user = userMapper.getUser(user);
//			if (user != null ) {
//				  return "success";
//			} else {
//				  return "fail";
//			}
//		}


    /**
     * 去用户查询
     *
     * @return
     */
    @RequestMapping(value = "/toUserSearch")
    public String toUserSearch(HttpSession session, Model model, User user, PageInfo<User> page) {
        logger.info("去用户查询");
        SessionUser sessionUser = SessionUser.get(session);
        if(!"admin".equals(sessionUser.getLoginName()))
        {
            user.setCreateLoginName(sessionUser.getLoginName());
        }
        user.setType("00");
        if (page.getPageSize() == 0) {
            page.setPageSize(10);
            page.setPageNum(1);
        }
        List<User> userList = userService.findUserList(user, page);
        page = new PageInfo<>(userList);
        model.addAttribute("page", page);
        return "/systemManage/userSearch";
    }


    /**
     * 修改用户动作
     *
     * @param userId
     * @param status
     */
    @RequestMapping(value = "/toModifiUser", method = RequestMethod.POST)
    @ResponseBody
    public String toModifiUser(HttpSession session, User user) {
        logger.info("修改用户状态");
        SessionUser sessionUser = SessionUser.get(session);
        user.setUpdateLoginName(sessionUser.getLoginName());
        user.setType("00");
        try {
            userMapper.updateStatus(user);
            return "ok";
        } catch (Exception e) {
            return "fail";
        }

    }


    /**
     * 系统公告页面
     *
     * @param session
     * @param user
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "/toAnnouncement")
    public String toAnnouncement(HttpSession session, User user, ModelMap model, HttpServletRequest request) {
        logger.info("去用系统公告页面");


        return "/systemManage/announcement";
    }

    /**
     * 公告发布动作
     *
     * @param session
     * @param user
     * @param model
     * @param request
     */
    @RequestMapping(value = "/toPublishAnnouncement")
    public void toPublishAnnouncement(HttpSession session, User user, ModelMap model, HttpServletRequest request) {
        logger.info("去用系统公告页面");


    }


    /**
     * 去用户修改
     *
     * @param session
     * @param model
     * @param loginName
     * @param realName
     * @return
     */
    @RequestMapping(value = "/toUserChange.do")
    public String toUserChange(HttpSession session, ModelMap model, String loginName, String realName) {
        logger.info("去用户修改");
//得到登录账号的所有权限
        try {
            realName =new String(realName.getBytes("iso8859-1"),"UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        Map<String, String> ruleMap = new HashMap<String, String>();
        SessionUser sessionUser = SessionUser.get(session);
        User user = new User();
        user.setCreateLoginName(sessionUser.getLoginName());//获取创建人
        //user.setMerId(Long.toString(sessionUser.getMerID()));//获取商户号
        //查询现有部门
        List<ConsoleDep> consoleDepList = consoleDepMapper.findConsoleDepList();
        model.put("consoleDepList", consoleDepList);
//        List<Rule> ruleList = sessionUser.getRuleList();//获取权限
        Rule rule = new Rule();
        rule.setType("1");
        List<Rule> ruleList = ruleMapper.getRule(rule);

        List<Dthree> dThreeList = new ArrayList<Dthree>(); //配置dtree
        for (int i = 0; i < ruleList.size(); i++) {
            Dthree dThree = new Dthree();
            if (ruleList.get(i).getMark() != null & ruleList.get(i).getRuleLevel() != null & ruleList.get(i).getRuleLevelParent() != null) {
                if (ruleList.get(i).getRuleLevel() == "1") {
                    dThree.setId(ruleList.get(i).getId());//节点id
                    dThree.setPid("0");//上级父节点id
                    dThree.setName(ruleList.get(i).getMark());//名字
                } else {
                    dThree.setId(ruleList.get(i).getId());
                    dThree.setPid(ruleList.get(i).getRuleLevelParent());
                    dThree.setName(ruleList.get(i).getMark());
                }
                dThreeList.add(dThree);
            }
        }

//得到该用户现有的权限
        User user2 = new User();
        user2.setType("00");
        user2.setLoginName(loginName);
        user2 = userMapper.getUser(user2);
        List<Rule> ruleList2 = ruleMapper.getRuleByUserId(user2.getId());
        logger.info(ruleList2.size());
        List ruleSelectList = new ArrayList();
        for (int i = 0; i < ruleList2.size(); i++) {
            ruleSelectList.add(ruleList2.get(i).getId());
        }
        for (int i = 0; i < ruleList2.size(); i++) {
            ruleSelectList.add(ruleList2.get(i).getRuleLevelParent());
        }


        model.addAttribute("consoleDepList", consoleDepList);
        model.addAttribute("ruleSelectList", ruleSelectList);
        model.addAttribute("dThreeList", dThreeList);
        model.addAttribute("loginName", loginName);
        model.addAttribute("realName", realName);
        if (user2.getConsoleDepId() != null) {
            model.addAttribute("consoleDepId", user2.getConsoleDepId());
        }

        if (user2.getId() != null) {
            model.addAttribute("id", user2.getId());
        }
        return "/systemManage/userChange";
    }


    /**
     * 用户修改动作
     *
     * @param session
     * @param user
     * @return
     */
    @RequestMapping(value = "/changeUser", method = RequestMethod.POST)
    @ResponseBody
    public String changeUser(HttpSession session, User user) {
        logger.info("用户修改动作");
//		try{
        if ("******".equals(user.getLoginPwd())) {
            user.setLoginPwd("");
        } else {
            user.setLoginPwd(Md5Util.md5Hex(user.getLoginPwd().trim()));
        }
        user.setType("00");
        user.setLoginName(user.getLoginName().trim());
        user.setRealName(user.getRealName().trim());
        user.setConsoleDepId(user.getConsoleDepId().trim());
        user.setId(user.getId());
        SessionUser sessionUser = SessionUser.get(session);
        if (sessionUser.getLoginName() != null) {

            user.setUpdateLoginName(sessionUser.getLoginName());
        }
        user.setUpdateTime(new Date());
        userMapper.updateUserById(user);
        Long userId = user.getId();

//修改权限
//删除原有userRule

        UserRule oldUserRule = new UserRule();
        oldUserRule.setUserId(userId);
        userRuleMapper.deleteUserRule(oldUserRule);
//新增userRule	    
        user.setRuleArr(user.getRuleArr().substring(0, user.getRuleArr().length() - 1));
        String ruleArr[] = user.getRuleArr().split(",");
        UserRule userRule = new UserRule();
        userRule.setUserId(userId);
        int insertUserRule = 0;
        for (int i = 0; i < ruleArr.length; i++) {
            userRule.setRuleId(ruleArr[i]);
            userRuleMapper.insertUserRule(userRule);
            insertUserRule++;
        }
        if (insertUserRule > 0) {
            return "ok";
        } else {

            return "error";
        }
//	  	}catch(Exception e){
//	  		logger.info(e);
//	  		return "error";
//	  	}


    }
    
    
    
//    @RequestMapping(value = "/udpateConsoleUser")
//    @ResponseBody
//    public String udpateConsoleUser(HttpSession session) throws IOException {
//
//
//
//    	/*
//    	 * 1.根据excel提供商编，查询老商户用户表，取出（登陆名email、姓名、商编）密文
//    	 *
//    	 * 2.使用解密机进行密文解密-----明文
//    	 * 3.以上两步操作得到当前商户的有效信息（商编、登录名、姓名）
//    	 * 4.根据商编对应生成默认当前商户登陆密码MD5格式（商户编码+001）
//    	 * 5.获取商户默认角色ID（all）
//    	 * 6.两种选择（生成sql文件、直接执行sql语句）
//    	 *      insert into console_user(序列id、商编、登录名、姓名、MD5生成密码) values(?,?,?,?,?);
//    	 *      for(根据默认角色列表)
//    	 *      {
//    	 *      	insert into console_user_rule(序列id、建立时间、更新时间、用户id、角色id) values(?,?,?,?,?);
//    	 *      }
//    	 *
//    	 *
//    	*/
//    	 List<MerUserInf> lists = merUserInfMapper.findByMap(null);
//    	 File file = new File("d://sql.txt");
//    	 File file1 = new File("d://info.txt");
//    	 FileWriter fw = new FileWriter(file);
//    	 FileWriter fw1 = new FileWriter(file1);
//
//    	 String [] rules = {"603","605","631","641","633","635","639","637","647","649","629","627","623","625","613","617"};
//    	 for(MerUserInf mui:lists){
////    		 System.out.println(mui.getMufCstno()+"   "+mui.getMufEmail()+"  "+mui.getMufUsername());
//    		 String mufEmail = ZpayUtil.decryptByWorkKey(mui.getMufEmail().substring(0,mui.getMufEmail().indexOf("|")));
//    		 String mufUsername = ZpayUtil.decryptByWorkKey(mui.getMufUsername().substring(0,mui.getMufUsername().indexOf("|")));
//    		 String mufNo = mui.getMufCstno();
//    		 String loginPwd = Md5Util.md5Hex(mufNo+"001");
//    		 System.out.println(mui.getMufCstno()+"   "+mufEmail+"  "+mufUsername);
//    		 String sql = "insert into console_user_test(id,login_name,real_name,login_pwd,create_time,status,mer_id,create_login_name,type)"
//    		 		+ "values(ConsoleUser_seq.Nextval,'"+mufEmail+"','"+mufUsername+"','"+loginPwd+"',sysdate,'0','"+mufNo+"','admin','1')";
//    		 fw.write(sql);
//    		 fw.write("\r\n");
//    		 fw1.write(mufNo+"|"+mufUsername+"|"+mufEmail+"|"+loginPwd);
//    		 fw1.write("\r\n");
//    		 fw.flush();
//    		 fw1.flush();
//    	 }
//    	 fw.close();
//    	 fw1.close();
//
//    	return null;
//    }


    public static void main(String arug[]) {

        logger.info(Md5Util.md5Hex("111111"));
    }


}
