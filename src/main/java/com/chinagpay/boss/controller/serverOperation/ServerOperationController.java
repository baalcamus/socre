package com.chinagpay.boss.controller.serverOperation;


import ch.ethz.ssh2.ChannelCondition;
import com.chinagpay.boss.common.util.ConfigService;
import com.chinagpay.boss.common.util.RemoteShellExecutor;
import com.chinagpay.boss.model.serverOperation.OperationInfo;
import com.chinagpay.utils.common.encrypt.AES;
import com.github.pagehelper.PageInfo;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ServerOperationController {
    private static final Logger logger = LogManager.getLogger(ServerOperationController.class);
    private static ArrayList<OperationInfo> operationInfoArrayList = new ArrayList<OperationInfo>();
    private static final String NORMAL = "NORMAL";

    @ResponseBody
    @RequestMapping(value = "/static/serverOperation/shellOperate", method = RequestMethod.POST)
    public static Object shellOperate(HttpServletRequest request, String ip, String userId, String filePath, String password) {
        Map<String, Object> res = new HashMap<>();
        userId = AES.dencrypt(userId);
        password = AES.dencrypt(password);
        res.put("err", true);
        String resultMsg = null;
        logger.info("请求执行shell脚本 ip" + ip + " userId " + userId + " password " + password + " filePath ");
        try {
            RemoteShellExecutor executor = new RemoteShellExecutor(ip, userId, password);
//            int resultCode = executor.exec(AES.dencrypt(filePath));
             Map<String,Object> resultCode = executor.exec(AES.dencrypt(filePath));
             int resultInt = Integer.parseInt(resultCode.get("intVa").toString());
             logger.info(resultInt + " 执行shell返回");
             if (0 != resultInt) {
                switch (resultInt) {
                    case ChannelCondition.TIMEOUT:
                        resultMsg = "TIMEOUT";
                        break;
                    case ChannelCondition.CLOSED:
                        resultMsg = "CLOSED";
                        break;
                    case ChannelCondition.STDOUT_DATA:
                        resultMsg = "STDOUT_DATA";
                        break;
                    case ChannelCondition.STDERR_DATA:
                        resultMsg = "STDERR_DATA";
                        break;
                    case ChannelCondition.EOF:
                        resultMsg = "EOF";
                        break;
                    case ChannelCondition.EXIT_STATUS:
                        resultMsg = "EXIT_STATUS";
                        break; 
                    case ChannelCondition.EXIT_SIGNAL:
                        resultMsg = "EXIT_SIGNAL";
                        break;
                    default:
                        resultMsg = "执行失败";
                }
                res.put("msg",resultMsg);
                res.put("sysOut", resultCode.get("outStr"));
                res.put("sysErr", resultCode.get("outErr"));
                logger.info(resultCode + " 执行shell返回");
            } else {
                res.put("msg", "执行成功");
                res.put("sysOut", resultCode.get("outStr"));
                res.put("sysErr", resultCode.get("outErr"));
                res.put("err", false);
            }
        } catch (Exception e) {
            logger.error("执行脚本异常", e);
            res.put("msg", e.getMessage());
            e.printStackTrace();
        }
        return res;
    }

    //获取文本中的内容，在页面中展示list
    @RequestMapping("/static/serverOperation/getOperationList")
    public String getOperationList(HttpServletRequest request, String type, PageInfo<OperationInfo> page) {

//        PageHelper.startPage(page.getPageNum(), page.getPageSize());
        List<OperationInfo> operationInfoList = getOperationInfoByFile(type);
//        page = new PageInfo<>(operationInfoList);
//        request.setAttribute("page", page);
        request.setAttribute("OperationInfoList", operationInfoList);
        return "serverOperation/operationSearch";
    }


    //
    public static List<OperationInfo> getOperationInfoByFile(String type) {
        //type normal force
        int listSize = operationInfoArrayList.size();
        if (listSize != 0 && NORMAL.equals(type)) {
            return operationInfoArrayList;
        }

        //获取
        ConfigService configService = new ConfigService();
        String path = configService.getProperty("shellData.path");
        String fileName = configService.getProperty("shellDate.fileName");
        //读取文件
        ArrayList<OperationInfo> infoList = new ArrayList<OperationInfo>();

        File file = new File(path + fileName);
        BufferedReader reader = null;
        String temp ;
        int line = 1;
        try {
            reader = new BufferedReader(new FileReader(file));
            while ((temp = reader.readLine()) != null) {
                System.out.println("line" + line + ":" + temp);
                String[] infoString = temp.split(":");
                OperationInfo oinfo = new OperationInfo();
                ArrayList<OperationInfo.FileInfo> fileInfoList = new ArrayList<OperationInfo.FileInfo>();
                oinfo.setInstruction(infoString[0]);
                oinfo.setIp(infoString[1]);
                oinfo.setUserId(AES.encrypt(infoString[2]));
                oinfo.setPassword(AES.encrypt(infoString[3]));
                String[] typeString = infoString[4].split(",");
                String[] fileString = infoString[5].split(",");
                for (int i = 0; i < typeString.length; i++) {
                    OperationInfo.FileInfo fileInfo = oinfo.new FileInfo();
                    fileInfo.setType(typeString[i]);
                    fileInfo.setFilePath(AES.encrypt(fileString[i]));//ljs加
                    fileInfoList.add(fileInfo);
                }
                oinfo.setFileInfoList(fileInfoList);
                infoList.add(oinfo);
                line++;
            }
        } catch (Exception e) {
            logger.error("getOperationInfoByFile解析配置文件失败", e);
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        operationInfoArrayList.clear();
        operationInfoArrayList = infoList;
        return infoList;
    }

    public static void main(String[] args) {
        String a =AES.encrypt("123");
        System.out.println(a);
        System.out.println(AES.dencrypt(a));
    }

}
