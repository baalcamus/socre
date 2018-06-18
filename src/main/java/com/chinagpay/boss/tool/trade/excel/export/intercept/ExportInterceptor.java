package com.chinagpay.boss.tool.trade.excel.export.intercept;

import java.util.Map;

import net.sf.jxls.transformer.XLSTransformer;

public interface ExportInterceptor {
	/**
	 * 在导出前预处理
	 * @param transformer
	 * @param beansMap
	 */
	void process(XLSTransformer transformer, Map<String, Object> beansMap);

}
