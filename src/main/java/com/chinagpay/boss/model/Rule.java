package com.chinagpay.boss.model;

import java.io.Serializable;
import java.util.Date;

public class Rule implements Serializable{
	  /**
	 * 
	 */
	  private static final long serialVersionUID = -3628125252275408674L;
	  private Long id;
	  private Date createTime;
      private Date updateTime;
      /**
       * 模块链接
       */
      private String code;
      /**
       * 模块名字
       */
      private String mark;
      /**
       * 模块等级
       */
      private String ruleLevel;
	  
      /**
       * 上级模块
       */
    private String ruleLevelParent;
    
    /**
     * 1-系统模块
     * 2-门户模块
     */
    private String type;
    

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public String getRuleLevel() {
		return ruleLevel;
	}

	public void setRuleLevel(String ruleLevel) {
		this.ruleLevel = ruleLevel;
	}

	public String getRuleLevelParent() {
		return ruleLevelParent;
	}

	public void setRuleLevelParent(String ruleLevelParent) {
		this.ruleLevelParent = ruleLevelParent;
	}
    
    
    
    
}
