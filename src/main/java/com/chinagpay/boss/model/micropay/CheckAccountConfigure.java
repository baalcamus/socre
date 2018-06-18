package com.chinagpay.boss.model.micropay;

import java.sql.Timestamp;

/**
 * Created by hanbinyu on 2017/5/17.
 */
public class CheckAccountConfigure {
    private String id;
    private String fileCode;
    private String fileCodeName;
    private String channelNo;
    private String filePath;
    private String fileNameRule;
    private String downFileNameRule;
    private String fileType;
    private String status;

    private String checkAccountType;
    private String checktradeType;
    private String dailyCheck;
    private String lastCheckDate;
    private String createStaff;
    private Timestamp createTime;
    private String updateStaff;
    private Timestamp updateTime;
    private String description;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFileCode() {
        return fileCode;
    }

    public void setFileCode(String fileCode) {
        this.fileCode = fileCode;
    }

    public String getFileCodeName() {
        return fileCodeName;
    }

    public void setFileCodeName(String fileCodeName) {
        this.fileCodeName = fileCodeName;
    }

    public String getChannelNo() {
        return channelNo;
    }

    public void setChannelNo(String channelNo) {
        this.channelNo = channelNo;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getFileNameRule() {
        return fileNameRule;
    }

    public void setFileNameRule(String fileNameRule) {
        this.fileNameRule = fileNameRule;
    }

    public String getDownFileNameRule() {
        return downFileNameRule;
    }

    public void setDownFileNameRule(String downFileNameRule) {
        this.downFileNameRule = downFileNameRule;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    public String getCheckAccountType() {
        return checkAccountType;
    }

    public void setCheckAccountType(String checkAccountType) {
        this.checkAccountType = checkAccountType;
    }

    public String getChecktradeType() {
        return checktradeType;
    }

    public void setChecktradeType(String checktradeType) {
        this.checktradeType = checktradeType;
    }

    public String getDailyCheck() {
        return dailyCheck;
    }

    public void setDailyCheck(String dailyCheck) {
        this.dailyCheck = dailyCheck;
    }

    public String getLastCheckDate() {
        return lastCheckDate;
    }

    public void setLastCheckDate(String lastCheckDate) {
        this.lastCheckDate = lastCheckDate;
    }

    public String getCreateStaff() {
        return createStaff;
    }

    public void setCreateStaff(String createStaff) {
        this.createStaff = createStaff;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public String getUpdateStaff() {
        return updateStaff;
    }

    public void setUpdateStaff(String updateStaff) {
        this.updateStaff = updateStaff;
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
