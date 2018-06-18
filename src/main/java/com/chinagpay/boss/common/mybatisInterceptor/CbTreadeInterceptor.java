/**   
 * Copyright © 2016 爱农支付. All rights reserved.
 * 
 * @Title: myInterceptor.java 
 * @Prject: cb-trade-core
 * @Package: com.chinagpay.cb.trade.core.order.test 
 * @Description: TODO
 * @author: lw
 * @date: 2016年12月13日 下午6:13:57 
 * @version: V1.0   
 */
package com.chinagpay.boss.common.mybatisInterceptor;

import java.sql.Statement;
import java.util.List;
import java.util.Properties;

import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.executor.resultset.ResultSetHandler;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.chinagpay.boss.model.trade.ForexOrderDetail;
import com.chinagpay.utils.common.encrypt.AES;


@Intercepts({
		@Signature(type = Executor.class, method = "update", args = {
				MappedStatement.class, Object.class }),
/*		@Signature(type = Executor.class, method = "query", args = {
				MappedStatement.class, Object.class, RowBounds.class,
				ResultHandler.class }),*/
		@Signature(method = "handleResultSets", type = ResultSetHandler.class, args = {Statement.class}) 
		})
public class CbTreadeInterceptor implements Interceptor {
	private static final Logger logger = LogManager.getLogger(CbTreadeInterceptor.class);
	private Properties properties;
	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.apache.ibatis.plugin.Interceptor#intercept(org.apache.ibatis.plugin
	 * .Invocation)
	 */
	@SuppressWarnings("unchecked")
	public Object intercept(Invocation invocation) throws Throwable {
		String methodName = invocation.getMethod().getName();

		/*if (methodName.equals("query")) {
				Object parameter = invocation.getArgs()[1];
				if(parameter instanceof ForexOrderDetail){
					//涉及到查询
				}
		}
		else if(methodName.equals("update")){
			Object parameter = invocation.getArgs()[1];
			if(parameter instanceof ForexOrderDetail){
				ForexOrderDetail detail = (ForexOrderDetail)parameter;
				String buyerType = detail.getBuyerType();
				if(buyerType.equals("D")){
					//调用通用方法 进行字段的加解
					String buyerIDno = detail.getBuyerIdNo();
					String buyerPhoneNo = detail.getBuyerPhoneNo();
					String sellerIdNo = detail.getSellerIdNo();
					String sellerPhoneNo = detail.getSellerPhoneNo();
					String buyerIDnoEnc = AES.encrypt(buyerIDno);
					String buyerPhoneNoEnc = AES.encrypt(buyerPhoneNo);
					String sellerIdNoEnc =AES.encrypt(sellerIdNo);
					String sellerPhoneNoEnc = AES.encrypt(sellerPhoneNo);;
					detail.setBuyerIdNo(buyerIDnoEnc);
					detail.setBuyerPhoneNo(buyerPhoneNoEnc);
					detail.setSellerIdNo(sellerIdNoEnc);
					detail.setSellerPhoneNo(sellerPhoneNoEnc);
					logger.info("拦截器加密 buyerIDno：{},buyerPhoneNo：{},sellerIdNo：{},sellerPhoneNo:{}",buyerIDno,buyerPhoneNo,sellerIdNo,sellerPhoneNo);
				}
			}
		}else*/ if (methodName.equals("handleResultSets")) {
			try {
			    List<Object> result = (List<Object>)invocation.proceed();
				for (Object obj:result) {
					if(obj instanceof ForexOrderDetail){
						try {
							ForexOrderDetail detail = (ForexOrderDetail)obj;
							String buyerIDno = detail.getBuyerIdNo();
							String buyerPhoneNo = detail.getBuyerPhoneNo();
							String sellerIdNo = detail.getSellerIdNo();
							String sellerPhoneNo = detail.getSellerPhoneNo();
							String buyerIDnoEnc = AES.dencrypt(buyerIDno);
							String buyerPhoneNoEnc = AES.dencrypt(buyerPhoneNo);
							String sellerIdNoEnc = AES.dencrypt(sellerIdNo);
							String sellerPhoneNoEnc = AES.dencrypt(sellerPhoneNo);
							detail.setBuyerIdNo(buyerIDnoEnc);
							detail.setBuyerPhoneNo(buyerPhoneNoEnc);
							detail.setSellerIdNo(sellerIdNoEnc);
							detail.setSellerPhoneNo(sellerPhoneNoEnc);
						} catch (Exception e) {
							logger.info("mybatail-过滤器异常");
						}
						//对于字段 ， 进行解密
					}
				}
				return result;
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
        }
		return invocation.proceed();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.apache.ibatis.plugin.Interceptor#plugin(java.lang.Object)
	 */
	public Object plugin(Object target) {
		return Plugin.wrap(target, this);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.apache.ibatis.plugin.Interceptor#setProperties(java.util.Properties)
	 */
	public void setProperties(Properties properties) {
		this.properties = properties;
	}
	
}

