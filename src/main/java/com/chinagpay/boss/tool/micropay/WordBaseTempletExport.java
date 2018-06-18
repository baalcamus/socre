package com.chinagpay.boss.tool.micropay;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import org.apache.ibatis.ognl.Ognl;
import org.apache.poi.hwpf.HWPFDocument;

public abstract class WordBaseTempletExport {

	/**
	 * 创建要导出的map组,默认返回 Map<className ...,obj ...>,可以覆盖此方法实现处理
	 * 
	 * @param obj
	 *            要导出的对象
	 * @return map组
	 */
	protected Map<String, Object> buildContent(Object... objs) {
		Map<String, Object> res = new HashMap<>();
		for (Object obj : objs) {
			String className = obj.getClass().getSimpleName();
			if (className.length() == 1) {
				className = className.toLowerCase();
			} else {
				className = String.valueOf(className.charAt(0)).toLowerCase() + className.substring(1);
			}
			res.put(className, obj);
		}
		return res;
	}

	/**
	 * 导出模板
	 * 
	 * @param templetFile
	 * @param exportPreInterceptor
	 *            预处理拦截器
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public HWPFDocument generateExcel(Path templetFile, ExportPreInterceptor exportPreInterceptor, Object... obj)
			throws Exception {
		Map<String, Object> beansMap = buildContent(obj);
		if (exportPreInterceptor != null) {
			exportPreInterceptor.preProcess(beansMap);
		}
		// 下面进行处理
		HWPFDocument doc = new HWPFDocument(Files.newInputStream(templetFile, StandardOpenOption.READ));
		// 取出标记
		org.apache.poi.hwpf.usermodel.Range range = doc.getRange();
		Pattern pattern = Pattern.compile("\\$\\{[ ]*([a-zA-Z_\\.]+)[ ]*\\}");
		java.util.regex.Matcher matcher = pattern.matcher(range.text());
		while (matcher.find()) {
			try {
				Object val=Ognl.getValue(matcher.group(1), beansMap);
				range.replaceText(matcher.group(), val==null?"":val.toString());
			} catch (Exception e) {
				e.printStackTrace();
			}
			;
		}
		return doc;
	}

	/**
	 * 
	 * @param templetFile
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public HWPFDocument generateExcel(Path templetFile, Object... obj) throws Exception {
		return generateExcel(templetFile, null,obj);
	}

	/**
	 * 预处理拦截器
	 * 
	 * @time 2017年5月16日 下午2:03:50
	 * @author likun
	 *
	 */
	public static interface ExportPreInterceptor {
		/**
		 * 预处理
		 * 
		 * @param transformer
		 * @param beansMap
		 */
		void preProcess(Map<String, Object> beansMap);

	}
}
