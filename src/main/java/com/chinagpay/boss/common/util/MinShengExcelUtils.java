package com.chinagpay.boss.common.util;


import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.HanyuPinyinVCharType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.chinagpay.boss.common.bean.MinShengExportBean;
import com.chinagpay.boss.model.trade.CommonPayer;
import com.chinagpay.boss.model.trade.CommonReceiver;
import com.chinagpay.boss.model.trade.ForexBizOrder;
import com.chinagpay.boss.model.trade.ForexOrderDetail;

public class MinShengExcelUtils {
	private static final Logger logger = LogManager.getLogger(MinShengExcelUtils.class);
	/**
	 * 根据详情表详情信息，获取模板中要导出的数据
	 * @param details List<ForexOrderDetail>
	 * @return Map<String, Object>
	 */
	public MinShengExportBean getExportList(List<ForexOrderDetail> details ,String templateFileType,int i,CommonPayer payer,CommonReceiver receiver,ForexBizOrder bizOrder){
		//将查询出来的数据放入MinShengExportBean中
		MinShengExportBean msebean = new MinShengExportBean();
		Integer seq = i + 1;
		msebean.setId(seq.toString());
		msebean.setForexCurrency(details.get(i).getForexCurrency());
		msebean.setForexAmount(details.get(i).getForexAmount().setScale(2,BigDecimal.ROUND_HALF_UP));
		msebean.setMerchantOrderDate(getTime(details.get(i).getMerchantOrderDate(),"yyyy-MM-dd HH:mm:ss"));
		msebean.setOrderAmount(details.get(i).getOrderAmount().setScale(2,BigDecimal.ROUND_HALF_UP));
		msebean.setOrderCurrency(details.get(i).getOrderCurrency());
		msebean.setMerchantOriginalOrderNo(details.get(i).getMerchantOriginalOrderNo());
		msebean.setProductType(details.get(i).getProductType());
		msebean.setProductQuantity(details.get(i).getProductQuantity());
		msebean.setProductUnit(details.get(i).getProductUnit());
		msebean.setProductName(details.get(i).getProductName());
		msebean.setProductDes(details.get(i).getProductDes());
		
		msebean.setSellerName(details.get(i).getSellerName());
		msebean.setSellerAgencyCode(details.get(i).getSellerAgencyCode());
		msebean.setSellerPhoneNo(details.get(i).getSellerPhoneNo());
		msebean.setSellerCountry(details.get(i).getSellerCountry());
		msebean.setSellerIdNo(details.get(i).getSellerIdNo());
		
		msebean.setBuyerName(details.get(i).getBuyerName());
		msebean.setBuyerIdNo(details.get(i).getBuyerIdNo());
		msebean.setBuyerPhoneNo(details.get(i).getBuyerPhoneNo());
		msebean.setBuyerCountry(details.get(i).getBuyerCountry());
		msebean.setBuyerAgencyCode(details.get(i).getBuyerAgencyCode());
		msebean.setOrderPayChannel(details.get(i).getOrderPayChannel());
		msebean.setCargoAgencyName(details.get(i).getCargoAgencyName());
		msebean.setTransportNo(details.get(i).getTransportNo());
		msebean.setInvoiceNo(details.get(i).getInvoiceNo());
		msebean.setContractNo(details.get(i).getContractNo());
		msebean.setPayType(details.get(i).getPayType());
		msebean.setNatureOfPayment(details.get(i).getNatureOfPayment());
		msebean.setTransactionRemark(details.get(i).getTransactionRemark());  //交易附言  自己对银行的
		msebean.setComments(details.get(i).getComments());   //用户  备注
		if(details.get(i).getProductQuantity() > 0){
			BigDecimal productAmount = details.get(i).getOrderAmount().divide(new BigDecimal(details.get(i).getProductQuantity()), 2,BigDecimal.ROUND_DOWN);
			msebean.setProductAmount(productAmount);
		}else{
			msebean.setProductAmount(details.get(i).getOrderAmount());
		}
		msebean.setBusinessRange(bizOrder.getBusinessRange());
		
		if(payer != null){
			msebean.setPayerName(payer.getPayerName()); 
			msebean.setPayerAddr(payer.getPayerAddr());
			msebean.setPayerIdNo(payer.getPayerIdNo());
			msebean.setPayerPhoneNo(payer.getPayerPhoneNo());
		}
		if(receiver != null){
			msebean.setReceiverName(receiver.getReceiverName());
			msebean.setReceiverCountry(receiver.getReceiverCountry());
			msebean.setRevBankSwiftCode(receiver.getRevBankSwiftCode());
			msebean.setReceiverAccountNo(receiver.getReceiverAccountNo());
			msebean.setReceiverBankName(receiver.getReceiverBankName());
			msebean.setReceiverAddr(receiver.getReceiverAddr());
			msebean.setReceiverPhoneNo(receiver.getReceiverPhoneNo());
			msebean.setReceiverBankAddr(receiver.getReceiverBankAddr());
		}

		if("jp".equals(templateFileType)){
			msebean.setPayerName("北京爱农驿站科技服务有限公司"); 
			msebean.setPayerAddr("22F OFFICE BUILDING XIHUAN PLAZA XIZHIMENWAI AVENUE XICHENG DISTRICT BEIJING 100045");
			msebean.setEngbuyerName(getPinYin(details.get(i).getBuyerName()));//存入英文的
		}
		if("xf".equals(templateFileType)){
			msebean.setMerchantOrderDate(getTime(details.get(i).getMerchantOrderDate(),"yyyy-MM-dd"));
			msebean.setEngbuyerName(getPinYin(details.get(i).getBuyerName()));//存入英文的
			msebean.setComments(getPinYin(details.get(i).getComments()));   //用户  备注
		}
		if("jd".equals(templateFileType)){
			msebean.setEngbuyerName(getPinYin(details.get(i).getBuyerName()));//存入拼音的
			msebean.setEngpayerAddr(getPinYin(payer.getPayerAddr()));
			msebean.setEngproductName(getPinYin(details.get(i).getProductName()));
		}
		if("hz".equals(templateFileType)){	
			if("C".equals(details.get(i).getBuyerType()) || details.get(i).getBuyerType()=="C"){
				msebean.setBuyerIdNo(details.get(i).getBuyerAgencyCode());
			}else{
				msebean.setBuyerIdNo(details.get(i).getBuyerIdNo());
			}
		}
		if("ds".equals(templateFileType)){
			if("C".equals(details.get(i).getSellerType()) || details.get(i).getSellerType()=="C"){
				msebean.setSellerIdNo(details.get(i).getSellerAgencyCode());
			}else{
				msebean.setSellerIdNo(details.get(i).getSellerIdNo());
			}
		}
		
		return msebean;
	}
	
	public String getTime(Timestamp time,String formatType){
		SimpleDateFormat df = new SimpleDateFormat(formatType);//"yyyy-MM-dd"
		String str = df.format(time);
		return str;	
	}
	
	/**
	 * 获取拼音字符串
	 * @param inputString
	 * @return
	 */
    public static String getPinYin(String inputString) {  
        HanyuPinyinOutputFormat format = new HanyuPinyinOutputFormat();  
       // format.setCaseType(HanyuPinyinCaseType.LOWERCASE);  
        format.setCaseType(HanyuPinyinCaseType.UPPERCASE);  
        format.setToneType(HanyuPinyinToneType.WITHOUT_TONE);  
        format.setVCharType(HanyuPinyinVCharType.WITH_V);  
        
        String output = ""; 
        
        if("".equals(inputString)||inputString == null || inputString.length()<=0){
        	 return output;  
        }
        char[] input = inputString.trim().toCharArray();  
        try {  
            for (int i = 0; i < input.length; i++) {  
                if (Character.toString(input[i]).matches("[\\u4E00-\\u9FA5]+")) {  //判断字符是否是中文  
                    //toHanyuPinyinStringArray 如果传入的不是汉字，就不能转换成拼音，那么直接返回null  
                    //由于中文有很多是多音字，所以这些字会有多个String，在这里我们默认的选择第一个作为pinyin  
                    String[] temp = PinyinHelper.toHanyuPinyinStringArray(input[i], format);    
                    output += " "+temp[0]+" ";  
                } else {  
                    output += Character.toString(input[i]);  
                }  
            }  
        } catch (BadHanyuPinyinOutputFormatCombination e) {  
            e.printStackTrace();  
//          Log.v(TAG, "BadHanyuPinyinOutputFormatCombination");  
        }  
        return output;  
    }  
      
    /** 
     * 取出拼音中第一个字母,一般第一个字母的使用时比较常见的 
     * @param chines 
     * @return 
     */  
    public static String converterToFirstSpell(String chines) {  
        String pinyinName = "";  
        char[] nameChar = chines.toCharArray();  
        HanyuPinyinOutputFormat defaulFormat = new HanyuPinyinOutputFormat();  
        defaulFormat.setCaseType(HanyuPinyinCaseType.LOWERCASE);  
        defaulFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);  
        defaulFormat.setVCharType(HanyuPinyinVCharType.WITH_V);  
        for (int i = 0; i < nameChar.length; i++) {  
            if (nameChar[i] > 128) {  
                try {  
                    pinyinName += PinyinHelper.toHanyuPinyinStringArray(nameChar[i], defaulFormat)[0].charAt(0);    
                } catch (BadHanyuPinyinOutputFormatCombination ex) {  
                    ex.printStackTrace();  
                }  
            } else {  
                pinyinName += nameChar[i];  
            }  
        }  
        return pinyinName;  
    }  
	
}
