package com.chinagpay.boss.common.util;

import javax.servlet.http.HttpServletRequest;

/**
 * 分页实现类
 */
public class SimplePageInfo implements IPageInfo {

	public SimplePageInfo(HttpServletRequest request) {
		try {
			this.currentPage = Integer.parseInt(request.getParameter("pageNo"));
		} catch (Exception e) {
			this.currentPage = 0;
		}
	}

	private int currentPage = 0;// 当前页码
	private long totalCount;// 总条数
	private int pageSize = 20;// 每页显示的大小
	
	protected int offset;

	public int getPageNo() {
		return currentPage;
	}

	public void setPageNo(int currentPage) {
		this.currentPage = currentPage;
	}

	public long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageCount() {
		return (int) Math.ceil((0.0 + this.totalCount) / this.pageSize);
	}

	@Override
	public int getOffset() {
		return this.pageSize * this.currentPage;
	}

	@Override
	public void setOffset(int offset) {
		this.offset = offset;
	}

	
}
