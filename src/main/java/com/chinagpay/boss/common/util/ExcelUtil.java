package com.chinagpay.boss.common.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.RichTextString;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

import com.chinagpay.utils.common.DateUtils;

/**
 * ExcelUtil
 */
public final class ExcelUtil {
	private Workbook workbook = null; // 工作簿
	private final Map<Integer, CellStyle> cellStyleMap = new HashMap<Integer, CellStyle>();

	public ExcelUtil(final InputStream is) {
		this.initExcel(is);
	}

	public ExcelUtil(final String templatePath) {
		this.initExcel(templatePath);
	}

	/**
	 * 初始化Excel
	 */
	public void initExcel(final InputStream is) {
		try {
			this.workbook = WorkbookFactory.create(is);
		} catch (FileNotFoundException e) {
			throw new RuntimeException(e);
		} catch (IOException e) {
			throw new RuntimeException(e);
		} catch (InvalidFormatException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 初始化Excel
	 */
	public void initExcel(final String templatePath) {
		try {
			File file = new File(templatePath);
			InputStream in = new FileInputStream(file);
			this.initExcel(in);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 给单元格设值（文字居左样式）
	 */
	public void setCellValue(final Sheet sheet, final int rowIndex, final int colIndex, final Object objValue) {
		if (sheet == null)
			return;

		Row targetRow = sheet.getRow(rowIndex);
		targetRow = (targetRow == null) ? sheet.createRow(rowIndex) : targetRow;

		Cell targetCell = targetRow.getCell(colIndex);
		targetCell = (targetCell == null) ? targetRow.createCell(colIndex) : targetCell;

		if (!cellStyleMap.containsKey(colIndex)) {
			CellStyle styleDef = targetCell.getCellStyle();
			CellStyle cellStyle = this.getWorkbook().createCellStyle(); // 创建样式

			cellStyle.setFillForegroundColor(styleDef.getFillForegroundColor());
			cellStyle.setAlignment(styleDef.getAlignment());
			cellStyle.setFillBackgroundColor(styleDef.getFillBackgroundColor());
			cellStyle.setFillPattern(styleDef.getFillPattern());
			cellStyle.setDataFormat(styleDef.getDataFormat());
			cellStyle.setBottomBorderColor(IndexedColors.BLACK.index);
			cellStyle.setTopBorderColor(IndexedColors.BLACK.index);
			cellStyle.setLeftBorderColor(IndexedColors.BLACK.index);
			cellStyle.setRightBorderColor(IndexedColors.BLACK.index);

			cellStyle.setVerticalAlignment(styleDef.getVerticalAlignment());
			cellStyle.setWrapText(true);
			cellStyle.setBorderBottom(CellStyle.BORDER_THIN); // 下边框
			cellStyle.setBorderLeft(CellStyle.BORDER_THIN); // 左边框
			cellStyle.setBorderTop(CellStyle.BORDER_THIN); // 上边框
			cellStyle.setBorderRight(CellStyle.BORDER_THIN); // 右边框
			cellStyleMap.put(colIndex, cellStyle);
		}

		if (objValue instanceof Integer) {
			Integer intValue = ((Integer) objValue).intValue();
			targetCell.setCellValue(intValue);
		} else if (objValue instanceof Long) {
			Long longValue = ((Long) objValue).longValue();
			targetCell.setCellValue(longValue);
		} else if (objValue instanceof Double) {
			Double doubleintValue = ((Double) objValue).doubleValue();
			targetCell.setCellValue(doubleintValue);
		} else if (objValue instanceof BigDecimal) {
			BigDecimal bigDecimalValue = (BigDecimal) objValue;
			Double doubleValue = bigDecimalValue.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			targetCell.setCellValue(doubleValue);
		} else if (objValue instanceof Date) {
			targetCell.setCellValue((Date) objValue);
			targetCell.setCellStyle(cellStyleMap.get(colIndex));
		} else {
			String strValue = objValue == null ? "" : (String) objValue;

			CreationHelper createHelper = this.workbook.getCreationHelper();
			RichTextString richText = createHelper.createRichTextString(strValue);
			targetCell.setCellValue(richText);
		}

	}

	/**
	 * 给单元格设值（文字居左样式） 南分报表
	 */
	public void setCellValueByReport(final Sheet sheet, final int rowIndex, final int colIndex, final Object objValue) {
		if (sheet == null)
			return;

		Row targetRow = sheet.getRow(rowIndex);
		targetRow = (targetRow == null) ? sheet.createRow(rowIndex) : targetRow;

		Cell targetCell = targetRow.getCell(colIndex);
		targetCell = (targetCell == null) ? targetRow.createCell(colIndex) : targetCell;

		if (!cellStyleMap.containsKey(colIndex)) {
			CellStyle styleDef = targetCell.getCellStyle();
			CellStyle cellStyle = this.getWorkbook().createCellStyle(); // 创建样式

			cellStyle.setFillForegroundColor(styleDef.getFillForegroundColor());
			cellStyle.setAlignment(styleDef.getAlignment());
			cellStyle.setFillBackgroundColor(styleDef.getFillBackgroundColor());
			cellStyle.setFillPattern(styleDef.getFillPattern());
			cellStyle.setDataFormat(styleDef.getDataFormat());
			cellStyle.setBottomBorderColor(IndexedColors.BLACK.index);
			cellStyle.setTopBorderColor(IndexedColors.BLACK.index);
			cellStyle.setLeftBorderColor(IndexedColors.BLACK.index);
			cellStyle.setRightBorderColor(IndexedColors.BLACK.index);
			cellStyle.setVerticalAlignment(styleDef.getVerticalAlignment());
			cellStyle.setWrapText(true);
			cellStyle.setBorderBottom(CellStyle.BORDER_THIN); // 下边框
			cellStyle.setBorderLeft(CellStyle.BORDER_THIN); // 左边框
			cellStyle.setBorderTop(CellStyle.BORDER_THIN); // 上边框
			cellStyle.setBorderRight(CellStyle.BORDER_THIN); // 右边框
			cellStyleMap.put(colIndex, cellStyle);
			targetCell.setCellStyle(cellStyle);
		}

		if (objValue instanceof Integer) {
			Integer intValue = ((Integer) objValue).intValue();
			targetCell.setCellValue(intValue);
			targetCell.setCellStyle(cellStyleMap.get(colIndex));
		} else if (objValue instanceof Double) {
			Double doubleintValue = ((Double) objValue).doubleValue();
			targetCell.setCellValue(doubleintValue);
			targetCell.setCellStyle(cellStyleMap.get(colIndex));
		} else if (objValue instanceof Date) {
			targetCell.setCellValue((Date) objValue);
			targetCell.setCellStyle(cellStyleMap.get(colIndex));
		} else {
			String strValue = objValue == null ? "" : (String) objValue;
			CreationHelper createHelper = this.workbook.getCreationHelper();
			RichTextString richText = createHelper.createRichTextString(strValue);
			targetCell.setCellValue(richText);
			targetCell.setCellStyle(cellStyleMap.get(colIndex));
		}

	}

	/**
	 * 取得Excel工作表
	 */
	public Sheet getSheet(int index) {
		return this.workbook.getSheetAt(index); // 获得工作表对象;
	}

	/**
	 * 取得Excel工作簿
	 */
	public Workbook getWorkbook() {
		return this.workbook;
	}

	public static Workbook exportWorkbook(List<? extends Object> titles, List<? extends Object> objs,
			String[] fieldNames, String sheetName) throws NoSuchFieldException, SecurityException,
					IllegalArgumentException, IllegalAccessException, ParseException {
		return exportWorkbook(titles, objs, fieldNames, sheetName, false);

	}

	/**
	 * 将model导出为excel
	 * 
	 * @param titles
	 *            List对象，里面只可以存放Map<String,String> , Collection<String>,String[]
	 *            标题
	 * @param objs
	 *            对象列表
	 * @param fieldNames
	 *            model的字段名
	 * @param sheetName
	 *            页名
	 * @param addS
	 * @return
	 * @throws SecurityException
	 * @throws NoSuchFieldException
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws ParseException
	 */
	@SuppressWarnings("unchecked")
	public static Workbook exportWorkbook(List<? extends Object> titles, List<? extends Object> objs,
			String[] fieldNames, String sheetName, boolean addSequence) throws NoSuchFieldException, SecurityException,
					IllegalArgumentException, IllegalAccessException, ParseException {
		// 声明一个工作薄
		HSSFWorkbook workbook = new HSSFWorkbook();
		if (titles == null && objs == null) {
			return workbook;
		}
		HSSFSheet sheet = workbook.createSheet((sheetName == null || sheetName == "") ? "sheet" : sheetName);
		int i = 0;
		// 设置标题
		if (titles != null) {
			for (int title_index = 0; title_index < titles.size(); title_index++) {
				int j = 0;
				HSSFRow row = sheet.createRow(i++);
				if (addSequence) {
					HSSFCell key = row.createCell(j++);
					setCellValue(key, "序号");
				}
				Object obj = titles.get(title_index);
				if (obj == null) {
					HSSFCell key = row.createCell(j++);
					setCellValue(key, "");
				} else if (obj instanceof Map) {// 如果是map,则输出 key+value+空
					Map<String, String> mobj = (Map<String, String>) obj;
					Iterator<?> it = mobj.keySet().iterator();
					while (it.hasNext()) {
						Object _key_ = it.next();
						HSSFCell key = row.createCell(j++);
						setCellValue(key, _key_);
						HSSFCell value = row.createCell(j++);
						setCellValue(value, mobj.get(_key_));
						HSSFCell withespace = row.createCell(j++);
						setCellValue(withespace, "");
					}
				} else if (obj instanceof Collection) {
					Collection<?> collection = (Collection<?>) obj;
					for (Object object : collection) {
						HSSFCell key = row.createCell(j++);
						setCellValue(key, object);
					}
				} else if (obj instanceof String[]) {
					String[] collection = (String[]) obj;
					for (Object object : collection) {
						HSSFCell key = row.createCell(j++);
						setCellValue(key, object);
					}
				} else {
					throw new RuntimeException("不支持" + obj.getClass());
				}
			}
		}
		if (objs == null) {
			return workbook;
		}
		// 设置内容
		Class<? extends Object> clazz = objs.get(0).getClass();
		int rowNum = 1;
		for (Object obj : objs) {
			HSSFRow row = sheet.createRow(i++);
			int index = 0;
			if (addSequence) {
				index = 1;
				HSSFCell key = row.createCell(0);
				setCellValue(key, rowNum++);
			}
			for (int j = 0; j < fieldNames.length; j++) {
				HSSFCell cell = row.createCell(j + index);
				Field field = clazz.getDeclaredField(fieldNames[j]);
				field.setAccessible(true);
				Object value = field.get(obj);
				setCellValue(cell, value);
			}
		}
		// 设置workbook的列宽
		for (int j = 0; j < fieldNames.length; j++) {
			sheet.autoSizeColumn(j);
		}
		return workbook;
	}

	public interface Process {
		public Object process(Object value);
	}

	/**
	 * 将model导出为excel
	 * 
	 * @param titles
	 *            List对象，里面只可以存放Map<String,String> , Collection<String>,String[]
	 *            标题
	 * @param objs
	 *            对象列表
	 * @param fieldNames
	 *            model的字段名
	 * @param sheetName
	 *            页名
	 * @param addS
	 * @return
	 * @throws SecurityException
	 * @throws NoSuchFieldException
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws ParseException
	 */
	@SuppressWarnings("unchecked")
	public static Workbook exportWorkbook(List<? extends Object> titles, List<? extends Object> objs,
			String[] fieldNames, Process[] processes, String sheetName, boolean addSequence)
					throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException,
					ParseException {
		// 声明一个工作薄
		HSSFWorkbook workbook = new HSSFWorkbook();
		if (titles == null && objs == null) {
			return workbook;
		}
		HSSFSheet sheet = workbook.createSheet((sheetName == null || sheetName == "") ? "sheet" : sheetName);
		int i = 0;
		// 设置标题
		if (titles != null) {
			for (int title_index = 0; title_index < titles.size(); title_index++) {
				int j = 0;
				HSSFRow row = sheet.createRow(i++);
				if (addSequence && title_index == titles.size() - 1) {
					HSSFCell key = row.createCell(j++);
					setCellValue(key, "序号");
				}
				Object obj = titles.get(title_index);
				if (obj == null) {
					HSSFCell key = row.createCell(j++);
					setCellValue(key, "");
				} else if (obj instanceof Map) {// 如果是map,则输出 key+value+空
					Map<String, String> mobj = (Map<String, String>) obj;
					Iterator<?> it = mobj.keySet().iterator();
					while (it.hasNext()) {
						Object _key_ = it.next();
						HSSFCell key = row.createCell(j++);
						setCellValue(key, _key_);
						HSSFCell value = row.createCell(j++);
						setCellValue(value, mobj.get(_key_));
						HSSFCell withespace = row.createCell(j++);
						setCellValue(withespace, "");
					}
				} else if (obj instanceof Collection) {
					Collection<?> collection = (Collection<?>) obj;
					for (Object object : collection) {
						HSSFCell key = row.createCell(j++);
						setCellValue(key, object);
					}
				} else if (obj instanceof String[]) {
					String[] collection = (String[]) obj;
					for (Object object : collection) {
						HSSFCell key = row.createCell(j++);
						setCellValue(key, object);
					}
				} else {
					throw new RuntimeException("不支持" + obj.getClass());
				}
			}
		}
		if (objs == null) {
			return workbook;
		}
		// 设置内容
		Class<? extends Object> clazz = objs.get(0).getClass();
		int rowNum = 1;
		for (Object obj : objs) {
			HSSFRow row = sheet.createRow(i++);
			int index = 0;
			if (addSequence) {
				index = 1;
				HSSFCell key = row.createCell(0);
				setCellValue(key, rowNum++);
			}
			for (int j = 0; j < fieldNames.length; j++) {
				HSSFCell cell = row.createCell(j + index);
				Field field = clazz.getDeclaredField(fieldNames[j]);
				field.setAccessible(true);
				Object value = field.get(obj);
				Process pro = processes[j];
				if (pro != null) {
					value = pro.process(value);
				}
				setCellValue(cell, value);
			}
		}
		// 设置workbook的列宽
		for (int j = 0; j < fieldNames.length; j++) {
			sheet.autoSizeColumn(j);
		}
		return workbook;
	}

	/**
	 * 对cell赋值
	 * 
	 * @param cell
	 * @param next
	 * @throws ParseException
	 */
	private static void setCellValue(HSSFCell cell, Object value) throws ParseException {

		if (value == null) {
			cell.setCellValue("");
		} else if (value instanceof String) {
			cell.setCellValue((String) value);
		} else if (value instanceof Number) {
			cell.setCellType(Cell.CELL_TYPE_NUMERIC);
			if (value instanceof BigDecimal) {
				cell.setCellValue(((BigDecimal) value).setScale(2, BigDecimal.ROUND_HALF_DOWN).toString());
			} else {
				cell.setCellValue(String.valueOf(value));
			}
		} else if (value instanceof Date) {
			if (value instanceof Timestamp) {
				cell.setCellValue(DateUtils.format((Timestamp) value, "yyyy-MM-dd HH:mm:ss"));
			} else {
				cell.setCellValue(DateUtils.format((Date)value, "yyyy-MM-dd HH:mm:ss"));
			}
		} else {
			System.out.println("不知道什么类型" + value);
			cell.setCellValue((String) value);
		}
	}

	public static class ExcelModel<T> {
		private String[] fieldName;
		private Map<String, Process> fieldProcess = new HashMap<>();// 这个是字段返回值处理
		private List<T> objs;
		public ExcelModel(){}
		public ExcelModel(String[] fieldName) {
			this.fieldName = fieldName;
		}

		public ExcelModel(String[] fieldName, List<T> objs) {
			this.fieldName = fieldName;
			this.objs = objs;
		}

		public ExcelModel(String[] fieldName, List<T> objs, Map<String, Process> fieldProcess) {
			this.fieldName = fieldName;
			this.objs = objs;
			this.fieldProcess = fieldProcess;
		}

		public String[] getFieldName() {
			return fieldName;
		}

		public void setFieldName(String[] fieldName) {
			this.fieldName = fieldName;
		}

		public List<T> getObjs() {
			return objs;
		}

		public void setObjs(List<T> obj) {
			this.objs = obj;
		}

		public void setObjs(String[] fieldName, List<T> obj) {
			this.fieldName = fieldName;
			this.objs = obj;
		}

		public void setObjs(List<T> objs, PreProcess<T> preProcess) {
			preProcess.process(objs);
			setObjs(objs);
		}

		public static interface PreProcess<T> {
			public void process(List<T> objs);
		}

		public void addProcess(String fieldName, Process process) {
			fieldProcess.put(fieldName, process);
		}

		public Process getProcess(String fieldName) {
			return fieldProcess.get(fieldName);
		}
	}

	/**
	 * 导出excel
	 * 
	 * @param head
	 *            头
	 * @param excelModel
	 *            内容
	 * @param tail
	 *            尾
	 * @param sheetName
	 *            页名字
	 * @param b
	 *            是否增加序号
	 * @return
	 * @throws ParseException
	 * @throws SecurityException
	 * @throws NoSuchFieldException
	 */
	public static Workbook exportWorkbook(List<Object> head, ExcelModel<?> excelModel, List<Object> tail,
			String sheetName, boolean addSequence) throws Exception {
		// 声明一个工作薄
		HSSFWorkbook workbook = new HSSFWorkbook();
		if (head == null && excelModel == null && tail == null) {
			return workbook;
		}
		int headCount = 0;
		int excelModelCount = 0;
		int tailCount = 0;
		if (head != null) {
			headCount = head.size();
		}
		if (excelModel != null && excelModel.getObjs() != null) {
			excelModelCount = excelModel.getObjs().size();
		}
		if (tail != null) {
			tailCount = tail.size();
		}
		int rownum_index = 0;
		int sheetNum = 1;
		HSSFSheet sheet = null;
		for (int r_index = 0; r_index < headCount + excelModelCount + tailCount; r_index++) {
			int columnIndex = 0;
			// 进行导出
			if (r_index % 50000 == 0) {
				String name = sheetName == null || sheetName == "" ? null : sheetName;
				if (name == null) {
					sheet = workbook.createSheet();
				} else {
					sheet = workbook.createSheet(name + (sheetNum++));
				}
				rownum_index = 0;
			}
			HSSFRow row = sheet.createRow(rownum_index++);
			if (r_index < headCount) {
				int _head_index = r_index;
				// 读头部
				if (addSequence && r_index == head.size() - 1) {
					HSSFCell key = row.createCell(columnIndex++);
					setCellValue(key, "序号");
				}
				Object obj = head.get(_head_index);
				// 从第columnIndex列添加数据
				addObject(obj, row, columnIndex);
			} else if (r_index < headCount + excelModelCount) {
				// 读模型
				int _model_index_ = r_index - headCount;
				String[] fieldNames = excelModel.getFieldName();
				Object obj = excelModel.getObjs().get(_model_index_);
				int index = 0;
				if (addSequence) {
					index = 1;
					HSSFCell key = row.createCell(columnIndex++);
					setCellValue(key, _model_index_ + 1);
				}
				for (int j = 0; j < fieldNames.length; j++) {
					HSSFCell cell = row.createCell(columnIndex++);
					Field field = obj.getClass().getDeclaredField(fieldNames[j]);
					field.setAccessible(true);
					Object value = field.get(obj);
					Process process = excelModel.getProcess(fieldNames[j]);
					if (process != null) {
						value = process.process(value);
					}
					setCellValue(cell, value);
				}
			} else if (r_index < headCount + excelModelCount + tailCount) {
				// 结尾
				int _tail_index = r_index - headCount - excelModelCount;
				Object obj = tail.get(_tail_index);
				// 从第columnIndex列添加数据
				addObject(obj, row, columnIndex);
			}
		}
		int sheets = workbook.getNumberOfSheets();
		for (int i = 0; i < sheets; i++) {
			Sheet s = workbook.getSheetAt(i);
			for (int j = 0; j < excelModel.getFieldName().length; j++) {
				s.autoSizeColumn(j);
			}
		}
		return workbook;
	}

	/**
	 * 把对象obj填充到行
	 * 
	 * @param obj
	 * @param row
	 * @param columnIndex
	 *            从第columnIndex列开始填充
	 * @return 下一个空列行数
	 * @throws ParseException
	 */
	private static int addObject(Object obj, HSSFRow row, int columnIndex) throws ParseException {
		if (obj == null) {
			HSSFCell key = row.createCell(columnIndex++);
			setCellValue(key, "");
		} else if (obj instanceof Map) {// 如果是map,则输出 key+value+空
			Map<String, String> mobj = (Map<String, String>) obj;
			Iterator<?> it = mobj.keySet().iterator();
			while (it.hasNext()) {
				Object _key_ = it.next();
				HSSFCell key = row.createCell(columnIndex++);
				setCellValue(key, _key_);
				HSSFCell value = row.createCell(columnIndex++);
				setCellValue(value, mobj.get(_key_));
				HSSFCell withespace = row.createCell(columnIndex++);
				setCellValue(withespace, "");
			}
		} else if (obj instanceof Collection) {
			Collection<?> collection = (Collection<?>) obj;
			for (Object object : collection) {
				HSSFCell key = row.createCell(columnIndex++);
				setCellValue(key, object);
			}
		} else if (obj instanceof String[]) {
			String[] collection = (String[]) obj;
			for (Object object : collection) {
				HSSFCell key = row.createCell(columnIndex++);
				setCellValue(key, object);
			}
		} else if (obj instanceof Object[]) {
			Object[] collection = (Object[]) obj;
			for (Object object : collection) {
				HSSFCell key = row.createCell(columnIndex++);
				setCellValue(key, object);
			}
		} else {
			throw new RuntimeException("不支持" + obj.getClass());
		}
		return columnIndex;
	}
}
