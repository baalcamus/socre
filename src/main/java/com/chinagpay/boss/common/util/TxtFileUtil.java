package com.chinagpay.boss.common.util;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

/**
 * 
 * @author 张丽
 * 获取txt文件内容
 *
 */
public class TxtFileUtil {
	private static final Logger logger = LogManager.getLogger(TxtFileUtil.class);

	public static List<String> readTxtFile(String filePath, String encoding) {
		List<String> list = null;
		InputStreamReader reader = null;
		BufferedReader bufferedReader = null;
		String lineTxt = null;
		try {
			File file = new File(filePath);
			if (file.isFile() && file.exists()) { // 判断文件是否存在
				reader = new InputStreamReader(new FileInputStream(file), encoding);// 考虑到编码格式
				bufferedReader = new BufferedReader(reader);
				list = new ArrayList<String>();
				while ((lineTxt = bufferedReader.readLine()) != null) {
					list.add(lineTxt);
				}
			}
		} catch (Exception e) {
			logger.error("读取文件内容出错");
			e.printStackTrace();
		} finally {
			if (reader != null)
				try {
					reader.close();
				} catch (IOException e) {
					logger.error(e);
				}
		}
		return list;

	}

	public static void main(String[] args) {
		List<String> list = readTxtFile("D:/test/sxfNew_dataList.txt", "UTF-8");
		logger.info("size:=============:"+list.size());
		String strArray[] = null;
		for (String str : list) {
			strArray = str.split(",");
			for (int i = 0; i < strArray.length; i++) {
				logger.info("aaaaaaaaaaaaa:"+strArray[i]);
			}
			logger.info("============================");
		}
	}
}
