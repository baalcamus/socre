package com.chinagpay.boss.tool.trade.excel.export.handler;

import java.util.HashMap;
import java.util.Map;

import com.chinagpay.boss.tool.trade.excel.export.ExcelExport;

public class ForexGatherOrderExportHandler extends ExcelExport{
	/**
	 * 基本信息处理
	 * @param com.chinagpay.boss.model.trade.CommonPayer
	 * @param com.chinagpay.boss.model.trade.CommonReceiver
	 * @param com.chinagpay.boss.model.trade.ForexBizOrder
	 * @param List<com.chinagpay.boss.model.trade.ForexOrderDetail>
	 */
	@Override
	protected Map<String, Object> buildContent(Object... objs) {
		Map<String,Object> content = new HashMap<>();
		content.put("_payer_", objs[0]);
		content.put("_receiver_", objs[1]);
		content.put("_order_", objs[2]);
		content.put("_detail_", objs[3]);
		return content;
	}
}
