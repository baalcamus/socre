package com.chinagpay.boss.tool.trade.excel.export;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.chinagpay.boss.common.bean.CurrencyEnum;
import com.chinagpay.boss.common.util.MathUtil;
import com.chinagpay.boss.model.trade.ForexOrderDetail;
import com.chinagpay.boss.tool.trade.excel.export.vo.ForexOrderDetailVo;
import com.chinagpay.common.enums.Country;
import com.chinagpay.utils.common.CommonUtils;
import com.chinagpay.utils.common.StringUtils;
import com.chinagpay.utils.file.excel.AbstractExcelCreateHandler;

public class ForexExportHandler extends ExcelExport {

	private static final Logger logger = LogManager.getLogger(ForexExportHandler.class);
	private static final List<String> spacefiledsName = new ArrayList<String>();
	private static final List<String> nullfiledsName = new ArrayList<String>();
	private static final List<String> toUpCaseFieldsName = new ArrayList<String>();

	static {
		spacefiledsName.add("productName");
		spacefiledsName.add("productDes");
		spacefiledsName.add("sellerAgencyCode");
		spacefiledsName.add("sellerName");
		spacefiledsName.add("sellerIdNo");
		spacefiledsName.add("sellerPhoneNo");
		spacefiledsName.add("buyerAgencyCode");
		spacefiledsName.add("buyerName");
		spacefiledsName.add("buyerIdNo");
		spacefiledsName.add("buyerPhoneNo");
		spacefiledsName.add("cargoAgencyName");
		nullfiledsName.add("transportNo");
		spacefiledsName.add("twomerchantName");
		// spacefiledsName.add("remitComment");
		spacefiledsName.add("idCode");
		spacefiledsName.add("payerAgencyCode");
		spacefiledsName.add("payerIdNo");
		spacefiledsName.add("payerPhoneNo");
		spacefiledsName.add("payerIdNo");
		spacefiledsName.add("payerName");
		spacefiledsName.add("payerAddr");
		nullfiledsName.add("payerAccountNo");
		spacefiledsName.add("payerBankAddr");
		spacefiledsName.add("payerBankName");
		spacefiledsName.add("agentBankAddr");
		spacefiledsName.add("agentBankName");
		spacefiledsName.add("receiverAgencyCode");
		spacefiledsName.add("receiverIdNo");
		spacefiledsName.add("receiverPhoneNo");
		spacefiledsName.add("receiverName");
		spacefiledsName.add("receiverAddr");
		nullfiledsName.add("receiverAccountNo");
		spacefiledsName.add("receiverBankAddr");
		spacefiledsName.add("receiverBankName");
		spacefiledsName.add("receiverAgentBankAddr");
		spacefiledsName.add("receiverAgentBankName");
		// 转为大写
		toUpCaseFieldsName.add("receiverName");
		toUpCaseFieldsName.add("remitComment");
		toUpCaseFieldsName.add("receiverAgentBankAddr");
		toUpCaseFieldsName.add("receiverAgentBankName");
		toUpCaseFieldsName.add("receiverIdNo");
		toUpCaseFieldsName.add("receiverBankAddr");
		toUpCaseFieldsName.add("receiverBankName");
		toUpCaseFieldsName.add("receiverAddr");
		toUpCaseFieldsName.add("receiverAccountNo");
		
		toUpCaseFieldsName.add("payerName");
		
	}

	@Override
	protected Map<String, Object> buildContent(Object ... objs) {
		//这个只使用了第一个
		Object contentObj = objs[0];
		
		Map<String, Object> content = new HashMap<String, Object>();
		if (contentObj instanceof List) {
			List<Object> list = (List<Object>) contentObj;
			List<ForexOrderDetailVo> detailList = new ArrayList<ForexOrderDetailVo>();
			int count = list.size();
			BigDecimal productAmt = new BigDecimal(0);
			String gatherCurrency = "";
			String remitCurrency = "";
			for (Object obj : list) {
				ForexOrderDetailVo model = (ForexOrderDetailVo) obj;

				gatherCurrency = model.getGatherCurrency();
				remitCurrency = model.getRemitCurrency();

				if (isNotNull(model.getPayerName())) {
					model.setPayerName(StringUtils.converterHanZiToPinYin(model.getPayerName(), ""));
				}
				if (isNotNull(model.getPayerAddr())) {
					model.setPayerAddr(StringUtils.converterHanZiToPinYin(model.getPayerAddr(), "")
							.replaceAll("\\|", " ").replaceAll("[,，]", " "));
				}
				if (isNotNull(model.getRemitComment())) {
					model.setRemitComment(StringUtils.converterHanZiToPinYin(model.getRemitComment(), ""));
				}

				if (isNotNull(model.getReceiverBankName())) {
					model.setReceiverBankName(model.getReceiverBankName().replaceAll("[,，]", " "));
				}
				// 收款人账号
				if (isNotNull(model.getReceiverAccountNo())) {
					model.setReceiverAccountNo(model.getReceiverAccountNo().replaceAll("-", ""));
				}
				// 收款人地址
				if (isNotNull(model.getReceiverAddr())) {
					model.setReceiverAddr(
							model.getReceiverAddr().replaceAll("\\|", " ").replaceAll("/", "").replaceAll("[,，]", " "));
				}
				if (isNotNull(model.getReceiverAddr())) {
					model.setReceiverAddr(model.getReceiverAddr().toUpperCase());
				}
				// 新增
				// 付款人组织机构号
				if (isNotNull(model.getPayerAgencyCode())) {
					model.setPayerAgencyCode(model.getPayerAgencyCode().replaceAll("-", ""));
				}
				// 付款人身份证号
				if (isNotNull(model.getIdCode())) {
					model.setIdCode(model.getIdCode().replaceAll("-", ""));
				}

				if (isNotNull(model.getPayerAccountNo())) {
					model.setPayNo(model.getPayerAccountNo().replaceAll("-", ""));
				}
				// 付款人电话
				if (isNotNull(model.getPayerPhoneNo())) {
					model.setPayerPhoneNo(model.getPayerPhoneNo().replaceAll("-", ""));
				}
				// 收款人电话
				if (isNotNull(model.getBuyerPhoneNo())) {
					model.setBuyerPhoneNo(model.getBuyerPhoneNo().replaceAll("-", ""));
				}
				if (isNotNull(model.getProductName())) {
					String str = model.getProductName();
					int i = str.indexOf("税费");
					if (i != -1) {
						str = str.substring(0, i) + str.substring(i + 2);
					}
					model.setProductName(str);
				}
				// 付款人账号
				// 收款人开户行名称
				// 收款人地址

				BigDecimal amt = model.getOrderAmount().multiply(new BigDecimal(100));
				model.setProductAmount(model.getProductAmount().multiply(new BigDecimal(100)));
				model.setOrderAmount(model.getOrderAmount().multiply(new BigDecimal(100)));
				if (isNotNull(model.getMerchantOriginalOrderNo())) {
					if (model.getMerchantOriginalOrderNo().length() > 20) {
						model.setMerchantOriginalOrderNo(model.getMerchantOriginalOrderNo().substring(0, 20));
					}
				}

				// model.setForexAmount(model.getForexAmount().multiply(new
				// BigDecimal(100)));
				productAmt = productAmt.add(amt);

				String range = model.getBusinessRange();
				if ("ABROAD_EDU".equals(range)) {
					if (isNotNull(model.getBuyerName())) {
						model.setPayerName(StringUtils.converterHanZiToPinYin(model.getBuyerName(), ""));
					}
					model.setPayerType("D");
					model.setIdCode(model.getBuyerIdNo().replaceAll("-", ""));
					model.setPayerAccountNo(model.getPayNo().replaceAll("-", ""));
					model.setPayerPhoneNo(model.getBuyerPhoneNo().replaceAll("-", ""));
				}
				// 替换特殊字符
				try {
					replaceAll(model, "[-/,——，|.。]", " ", spacefiledsName);
					replaceAll(model, "[-/,——，|.。]", "", nullfiledsName);
					replaceAllToULCase(model, true, toUpCaseFieldsName);
				} catch (Exception e) {
					logger.error("预处理excel数据异常{}", e);
				}
				// switch 使用[x]补足11位
				String revBankSwiftCode = model.getRevBankSwiftCode() == null ? "" : model.getRevBankSwiftCode();
				revBankSwiftCode = CommonUtils.appendStr(revBankSwiftCode, "X", 11, false);
				model.setRevBankSwiftCode(revBankSwiftCode);
				detailList.add(model);
			}
			SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat sf1 = new SimpleDateFormat("HHmmss");
			String date = sf.format(new Date());
			String time = sf1.format(new Date());
			content.put("detailList", detailList);
			content.put("orderCount", count);
			content.put("batchNo", "TDE_MER00000003_" + date + "000001");
			content.put("productAmt", productAmt);
			content.put("gatherCurrency", gatherCurrency);
			content.put("remitCurrency", remitCurrency);
			content.put("date", date);
			content.put("time", time);
			content.put("math", new MathUtil());
			content.put("cty", Country.CHN);
			content.put("cy",CurrencyEnum.X);
		}

		return content;
	}

	private void replaceAllToULCase(ForexOrderDetailVo model, boolean b, List<String> toupcasefieldsname2)
			throws IllegalArgumentException, IllegalAccessException {
		// 替换所有字段的特殊符号
		Class clazz = model.getClass();
		Field[] field = clazz.getDeclaredFields();
		for (Field field2 : field) {
			if (toupcasefieldsname2 != null) {
				if (toupcasefieldsname2.contains(field2.getName())) {
					replaceFieldULCase(model, field2, b);
				}
			}
		}
	}

	private static void replaceFieldULCase(Object model, Field field2, boolean toUpCase)
			throws IllegalArgumentException, IllegalAccessException {
		field2.setAccessible(true);
		Object obj = field2.get(model);
		if (obj != null && String.class == field2.getType()) {
			if (toUpCase) {
				field2.set(model, ((String) obj).toUpperCase());
			} else {
				field2.set(model, ((String) obj).toLowerCase());
			}
		}
	}

	/**
	 * 替换对象中的所有符合正则regex的为tar
	 * 
	 * @param u
	 * @param regex
	 * @param tar
	 * @param spacefiledsName
	 *            要替换的字段名
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	private static void replaceAll(Object u, String regex, String tar, List<String> spacefiledsName) {
		// 替换所有字段的特殊符号
		Class<? extends Object> clazz = u.getClass();
		Field[] field = clazz.getDeclaredFields();
		for (Field field2 : field) {
			if (spacefiledsName != null) {
				if (spacefiledsName.contains(field2.getName())) {
					try {
						replaceField(u, field2, regex, tar);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			} else {
				try {
					replaceField(u, field2, regex, tar);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	private static void replaceField(Object u, Field filed, String regex, String tar)
			throws IllegalArgumentException, IllegalAccessException {
		filed.setAccessible(true);
		if (filed.get(u) != null) {
			filed.set(u, filed.get(u).toString().replaceAll(regex, tar));
		}
	}

	public boolean isNotNull(String str) {
		if ("".equals(str) || str == null) {
			return false;
		}
		return true;
	}
}
