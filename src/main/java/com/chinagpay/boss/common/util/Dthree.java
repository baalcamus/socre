package com.chinagpay.boss.common.util;

public class Dthree {
	
	/**
	 * int 每个节点都有唯一ID，增加节点时需要手工定义一个ID。 
	 */
	private long id;
	
	/**
	 *  int 父节点ID，根节点的父节点是-1。 
	 */
	private String pid;

	/**
	 * String 节点名称
	 */
	private String name;

	

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}


	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
