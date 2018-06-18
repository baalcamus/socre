package com.chinagpay.boss.model.trade.vo;

import java.math.BigDecimal;

public class RemitTrialResVo {
	/** 商户编号 **/
	private String merchantNo;
	/** 商户结算类型 定额人民币付，定额外币付 */
	private String mctSettleType;
	/** 账户余额 */
	private BigDecimal balance = BigDecimal.ZERO;
	/** 可用余额 */
	private BigDecimal availableBalance = BigDecimal.ZERO;
	/** 手续费 */
	private BigDecimal feeAmount = BigDecimal.ZERO;
	/** 牌价 **/
	private Double exchangeRate;
	/**通道**/
	private String bankId;
	/** 付款上浮资金--牌价变动 上浮5%金额冻结 **/
	private BigDecimal forexFloatAmount = BigDecimal.ZERO;
	/** 交易金额 */
	private BigDecimal exchangeAmount;
	/** 收款币种 */
	private String gatherCurrency;
	/** 是否足额 **/
//	private String isAmountEnough;
	/** 所需成本金额 **/
	private BigDecimal forexCostAmount = BigDecimal.ZERO;
	/** 需充值金额 **/
//	private BigDecimal needRechargeAmount = BigDecimal.ZERO;
	/**收款金额**/
	private BigDecimal gatherAmount;

	public String getMerchantNo() {
		return merchantNo;
	}

	public void setMerchantNo(String merchantNo) {
		this.merchantNo = merchantNo;
	}

	public String getMctSettleType() {
		return mctSettleType;
	}

	public void setMctSettleType(String mctSettleType) {
		this.mctSettleType = mctSettleType;
	}

	public BigDecimal getBalance() {
		return balance;
	}

	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}

	public BigDecimal getFeeAmount() {
		return feeAmount;
	}

	public void setFeeAmount(BigDecimal feeAmount) {
		this.feeAmount = feeAmount;
	}

	public String getBankId() {
		return bankId;
	}

	public void setBankId(String bankId) {
		this.bankId = bankId;
	}

	public Double getExchangeRate() {
		return exchangeRate;
	}

	public void setExchangeRate(Double exchangeRate) {
		this.exchangeRate = exchangeRate;
	}

	public BigDecimal getForexFloatAmount() {
		return forexFloatAmount;
	}

	public void setForexFloatAmount(BigDecimal forexFloatAmount) {
		this.forexFloatAmount = forexFloatAmount;
	}

	public BigDecimal getExchangeAmount() {
		return exchangeAmount;
	}

	public void setExchangeAmount(BigDecimal exchangeAmount) {
		this.exchangeAmount = exchangeAmount;
	}

	public String getGatherCurrency() {
		return gatherCurrency;
	}

	public void setGatherCurrency(String gatherCurrency) {
		this.gatherCurrency = gatherCurrency;
	}
	/**
	 * 余额是否充足
	 * @return true充足 ，false不足
	 */
	public boolean getIsAmountEnough() {
		return getNeedRechargeAmount().compareTo(BigDecimal.ZERO)<0?false:true;
	}

	/**
	 * 需充值金额
	 * @return
	 */
	public BigDecimal getNeedRechargeAmount() {
		return getAvailableBalance().subtract(getTotalNeedAmount()).compareTo(BigDecimal.ZERO) >= 0 ? BigDecimal.ZERO
				: getTotalNeedAmount().subtract(getAvailableBalance());
	}

	public BigDecimal getForexCostAmount() {
		return forexCostAmount;
	}

	public void setForexCostAmount(BigDecimal forexCostAmount) {
		this.forexCostAmount = forexCostAmount;
	}

	public BigDecimal getTotalNeedAmount() {
		return getFeeAmount().add(getForexFloatAmount()).add(getForexCostAmount());
	}

	public BigDecimal getAvailableBalance() {
		return availableBalance;
	}

	public void setAvailableBalance(BigDecimal availableBalance) {
		this.availableBalance = availableBalance;
	}

	public BigDecimal getGatherAmount() {
		return gatherAmount;
	}

	public void setGatherAmount(BigDecimal gatherAmount) {
		this.gatherAmount = gatherAmount;
	}

}
