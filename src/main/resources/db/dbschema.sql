-- Create table 用户表
create table CONSOLE_USER
(
  id                VARCHAR2(20),
  login_name        VARCHAR2(50),
  real_name         VARCHAR2(64),
  login_pwd         VARCHAR2(128),
  console_dep_id    VARCHAR2(20),
  create_time       DATE,
  update_time       DATE,
  status            VARCHAR2(1),
  mer_id            VARCHAR2(20),
  create_login_name VARCHAR2(20),
  update_login_name VARCHAR2(20),
  type              VARCHAR2(20),
  pay_pwd           VARCHAR2(128)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    minextents 1
    maxextents unlimited
  );


-- Create table   角色表
create table CONSOLE_RULE
(
  id                VARCHAR2(20) not null,
  create_time       DATE,
  update_time       DATE,
  code              VARCHAR2(50),
  mark              VARCHAR2(50),
  rule_level        VARCHAR2(20),
  rule_level_parent VARCHAR2(20),
  type              VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    minextents 1
    maxextents unlimited
  );


-- Create table  用户角色关系表
create table CONSOLE_USER_RULE
(
  id          VARCHAR2(20),
  create_time DATE,
  update_time DATE,
  user_id     VARCHAR2(20),
  rule_id     VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    minextents 1
    maxextents unlimited
  );

-- Create table  部门表
create table CONSOLE_DEP
(
  id         VARCHAR2(10),
  department VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    minextents 1
    maxextents unlimited
  );




-- Create table  商户录入记录
create table CONSOLE_MERCHANT_ENTRY_RECORD
(
  id          NUMBER,
  flow_number VARCHAR2(20),
  merchant_no VARCHAR2(20),
  create_time DATE,
  creator     NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table
comment on table CONSOLE_MERCHANT_ENTRY_RECORD
  is '商户录入记录';
-- Add comments to the columns
comment on column CONSOLE_MERCHANT_ENTRY_RECORD.id
  is '主键';
comment on column CONSOLE_MERCHANT_ENTRY_RECORD.flow_number
  is '时间戳';
comment on column CONSOLE_MERCHANT_ENTRY_RECORD.merchant_no
  is '商户号';
comment on column CONSOLE_MERCHANT_ENTRY_RECORD.create_time
  is '创建事件';
comment on column CONSOLE_MERCHANT_ENTRY_RECORD.creator
  is '创建人';


-- Create sequence   上面的ID
create sequence SEQ_CONSOLE_MER_ENTRY_RECORD
minvalue 1
maxvalue 999999999999999999
start with 80
increment by 1
cache 20
order;

-- Create table   银行数据
create table CONSOLE_BANK_DATA
(
  bank_name  VARCHAR2(50),
  short_name VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table
comment on table CONSOLE_BANK_DATA
  is '银行数据';
-- Add comments to the columns
comment on column CONSOLE_BANK_DATA.bank_name
  is '银行名称';
comment on column CONSOLE_BANK_DATA.short_name
  is '缩写';



-- Create table 业务统计报表
create table CONSOLE_BUSINESS_REPORT
(
  id              NUMBER,
  statistics_date DATE,
  statistics_year VARCHAR2(10),
  add_mer_count   NUMBER,
  sum_mer_count   NUMBER,
  business_type   VARCHAR2(20),
  fund_flow       VARCHAR2(20),
  total_trade     NUMBER,
  total_amount    NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table
comment on table CONSOLE_BUSINESS_REPORT
  is '业务统计报表';
-- Add comments to the columns
comment on column CONSOLE_BUSINESS_REPORT.id
  is '主键';
comment on column CONSOLE_BUSINESS_REPORT.statistics_date
  is '统计日期';
comment on column CONSOLE_BUSINESS_REPORT.statistics_year
  is '统计年度';
comment on column CONSOLE_BUSINESS_REPORT.add_mer_count
  is '新增商户数';
comment on column CONSOLE_BUSINESS_REPORT.sum_mer_count
  is '累计商户数';
comment on column CONSOLE_BUSINESS_REPORT.business_type
  is '业务类型';
comment on column CONSOLE_BUSINESS_REPORT.fund_flow
  is '资金流向';
comment on column CONSOLE_BUSINESS_REPORT.total_trade
  is '交易总笔数（万笔）';
comment on column CONSOLE_BUSINESS_REPORT.total_amount
  is '总金额（万元）';



-- Create table 公告
create table CONSOLE_ANNOUNCE
(
  id             VARCHAR2(50) not null,
  visible_range  VARCHAR2(500) not null,
  title          VARCHAR2(500) not null,
  upload_path    VARCHAR2(500),
  content        CLOB not null,
  expiry_date    INTEGER not null,
  create_time    TIMESTAMP(6) not null,
  update_time    TIMESTAMP(6),
  release_person VARCHAR2(200) not null,
  status         VARCHAR2(50) not null,
  file_name      VARCHAR2(500),
  closing_time   TIMESTAMP(6) not null,
  term_status    VARCHAR2(500)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints
alter table CONSOLE_ANNOUNCE
  add primary key (ID)
  using index
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );



  -- Create sequence
create sequence CONSOLEANNOUNCE_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 3
increment by 1
nocache;

-- Create sequence
create sequence CONSOLERULE_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 50
increment by 1
nocache;



-- Create sequence
create sequence CONSOLEUSERRULENEW_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 96
increment by 1
nocache;



-- Create sequence
create sequence CONSOLEUSERRULE_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 609
increment by 1
nocache;


-- Create sequence
create sequence CONSOLEUSER_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 11
increment by 1
nocache;



-- Create sequence
create sequence NEWCONSOLERULE_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 144
increment by 1
nocache;



