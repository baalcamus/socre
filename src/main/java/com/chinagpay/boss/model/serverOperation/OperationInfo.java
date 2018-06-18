package com.chinagpay.boss.model.serverOperation;

import java.util.List;

public class OperationInfo {
    private String ip;   //远程登录IP地址
    private String userId; //登录用户名称
    private String instruction; //说明
    private String password; //登录密码
    private List<FileInfo> fileInfoList;

    public class FileInfo {

        private String type; //功能类型
        private String filePath; //sh文件全路径和名称   /home/items/xxx.sh

        public String getFilePath() {
            return filePath;
        }

        public void setFilePath(String filePath) {
            this.filePath = filePath;
        }

        public String getType() {
            return type;
        }

        public void setType(String type) {
            this.type = type;
        }
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<FileInfo> getFileInfoList() {
        return fileInfoList;
    }

    public void setFileInfoList(List<FileInfo> fileInfoList) {
        this.fileInfoList = fileInfoList;
    }

    public String getInstruction() {
        return instruction;
    }

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }
}
