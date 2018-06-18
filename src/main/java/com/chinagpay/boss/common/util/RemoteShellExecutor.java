package com.chinagpay.boss.common.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import ch.ethz.ssh2.ChannelCondition;
import ch.ethz.ssh2.Connection;
import ch.ethz.ssh2.Session;
import ch.ethz.ssh2.StreamGobbler;


public class RemoteShellExecutor {
    private static final Logger logger = LogManager.getLogger(RemoteShellExecutor.class);
    private Connection conn;
    /**
     * 远程机器IP
     */
    private String ip;
    /**
     * 用户名
     */
    private String osUsername;
    /**
     * 密码
     */
    private String password;
    private String charset = Charset.defaultCharset().toString();

    private static final int TIME_OUT = 1000 * 5 * 60;

    /**
     * 构造函数
     *
     * @param ip
     * @param usr
     * @param pasword
     */
    public RemoteShellExecutor(String ip, String usr, String pasword) {
        this.ip = ip;
        this.osUsername = usr;
        this.password = pasword;
    }


    /**
     * 登录
     *
     * @return
     * @throws IOException
     */
    private boolean login() throws IOException {
        conn = new Connection(ip);
        conn.connect();
        return conn.authenticateWithPassword(osUsername, password);
    }

    /**
     * 执行脚本
     *
     * @param cmds
     * @return
     * @throws Exception
     */
    public Map<String,Object> exec(String cmds) throws Exception {
        InputStream stdOut = null;
        InputStream stdErr = null;
        String outStr = "";
        String outErr = "";
        int ret = -1;
        Map<String,Object> map = new HashMap<String,Object>();
        try {
            if (login()) {
                // Open a new {@link Session} on this connection
                Session session = conn.openSession();
                // Execute a command on the remote machine.
                session.execCommand(cmds);

                stdOut = new StreamGobbler(session.getStdout());
                outStr = processStream(stdOut, charset);
                map.put("outStr", outStr.trim());
                stdErr = new StreamGobbler(session.getStderr());
                outErr = processStream(stdErr, charset);
                map.put("outErr", outErr.trim());
                session.waitForCondition(ChannelCondition.EXIT_STATUS, TIME_OUT);

                System.out.println("outStr=" + outStr);
                System.out.println("outErr=" + outErr);

                ret = session.getExitStatus();
                map.put("intVa", ret);
            } else {
                throw new Exception("登录远程机器失败" + ip); // 自定义异常类 实现略
            }
        } finally {
            if (conn != null) {
                conn.close();
            }
            IOUtils.closeQuietly(stdOut);
            IOUtils.closeQuietly(stdErr);
        }
        return map;
    }

    /**
     * @param in
     * @param charset
     * @return
     * @throws IOException
     * @throws UnsupportedEncodingException
     */
    private String processStream(InputStream in, String charset) throws Exception {
        byte[] buf = new byte[1024];
        StringBuilder sb = new StringBuilder();
        while (in.read(buf) != -1) {
            sb.append(new String(buf, charset));
        }
        return sb.toString();
    }

    public static void main(String args[]) throws Exception {
//        RemoteShellExecutor executor = new RemoteShellExecutor("192.168.8.95", "root", "cgp@20!^");

        RemoteShellExecutor executor = null;
        try {
            executor = new RemoteShellExecutor("192.168.0.193", "items", "anyz@cgp");
            // 执行myTest.sh 参数为java Know dummy
//            Map<String,Object> resultCode = executor.exec("");
//            System.out.println(resultCode + " getCode");
//            System.out.println("outStr:"+resultCode.get("outStr")+"outErr:"+resultCode.get("outErr")+"intVa:"+resultCode.get("intVa") );

            //System.out.println(executor.exec("/home/items/apps/test.sh") +" getCode");
        } catch (Exception e) {
            System.out.println(e + "  2222");
            e.printStackTrace();
        }


    }

//    private int shellOperate(OperationInfo operationInfo) throws Exception {
//        int resultCode = -1;
//        try {
//            RemoteShellExecutor executor = new RemoteShellExecutor(operationInfo.getIp(), operationInfo.
//                    getUserId(), operationInfo.getPassword());
//            resultCode = executor.exec(operationInfo.getFilePath());
//            logger.info(resultCode+" 执行shell返回Code");
//
//        } catch (Exception e) {
//            logger.error("操作shell脚本异常",e);
//            e.printStackTrace();
//        }
//        return resultCode;
//    }

}
