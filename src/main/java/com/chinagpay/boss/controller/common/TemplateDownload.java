package com.chinagpay.boss.controller.common;



import java.io.IOException;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.chinagpay.boss.common.util.DateUtil;

public class TemplateDownload {
	private static final Logger logger = LogManager.getLogger(TemplateDownload.class);

//	private static ParamInfoService paramInfoService = SpringContextHolder.getBean(ParamInfoService.class);
	/*
	public static boolean download(HttpServletResponse response, int num, int amt, String txtOrexcel, String recPay) {
		try {
			if ("txt".equals(txtOrexcel)) {// 模板下载txt
				return downloadTXT(response, recPay, num, amt);
			} else if ("excel".equals(txtOrexcel)) {// 模板下载excel
				return downloadExcel(response, recPay, num, amt);
			}
		} catch (Exception e) {
			logger.info("下载出错.....", "");
			return false;
		}
		return false;
	}*/

	/**
	 * 代收
	 * 
	 * @param num
	 * @param amt
	 * @return
	 */
	private static String receiveTemplateTXT(int num, int amt) {
		DecimalFormat df6 = new DecimalFormat("000000");// 16位补全
		String date = DateUtil.format(new Date(), "yyyyMMdd");
		String batchId = DateUtil.format(new Date(),"ddHHmmss");
		StringBuffer sb = new StringBuffer("200000000000001|" + batchId + "|" + num + "|" + num * amt);
		sb.append("\r\n");
		for (int i = 0; i < num; i++) {
			sb.append(date + "|12341231" + df6.format(i) + "|01020000|01|12312312312312|啊啊啊|01|310101190001"
					+ df6.format(i) + "|"+ "13111111111" + "|" + amt + "|用途|私有域");
			sb.append("\r\n");
		}
		return sb.toString();
	}

	/**
	 * 代收
	 * 
	 * @param num
	 * @param amt
	 * @return
	 */
//	private static WritableSheet receiveTemplateExcel(int num, int amt, WritableWorkbook wbook) {
//		WritableSheet wsheet = null;
//		try {
//			//头
//			String batchId = DateUtil.getCurrentDate("ddHHmmss");
//			wsheet = wbook.createSheet("第一页", 0);//页名
//			wsheet.addCell(new Label(0, 0, "100000000000001"));//（列，行，字段）
//			wsheet.addCell(new Label(1, 0, batchId));
//			wsheet.addCell(new Label(2, 0, num+""));
//			wsheet.addCell(new Label(3, 0, num * amt+""));
//			// 开始生成主体内容
//			String date = DateUtil.getCurrentDate("yyyyMMdd");
//			DecimalFormat df6 = new DecimalFormat("000000");// 16位补全
//			for(int i=1;i<(num+1);i++){
//				wsheet.addCell(new Label(0, i, date));
//				wsheet.addCell(new Label(1, i, "12341231"+df6.format(i)));
//				wsheet.addCell(new Label(2, i, "01020000"));
//				wsheet.addCell(new Label(3, i, "01"));
//				wsheet.addCell(new Label(4, i, "12312312312312"));
//				wsheet.addCell(new Label(5, i, "啊啊啊"));
//				wsheet.addCell(new Label(6, i, "01"));
//				wsheet.addCell(new Label(7, i, "310101190001"+ df6.format(i) ));
//				wsheet.addCell(new Label(8, i, amt+""));
//				wsheet.addCell(new Label(9, i, "用途"));
//				wsheet.addCell(new Label(10, i, "私有域"));
//			}
//		} catch (Exception e) {
//			LogFactory.getLog().error(e);
//		}
//		// 主体内容生成结束
//		return wsheet;
//	}

	/**
	 * 代付
	 * 
	 * @param num
	 * @param amt
	 * @return
	 */
	private static String payTemplateTXT(int num, int amt) {
		DecimalFormat df6 = new DecimalFormat("000000");// 16位补全
		String date = DateUtil.format(new Date(), "yyyyMMdd");
		String batchId = DateUtil.format(new Date(),"ddHHmmss");
		StringBuffer sb = new StringBuffer("200000000000003|" + batchId + "|" + num + "|" + num * amt);
		sb.append("\r\n");
		for (int i = 0; i < num; i++) {
			sb.append(date + "|19911178" + df6.format(i) + "|00|河南|郑州|民生银行上海分行|许宪魁|310101190001" + df6.format(i) + "|"
					+ amt + "|12312312311|备注");
			sb.append("\r\n");
		}
		return sb.toString();
	}

	/**
	 * 代付
	 * 
	 * @param num
	 * @param amt
	 * @return
	 */
//	private static WritableSheet payTemplateExcel(int num, int amt, WritableWorkbook wbook) {
//		WritableSheet wsheet = null;
//		try {
//			//头
//			String batchId = DateUtil.getCurrentDate("ddHHmmss");
//			wsheet = wbook.createSheet("第一页", 0);//页名
//			wsheet.addCell(new Label(0, 0, "200000000000003"));//（列，行，字段）
//			wsheet.addCell(new Label(1, 0, batchId));
//			wsheet.addCell(new Label(2, 0, num+""));
//			wsheet.addCell(new Label(3, 0, num * amt+""));
//			// 开始生成主体内容
//			String date = DateUtil.getCurrentDate("yyyyMMdd");
//			DecimalFormat df6 = new DecimalFormat("000000");// 16位补全
//			for(int i=1;i<(num+1);i++){
//				wsheet.addCell(new Label(0, i, date));
//				wsheet.addCell(new Label(1, i, "19911178"+df6.format(i)));
//				wsheet.addCell(new Label(2, i, "00"));
//				wsheet.addCell(new Label(3, i, "河南"));
//				wsheet.addCell(new Label(4, i, "郑州"));
//				wsheet.addCell(new Label(5, i, "民生银行上海分行"));
//				wsheet.addCell(new Label(6, i, "许宪魁"));
//				wsheet.addCell(new Label(7, i, "310101190001" + df6.format(i)));
//				wsheet.addCell(new Label(8, i, amt+""));
//				wsheet.addCell(new Label(9, i, "12312312311"));
//				wsheet.addCell(new Label(10, i, "备注"));
//			}
//		} catch (Exception e) {
//			LogFactory.getLog().error(e);
//		}
//		// 主体内容生成结束
//		return wsheet;
//	}

/*	private static boolean downloadExcel(HttpServletResponse response, String recPay, int num, int amt) {
		OutputStream toClient =null;
		try {
			
			//String classPath=Thread.currentThread().getContextClassLoader().getResource("").getPath();
			ParamInfo record=new ParamInfo();
			record.setParamKey("recPayTemplate");
			record.setParamIndex("0");
			record=paramInfoService.selectByPrimaryKey(record);
			String xlsPath=record.getParamValue();
//			xlsPath="D:/logs/template.xls";
			File file = new File(xlsPath);
			// 取得文件名。
			String filename = file.getName();
			// 取得文件的后缀名。
			String ext = filename.substring(filename.lastIndexOf(".") + 1).toUpperCase();
			// 以流的形式下载文件。
			InputStream fis = new BufferedInputStream(new FileInputStream(xlsPath));
			byte[] buffer = new byte[fis.available()];
			fis.read(buffer);
			fis.close();
			// 清空response
			response.reset();
			// 设置response的Header
			response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes()));
			response.addHeader("Content-Length", "" + file.length());
			toClient = new BufferedOutputStream(response.getOutputStream());
			response.setContentType("application/octet-stream");
			toClient.write(buffer);
			return true;
		} catch (IOException e) {
			logger.info("下载出错.....", "");
			return false;
		}finally{
			if(toClient!=null){
				try {
					toClient.flush();
					toClient.close();
				} catch (IOException e) {
					logger.info("下载出错.....", "");
				}
				
			}
		}
		OutputStream os = null;// 取得输出流
		WritableWorkbook wbook = null; // 建立excel文件
		try {
			response.setCharacterEncoding("gbk");
			TraceLog.debug("开始下载.....");
			response.setContentType("text/html;charset=gbk");
			response.addHeader("Content-Disposition", "attachment;filename='" + recPay + "Template.xls'");
			os = response.getOutputStream();// 取得输出流
			wbook = Workbook.createWorkbook(os); // 建立excel文件

			if ("rec".equals(recPay)) {
				receiveTemplateExcel(num, amt, wbook);
			} else if ("pay".equals(recPay)) {
				payTemplateExcel(num, amt, wbook);
			}

			wbook.write(); // 写入文件
			TraceLog.debug("Excel模板下载结束.....");
			return true;
		} catch (Exception e) {
			LogFactory.getLog().error(e);
			return false;
		} finally {
			try {
				if (wbook != null) {
					wbook.close();
				} else if (os != null) {
					os.close();
				}
			} catch (Exception e) {
				LogFactory.getLog().error(e);
			}
		}
		
	}
*/
	private static boolean downloadTXT(HttpServletResponse response, String recPay, int num, int amt) {
		OutputStream output = null;
		try {
			String sb = "";
			String fileName = "";
			if ("rec".equals(recPay)) {
				sb = receiveTemplateTXT(num, amt);
				fileName = "ReceiveTemplate.txt";
			} else if ("pay".equals(recPay)) {
				sb = payTemplateTXT(num, amt);
				fileName = "PayTemplate.txt";
			}
			response.setCharacterEncoding("gbk");
			logger.info("开始下载.....");
			response.setContentType("text/html;charset=gbk");
			response.addHeader("Content-Disposition", "attachment;filename='" + fileName + "'");
			output = response.getOutputStream();
			output.write(sb.toString().getBytes("gbk"));
			logger.info("XT模板下载结束.....");
			return true;
		} catch (Exception e) {
			logger.info("XT模板下载出错.....");
			return false;
		} finally {
			if (output != null) {
				try {
					output.flush();
					output.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	
}
