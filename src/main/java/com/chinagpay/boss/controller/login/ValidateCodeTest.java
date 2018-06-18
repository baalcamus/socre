package com.chinagpay.boss.controller.login;


import com.chinagpay.boss.common.util.ValidateCode;

import java.io.IOException;
import java.util.Date;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public class ValidateCodeTest {  
	private static Logger logger = LogManager.getLogger(ValidateCodeTest.class);
    /** 
     * @param args 
     */  
    public static void main(String[] args) {  
        ValidateCode vCode = new ValidateCode(120,40,5,100);
        try {  
            String path="D:/t/"+new Date().getTime()+".png";  
            logger.info(vCode.getCode()+" >"+path);  
            vCode.write(path);  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
    }  
  
}  
