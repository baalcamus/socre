package com.chinagpay.boss.common.bean;

/**
 * Created by hanbinyu on 2016/7/18.
 */
public enum AccountStatusEnum {

    /**
     * 活动中
     */
    ACCOUNT_AVAILABLE(1000000, 0, "活动中"),

    /**
     * 完全冻结
     */
    ACCOUNT_FROZEN(2000000, 1000, "完全冻结"),

    /**
     * 冻结止付
     */
    ACCOUNT_FREEZE_DEBIT(2000000, 100, "冻结止付"),

    /**
     * 冻结止付可退款
     */
    ACCOUNT_FREEZE_DEBIT_CAN_REFUND(2000000, 10, "冻结止付可退款"),

    /**
     * 冻结止收
     */
    ACCOUNT_FREEZE_CREDIT(2000000, 1, "冻结止收"),

    /**
     * 已注销
     */
    ACCOUNT_CANCELLED(9000000, 0, "已注销");

    /**
     * 基数
     */
    private Integer code;

    /**
     * 递进数
     */
    private Integer step;

    private String description;

    private AccountStatusEnum(Integer code, Integer step, String description) {
        this.code = code;
        this.step = step;
        this.description = description;
    }

    public Integer getCode() {
        return code;
    }

    public Integer getStep() {
        return step;
    }

    public String getDescription() {
        return description;
    }

    public static AccountStatusEnum calcStatus(Integer accountStatusCode,
                                               AccountStatusEnum defaultStatus) {
        if (accountStatusCode == null) {
            return defaultStatus;
        }
        int code = accountStatusCode.intValue();
        if (code == ACCOUNT_AVAILABLE.code) {
            return AccountStatusEnum.ACCOUNT_AVAILABLE;
        } else if (code == ACCOUNT_CANCELLED.code) {
            return AccountStatusEnum.ACCOUNT_CANCELLED;
        } else if (code / ACCOUNT_FROZEN.step % 10 >= 1) {
            // 取冻结位
            return AccountStatusEnum.ACCOUNT_FROZEN;
        } else if (code / ACCOUNT_FREEZE_DEBIT.step % 10 >= 1 && code % 10 >= 1) {
            // 冻结止收&冻结止付
            return AccountStatusEnum.ACCOUNT_FROZEN;
        } else if (code / ACCOUNT_FREEZE_DEBIT.step % 10 >= 1) {
            // 取冻结止付位
            return AccountStatusEnum.ACCOUNT_FREEZE_DEBIT;
        } else if (code / ACCOUNT_FREEZE_DEBIT_CAN_REFUND.step % 10 >= 1) {
            // 取冻结止付可退款
            return AccountStatusEnum.ACCOUNT_FREEZE_DEBIT_CAN_REFUND;
        } else if (code % 10 >= 1) {
            // 取冻结止收位
            return AccountStatusEnum.ACCOUNT_FREEZE_CREDIT;
        }
        return defaultStatus;
    }
}
