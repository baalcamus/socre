package com.chinagpay.boss.tool.trade.excel.analysis;

import java.text.DecimalFormat;

import org.apache.poi.ss.usermodel.Row;

import com.chinagpay.boss.model.Currency2UsdRate;
import com.chinagpay.utils.file.excel.AbstractExcelImportHandler;

public class Cy2UsdFileAnalysis extends AbstractExcelImportHandler {
	// 读取的值保留6位
	private DecimalFormat df = new DecimalFormat("##0.000000");

	@Override
	protected Currency2UsdRate fillModel(Row row) {
		try {
			Currency2UsdRate r = new Currency2UsdRate();
			r.setCurrencyCode(row.getCell(0).getStringCellValue());
			r.setCurrencyName(row.getCell(1).getStringCellValue());
			r.setUnit(1);
			r.setExchangeRate(Double.valueOf(df.format((row.getCell(3).getNumericCellValue()))));
			return r;
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}
}
