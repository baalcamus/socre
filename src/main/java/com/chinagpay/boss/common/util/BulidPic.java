package com.chinagpay.boss.common.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.swing.ImageIcon;

import com.chinagpay.boss.model.trade.vo.ElectronicReceiptInfoVo;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class BulidPic {
	BufferedImage image;

	public void createImage(String fileLocation) {
		try {
			FileOutputStream fos = new FileOutputStream(fileLocation);
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(bos);
			encoder.encode(image);
			bos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void graphicsGeneration(String chapterFile, String ReceiptPicFile, ElectronicReceiptInfoVo vo) {
		// 实际数据行数+标题+备注
		int totalrow = 12;// 行数
//		int totalrow = 13;// 行数
		int imageWidth = 1024;
		int imageHeight = totalrow * 40 + 20;
		int rowheight = 40;
		int startHeight = 10;
		int startWidth = 10;
		image = new BufferedImage(imageWidth, imageHeight, BufferedImage.TYPE_INT_RGB);
		Graphics graphics = image.getGraphics();
		// 列宽
		int colwidthAll = (int) ((imageWidth - 20));
		graphics.setColor(Color.WHITE);
		graphics.fillRect(0, 0, imageWidth, imageHeight);
		graphics.setColor(new Color(220, 240, 240));
		// 画横线
		for (int j = 0; j < totalrow - 1; j++) {
			graphics.setColor(Color.black);
			graphics.drawLine(startWidth, startHeight + (j + 1) * rowheight, imageWidth - 5,
					startHeight + (j + 1) * rowheight);
			// 画竖线
			if (j == 1 || j == 2 || j == 3 || j == 0) { // 第一行
				graphics.drawLine(startWidth, startHeight + (j + 1) * rowheight, imageWidth - 5,
						startHeight + (j + 1) * rowheight);
				int totalcol = 2;// 列数
				int colwidth;
				if (j != 3) {
					colwidth = (int) (colwidthAll / 4); // 列宽
				} else {
					colwidth = (int) (colwidthAll / 2); // 列宽
				}
				for (int k = 0; k < totalcol; k++) {
					// int colwidth = (int)(colwidthAll/4); //列宽
					graphics.setColor(Color.black);
					graphics.drawLine(startWidth + k * colwidth, startHeight + (j + 1) * rowheight,
							startWidth + k * colwidth, startHeight + (j + 2) * rowheight);
				}
			} else if (j == 5 || j == 6 || j == 7 || j == 8  || j == 4) {
//			} else if (j == 5 || j == 6 || j == 7 || j == 8 || j == 9 || j == 4) {
				int totalcol = 3;// 列数
				int colwidth = (int) (colwidthAll / 4); // 列宽
				for (int k = 0; k < totalcol; k++) {
					graphics.setColor(Color.black);
					graphics.drawLine(startWidth + k * colwidth, startHeight + (j + 1) * rowheight,
							startWidth + k * colwidth, startHeight + (j + 2) * rowheight);
				}
				graphics.setColor(Color.white);
				if (j != 4) {
					graphics.drawLine(startWidth + (totalcol - 1) * colwidth, startHeight + (j + 1) * rowheight,
							imageWidth - 5, startHeight + (j + 1) * rowheight);// 画白最后一列
				}
			} else if (j == 9) {
//			} else if (j == 10) {
				int totalcol = 4;// 列数
				for (int k = 0; k < totalcol; k++) {
					int colwidth = (int) (colwidthAll / 4); // 列宽
					graphics.setColor(Color.black);
					graphics.drawLine(startWidth + k * colwidth, startHeight + (j + 1) * rowheight,
							startWidth + k * colwidth, startHeight + (j + 2) * rowheight);
				}
			}
		}
		graphics.setColor(Color.black);
		graphics.drawLine(startWidth, startHeight + rowheight, startWidth, imageHeight - 50);
		// 末行
		graphics.setColor(Color.black);
		graphics.drawLine(startWidth, imageHeight - 90, imageWidth - 5, imageHeight - 90);
		// 末列
		graphics.setColor(Color.black);
		graphics.drawLine(imageWidth - 5, startHeight + rowheight, imageWidth - 5, imageHeight - 50);
		Font font = new Font("宋体", Font.BOLD, 18);
		graphics.setFont(font);
		// 写入表头
		String[] headCells = { "汇款人", "收款人", "收款人账号", "", "汇款币种及金额", "购汇汇率", "购汇人民币", "手续费", "合计", "账户余额" };
//		String[] headCells = { "汇款人", "收款人", "收款人账号", "", "汇款币种及金额", "购汇汇率", "购汇人民币", "手续费费率", "手续费", "合计", "账户余额" };
		for (int m = 0; m < headCells.length; m++) {
			if (m != 3) {
				graphics.drawString(headCells[m].toString(), startWidth + 5, startHeight + (m + 2) * rowheight - 10);
			}
		}
		graphics.drawString("爱农驿站专用栏", startWidth + 5, startHeight + (3 + 2) * rowheight - 10);
		graphics.drawString("北京爱农驿站科技服务有限公司签章", startWidth + 5 + colwidthAll / 2,startHeight + (3 + 2) * rowheight - 10);
		DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		graphics.drawString("受理日期 Date", startWidth + 5 + colwidthAll / 2, startHeight + (10 + 1) * rowheight - 10);
//		graphics.drawString("受理日期 Date", startWidth + 5 + colwidthAll / 2, startHeight + (10 + 2) * rowheight - 10);
		// 添加数据
		graphics.drawString(vo.getPayerName(), startWidth + 5 + colwidthAll / 4, startHeight + 2 * rowheight - 10);
		graphics.drawString(vo.getReceiverName(), startWidth + 5 + colwidthAll / 4, startHeight + 3 * rowheight - 10);
		graphics.drawString(vo.getReceiverAccountNo(), startWidth + 5 + colwidthAll / 4, startHeight + 4 * rowheight - 10);
		graphics.drawString(vo.getBankGatherAmount()+" "+vo.getGatherCurrency(), startWidth + 5 + colwidthAll / 4, startHeight + 6 * rowheight - 10);
		graphics.drawString(vo.getExchangeRate()==null?" ":vo.getExchangeRate().toString(), startWidth + 5 + colwidthAll / 4, startHeight + 7 * rowheight - 10);
		graphics.drawString(vo.getSumRemitAmount()==null?"":vo.getSumRemitAmount().toString(), startWidth + 5 + colwidthAll / 4, startHeight + 8 * rowheight - 10);
		graphics.drawString(vo.getCharge()==null?"":vo.getCharge().toString(), startWidth + 5 + colwidthAll / 4, startHeight + 9 * rowheight - 10);
		graphics.drawString(vo.getTotal()==null?"":vo.getTotal().toString(), startWidth + 5 + colwidthAll / 4, startHeight + 10 * rowheight - 10);
		graphics.drawString(vo.getBalance()==null?"":vo.getBalance().toString(), startWidth + 5 + colwidthAll / 4, startHeight + 11 * rowheight - 10);
		graphics.drawString(sdf.format(vo.getAcceptDate()), startWidth + 5 + colwidthAll / 4 * 3, startHeight + 11 * rowheight - 10);
		
//		graphics.drawString(vo.getFeeRate()==null?"":vo.getFeeRate().toString(), startWidth + 5 + colwidthAll / 4, startHeight + 9 * rowheight - 10);
//		graphics.drawString(vo.getCharge()==null?"":vo.getCharge().toString(), startWidth + 5 + colwidthAll / 4, startHeight + 10 * rowheight - 10);
//		graphics.drawString(vo.getTotal()==null?"":vo.getTotal().toString(), startWidth + 5 + colwidthAll / 4, startHeight + 11 * rowheight - 10);
//		graphics.drawString(vo.getBalance()==null?"":vo.getBalance().toString(), startWidth + 5 + colwidthAll / 4, startHeight + 12 * rowheight - 10);
//		graphics.drawString(sdf.format(vo.getAcceptDate()), startWidth + 5 + colwidthAll / 4 * 3, startHeight + 12 * rowheight - 10);
//		
		ImageIcon imgIcon2 = new ImageIcon(chapterFile);
		Image img2 = imgIcon2.getImage();
		graphics.drawImage(img2, startWidth + 5 + colwidthAll / 5 * 3, startHeight + 6 * rowheight - 10, null);
//		graphics.drawImage(img2, startWidth + 5 + colwidthAll / 5 * 3, startHeight + 7 * rowheight - 10, null);
		createImage(ReceiptPicFile);
	}
	
	public static void main(String[] args) {
		BulidPic cg = new BulidPic();
		try {
			//cg.graphicsGeneration("D://章.jpg", "D:\\1.jpg");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
