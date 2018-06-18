package com.chinagpay.boss.controller.interceptor;

import com.chinagpay.boss.common.sessionuser.SessionUser;
import com.chinagpay.boss.common.util.JsonUtil;
import com.chinagpay.boss.common.util.ServletUtil;
import com.chinagpay.boss.common.vo.JsonResult;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * 拦截器，登录、权限
 * 
 * @author
 */
public class ForpayWebInterceptor implements HandlerInterceptor {
	private static Logger logger = LogManager.getLogger(ForpayWebInterceptor.class);
	/**
	 * 登录页面
	 */
	private String loginPage = "/login.jsp";

	/**
	 * 无权访问
	 */
	private String noRulePage = "";

	/**
	 * 不拦截的代码(权限代码/uri)
	 */
	private Map<String, String> notInterceptCodeMap;

	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object obj) throws Exception {
		logger.info("进入拦截器");

		request.setAttribute("contextPath", request.getContextPath());
		request.setAttribute("$serverCostMilliSecond$",System.currentTimeMillis());
		
		ajaxDeal(request, response);
		
		// ----不需要拦截的地址，直接通过--------
		String pageUriCode = ServletUtil.getPageUriCode(request);

		logger.info("当前地址:" + pageUriCode + ",无需拦截地址:" + notInterceptCodeMap);
		if (notInterceptCodeMap != null && notInterceptCodeMap.containsKey(pageUriCode)) {
			return true;
		}

		// 对省份下拉框选择城市特殊处理
		if (pageUriCode.contains("linkageSelect/getCity")) {
			return true;
		}

		// ----权限检查--------
		if (!ruleCheck(request, response)) {
			return false;
		}
		if (!loginCheck(request, response)) {
			return false;
		}

		logger.info("拦截器执行完毕,准备进入controller");
		return true;
	}

	/**
	 * ajax请求头信息处理
	 */
	private void ajaxDeal(HttpServletRequest request,HttpServletResponse response) {
		boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		if (isAjax) {
			response.setHeader("is-json-result", "true");// 表示返回结果是AjaxResult对象
			response.setHeader("Content-Type", "text/html;charset=utf-8");
		}
	}

	/**
	 * 检验session是否登录O
	 */
	private boolean loginCheck(HttpServletRequest request,HttpServletResponse response) {
		SessionUser ssUser = SessionUser.get(request.getSession());
		if (ssUser == null) {
			logger.info("session已失效");
			boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));// ajax异步
			
			// ----如果是ajax请求，返回错误码:11-------------
			if (isAjax) {
				JsonResult ar = JsonResult.failure(11, "请登录");// 【11：请登录】
				response.setContentType("application/json;charset=UTF-8");
				try {
					response.getWriter().println(JsonUtil.toJson(ar));
				} catch (Exception e) {
					logger.error("ajax request, not login, return json to login, error",e);
				}
			} else { // ----如果是普通请求，跳到登录页面----
				response.setContentType("text/html;charset=utf-8");
				try {
					request.setAttribute("redirectUrl", URLEncoder.encode(buildOriginalRelativeURL(request), "UTF-8"));
					// request.getRequestDispatcher(loginPage).forward(request,
					// response);
					response.sendRedirect(request.getContextPath() + loginPage);
				} catch (UnsupportedEncodingException e) {
					logger.error("normal request, not login, return to login page, encoding error",e);
				} catch (Exception e) {
					logger.error("normal request, not login, return to login page, error",e);
				}
			}
			return false;
		}

		logger.info("session未失效");
		return true;
	}

	/**
	 * 权限检查
	 */
	private boolean ruleCheck(HttpServletRequest request,
			HttpServletResponse response) {
		SessionUser ssUser = SessionUser.get(request.getSession());
		if (ssUser != null) {
			String pageUriCode = ServletUtil.getPageUriCode(request);
			logger.info("功能名:" + ssUser.getRuleMap().get(pageUriCode) + ",功能路径:" + pageUriCode);
			
			if (ssUser.getRuleMap() != null&& ssUser.getRuleMap().containsKey(pageUriCode)) {
				// 如果在user的RuleMap里 则通过
				return true;
			}

			boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
			if (isAjax) {
				JsonResult ar = JsonResult.failure(12, "无权访问");// 【12：无权访问】
				response.setContentType("application/json;charset=UTF-8");
				try {
					response.getWriter().println(JsonUtil.toJson(ar));
				} catch (Exception e) {
					logger.error("ajax request, not login, return json to login, error",e);
				}
			}
			// ----如果是普通请求，跳到无权访问页----
			else {
				response.setContentType("text/html;charset=utf-8");
				try {
					request.getRequestDispatcher(noRulePage).forward(request,response);
				} catch (Exception e) {
					logger.error("normal request, no rule, return to no rule page, error",e);
				}
			}

			return false;

		}

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object obj, ModelAndView mav)
			throws Exception {
		// ----是否是ajax请求类型，在响应头中添加isAjax和isJsonResult标志----
		boolean isAjax = "XMLHttpRequest".equals(request
				.getHeader("X-Requested-With"));
		if (isAjax && mav != null) {
			response.setHeader("is-json-result", "false");// 表示返回的是页面片段
		}

		Object $serverCostMilliSecond$ = request
				.getAttribute("$serverCostMilliSecond$");
		if ($serverCostMilliSecond$ != null) {
			request.setAttribute(
					"$serverCostMilliSecond$",
					(System.currentTimeMillis() - ((Long) $serverCostMilliSecond$)));
		}
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object obj, Exception exception)
			throws Exception {

	}

	public void setLoginPage(String loginPage) {
		this.loginPage = loginPage;
	}

	public void setNoRulePage(String noRulePage) {
		this.noRulePage = noRulePage;
	}

	public void setNotInterceptList(List<String> notInterceptList) {
		this.notInterceptCodeMap = new HashMap<String, String>();
		for (String uriCode : notInterceptList) {
			notInterceptCodeMap.put(uriCode, uriCode);
		}
	}

	@SuppressWarnings("rawtypes")
	private String buildOriginalRelativeURL(HttpServletRequest request) {
		StringBuffer originalURL = new StringBuffer();
		originalURL.append(request.getServletPath());

		Map parameters = request.getParameterMap();
		if (parameters != null && parameters.size() > 0) {
			originalURL.append("?");
			for (Iterator iter = parameters.keySet().iterator(); iter.hasNext();) {
				String key = (String) iter.next();
				String[] values = (String[]) parameters.get(key);
				for (int i = 0; i < values.length; i++) {
					originalURL.append(key).append("=").append(values[i])
							.append("&");
				}
			}
			return originalURL.substring(0, originalURL.length() - 1)
					.toString();
		} else
			return originalURL.toString();
	}

}
