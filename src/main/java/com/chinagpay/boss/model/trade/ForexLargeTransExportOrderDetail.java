package com.chinagpay.boss.model.trade;

import java.math.BigDecimal;
import java.sql.Timestamp;

////  大额交易要导出的明细数据
public class ForexLargeTransExportOrderDetail {
	private String businessRange;
	/** 订单明细表主键 **/
	private String id;
	/** 大额交易主订单的主键 **/
	private String largetransOrderStatusId;
	/** 订单金额对应的美元 **/
	private BigDecimal orderAmountUsd;
	/** 明细对应的交易对手国 **/
	private String counterpartyCountry;
	/** 明细对应导出的月份 **/
	private String detailExportMonth;
	/** 明细对应导出的类型  个人、机构 **/
	private String detailExportType;
	
	/** -汇款订单ID **/
	private String forexOrderId;
	/** 平台订单号 **/
	private String orderNo;
	/** 商户编号 **/
	private String merchantNo;
	/** 贸易种类 **/
	private String tradeType;
	/** 商户订单号-商户传递 **/
	private String merchantOrderNo;
	/** 汇款币种 **/
	private String forexCurrency;
	/** 汇款金额 **/
	private BigDecimal forexAmount;
	/** 交易类型[付款，收款] **/
	private String exchangeType;
	/** 商户订单明细号-商户传递 **/
	private String merchantOriginalOrderNo;
	/** 订单时间 **/
	private Timestamp merchantOrderDate;
	/** 订单金额 **/
	private BigDecimal orderAmount;
	/** 订单币种 **/
	private String orderCurrency;
	/** 产品种类如酒店、机票、门票等 **/
	private String productType;
	/** 产品名称 **/
	private String productName;
	/** 产品描述 **/
	private String productDes;
	/** 产品数量 **/
	private int productQuantity;
	/** 卖家主体类型 **/
	private String sellerType;
	/** 组织机构代码 **/
	private String sellerAgencyCode;
	/** 卖家姓名 **/
	private String sellerName;
	/** 卖家证件号 **/
	private String sellerIdNo;
	/** 卖家国别 **/
	private String sellerCountry;
	/** 卖家联系方式 **/
	private String sellerPhoneNo;
	/** 买家主体类型 **/
	private String buyerType;
	/** 组织机构代码 **/
	private String buyerAgencyCode;
	/** 买家姓名 **/
	private String buyerName;
	/** 买家证件号 **/
	private String buyerIdNo;
	/** 买家国别 **/
	private String buyerCountry;
	/** 买家联系方式 **/
	private String buyerPhoneNo;
	/** 运单号 **/
	private String transportNo;
	/** 货运机构名 **/
	private String cargoAgencyName;
	/** 发货日期 **/
	private Timestamp shipDate;
	/** 收货日期 **/
	private Timestamp receivedDate;
	/** 订单支付渠道 **/
	private String orderPayChannel;
	/** 支付方式 **/
	private String payType;
	/** 卡类型 **/
	private String cardType;
	/** 支付账/卡号 **/
	private String payNo;
	/** 发票号 **/
	private String invoiceNo;
	/** 合同号 **/
	private String contractNo;
	/** 收付款性质 **/
	private String natureOfPayment;
	/** 是否为保税货物项下付款 **/
	private String bondedGoods;
	/** 二级商户名称 **/
	private String twomerchantName;
	/** 备注 **/
	private String comments;
	/** 创建时间 */
	private Timestamp createTime;
	/** 创建人 */
	private String createStaff;
	/** 审核结果标志 */
	private String checkFlag;
	/** 审核码 */
	private String checkCode;
	/** 审核信息 */
	private String checkMsg;
	//交易附言
	private String transactionRemark;
	private String productUnit;
	
	
	public String getDetailExportType() {
		return detailExportType;
	}

	public void setDetailExportType(String detailExportType) {
		this.detailExportType = detailExportType;
	}

	public String getDetailExportMonth() {
		return detailExportMonth;
	}

	public void setDetailExportMonth(String detailExportMonth) {
		this.detailExportMonth = detailExportMonth;
	}

	public String getLargetransOrderStatusId() {
		return largetransOrderStatusId;
	}

	public void setLargetransOrderStatusId(String largetransOrderStatusId) {
		this.largetransOrderStatusId = largetransOrderStatusId;
	}

	public String getCounterpartyCountry() {
		return counterpartyCountry;
	}

	public void setCounterpartyCountry(String counterpartyCountry) {
		this.counterpartyCountry = counterpartyCountry;
	}

	public BigDecimal getOrderAmountUsd() {
		return orderAmountUsd;
	}

	public void setOrderAmountUsd(BigDecimal orderAmountUsd) {
		this.orderAmountUsd = orderAmountUsd;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getMerchantNo() {
		return merchantNo;
	}

	public void setMerchantNo(String merchantNo) {
		this.merchantNo = merchantNo;
	}

	public String getTradeType() {
		return tradeType;
	}

	public void setTradeType(String tradeType) {
		this.tradeType = tradeType;
	}

	public String getMerchantOrderNo() {
		return merchantOrderNo;
	}

	public void setMerchantOrderNo(String merchantOrderNo) {
		this.merchantOrderNo = merchantOrderNo;
	}

	public String getForexCurrency() {
		return forexCurrency;
	}

	public void setForexCurrency(String forexCurrency) {
		this.forexCurrency = forexCurrency;
	}

	public BigDecimal getForexAmount() {
		return forexAmount;
	}

	public void setForexAmount(BigDecimal forexAmount) {
		this.forexAmount = forexAmount;
	}

	public String getMerchantOriginalOrderNo() {
		return merchantOriginalOrderNo;
	}

	public void setMerchantOriginalOrderNo(String merchantOriginalOrderNo) {
		this.merchantOriginalOrderNo = merchantOriginalOrderNo;
	}

	public Timestamp getMerchantOrderDate() {
		return merchantOrderDate;
	}

	public void setMerchantOrderDate(Timestamp merchantOrderDate) {
		this.merchantOrderDate = merchantOrderDate;
	}

	public BigDecimal getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(BigDecimal orderAmount) {
		this.orderAmount = orderAmount;
	}

	public String getOrderCurrency() {
		return orderCurrency;
	}

	public void setOrderCurrency(String orderCurrency) {
		this.orderCurrency = orderCurrency;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDes() {
		return productDes;
	}

	public void setProductDes(String productDes) {
		this.productDes = productDes;
	}

	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	public String getSellerType() {
		return sellerType;
	}

	public void setSellerType(String sellerType) {
		this.sellerType = sellerType;
	}

	public String getSellerAgencyCode() {
		return sellerAgencyCode;
	}

	public void setSellerAgencyCode(String sellerAgencyCode) {
		this.sellerAgencyCode = sellerAgencyCode;
	}

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	public String getSellerIdNo() {
		return sellerIdNo;
	}

	public void setSellerIdNo(String sellerIdNo) {
		this.sellerIdNo = sellerIdNo;
	}

	public String getSellerCountry() {
		return sellerCountry;
	}

	public void setSellerCountry(String sellerCountry) {
		this.sellerCountry = sellerCountry;
	}

	public String getSellerPhoneNo() {
		return sellerPhoneNo;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public String getCreateStaff() {
		return createStaff;
	}

	public void setCreateStaff(String createStaff) {
		this.createStaff = createStaff;
	}

	public void setSellerPhoneNo(String sellerPhoneNo) {
		this.sellerPhoneNo = sellerPhoneNo;
	}

	public String getBuyerType() {
		return buyerType;
	}

	public void setBuyerType(String buyerType) {
		this.buyerType = buyerType;
	}

	public String getBuyerAgencyCode() {
		return buyerAgencyCode;
	}

	public void setBuyerAgencyCode(String buyerAgencyCode) {
		this.buyerAgencyCode = buyerAgencyCode;
	}

	public String getBuyerName() {
		return buyerName;
	}

	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}

	public String getBuyerIdNo() {
		return buyerIdNo;
	}

	public void setBuyerIdNo(String buyerIdNo) {
		this.buyerIdNo = buyerIdNo;
	}

	public String getBuyerCountry() {
		return buyerCountry;
	}

	public void setBuyerCountry(String buyerCountry) {
		this.buyerCountry = buyerCountry;
	}

	public String getBuyerPhoneNo() {
		return buyerPhoneNo;
	}

	public void setBuyerPhoneNo(String buyerPhoneNo) {
		this.buyerPhoneNo = buyerPhoneNo;
	}

	public String getTransportNo() {
		return transportNo;
	}

	public void setTransportNo(String transportNo) {
		this.transportNo = transportNo;
	}

	public String getCargoAgencyName() {
		return cargoAgencyName;
	}

	public void setCargoAgencyName(String cargoAgencyName) {
		this.cargoAgencyName = cargoAgencyName;
	}

	public Timestamp getShipDate() {
		return shipDate;
	}

	public void setShipDate(Timestamp shipDate) {
		this.shipDate = shipDate;
	}

	public Timestamp getReceivedDate() {
		return receivedDate;
	}

	public void setReceivedDate(Timestamp receivedDate) {
		this.receivedDate = receivedDate;
	}

	public String getOrderPayChannel() {
		return orderPayChannel;
	}

	public void setOrderPayChannel(String orderPayChannel) {
		this.orderPayChannel = orderPayChannel;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public String getPayNo() {
		return payNo;
	}

	public void setPayNo(String payNo) {
		this.payNo = payNo;
	}

	public String getInvoiceNo() {
		return invoiceNo;
	}

	public void setInvoiceNo(String invoiceNo) {
		this.invoiceNo = invoiceNo;
	}

	public String getContractNo() {
		return contractNo;
	}

	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
	}

	public String getNatureOfPayment() {
		return natureOfPayment;
	}

	public void setNatureOfPayment(String natureOfPayment) {
		this.natureOfPayment = natureOfPayment;
	}

	public String getBondedGoods() {
		return bondedGoods;
	}

	public void setBondedGoods(String bondedGoods) {
		this.bondedGoods = bondedGoods;
	}

	public String getTwomerchantName() {
		return twomerchantName;
	}

	public void setTwomerchantName(String twomerchantName) {
		this.twomerchantName = twomerchantName;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getForexOrderId() {
		return forexOrderId;
	}

	public void setForexOrderId(String forexOrderId) {
		this.forexOrderId = forexOrderId;
	}

	public String getExchangeType() {
		return exchangeType;
	}

	public void setExchangeType(String exchangeType) {
		this.exchangeType = exchangeType;
	}

	public String getCheckFlag() {
		return checkFlag;
	}

	public void setCheckFlag(String checkFlag) {
		this.checkFlag = checkFlag;
	}

	public String getCheckCode() {
		return checkCode;
	}

	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}

	public String getCheckMsg() {
		return checkMsg;
	}

	public void setCheckMsg(String checkMsg) {
		this.checkMsg = checkMsg;
	}

	public void validate() {
		String[] fields2 = { merchantOrderNo, merchantOriginalOrderNo, productName, productDes, sellerAgencyCode,
				sellerName, sellerIdNo, sellerCountry, sellerPhoneNo, buyerAgencyCode, buyerName, buyerIdNo,
				buyerCountry, buyerPhoneNo, transportNo, cargoAgencyName, orderPayChannel, payType, cardType, payNo,
				invoiceNo, contractNo, natureOfPayment, bondedGoods, twomerchantName, comments };
		String[] names2 = { "merchantOrderNo", "merchantOriginalOrderNo", "productName", "productDes",
				"sellerAgencyCode", "sellerName", "sellerIdNo", "sellerCountry", "sellerPhoneNo", "buyerAgencyCode",
				"buyerName", "buyerIdNo", "buyerCountry", "buyerPhoneNo", "transportNo", "cargoAgencyName",
				"orderPayChannel", "payType", "cardType", "payNo", "invoiceNo", "contractNo", "natureOfPayment",
				"bondedGoods", "twomerchantName", "comments" };
		int[] lens = { 64, 64, 500, 1024, 20, 64, 64, 30, 20, 20, 64, 64, 30, 20, 100, 100, 100, 8, 20, 64, 20, 20, 20,
				20, 100, 1024 };
		com.chinagpay.utils.common.CheckUtils.validateFieldsOutOfLength(fields2, names2, lens);
	}

	public String getBusinessRange() {
		return businessRange;
	}

	public void setBusinessRange(String businessRange) {
		this.businessRange = businessRange;
	}

	public String getTransactionRemark() {
		return transactionRemark;
	}

	public void setTransactionRemark(String transactionRemark) {
		this.transactionRemark = transactionRemark;
	}

	public String getProductUnit() {
		return productUnit;
	}

	public void setProductUnit(String productUnit) {
		this.productUnit = productUnit;
	}
}
