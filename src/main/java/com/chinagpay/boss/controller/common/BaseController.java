package com.chinagpay.boss.controller.common;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public abstract class BaseController {
	
	/**
	 * 回写结果页面的信息
	 */
	protected String message;
	
	/**
	 * 写流的方法
	 * 
	 * @param msg
	 * @return
	 */
	protected boolean write(HttpServletResponse response, String msg) {
		PrintWriter pw = null;
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentLength(msg.getBytes("UTF-8").length);
			pw = response.getWriter();

			if (pw != null) {
				pw.write(msg);
				pw.flush();
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			if (pw != null) {
				try {
					pw.flush();
					pw.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
}
