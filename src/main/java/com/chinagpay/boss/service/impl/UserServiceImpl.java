package com.chinagpay.boss.service.impl;


import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chinagpay.boss.dao.zboss.UserMapper;
import com.chinagpay.boss.model.User;
import com.chinagpay.boss.model.UserRule;
import com.chinagpay.boss.model.zpay.CbMerchantOperator;
import com.chinagpay.boss.service.UserService;
//import com.chinagpay.boss.service.zpay.util.ZpayUtil;
import com.chinagpay.utils.common.StringUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;


    @Override
    public List<User> findUserList(User user, PageInfo<User> page) {
        PageHelper.startPage(page.getPageNum(), page.getPageSize());
        List<User> userList = userMapper.findUserList(user);
        return userList;
    }

    @Override
    public User selectByLoginName(String loginName) {
        return userMapper.selectByLoginName(loginName);
    }

	@Override
	public void insertUser(User user) {
		// TODO Auto-generated method stub
		userMapper.insertUser(user);
	}

	@Override
	public List<User> getAllUsers(User user,PageInfo<User> page) {
		PageHelper.startPage(page.getPageNum(), page.getPageSize());		
		return userMapper.selectUsers(user);
	}

	@Override
	public void editUser(User user) {
		userMapper.updateUserById(user);
	}

    /**
     * 测试多数据源  事务的方法
     */
//    @Override
//    public void test() {
//        User user = new User();
//        user.setLoginName("hby");
//        user.setLoginPwd("jjjjjjjj");
//        user.setRealName("hby");
//        user.setStatus("1");
//        user.setCreateLoginName("hhhhhh");
//        userMapper.insertUser(user);
////        int i = 1/0;
//        userSqlMapper.insertUser(user);
//    }


}
