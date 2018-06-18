package com.chinagpay.boss.common.exception;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.chinagpay.boss.common.util.ServletUtil;

/**
 * 异常拦截器
 * @author liuxi
 */
public class ControllerExceptionResolver implements HandlerExceptionResolver{
	private static final Logger logger = LogManager.getLogger(ControllerExceptionResolver.class);
	private String errorPage = "/WEB-INF/jsp/error.jsp";

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
		logger.info( "ip:" + ServletUtil.getRequestIp( request ) + " pageUriCode:" + ServletUtil.getPageUriCode( request ) + " params:" + ServletUtil.getParamsString( request ) );
		
		//----对于异常类型处理----------------
		String idf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format( new Date() ) + "(" + (int)( Math.random() * 99999999 ) + ")";
		String errMsg = "";
		if (ex instanceof CommonException) {
			CommonException ce = ( CommonException )ex;
			errMsg = ce.getMessage();
			logger.error( ce.getMessage() + "【" + ce.getThrowAt() + "】" );
		}else {
			errMsg = "系统异常" + idf;
			logger.error( errMsg, ex );
		}

		response.setContentType("text/html;charset=utf-8");
		try {
			request.getRequestDispatcher( errorPage ).forward( request, response );
		} catch (Exception e) {
			logger.error( "====ERROR(form)====", e );
		} 
		
		return new ModelAndView();
	}

	public void setErrorPage(String errorPage) {
		this.errorPage = errorPage;
	}
}
