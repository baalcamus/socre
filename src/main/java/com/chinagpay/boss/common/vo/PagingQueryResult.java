package com.chinagpay.boss.common.vo;

import java.math.BigDecimal;
import java.util.List;

/**
 * 分页查询结果
 * @author liuxi
 */
public class PagingQueryResult<E> {
	/**
	 * (当前)页号
	 */
	private Integer pageNo;
	
	/**
	 * 每页数据条数
	 */
	private Integer pageSize;
	
	/**
	 * 总页数
	 */
	private Integer totalPage;
	
	/**
	 * 总条数
	 */
	private Integer totalRow;
	
	/**
	 * 数据结果集
	 */
	private List<E> dataList;
	
	/**
	 * 查询耗时(毫秒)
	 */
	private BigDecimal costMilliSecond;

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public Integer getTotalRow() {
		return totalRow;
	}

	public void setTotalRow(Integer totalRow) {
		this.totalRow = totalRow;
	}

	public List<E> getDataList() {
		return dataList;
	}

	public void setDataList(List<E> dataList) {
		this.dataList = dataList;
	}

	public BigDecimal getCostMilliSecond() {
		return costMilliSecond;
	}

	public void setCostMilliSecond(BigDecimal costMilliSecond) {
		this.costMilliSecond = costMilliSecond;
	}
	
	
}
