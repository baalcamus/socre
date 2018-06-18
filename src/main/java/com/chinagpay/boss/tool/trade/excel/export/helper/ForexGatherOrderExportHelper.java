package com.chinagpay.boss.tool.trade.excel.export.helper;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.Workbook;

import com.chinagpay.boss.common.exception.BossException;
import com.chinagpay.boss.contants.Contants;
import com.chinagpay.boss.model.trade.CommonPayer;
import com.chinagpay.boss.model.trade.CommonReceiver;
import com.chinagpay.boss.model.trade.ForexBizOrder;
import com.chinagpay.boss.model.trade.ForexOrderDetail;
import com.chinagpay.boss.tool.trade.excel.export.handler.ForexGatherOrderExportHandler;
import com.chinagpay.boss.tool.trade.excel.export.intercept.ExportInterceptor;

/**
 * 跨境收款订单导出
 * 
 * @time 2017年1月12日 上午9:44:16
 * @author likun
 *
 */
public class ForexGatherOrderExportHelper {
	private static final Logger logger = LogManager.getLogger(ForexGatherOrderExportHelper.class);
	private static final String tempPath = Contants.getForexOrderTempletFileDir();

	/**
	 * 初始化
	 * 
	 * @param tempFileName
	 * @param commonPayer
	 * @param commonReceiver
	 * @param forexBizOrder
	 * @throws BossException
	 */
	public Workbook export(String tempFileName, CommonPayer commonPayer, CommonReceiver commonReceiver,
			ForexBizOrder bizOrder, List<ForexOrderDetail> forexOrderDetails, ExportInterceptor listnener)
					throws BossException {
		try { // 组装数据
			logger.info("tempPath=" + tempPath + tempFileName);
			Path template = Paths.get(tempPath, tempFileName);
			String file = tempFileName;

			if (file == null || "".equals(file)) {
				throw new BossException("模板文件名为空");
			}
			ForexGatherOrderExportHandler handler = new ForexGatherOrderExportHandler();
			return handler.generateExcel(template,listnener,commonPayer,commonReceiver,bizOrder,forexOrderDetails);
		} catch (BossException e) {
			logger.error("导出模板异常", e);
			throw e;
		} catch (Exception e) {
			logger.error("导出模板异常", e);
			throw new BossException("生成模板文件失败");
		}
	}
}
