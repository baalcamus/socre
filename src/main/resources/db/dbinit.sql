insert into CONSOLE_USER (ID, LOGIN_NAME, REAL_NAME, LOGIN_PWD, CONSOLE_DEP_ID, CREATE_TIME, UPDATE_TIME, STATUS, MER_ID, CREATE_LOGIN_NAME, UPDATE_LOGIN_NAME, TYPE, PAY_PWD)
values ('1', 'admin', '超级管理员', '96e79218965eb72c92a549dd5a330112', '1', to_date('05-07-2016 15:11:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-07-2016 13:51:58', 'dd-mm-yyyy hh24:mi:ss'), '1', null, 'admin', 'admin', '00', null);



insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('80', to_date('14-07-2016 11:11:20', 'dd-mm-yyyy hh24:mi:ss'), null, 'provisions/toBankManageList', '备付金银行管理', '2', '78', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('94', to_date('15-07-2016 17:52:57', 'dd-mm-yyyy hh24:mi:ss'), null, 'crossBorderTradeManager', '跨境交易管理', '1', '1', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('84', to_date('14-07-2016 11:15:46', 'dd-mm-yyyy hh24:mi:ss'), null, 'provisions/toFileManageList', '报备文件管理', '2', '78', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('96', to_date('15-07-2016 18:04:26', 'dd-mm-yyyy hh24:mi:ss'), null, 'crossBorderTradeManager/exchangeRateQuery', '汇率查询', '2', '94', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('120', to_date('21-07-2016 17:46:27', 'dd-mm-yyyy hh24:mi:ss'), null, 'cbTrade/mctRemitNotifyQuery', '商户汇款通知', '2', '92', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('122', to_date('21-07-2016 19:16:16', 'dd-mm-yyyy hh24:mi:ss'), null, 'provisions/queryTableDetail', '查看报表明细', '3', '84', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('140', to_date('28-07-2016 16:01:32', 'dd-mm-yyyy hh24:mi:ss'), null, 'reportStatistics', '报表统计', '1', '1', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('142', to_date('28-07-2016 16:03:41', 'dd-mm-yyyy hh24:mi:ss'), null, 'reportStatistics/selectYearReportOfBusinessList', '业务统计年报', '2', '140', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('1', to_date('07-06-2016 15:15:27', 'dd-mm-yyyy hh24:mi:ss'), null, 'main/toMain', '主页', '1', '0', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('15', to_date('07-06-2016 15:12:38', 'dd-mm-yyyy hh24:mi:ss'), null, 'console/moduleAdd', '创建模块', '4', '7', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('16', to_date('07-06-2016 15:12:38', 'dd-mm-yyyy hh24:mi:ss'), null, 'console/getConsoleRuleList', '获取上级菜单列表', '4', '7', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('60', to_date('07-07-2016 10:53:36', 'dd-mm-yyyy hh24:mi:ss'), null, 'announce/announceAdd', '添加公告', '4', '10', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('64', to_date('07-07-2016 10:56:04', 'dd-mm-yyyy hh24:mi:ss'), null, 'announce/toAnnounceChange', '修改公告页', '4', '11', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('66', to_date('07-07-2016 10:56:35', 'dd-mm-yyyy hh24:mi:ss'), null, 'announce/toAnnounceDetail', '公告详情页', '4', '11', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('68', to_date('07-07-2016 10:59:26', 'dd-mm-yyyy hh24:mi:ss'), null, 'announce/announceUpdate', '修改公告', '5', '66', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('70', to_date('07-07-2016 11:01:25', 'dd-mm-yyyy hh24:mi:ss'), null, 'announce/download', '公告下载附件', '5', '66', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('72', to_date('07-07-2016 11:04:28', 'dd-mm-yyyy hh24:mi:ss'), null, 'announce/changeStatus', '修改公告状态', '4', '66', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('78', to_date('14-07-2016 10:33:41', 'dd-mm-yyyy hh24:mi:ss'), null, 'provisions/provisionsManage', '备付金管理', '1', '1', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('88', to_date('14-07-2016 17:23:23', 'dd-mm-yyyy hh24:mi:ss'), null, 'provisions/toBankAdd', '银行注册', '3', '80', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('92', to_date('15-07-2016 17:27:33', 'dd-mm-yyyy hh24:mi:ss'), null, 'accountManager', '账户管理', '1', '1', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('116', to_date('20-07-2016 15:06:09', 'dd-mm-yyyy hh24:mi:ss'), null, 'provisions/queryTaskList', '任务情况查询', '3', '84', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('124', to_date('22-07-2016 13:11:56', 'dd-mm-yyyy hh24:mi:ss'), null, 'provisions/toAddTable', '添加报表明细数据', '4', '122', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('126', to_date('22-07-2016 17:48:45', 'dd-mm-yyyy hh24:mi:ss'), null, 'provisions/addTable', '添加明细', '4', '122', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('130', to_date('25-07-2016 17:20:04', 'dd-mm-yyyy hh24:mi:ss'), null, 'provisions/toModifyTable', '修改报表明细数据', '4', '122', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('132', to_date('25-07-2016 17:21:09', 'dd-mm-yyyy hh24:mi:ss'), null, 'provisions/modifyTable', '修改明细', '4', '122', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('134', to_date('25-07-2016 17:21:38', 'dd-mm-yyyy hh24:mi:ss'), null, 'provisions/deleteTable', '删除报表明细', '4', '122', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('2', to_date('07-06-2016 15:12:38', 'dd-mm-yyyy hh24:mi:ss'), null, 'systemManage', '系统管理', '1', '1', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('3', to_date('07-06-2016 15:12:38', 'dd-mm-yyyy hh24:mi:ss'), null, 'systemManage/userManage', '用户管理', '2', '2', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('4', to_date('07-06-2016 15:12:38', 'dd-mm-yyyy hh24:mi:ss'), null, 'systemManage/toUserSearch', '用户查询', '3', '2', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('5', to_date('07-06-2016 15:12:38', 'dd-mm-yyyy hh24:mi:ss'), null, 'console/moduleAddManage', '模块管理', '2', '2', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('6', to_date('07-06-2016 15:12:38', 'dd-mm-yyyy hh24:mi:ss'), null, 'systemManage/toUserManage', '用户创建', '3', '3', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('7', to_date('07-06-2016 15:12:38', 'dd-mm-yyyy hh24:mi:ss'), null, 'console/toModuleAdd', '模块创建', '3', '5', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('8', to_date('07-06-2016 15:12:38', 'dd-mm-yyyy hh24:mi:ss'), null, 'console/toModuleList', '模块查询', '3', '5', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('9', to_date('07-06-2016 15:12:38', 'dd-mm-yyyy hh24:mi:ss'), null, 'announce/announceAdd', '公告管理', '2', '2', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('10', to_date('07-06-2016 15:12:38', 'dd-mm-yyyy hh24:mi:ss'), null, 'announce/toAnnounceAdd', '公告创建', '3', '9', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('11', to_date('07-06-2016 15:12:38', 'dd-mm-yyyy hh24:mi:ss'), null, 'announce/toAnnounceList', '公告查询', '3', '9', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('17', to_date('06-07-2016 14:14:33', 'dd-mm-yyyy hh24:mi:ss'), null, 'console/deleteRow', '模块查询-删除', '4', '8', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('90', to_date('15-07-2016 09:39:53', 'dd-mm-yyyy hh24:mi:ss'), null, 'provisions/bankAdd', '注册银行', '4', '88', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('52', to_date('06-07-2016 14:56:03', 'dd-mm-yyyy hh24:mi:ss'), null, 'systemManage/toAdd', '创建用户', '4', '6', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('100', to_date('18-07-2016 13:36:43', 'dd-mm-yyyy hh24:mi:ss'), null, 'cbAccount/selectCbAccountList', '跨境账户查询', '2', '92', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('102', to_date('18-07-2016 16:16:17', 'dd-mm-yyyy hh24:mi:ss'), null, 'provisions/toAccountList', '查询账户明细', '3', '80', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('104', to_date('18-07-2016 16:18:48', 'dd-mm-yyyy hh24:mi:ss'), null, 'provisions/toAccountAdd', '账户注册', '3', '80', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('106', to_date('18-07-2016 16:19:55', 'dd-mm-yyyy hh24:mi:ss'), null, 'provisions/accountAdd', '新增账户', '4', '104', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('108', to_date('18-07-2016 16:21:44', 'dd-mm-yyyy hh24:mi:ss'), null, 'provisions/modifyAccountStatus', '更改账户状态', '4', '102', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('128', to_date('22-07-2016 17:53:42', 'dd-mm-yyyy hh24:mi:ss'), null, 'provisions/exportTxT', '备付金文件下载', '4', '124', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('12', to_date('07-06-2016 15:12:38', 'dd-mm-yyyy hh24:mi:ss'), null, 'excelController/exportExcel', '导出功能', '2', '2', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('13', to_date('07-06-2016 15:12:38', 'dd-mm-yyyy hh24:mi:ss'), null, 'main/toChangeLoginPwd', '修改密码页面', '2', '1', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('14', to_date('07-06-2016 15:12:38', 'dd-mm-yyyy hh24:mi:ss'), null, 'main/changePwd', '修改密码', '3', '13', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('54', to_date('07-07-2016 09:34:50', 'dd-mm-yyyy hh24:mi:ss'), null, 'systemManage/toModifiUser', '用户关闭', '4', '4', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('56', to_date('07-07-2016 09:35:54', 'dd-mm-yyyy hh24:mi:ss'), null, 'systemManage/toUserChange', '修改用户页', '4', '4', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('58', to_date('07-07-2016 09:36:17', 'dd-mm-yyyy hh24:mi:ss'), null, 'systemManage/changeUser', '修改用户', '5', '56', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('138', to_date('26-07-2016 15:09:34', 'dd-mm-yyyy hh24:mi:ss'), null, 'cbMerchant/checkCompanyEmail', '检查公司邮箱是否存在', '3', '112', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('110', to_date('19-07-2016 15:39:33', 'dd-mm-yyyy hh24:mi:ss'), null, 'merchantManager', '商户管理', '1', '1', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('112', to_date('19-07-2016 15:40:20', 'dd-mm-yyyy hh24:mi:ss'), null, 'cbMerchant/toCreateCbMerchant', '商户录入', '2', '110', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('118', to_date('21-07-2016 13:09:19', 'dd-mm-yyyy hh24:mi:ss'), null, 'cbMerchant/createCbMerchant', '商户录入-录入', '3', '112', '1');

insert into CONSOLE_RULE (ID, CREATE_TIME, UPDATE_TIME, CODE, MARK, RULE_LEVEL, RULE_LEVEL_PARENT, TYPE)
values ('136', to_date('26-07-2016 14:06:00', 'dd-mm-yyyy hh24:mi:ss'), null, 'cbTrade/mctRemitNotify/verify', '汇款通知审核', '3', '120', '1');


insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('71', to_date('15-07-2016 17:52:57', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '94');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('72', to_date('15-07-2016 18:04:26', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '96');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('84', to_date('21-07-2016 17:46:27', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '120');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('85', to_date('21-07-2016 19:16:16', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '122');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('94', to_date('28-07-2016 16:01:32', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '140');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('95', to_date('28-07-2016 16:03:41', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '142');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('202', to_date('14-07-2016 17:09:49', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '14');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('203', to_date('14-07-2016 17:09:49', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '2');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('204', to_date('14-07-2016 17:09:49', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '12');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('205', to_date('14-07-2016 17:09:49', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '9');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('206', to_date('14-07-2016 17:09:49', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '11');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('207', to_date('14-07-2016 17:09:49', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '64');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('208', to_date('14-07-2016 17:09:49', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '66');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('209', to_date('14-07-2016 17:09:49', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '68');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('210', to_date('14-07-2016 17:09:49', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '70');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('211', to_date('14-07-2016 17:09:49', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '72');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('212', to_date('14-07-2016 17:09:49', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '10');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('213', to_date('14-07-2016 17:09:50', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '60');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('214', to_date('14-07-2016 17:09:50', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '5');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('215', to_date('14-07-2016 17:09:50', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '8');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('216', to_date('14-07-2016 17:09:50', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '17');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('217', to_date('14-07-2016 17:09:50', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '7');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('218', to_date('14-07-2016 17:09:50', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '15');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('219', to_date('14-07-2016 17:09:50', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '16');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('220', to_date('14-07-2016 17:09:50', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '4');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('221', to_date('14-07-2016 17:09:50', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '54');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('222', to_date('14-07-2016 17:09:50', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '56');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('223', to_date('14-07-2016 17:09:50', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '58');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('224', to_date('14-07-2016 17:09:50', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '3');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('225', to_date('14-07-2016 17:09:50', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '6');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('226', to_date('14-07-2016 17:09:50', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '52');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('227', to_date('14-07-2016 17:09:50', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '78');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('200', to_date('14-07-2016 17:09:49', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '1');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('201', to_date('14-07-2016 17:09:49', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '13');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('228', to_date('14-07-2016 17:09:50', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '80');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('229', to_date('14-07-2016 17:09:50', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '86');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('230', to_date('14-07-2016 17:09:50', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '84');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('68', to_date('14-07-2016 17:23:23', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '88');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('70', to_date('15-07-2016 17:27:33', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '92');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('82', to_date('20-07-2016 15:06:10', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '116');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('86', to_date('22-07-2016 13:11:56', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '124');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('87', to_date('22-07-2016 17:48:45', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '126');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('89', to_date('25-07-2016 17:20:05', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '130');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('90', to_date('25-07-2016 17:21:09', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '132');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('91', to_date('25-07-2016 17:21:39', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '134');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('74', to_date('18-07-2016 13:36:43', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '100');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('69', to_date('15-07-2016 09:39:53', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '90');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('73', to_date('18-07-2016 13:28:51', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '98');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('75', to_date('18-07-2016 16:16:17', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '102');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('76', to_date('18-07-2016 16:18:48', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '104');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('77', to_date('18-07-2016 16:19:55', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '106');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('78', to_date('18-07-2016 16:21:45', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '108');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('88', to_date('22-07-2016 17:53:42', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '128');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('79', to_date('19-07-2016 15:39:33', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '110');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('80', to_date('19-07-2016 15:40:20', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '112');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('81', to_date('19-07-2016 16:07:54', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '114');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('83', to_date('21-07-2016 13:09:19', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '118');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('92', to_date('26-07-2016 14:06:01', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '136');

insert into CONSOLE_USER_RULE (ID, CREATE_TIME, UPDATE_TIME, USER_ID, RULE_ID)
values ('93', to_date('26-07-2016 15:09:34', 'dd-mm-yyyy hh24:mi:ss'), null, '1', '138');


insert into CONSOLE_BUSINESS_REPORT (ID, STATISTICS_DATE, STATISTICS_YEAR, ADD_MER_COUNT, SUM_MER_COUNT, BUSINESS_TYPE, FUND_FLOW, TOTAL_TRADE, TOTAL_AMOUNT)
values (10, to_date('31-12-2015', 'dd-mm-yyyy'), '2015', 98, 648, 'PAY', 'IN', 28.17, 1469526.49);

insert into CONSOLE_BUSINESS_REPORT (ID, STATISTICS_DATE, STATISTICS_YEAR, ADD_MER_COUNT, SUM_MER_COUNT, BUSINESS_TYPE, FUND_FLOW, TOTAL_TRADE, TOTAL_AMOUNT)
values (9, to_date('01-01-2015', 'dd-mm-yyyy'), '2015', 0, 757, 'PAY', 'IN', 0, 0);

insert into CONSOLE_BUSINESS_REPORT (ID, STATISTICS_DATE, STATISTICS_YEAR, ADD_MER_COUNT, SUM_MER_COUNT, BUSINESS_TYPE, FUND_FLOW, TOTAL_TRADE, TOTAL_AMOUNT)
values (8, to_date('31-12-2014', 'dd-mm-yyyy'), '2014', 28, 757, 'PAY', 'IN', 1.3, 2033.64);

insert into CONSOLE_BUSINESS_REPORT (ID, STATISTICS_DATE, STATISTICS_YEAR, ADD_MER_COUNT, SUM_MER_COUNT, BUSINESS_TYPE, FUND_FLOW, TOTAL_TRADE, TOTAL_AMOUNT)
values (7, to_date('01-01-2014', 'dd-mm-yyyy'), '2014', 0, 134, 'PAY', 'IN', 0, 0);

insert into CONSOLE_BUSINESS_REPORT (ID, STATISTICS_DATE, STATISTICS_YEAR, ADD_MER_COUNT, SUM_MER_COUNT, BUSINESS_TYPE, FUND_FLOW, TOTAL_TRADE, TOTAL_AMOUNT)
values (6, to_date('31-12-2013', 'dd-mm-yyyy'), '2013', 134, 2261, 'PAY', 'IN', 152.29, 22647.33);

insert into CONSOLE_BUSINESS_REPORT (ID, STATISTICS_DATE, STATISTICS_YEAR, ADD_MER_COUNT, SUM_MER_COUNT, BUSINESS_TYPE, FUND_FLOW, TOTAL_TRADE, TOTAL_AMOUNT)
values (5, to_date('01-01-2013', 'dd-mm-yyyy'), '2013', 0, 2127, 'PAY', 'IN', 0, 0);

insert into CONSOLE_BUSINESS_REPORT (ID, STATISTICS_DATE, STATISTICS_YEAR, ADD_MER_COUNT, SUM_MER_COUNT, BUSINESS_TYPE, FUND_FLOW, TOTAL_TRADE, TOTAL_AMOUNT)
values (4, to_date('31-12-2012', 'dd-mm-yyyy'), '2012', 2127, 2127, 'PAY', 'IN', 121.46, 26036.23);

insert into CONSOLE_BUSINESS_REPORT (ID, STATISTICS_DATE, STATISTICS_YEAR, ADD_MER_COUNT, SUM_MER_COUNT, BUSINESS_TYPE, FUND_FLOW, TOTAL_TRADE, TOTAL_AMOUNT)
values (3, to_date('01-01-2012', 'dd-mm-yyyy'), '2012', 0, 0, 'PAY', 'IN', 0, 0);

insert into CONSOLE_BUSINESS_REPORT (ID, STATISTICS_DATE, STATISTICS_YEAR, ADD_MER_COUNT, SUM_MER_COUNT, BUSINESS_TYPE, FUND_FLOW, TOTAL_TRADE, TOTAL_AMOUNT)
values (2, to_date('31-12-2011', 'dd-mm-yyyy'), '2011', 0, 0, 'PAY', 'IN', 0, 0);

insert into CONSOLE_BUSINESS_REPORT (ID, STATISTICS_DATE, STATISTICS_YEAR, ADD_MER_COUNT, SUM_MER_COUNT, BUSINESS_TYPE, FUND_FLOW, TOTAL_TRADE, TOTAL_AMOUNT)
values (1, to_date('01-01-2011', 'dd-mm-yyyy'), '2011', 0, 0, 'PAY', 'IN', 0, 0);


insert into CONSOLE_BANK_DATA (BANK_NAME, SHORT_NAME)
values ('工商银行', 'ICBC');

insert into CONSOLE_BANK_DATA (BANK_NAME, SHORT_NAME)
values ('光大银行', 'CEB');

insert into CONSOLE_BANK_DATA (BANK_NAME, SHORT_NAME)
values ('民生银行', 'CMBC');

insert into CONSOLE_BANK_DATA (BANK_NAME, SHORT_NAME)
values ('招商银行', 'CMB');

insert into CONSOLE_BANK_DATA (BANK_NAME, SHORT_NAME)
values ('浦发银行', 'SPDB');

insert into CONSOLE_BANK_DATA (BANK_NAME, SHORT_NAME)
values ('交通银行', 'BCM');

insert into CONSOLE_BANK_DATA (BANK_NAME, SHORT_NAME)
values ('农业银行', 'ABC');

insert into CONSOLE_BANK_DATA (BANK_NAME, SHORT_NAME)
values ('建设银行', 'CCB');

insert into CONSOLE_BANK_DATA (BANK_NAME, SHORT_NAME)
values ('中国银行', 'BOC');

insert into CONSOLE_BANK_DATA (BANK_NAME, SHORT_NAME)
values ('兴业银行', 'CIB');

insert into CONSOLE_BANK_DATA (BANK_NAME, SHORT_NAME)
values ('广东发展银行', 'GDB');

insert into CONSOLE_BANK_DATA (BANK_NAME, SHORT_NAME)
values ('华夏银行', 'Huaxia Bank');

insert into CONSOLE_BANK_DATA (BANK_NAME, SHORT_NAME)
values ('中信银行', 'China CITIC Bank');

insert into CONSOLE_BANK_DATA (BANK_NAME, SHORT_NAME)
values ('深圳发展银行', 'SDB');
