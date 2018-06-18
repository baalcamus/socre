package com.chinagpay.boss.common.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.poi.ss.usermodel.Workbook;

/**
 * Servlet工具
 * @author 
 */
public class ServletUtil {
	/**
	 * 取得请求功能的路径
	 */
	public static String getPageUriCode(HttpServletRequest request) {
		String uri = request.getRequestURI().replaceAll("/+", "/");
		String contextPath = request.getContextPath();
		if ("/".equals(contextPath) || "".equals(contextPath)) {
			uri = uri.substring(1);
		} else {
			uri = uri.substring(contextPath.length() + 1);
		}

		int dotPos = uri.indexOf(".");
		if (dotPos != -1) {
			uri = uri.substring(0, dotPos);
		}
		return uri;
	}

	/**
	 * 取得请求公网的ip
	 */
	public static String getRequestIp(HttpServletRequest req) {
		String ip = req.getHeader("X-Forwarded-For");

		if (ip == null || "".equals(ip.trim())) {
			ip = req.getHeader("X-Real-IP");
		}
		if (ip == null || "".equals(ip.trim())) {
			ip = req.getHeader("Proxy-Client-IP");
		}
		if (ip == null || "".equals(ip.trim())) {
			ip = req.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || "".equals(ip.trim())) {
			ip = req.getRemoteAddr();
		}
		if (ip == null || "".equals(ip.trim())) {
			ip = "";
		}

		return ip;
	}
	
	/**
	 * 取得cookie
	 */
	public static String getCookie( HttpServletRequest request, String key ){
		Cookie[] cs = request.getCookies();
		if( cs != null ){
			for( Cookie c : cs ){
				if( c.getName().equals( key ) ){
					return c.getValue();
				}
			}
		}
		return null;
	}
	
	/**
	 * 获取请求的参数，转成字符串
	 */
	public static String getParamsString(HttpServletRequest request){
		Set<String> keySet = request.getParameterMap().keySet();
		StringBuilder sb = new StringBuilder();
		if (keySet != null && keySet.size() > 0) {
			int size = keySet.size();
			int i = 0;
			for (String key : keySet) {
				i += 1;
				
				String[] values = request.getParameterValues( key);
				String vStr = "";
				if( values.length == 1 ){
					vStr = values[0];
				}else{
					vStr = "[";
					for( int h = 0; h < values.length; h ++ ){
						vStr = vStr + ( h > 0? ", " : "" ) + values[h];
					}
					vStr = vStr + "]";
				}
				sb.append(key).append("=").append(vStr);
				if( i != size ){
					sb.append(", ");
				}
			}
		}
		return sb.toString();
	}
	
	/**
	 * 获取所有请求的参数
	 * @return map key:参数名 value:值(数组)
	 */
	public static Map<String, String[]> getParamsMap(HttpServletRequest request){
		Map<String, String[]> map = new HashMap<String, String[]>();
		Set<String> keySet = request.getParameterMap().keySet();
		if (keySet != null && keySet.size() > 0) {
			for (String key : keySet) {
				String[] values = request.getParameterValues( key);
				map.put( key, values );
			}
		}
		return map;
	}
	
	/**
	 * 获取请求体内容
	 */
	public static String getRequestBodyContent( HttpServletRequest request ){
		try {
			InputStream is = request.getInputStream();
			StringBuilder str0 = new StringBuilder();
			while( true ){
				byte[] bs = new byte[10240];
				int n = is.read( bs );
				if( n < 1 ){
					break;
				}
				String html = new String( bs, 0, n, "utf-8" );
				str0.append( html );
			}
			return str0.toString();
		} catch (IOException e) {
			throw new RuntimeException( e );
		}
	}
	
	/**
	 * 下载文件
	 * @param response : HttpServletResponse
	 * @param filePath ：文件绝对路径
	 * @param fileName : 客户端保存的文件名，如果传null，则使用file的名称
	 * @throws IOException 
	 */
	public static void downloadFile( HttpServletResponse response, String filePath ) throws IOException {
		if (filePath.indexOf("http://") > -1 || filePath.indexOf("https://") > -1) {
			byte[] btImg = getImageFromNetByUrl(filePath);
			response.reset();
			response.setContentType("application/x-download;charset=utf-8");
			response.setHeader("Content-Disposition",
					"attachment; filename=" + URLEncoder.encode("pic.jpg", "utf-8"));
			response.getOutputStream().write(btImg);
		} else {
			File file = new File(filePath);
			InputStream is = new FileInputStream(file);
			response.reset();
			response.setContentType("application/x-download;charset=utf-8");
			response.setHeader("Content-Disposition",
					"attachment; filename=" + URLEncoder.encode(file.getName(), "utf-8"));
			response.setContentLength((int) file.length());
			byte[] bytes = new byte[10240];
			int len = 0;
			while ((len = is.read(bytes)) > 0) {
				response.getOutputStream().write(bytes, 0, len);
			}
			is.close();
		}
	}
	
	

	/**
	 * 将url图片转为图片流
	 * @param strUrl
	 * @return
	 */
	private static byte[] getImageFromNetByUrl(String strUrl) {
		try {
			InputStream inStream = null;
			/**
			 * 
			 * 方法二 HttpClient
			 */
			HttpClient client = new HttpClient();
			GetMethod method = new GetMethod(strUrl);// 获取内容用GetMethod,经过测试PostMethod拿不到图片的内容
			int status = client.executeMethod(method);
			method.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET, "utf-8"); // 设置编码
			if (status == HttpStatus.SC_OK) {
				inStream = method.getResponseBodyAsStream();
				byte[] btImg = readStream(inStream);// 得到图片的二进制数据
				return btImg;
			} else {
				System.err.println("网络异常");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * 从输入流中获取数据
	 * 
	 * @param inStream
	 *            输入流
	 * @return
	 * @throws Exception
	 */
	private static byte[] readStream(InputStream inStream) throws Exception {
		ByteArrayOutputStream outStream = new ByteArrayOutputStream();
		byte[] buffer = new byte[1024];
		int len = 0;
		while ((len = inStream.read(buffer)) != -1) {
			outStream.write(buffer, 0, len);
		}
		inStream.close();
		return outStream.toByteArray();
	}
	/**
	 * 下载excel文件
	 * @param response
	 * @param workbook
	 * @param fileName
	 */
	public static void downloadExcel(HttpServletResponse response, Workbook workbook, String fileName) {
		try {
			response.setCharacterEncoding("utf-8");
	        response.setContentType("multipart/form-data");
	        response.setHeader("Content-Disposition", "attachment;fileName="+new String(fileName.getBytes(),"iso-8859-1"));
            OutputStream os = response.getOutputStream();
            if(workbook!=null){
            	workbook.write(os);
            }
            os.flush();
            os.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
}
