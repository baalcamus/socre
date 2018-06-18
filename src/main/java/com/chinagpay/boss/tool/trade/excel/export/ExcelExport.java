package com.chinagpay.boss.tool.trade.excel.export;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.util.Map;

import org.apache.poi.ss.usermodel.Workbook;

import com.chinagpay.boss.tool.trade.excel.export.intercept.ExportInterceptor;

import net.sf.jxls.transformer.XLSTransformer;

/**
 * 导出excel
 * 
 * @time 2016年8月23日 下午1:39:40
 * @author likun
 *
 */
public abstract class ExcelExport {
	//可以添加注册监听，当使用导出方法时触发监听
	protected abstract Map<String, Object> buildContent(Object ... obj);
	/**
	 * 导出模板
	 * @param templetFile
	 * @param obj
	 * @param exportListener	导出监听
	 * @return
	 * @throws Exception
	 */
	public Workbook generateExcel(Path templetFile,ExportInterceptor exportListener,Object ...obj) throws Exception {
		Map<String, Object> beansMap = buildContent(obj);
		
		XLSTransformer transformer = new XLSTransformer();
		if(exportListener!=null){
			exportListener.process(transformer,beansMap);
		}
		return transformer.transformXLS(Files.newInputStream(templetFile,StandardOpenOption.READ),beansMap);
	}
	/**
	 * 
	 * @param templetFile
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Workbook generateExcel(Path templetFile, Object ... obj) throws Exception {
		return generateExcel(templetFile,obj,null);
	}
}
