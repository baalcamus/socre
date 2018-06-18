package com.chinagpay.boss.model;

import java.math.BigDecimal;
import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.chinagpay.utils.persistence.Entity;

/**
 * 商户计费规则
 * 
 * @author likun
 *
 */
public class CbMerchantFeeRule implements Entity<Long> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4301472273355100191L;
	/**
	 * id
	 */
	private Long id;
	/**
	 * 商户编号 非空
	 */
	private String merchantNo;
	/**
	 * 产品编号 非空
	 */
	private String productNo;
	/**
	 * 计费产品 非空
	 */
	private String feeProduct;

	/**
	 * 计费类型 非空
	 */
	private String feeType;
	/**
	 * 规则开始日期 非空
	 */
	private String ruleBeginDate;
	/**
	 * 规则结束日期
	 */
	private String ruleEndDate;
	/**
	 * 固定金额
	 */
	private BigDecimal fixedAmount;
	/**
	 * 百分比
	 */
	private BigDecimal percentage;
	/**
	 * 最低金额
	 */
	private BigDecimal minAmount;
	/**
	 * 最高金额
	 */
	private BigDecimal maxAmount;
	
	/**
	 * 额外加收金额
	 */
	private BigDecimal addGatherAmount;
	
	/**
	 * 不足金额约定--比较本金
	 */
	private BigDecimal lessLineAmount;
	
	/**
	 * 不足补收手续费
	 */
	private BigDecimal lessLineGatherFee;
	/**
	 * 创建日期
	 */
	private Date createDate;
	/**
	 * 创建人
	 */
	private String createOperator;
	/**
	 * 更新日期
	 */
	private Date updateDate;
	/**
	 * 更新人
	 */
	private String updateOperator;
	private String feeRule;
	@Override
	public Long getId() {
		return id;
	}

	@Override
	public void setId(Long id) {
		this.id = id;
	}

	public String getMerchantNo() {
		return merchantNo;
	}

	public void setMerchantNo(String merchantNo) {
		this.merchantNo = merchantNo;
	}


	public String getFeeType() {
		return feeType;
	}

	public void setFeeType(String feeType) {
		this.feeType = feeType;
	}

	public BigDecimal getFixedAmount() {
		return fixedAmount;
	}

	public void setFixedAmount(BigDecimal fixedAmount) {
		this.fixedAmount = fixedAmount;
	}

	public BigDecimal getPercentage() {
		return percentage;
	}

	public void setPercentage(BigDecimal percentage) {
		this.percentage = percentage;
	}

	public BigDecimal getMinAmount() {
		return minAmount;
	}

	public void setMinAmount(BigDecimal minAmount) {
		this.minAmount = minAmount;
	}

	public BigDecimal getMaxAmount() {
		return maxAmount;
	}

	public void setMaxAmount(BigDecimal maxAmount) {
		this.maxAmount = maxAmount;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCreateOperator() {
		return createOperator;
	}

	public void setCreateOperator(String createOperator) {
		this.createOperator = createOperator;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getUpdateOperator() {
		return updateOperator;
	}

	public void setUpdateOperator(String updateOperator) {
		this.updateOperator = updateOperator;
	}
	@Override
	public String toString() {
		try {
			return ToStringBuilder.reflectionToString(this,
					ToStringStyle.SHORT_PREFIX_STYLE);
		} catch (Exception e) {
			return super.toString();
		}
	}

	public BigDecimal getAddGatherAmount() {
		return addGatherAmount;
	}

	public void setAddGatherAmount(BigDecimal addGatherAmount) {
		this.addGatherAmount = addGatherAmount;
	}

	public BigDecimal getLessLineAmount() {
		return lessLineAmount;
	}

	public void setLessLineAmount(BigDecimal lessLineAmount) {
		this.lessLineAmount = lessLineAmount;
	}

	public BigDecimal getLessLineGatherFee() {
		return lessLineGatherFee;
	}

	public void setLessLineGatherFee(BigDecimal lessLineGatherFee) {
		this.lessLineGatherFee = lessLineGatherFee;
	}

	public String getFeeProduct() {
		return feeProduct;
	}

	public void setFeeProduct(String feeProduct) {
		this.feeProduct = feeProduct;
	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}

	public String getRuleBeginDate() {
		return ruleBeginDate;
	}

	public void setRuleBeginDate(String ruleBeginDate) {
		this.ruleBeginDate = ruleBeginDate;
	}

	public String getRuleEndDate() {
		return ruleEndDate;
	}

	public void setRuleEndDate(String ruleEndDate) {
		this.ruleEndDate = ruleEndDate;
	}

	public String getFeeRule() {
		return feeRule;
	}

	public void setFeeRule(String feeRule) {
		this.feeRule = feeRule;
	}
}
