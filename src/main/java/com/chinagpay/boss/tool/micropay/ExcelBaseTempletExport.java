package com.chinagpay.boss.tool.micropay;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.util.HashMap;
import java.util.Map;

import org.apache.poi.ss.usermodel.Workbook;

import net.sf.jxls.transformer.XLSTransformer;

public abstract class ExcelBaseTempletExport {

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
	public Workbook generateExcel(Path templetFile, ExportPreInterceptor exportPreInterceptor, Object... obj)
			throws Exception {
		Map<String, Object> beansMap = buildContent(obj);

		XLSTransformer transformer = new XLSTransformer();
		if (exportPreInterceptor != null) {
			exportPreInterceptor.preProcess(transformer, beansMap);
		}
		return transformer.transformXLS(Files.newInputStream(templetFile, StandardOpenOption.READ), beansMap);
	}

	/**
	 * 
	 * @param templetFile
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Workbook generateExcel(Path templetFile, Object... obj) throws Exception {
		return generateExcel(templetFile,null, obj );
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
		void preProcess(XLSTransformer transformer, Map<String, Object> beansMap);

	}
}
