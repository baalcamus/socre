package com.chinagpay.boss.model;

import com.chinagpay.boss.common.bean.AccountStatusEnum;
import com.chinagpay.boss.common.bean.CurrencyEnum;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by hanbinyu on 2016/7/15.
 */
public class CbAccount {
    private Long id;

    /**
     * 账号
     */
    private String accountNo;

    /**
     * 客户
     */
    private String customerNo;

    /**
     * 账户类型
     */
    private String accountType;

    /**
     * 账户状态
     */
    private AccountStatusEnum status;

    /**
     * 账户状态账户码值
     */
    private Integer statusCode;

    /**
     * 账户余额
     */
    private BigDecimal balance = BigDecimal.ZERO;

    /**
     * 是否按项目结算
     */
    private boolean byProject = false;

    /**
     * 余额签名
     */
    private String balanceSign;

    /**
     * 币种
     */
    private CurrencyEnum currencyEnum;

    /**
     * 账户提供方
     */
    private Long providerId;

    /**
     * 交易密码
     */
    private String tradePassword;

    /**
     * 可用额度
     */
    private BigDecimal withdrawAmount = BigDecimal.ZERO;

    /**
     * 冻结额度
     */
    private BigDecimal freezeAmount = BigDecimal.ZERO;

    /**
     * 固定保证金
     */
    private BigDecimal fixedCautionMoney = BigDecimal.ZERO;

    /**
     * 循环保证金
     */
    private BigDecimal cycledCautionMoney = BigDecimal.ZERO;

    /**
     * 账户历史流水顺序号
     */
    private Long accHisSerial;

    /**
     * 账户管理顺序号
     */
    private Long manageSerial;

    /**
     * 冻结解冻记录顺序号
     */
    private Long frozenSerial;

    /**
     * 版本号
     */
    private Long version;

    /**
     * 最近快照日期
     */
    private Date snapshotDate;

    /**
     * 上日日终账户余额
     */
    private BigDecimal yDayBalance = BigDecimal.ZERO;

    /**
     * 最后交易时间
     */
    private Date lastTrxDate;

    /**
     * 创建时间
     */
    private Date createDate;

    /**
     * 关闭时间
     */
    private Date closeDate;

    /**
     * 备注
     */
    private String remark;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAccountNo() {
        return accountNo;
    }

    public void setAccountNo(String accountNo) {
        this.accountNo = accountNo;
    }

    public String getCustomerNo() {
        return customerNo;
    }

    public void setCustomerNo(String customerNo) {
        this.customerNo = customerNo;
    }

    public String getAccountType() {
        return accountType;
    }

    public void setAccountType(String accountType) {
        this.accountType = accountType;
    }

    public AccountStatusEnum getStatus() {
        return status;
    }

    public void setStatus(AccountStatusEnum status) {
        this.status = status;
    }

    public Integer getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(Integer statusCode) {
        this.statusCode = statusCode;
    }

    public Long getProviderId() {
        return providerId;
    }

    public void setProviderId(Long providerId) {
        this.providerId = providerId;
    }

    public String getTradePassword() {
        return tradePassword;
    }

    public void setTradePassword(String tradePassword) {
        this.tradePassword = tradePassword;
    }

    public BigDecimal getWithdrawAmount() {
        return withdrawAmount;
    }

    public void setWithdrawAmount(BigDecimal withdrawAmount) {
        this.withdrawAmount = withdrawAmount;
    }

    public BigDecimal getFreezeAmount() {
        return freezeAmount;
    }

    public void setFreezeAmount(BigDecimal freezeAmount) {
        this.freezeAmount = freezeAmount;
    }

    public Long getAccHisSerial() {
        return accHisSerial;
    }

    public void setAccHisSerial(Long accHisSerial) {
        this.accHisSerial = accHisSerial;
    }

    public BigDecimal getYDayBalance() {
        return yDayBalance;
    }

    public void setYDayBalance(BigDecimal ydayBalance) {
        this.yDayBalance = ydayBalance;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    public boolean isByProject() {
        return byProject;
    }

    public void setByProject(boolean byProject) {
        this.byProject = byProject;
    }

    public String getBalanceSign() {
        return balanceSign;
    }

    public void setBalanceSign(String balanceSign) {
        this.balanceSign = balanceSign;
    }

    public CurrencyEnum getCurrencyEnum() {
        return currencyEnum;
    }

    public void setCurrencyEnum(CurrencyEnum currencyEnum) {
        this.currencyEnum = currencyEnum;
    }
    public void setCurrencyEnum(String currencyEnum) {
        this.currencyEnum = CurrencyEnum.valueOf(currencyEnum);
    }

    public BigDecimal getFixedCautionMoney() {
        return fixedCautionMoney;
    }

    public void setFixedCautionMoney(BigDecimal fixedCautionMoney) {
        this.fixedCautionMoney = fixedCautionMoney;
    }

    public BigDecimal getCycledCautionMoney() {
        return cycledCautionMoney;
    }

    public void setCycledCautionMoney(BigDecimal cycledCautionMoney) {
        this.cycledCautionMoney = cycledCautionMoney;
    }


    public Long getManageSerial() {
        return manageSerial;
    }

    public void setManageSerial(Long manageSerial) {
        this.manageSerial = manageSerial;
    }

    public Long getFrozenSerial() {
        return frozenSerial;
    }

    public void setFrozenSerial(Long frozenSerial) {
        this.frozenSerial = frozenSerial;
    }

    public Long getVersion() {
        return version;
    }

    public void setVersion(Long version) {
        this.version = version;
    }

    public Date getSnapshotDate() {
        return snapshotDate;
    }

    public void setSnapshotDate(Date snapshotDate) {
        this.snapshotDate = snapshotDate;
    }


    public Date getLastTrxDate() {
        return lastTrxDate;
    }

    public void setLastTrxDate(Date lastTrxDate) {
        this.lastTrxDate = lastTrxDate;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getCloseDate() {
        return closeDate;
    }

    public void setCloseDate(Date closeDate) {
        this.closeDate = closeDate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
