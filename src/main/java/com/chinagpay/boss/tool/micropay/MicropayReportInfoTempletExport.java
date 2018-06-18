package com.chinagpay.boss.tool.micropay;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Path;
import java.util.Map;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.ss.usermodel.Workbook;

import net.sf.jxls.transformer.XLSTransformer;

/**
 * 通过文件模板名称用不同方式导出
 * 
 * @time 2017年5月16日 下午6:35:52
 * @author likun
 *
 */
public class MicropayReportInfoTempletExport {
	private static final String DOC = "doc";
	private static final String XLS = "xls";
	private HWPFDocument hwpfDocument;
	private Workbook workbook;
	private String type;

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
	public MicropayReportInfoTempletExport(Path templetFile,
			final MicropayReportInfoTempletExport.ExportPreInterceptor exportPreInterceptor, Object... obj)
					throws Exception {
		if (templetFile == null || !templetFile.toFile().exists()) {
			throw new RuntimeException("模板文件"+templetFile+"不存在");
		}
		String fileName = templetFile.toFile().getName();
		if (fileName.toLowerCase().endsWith(DOC)) {
			this.type = DOC;
			MicropayReportInfoTempletExportWord word = new MicropayReportInfoTempletExportWord();
			HWPFDocument doc = word.generateExcel(templetFile,
					new MicropayReportInfoTempletExportWord.ExportPreInterceptor() {
						@Override
						public void preProcess(Map<String, Object> beansMap) {
							exportPreInterceptor.preProcess(null, beansMap);
						}
					}, obj);
			this.hwpfDocument = doc;
		} else if (fileName.toLowerCase().endsWith(XLS)) {
			this.type = XLS;
			MicropayReportInfoTempletExportExcel excel = new MicropayReportInfoTempletExportExcel();
			org.apache.poi.ss.usermodel.Workbook work = excel.generateExcel(templetFile,
					new MicropayReportInfoTempletExportExcel.ExportPreInterceptor() {
						@Override
						public void preProcess(XLSTransformer transformer, Map<String, Object> beansMap) {
							exportPreInterceptor.preProcess(transformer, beansMap);
						}
					}, obj);
			this.workbook = work;
		} else {
			throw new RuntimeException(fileName + "模板不能处理");
		}
	}

	/**
	 * 
	 * @param templetFile
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public MicropayReportInfoTempletExport(Path templetFile, Object... obj) throws Exception {
		this(templetFile, null, obj);
	}

	public void write(OutputStream out) throws IOException {
		if (DOC.equals(type)) {
			hwpfDocument.write(out);
		} else if (XLS.equals(type)) {
			workbook.write(out);
		} else {
			out.write('\0');
			out.flush();
		}
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

	public HWPFDocument getHwpfDocument() {
		return hwpfDocument;
	}

	public void setHwpfDocument(HWPFDocument hwpfDocument) {
		this.hwpfDocument = hwpfDocument;
	}

	public Workbook getWorkbook() {
		return workbook;
	}

	public void setWorkbook(Workbook workbook) {
		this.workbook = workbook;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public static String getDoc() {
		return DOC;
	}

	public static String getXls() {
		return XLS;
	}
}
