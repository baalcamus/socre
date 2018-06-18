package com.chinagpay.boss.tool.trade.excel.export.vo;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class ForexOrderDetailVo {
	private String businessCode;
	private String payerIdType;
	/**订单明细表主键**/
	private String id;
	/**-汇款订单ID**/
	private String forexOrderId;
	/**平台订单号**/
	private String orderNo;
	/**商户编号**/
	private String merchantNo;
	/**贸易种类**/
	private String tradeType;
	/**商户订单号-商户传递**/
	private String merchantOrderNo;
	/**汇款币种**/
	private String forexCurrency;
	/**汇款金额**/
	private BigDecimal forexAmount;
	/**交易类型[付款，收款]**/
	private String exchangeType;
	/**商户订单明细号-商户传递**/
	private String merchantOriginalOrderNo;
	/**订单时间**/
	private String merchantOrderDate;
	/**订单金额**/
	private BigDecimal orderAmount;
	/**订单币种**/
	private String orderCurrency;
	/**产品种类如酒店、机票、门票等**/
	private String productType;
	/**产品名称**/
	private String productName;
	/**产品描述**/
	private String productDes;
	/**产品数量**/
	private int productQuantity;
	/**卖家主体类型**/
	private String sellerType;
	/**组织机构代码**/
	private String sellerAgencyCode;
	/**卖家姓名**/
	private String sellerName;
	/**卖家证件号**/
	private String sellerIdNo;
	/**卖家国别**/
	private String sellerCountry;
	/**卖家联系方式**/
	private String sellerPhoneNo;
	/**买家主体类型**/
	private String buyerType;
	/**组织机构代码**/
	private String buyerAgencyCode;
	/**买家姓名**/
	private String buyerName;
	/**买家证件号**/
	private String buyerIdNo;
	/**买家国别**/
	private String buyerCountry;
	/**买家联系方式**/
	private String buyerPhoneNo;
	/**运单号**/
	private String transportNo;
	/**货运机构名**/
	private String cargoAgencyName;
	/**发货日期**/
	private Timestamp shipDate;
	/**收货日期**/
	private Timestamp receivedDate;
	/**订单支付渠道**/
	private String orderPayChannel;
	/**支付方式**/
	private String payType;
	/**卡类型**/
	private String cardType;
	/**支付账/卡号**/
	private String payNo;
	/**发票号**/
	private String invoiceNo;
	/**合同号**/
	private String contractNo;
	/**收付款性质**/
	private String natureOfPayment;
	/**是否为保税货物项下付款**/
	private String bondedGoods;
	/**二级商户名称**/
	private String twomerchantName;
	/**备注**/
	private String comments;
	 /**创建时间*/
	private Timestamp    createTime;
	/**创建人*/
	private String    createStaff;
	
	
	
	
	/**交易附言*/
	private String remitComment;
	/**当前时间*/
	private Timestamp  currentTime;
	/**证件号*/
	private String idCode;
	/**单价*/
	private BigDecimal productAmount;
	
	private BigDecimal sumRemitAmount;
	private String rateType;
	private String remitCurrency;
	
	private BigDecimal sumGatherAmount;
	
	private String gatherCurrency;
	
	/**客户属性*/
	private String customerType;
	/**购汇种类*/
	private String sort;
	/**付款类型*/
	private String paymentType;
	/**交易编码*/
	private String tradeCode;
	
	/**汇款行手续费*/
	private BigDecimal feeAmount;	
	
	
	
	/**付款人信息*/
	private String payerType;                              
	private String payerAgencyCode;                        
	private String payerIdNo;                              
	private String payerPhoneNo;                           
	private String payerName;                              
	private String payerCountry;                           
	private String payerAddr;                              
	private String payerAccountNo;                         
	private String payerBankAddr;                          
	private String payerBankName;                          
	private String payBankSwiftCode;    
	
	private String agentBankAddr;                          
	private String agentBankName;                          
	private String agentBankSwiftCode;   
	
	/**收款人信息*/
	private String receiverType;                              
	private String receiverAgencyCode;                        
	private String receiverIdNo;                              
	private String receiverPhoneNo;                           
	private String receiverName;                              
	private String receiverCountry;                           
	private String receiverAddr;                              
	private String receiverAccountNo;                         
	private String receiverBankAddr;                          
	private String receiverBankName;                          
	private String revBankSwiftCode;      
	
	private String receiverAgentBankAddr;                          
	private String receiverAgentBankName;                          
	private String receiverAgentBankSwiftCode;     
	
	private String businessRange;



	
	public String getBusinessRange() {
		return businessRange;
	}
	public void setBusinessRange(String businessRange) {
		this.businessRange = businessRange;
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
	public String getMerchantOrderDate() {
		return merchantOrderDate;
	}
	public void setMerchantOrderDate(String merchantOrderDate) {
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
	public String getRemitComment() {
		return remitComment;
	}
	public void setRemitComment(String remitComment) {
		this.remitComment = remitComment;
	}
	public String getPayerType() {
		return payerType;
	}
	public void setPayerType(String payerType) {
		this.payerType = payerType;
	}
	public String getPayerAgencyCode() {
		return payerAgencyCode;
	}
	public void setPayerAgencyCode(String payerAgencyCode) {
		this.payerAgencyCode = payerAgencyCode;
	}
	public String getPayerIdNo() {
		return payerIdNo;
	}
	public void setPayerIdNo(String payerIdNo) {
		this.payerIdNo = payerIdNo;
	}
	public String getPayerPhoneNo() {
		return payerPhoneNo;
	}
	public void setPayerPhoneNo(String payerPhoneNo) {
		this.payerPhoneNo = payerPhoneNo;
	}
	public String getPayerName() {
		return payerName;
	}
	public void setPayerName(String payerName) {
		this.payerName = payerName;
	}
	public String getPayerCountry() {
		return payerCountry;
	}
	public void setPayerCountry(String payerCountry) {
		this.payerCountry = payerCountry;
	}
	public String getPayerAddr() {
		return payerAddr;
	}
	public void setPayerAddr(String payerAddr) {
		this.payerAddr = payerAddr;
	}
	public String getPayerAccountNo() {
		return payerAccountNo;
	}
	public void setPayerAccountNo(String payerAccountNo) {
		this.payerAccountNo = payerAccountNo;
	}
	public String getPayerBankAddr() {
		return payerBankAddr;
	}
	public void setPayerBankAddr(String payerBankAddr) {
		this.payerBankAddr = payerBankAddr;
	}
	public String getPayerBankName() {
		return payerBankName;
	}
	public void setPayerBankName(String payerBankName) {
		this.payerBankName = payerBankName;
	}
	public String getPayBankSwiftCode() {
		return payBankSwiftCode;
	}
	public void setPayBankSwiftCode(String payBankSwiftCode) {
		this.payBankSwiftCode = payBankSwiftCode;
	}
	public String getReceiverType() {
		return receiverType;
	}
	public void setReceiverType(String receiverType) {
		this.receiverType = receiverType;
	}
	public String getReceiverAgencyCode() {
		return receiverAgencyCode;
	}
	public void setReceiverAgencyCode(String receiverAgencyCode) {
		this.receiverAgencyCode = receiverAgencyCode;
	}
	public String getReceiverIdNo() {
		return receiverIdNo;
	}
	public void setReceiverIdNo(String receiverIdNo) {
		this.receiverIdNo = receiverIdNo;
	}
	public String getReceiverPhoneNo() {
		return receiverPhoneNo;
	}
	public void setReceiverPhoneNo(String receiverPhoneNo) {
		this.receiverPhoneNo = receiverPhoneNo;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getReceiverCountry() {
		return receiverCountry;
	}
	public void setReceiverCountry(String receiverCountry) {
		this.receiverCountry = receiverCountry;
	}
	public String getReceiverAddr() {
		return receiverAddr;
	}
	public void setReceiverAddr(String receiverAddr) {
		this.receiverAddr = receiverAddr;
	}
	public String getReceiverAccountNo() {
		return receiverAccountNo;
	}
	public void setReceiverAccountNo(String receiverAccountNo) {
		this.receiverAccountNo = receiverAccountNo;
	}
	public String getReceiverBankAddr() {
		return receiverBankAddr;
	}
	public void setReceiverBankAddr(String receiverBankAddr) {
		this.receiverBankAddr = receiverBankAddr;
	}
	public String getReceiverBankName() {
		return receiverBankName;
	}
	public void setReceiverBankName(String receiverBankName) {
		this.receiverBankName = receiverBankName;
	}
	public String getRevBankSwiftCode() {
		return revBankSwiftCode;
	}
	public void setRevBankSwiftCode(String revBankSwiftCode) {
		this.revBankSwiftCode = revBankSwiftCode;
	}
	public Timestamp getCurrentTime() {
		return currentTime;
	}
	public void setCurrentTime(Timestamp currentTime) {
		this.currentTime = currentTime;
	}
	public String getIdCode() {
		return idCode;
	}
	public void setIdCode(String idCode) {
		this.idCode = idCode;
	}
	public BigDecimal getProductAmount() {
		return productAmount;
	}
	public void setProductAmount(BigDecimal productAmount) {
		this.productAmount = productAmount;
	}
	public BigDecimal getSumRemitAmount() {
		return sumRemitAmount;
	}
	public void setSumRemitAmount(BigDecimal sumRemitAmount) {
		this.sumRemitAmount = sumRemitAmount;
	}
	public String getRemitCurrency() {
		return remitCurrency;
	}
	public void setRemitCurrency(String remitCurrency) {
		this.remitCurrency = remitCurrency;
	}
	public BigDecimal getSumGatherAmount() {
		return sumGatherAmount;
	}
	public void setSumGatherAmount(BigDecimal sumGatherAmount) {
		this.sumGatherAmount = sumGatherAmount;
	}
	public String getGatherCurrency() {
		return gatherCurrency;
	}
	public void setGatherCurrency(String gatherCurrency) {
		this.gatherCurrency = gatherCurrency;
	}
	public String getCustomerType() {
		return customerType;
	}
	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public String getTradeCode() {
		return tradeCode;
	}
	public void setTradeCode(String tradeCode) {
		this.tradeCode = tradeCode;
	}
	public BigDecimal getFeeAmount() {
		return feeAmount;
	}
	public void setFeeAmount(BigDecimal feeAmount) {
		this.feeAmount = feeAmount;
	}
	public String getAgentBankAddr() {
		return agentBankAddr;
	}
	public void setAgentBankAddr(String agentBankAddr) {
		this.agentBankAddr = agentBankAddr;
	}
	public String getAgentBankName() {
		return agentBankName;
	}
	public void setAgentBankName(String agentBankName) {
		this.agentBankName = agentBankName;
	}
	public String getAgentBankSwiftCode() {
		return agentBankSwiftCode;
	}
	public void setAgentBankSwiftCode(String agentBankSwiftCode) {
		this.agentBankSwiftCode = agentBankSwiftCode;
	}
	public String getReceiverAgentBankAddr() {
		return receiverAgentBankAddr;
	}
	public void setReceiverAgentBankAddr(String receiverAgentBankAddr) {
		this.receiverAgentBankAddr = receiverAgentBankAddr;
	}
	public String getReceiverAgentBankName() {
		return receiverAgentBankName;
	}
	public void setReceiverAgentBankName(String receiverAgentBankName) {
		this.receiverAgentBankName = receiverAgentBankName;
	}
	public String getReceiverAgentBankSwiftCode() {
		return receiverAgentBankSwiftCode;
	}
	public void setReceiverAgentBankSwiftCode(String receiverAgentBankSwiftCode) {
		this.receiverAgentBankSwiftCode = receiverAgentBankSwiftCode;
	}
	public String getPayerIdType() {
		return payerIdType;
	}
	public void setPayerIdType(String payerIdType) {
		this.payerIdType = payerIdType;
	}
	public String getBusinessCode() {
		return businessCode;
	}
	public void setBusinessCode(String businessCode) {
		this.businessCode = businessCode;
	}
	public String getRateType() {
		return rateType;
	}
	public void setRateType(String rateType) {
		this.rateType = rateType;
	}	
}
