package com.chinagpay.boss.common.util;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.chinagpay.boss.common.bean.RiskOrderDetailExportBean;
import com.chinagpay.boss.model.trade.ForexOrderDetail;
import com.chinagpay.boss.model.trade.risk.ForexRiskOrderDetail;

public class RiskOrderDetailExportExcelUtils {
	private static final Logger logger = LogManager.getLogger(RiskOrderDetailExportExcelUtils.class);
	/**
	 * 根据详情表详情信息，获取模板中要导出的数据
	 * @param details List<ForexOrderDetail>
	 * @return Map<String, Object>
	 */
	public RiskOrderDetailExportBean getExportList(ForexRiskOrderDetail details ,int i,ForexOrderDetail OrderDetail){
		//将查询出来的数据放入RiskOrderDetailExportBean中
		RiskOrderDetailExportBean msebean = new RiskOrderDetailExportBean();
		Integer seq = i + 1;
		msebean.setId(seq.toString());
		msebean.setMerchantOriginalOrderNo(OrderDetail.getMerchantOriginalOrderNo());
		msebean.setBuyerName(details.getName());
		msebean.setBuyerIdNo(details.getIdentityCard());
		msebean.setErrorReason(details.getErrorReason());
		msebean.setMerchantNo(details.getMerchantNo());
			
		return msebean;
	}
	
}
