package com.chinagpay.boss.common.util;

import com.chinagpay.common.exception.zpaytrade.ZpayTradeErrorCode;
import com.chinagpay.common.exception.zpaytrade.ZpayTradeServiceException;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by hanbinyu on 2016/9/8.
 */
public class Configuration {
    private static Logger logger = LogManager.getLogger(Configuration.class);
    private static Configuration configuration ;
    private Properties properties;

    private Configuration() {
        init();
    }

    public static Configuration getInstance(){
        if (configuration == null){
            configuration = new Configuration();
        }
        return configuration;
    }

    private void init(){
        try{
            InputStream is = Configuration.class.getResourceAsStream("/config/forpay-web.properties");
            properties = new Properties();
            properties.load(is);
        } catch (IOException e) {
            logger.error("加载forpay-web.properties配置文件异常",e);
            throw  new ZpayTradeServiceException(ZpayTradeErrorCode.COMMON_ERROR,"加载配置文件异常");
        }
    }

    public String getValue(String key){
        return properties.getProperty(key);
    }

    public Properties getProperties(){
        return properties;
    }
}
