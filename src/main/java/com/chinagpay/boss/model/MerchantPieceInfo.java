package com.chinagpay.boss.model;
import com.chinagpay.boss.common.vo.CommonRequest;
import com.chinagpay.common.exception.zpaytrade.ZpayTradeErrorCode;
import com.chinagpay.common.exception.zpaytrade.ZpayTradeServiceException;

import java.sql.Timestamp;
import java.util.Arrays;

public class MerchantPieceInfo extends CommonRequest {
	private String mchDealType;
	private String bizCategory;
	private String provinceId;
	private String cityId;
	private String districtId;
	private String appid;
	private String payAuthCatalog;
	private String payAttentionFlag;
	private String appPayId;
	
	private Long id;
	private String merchantNo;
	private String thirdMerchantId;
	private String pieceMerchantNo;
	private String pieceBatchNo;
	private String pieceStatus;
	private Timestamp pieceTime;
	private String examineStaff;
	private Timestamp examineTime;
	private String merchantName;
	private String merchantShortName;
	private String merchantClass;
	private String merchantType;
	private String merchantIndustry;
	private String websiteDomain;
	private String merchantBusCode;
	private String merchantFeature;
	private String belongAgentMctNo;
	private String registerAddress;
	private String contactAddress;
	private String ipList;
	private String salesman;
	private String salesmanPhone;
	private String legalPerson;
	private String legalPerPhoneNo;
	private String legalPerCtfType;
	private String legalPerCtfNo;
	private String legalPerCtfDate;
	private String merchantContactPerson;
	private String merchantContactPhone;
	private String merchantContactEmail;
	private String busLicenceNo;
	private String taxRegCtfNo;
	private String orgCode;
	private String speIndusLicenceNo;
	private String icpRecordNumber;
	private String legalPerCtfPath;
	private String busLicenceCftPath;
	private String taxRegCtfPath;
	private String orgCodeCtfPath;
	private String accountOpenCtfPath;
	private String speIndusLicenceCtfPath;
	private String riskLever;
	private String status;
	private String createOperator;
	private Timestamp createTime;
	private String updateOperator;
	private Timestamp updateTime;
	private String virtualAccCurrency;
	private String feePayType;
	private String accountOpenBank;
	private String bankAddress;
	private String accountType;
	private String accountName;
	private String accountOpenCtfType;
	private String accountOpenCtfNo;
	private String accountRemainPhone;
	private String settleType;
	private String settleCycle;
	private byte[] reportData;
	private byte[] feeData;
	private String accountNo;
	private String isItSptByAgent;
	private String companyId;
	private String merchantNature;
	private String product;
	private String servicePhone;
	private String legalPersonPicBack;
	private String foodBusPermissionCtf;
	private String prosceniumPic;
	private String innerStorePic;
	private String cashierDeskPic;
	private String bankId;
	private String callbackUrl;
	private String reportFlag;
	private String esignStatus;

    private String licenseScope;
    private String licenseNum;
    private String licenseStartDate;
    private String licenseEndDate;
    private String licensePeriod;

    public String getLicenseScope() {
        return licenseScope;
    }

    public void setLicenseScope(String licenseScope) {
        this.licenseScope = licenseScope;
    }

    public String getLicenseNum() {
        return licenseNum;
    }

    public void setLicenseNum(String licenseNum) {
        this.licenseNum = licenseNum;
    }

    public String getLicenseStartDate() {
        return licenseStartDate;
    }

    public void setLicenseStartDate(String licenseStartDate) {
        this.licenseStartDate = licenseStartDate;
    }

    public String getLicenseEndDate() {
        return licenseEndDate;
    }

    public void setLicenseEndDate(String licenseEndDate) {
        this.licenseEndDate = licenseEndDate;
    }

    public String getLicensePeriod() {
        return licensePeriod;
    }

    public void setLicensePeriod(String licensePeriod) {
        this.licensePeriod = licensePeriod;
    }

    public String getAccountNo() {
		return accountNo;
	}
    
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public byte[] getReportData() {
        return reportData;
    }

    public void setReportData(byte[] reportData) {
        this.reportData = reportData;
    }

    public byte[] getFeeData() {
        return feeData;
    }

    public void setFeeData(byte[] feeData) {
        this.feeData = feeData;
    }
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPieceMerchantNo() {
        return pieceMerchantNo;
    }

    public void setPieceMerchantNo(String pieceMerchantNo) {
        this.pieceMerchantNo = pieceMerchantNo == null ? null : pieceMerchantNo.trim();
    }

    public String getPieceBatchNo() {
        return pieceBatchNo;
    }

    public void setPieceBatchNo(String pieceBatchNo) {
        this.pieceBatchNo = pieceBatchNo == null ? null : pieceBatchNo.trim();
    }

    public String getPieceStatus() {
        return pieceStatus;
    }

    public void setPieceStatus(String pieceStatus) {
        this.pieceStatus = pieceStatus == null ? null : pieceStatus.trim();
    }

    public Timestamp getPieceTime() {
        return pieceTime;
    }

    public void setPieceTime(Timestamp pieceTime) {
        this.pieceTime = pieceTime;
    }

    public String getExamineStaff() {
        return examineStaff;
    }

    public void setExamineStaff(String examineStaff) {
        this.examineStaff = examineStaff == null ? null : examineStaff.trim();
    }

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName == null ? null : merchantName.trim();
    }

    public String getMerchantShortName() {
        return merchantShortName;
    }

    public void setMerchantShortName(String merchantShortName) {
        this.merchantShortName = merchantShortName == null ? null : merchantShortName.trim();
    }

    public String getMerchantClass() {
        return merchantClass;
    }

    public void setMerchantClass(String merchantClass) {
        this.merchantClass = merchantClass == null ? null : merchantClass.trim();
    }

    public String getMerchantType() {
        return merchantType;
    }

    public void setMerchantType(String merchantType) {
        this.merchantType = merchantType == null ? null : merchantType.trim();
    }

    public String getMerchantIndustry() {
        return merchantIndustry;
    }

    public void setMerchantIndustry(String merchantIndustry) {
        this.merchantIndustry = merchantIndustry == null ? null : merchantIndustry.trim();
    }

    public String getWebsiteDomain() {
        return websiteDomain;
    }

    public void setWebsiteDomain(String websiteDomain) {
        this.websiteDomain = websiteDomain == null ? null : websiteDomain.trim();
    }

    public String getMerchantBusCode() {
        return merchantBusCode;
    }

    public void setMerchantBusCode(String merchantBusCode) {
        this.merchantBusCode = merchantBusCode == null ? null : merchantBusCode.trim();
    }

    public String getMerchantFeature() {
        return merchantFeature;
    }

    public void setMerchantFeature(String merchantFeature) {
        this.merchantFeature = merchantFeature == null ? null : merchantFeature.trim();
    }

    public String getBelongAgentMctNo() {
        return belongAgentMctNo;
    }

    public void setBelongAgentMctNo(String belongAgentMctNo) {
        this.belongAgentMctNo = belongAgentMctNo == null ? null : belongAgentMctNo.trim();
    }

//    public String getBelongGroupMctNo() {
//        return belongGroupMctNo;
//    }
//
//    public void setBelongGroupMctNo(String belongGroupMctNo) {
//        this.belongGroupMctNo = belongGroupMctNo == null ? null : belongGroupMctNo.trim();
//    }

    public String getRegisterAddress() {
        return registerAddress;
    }

    public void setRegisterAddress(String registerAddress) {
        this.registerAddress = registerAddress == null ? null : registerAddress.trim();
    }

    public String getContactAddress() {
        return contactAddress;
    }

    public void setContactAddress(String contactAddress) {
        this.contactAddress = contactAddress == null ? null : contactAddress.trim();
    }

    public String getIpList() {
        return ipList;
    }

    public void setIpList(String ipList) {
        this.ipList = ipList == null ? null : ipList.trim();
    }

    public String getSalesman() {
        return salesman;
    }

    public void setSalesman(String salesman) {
        this.salesman = salesman == null ? null : salesman.trim();
    }

    public String getSalesmanPhone() {
        return salesmanPhone;
    }

    public void setSalesmanPhone(String salesmanPhone) {
        this.salesmanPhone = salesmanPhone == null ? null : salesmanPhone.trim();
    }

    public String getLegalPerson() {
        return legalPerson;
    }

    public void setLegalPerson(String legalPerson) {
        this.legalPerson = legalPerson == null ? null : legalPerson.trim();
    }

    public String getLegalPerPhoneNo() {
        return legalPerPhoneNo;
    }

    public void setLegalPerPhoneNo(String legalPerPhoneNo) {
        this.legalPerPhoneNo = legalPerPhoneNo == null ? null : legalPerPhoneNo.trim();
    }

    public String getLegalPerCtfType() {
        return legalPerCtfType;
    }

    public void setLegalPerCtfType(String legalPerCtfType) {
        this.legalPerCtfType = legalPerCtfType == null ? null : legalPerCtfType.trim();
    }

    public String getLegalPerCtfNo() {
        return legalPerCtfNo;
    }

    public void setLegalPerCtfNo(String legalPerCtfNo) {
        this.legalPerCtfNo = legalPerCtfNo == null ? null : legalPerCtfNo.trim();
    }

    public String getLegalPerCtfDate() {
        return legalPerCtfDate;
    }

    public void setLegalPerCtfDate(String legalPerCtfDate) {
        this.legalPerCtfDate = legalPerCtfDate == null ? null : legalPerCtfDate.trim();
    }

    public String getMerchantContactPerson() {
        return merchantContactPerson;
    }

    public void setMerchantContactPerson(String merchantContactPerson) {
        this.merchantContactPerson = merchantContactPerson == null ? null : merchantContactPerson.trim();
    }

    public String getMerchantContactPhone() {
        return merchantContactPhone;
    }

    public void setMerchantContactPhone(String merchantContactPhone) {
        this.merchantContactPhone = merchantContactPhone == null ? null : merchantContactPhone.trim();
    }

    public String getMerchantContactEmail() {
        return merchantContactEmail;
    }

    public void setMerchantContactEmail(String merchantContactEmail) {
        this.merchantContactEmail = merchantContactEmail == null ? null : merchantContactEmail.trim();
    }

    public String getBusLicenceNo() {
        return busLicenceNo;
    }

    public void setBusLicenceNo(String busLicenceNo) {
        this.busLicenceNo = busLicenceNo == null ? null : busLicenceNo.trim();
    }

    public String getTaxRegCtfNo() {
        return taxRegCtfNo;
    }

    public void setTaxRegCtfNo(String taxRegCtfNo) {
        this.taxRegCtfNo = taxRegCtfNo == null ? null : taxRegCtfNo.trim();
    }

    public String getOrgCode() {
        return orgCode;
    }

    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode == null ? null : orgCode.trim();
    }

    public String getSpeIndusLicenceNo() {
        return speIndusLicenceNo;
    }

    public void setSpeIndusLicenceNo(String speIndusLicenceNo) {
        this.speIndusLicenceNo = speIndusLicenceNo == null ? null : speIndusLicenceNo.trim();
    }

    public String getIcpRecordNumber() {
        return icpRecordNumber;
    }

    public void setIcpRecordNumber(String icpRecordNumber) {
        this.icpRecordNumber = icpRecordNumber == null ? null : icpRecordNumber.trim();
    }

    public String getLegalPerCtfPath() {
        return legalPerCtfPath;
    }

    public void setLegalPerCtfPath(String legalPerCtfPath) {
        this.legalPerCtfPath = legalPerCtfPath == null ? null : legalPerCtfPath.trim();
    }

    public String getBusLicenceCftPath() {
        return busLicenceCftPath;
    }

    public void setBusLicenceCftPath(String busLicenceCftPath) {
        this.busLicenceCftPath = busLicenceCftPath == null ? null : busLicenceCftPath.trim();
    }

    public String getTaxRegCtfPath() {
        return taxRegCtfPath;
    }

    public void setTaxRegCtfPath(String taxRegCtfPath) {
        this.taxRegCtfPath = taxRegCtfPath == null ? null : taxRegCtfPath.trim();
    }

    public String getOrgCodeCtfPath() {
        return orgCodeCtfPath;
    }

    public void setOrgCodeCtfPath(String orgCodeCtfPath) {
        this.orgCodeCtfPath = orgCodeCtfPath == null ? null : orgCodeCtfPath.trim();
    }

    public String getAccountOpenCtfPath() {
        return accountOpenCtfPath;
    }

    public void setAccountOpenCtfPath(String accountOpenCtfPath) {
        this.accountOpenCtfPath = accountOpenCtfPath == null ? null : accountOpenCtfPath.trim();
    }

    public String getSpeIndusLicenceCtfPath() {
        return speIndusLicenceCtfPath;
    }

    public void setSpeIndusLicenceCtfPath(String speIndusLicenceCtfPath) {
        this.speIndusLicenceCtfPath = speIndusLicenceCtfPath == null ? null : speIndusLicenceCtfPath.trim();
    }

    public String getRiskLever() {
        return riskLever;
    }

    public void setRiskLever(String riskLever) {
        this.riskLever = riskLever == null ? null : riskLever.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getCreateOperator() {
        return createOperator;
    }

    public void setCreateOperator(String createOperator) {
        this.createOperator = createOperator == null ? null : createOperator.trim();
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public String getUpdateOperator() {
        return updateOperator;
    }

    public void setUpdateOperator(String updateOperator) {
        this.updateOperator = updateOperator == null ? null : updateOperator.trim();
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    public String getVirtualAccCurrency() {
        return virtualAccCurrency;
    }

    public void setVirtualAccCurrency(String virtualAccCurrency) {
        this.virtualAccCurrency = virtualAccCurrency == null ? null : virtualAccCurrency.trim();
    }

    public String getFeePayType() {
        return feePayType;
    }

    public void setFeePayType(String feePayType) {
        this.feePayType = feePayType == null ? null : feePayType.trim();
    }

    public String getAccountOpenBank() {
        return accountOpenBank;
    }

    public void setAccountOpenBank(String accountOpenBank) {
        this.accountOpenBank = accountOpenBank == null ? null : accountOpenBank.trim();
    }

    public String getBankAddress() {
        return bankAddress;
    }

    public void setBankAddress(String bankAddress) {
        this.bankAddress = bankAddress == null ? null : bankAddress.trim();
    }

    public String getAccountType() {
        return accountType;
    }

    public void setAccountType(String accountType) {
        this.accountType = accountType == null ? null : accountType.trim();
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName == null ? null : accountName.trim();
    }

    public String getAccountOpenCtfType() {
        return accountOpenCtfType;
    }

    public void setAccountOpenCtfType(String accountOpenCtfType) {
        this.accountOpenCtfType = accountOpenCtfType == null ? null : accountOpenCtfType.trim();
    }

    public String getAccountOpenCtfNo() {
        return accountOpenCtfNo;
    }

    public void setAccountOpenCtfNo(String accountOpenCtfNo) {
        this.accountOpenCtfNo = accountOpenCtfNo == null ? null : accountOpenCtfNo.trim();
    }

    public String getAccountRemainPhone() {
        return accountRemainPhone;
    }

    public void setAccountRemainPhone(String accountRemainPhone) {
        this.accountRemainPhone = accountRemainPhone == null ? null : accountRemainPhone.trim();
    }

    public String getSettleType() {
        return settleType;
    }

    public void setSettleType(String settleType) {
        this.settleType = settleType == null ? null : settleType.trim();
    }

    public String getSettleCycle() {
        return settleCycle;
    }

    public void setSettleCycle(String settleCycle) {
        this.settleCycle = settleCycle == null ? null : settleCycle.trim();
    }

	public Timestamp getExamineTime() {
		return examineTime;
	}

	public void setExamineTime(Timestamp examineTime) {
		this.examineTime = examineTime;
	}

	public String getIsItSptByAgent() {
		return isItSptByAgent;
	}

	public void setIsItSptByAgent(String isItSptByAgent) {
		this.isItSptByAgent = isItSptByAgent;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getMerchantNature() {
		return merchantNature;
	}

	public void setMerchantNature(String merchantNature) {
		this.merchantNature = merchantNature;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getServicePhone() {
		return servicePhone;
	}

	public void setServicePhone(String servicePhone) {
		this.servicePhone = servicePhone;
	}

	public String getLegalPersonPicBack() {
		return legalPersonPicBack;
	}

	public void setLegalPersonPicBack(String legalPersonPicBack) {
		this.legalPersonPicBack = legalPersonPicBack;
	}

	public String getFoodBusPermissionCtf() {
		return foodBusPermissionCtf;
	}

	public void setFoodBusPermissionCtf(String foodBusPermissionCtf) {
		this.foodBusPermissionCtf = foodBusPermissionCtf;
	}

	public String getProsceniumPic() {
		return prosceniumPic;
	}

	public void setProsceniumPic(String prosceniumPic) {
		this.prosceniumPic = prosceniumPic;
	}

	public String getInnerStorePic() {
		return innerStorePic;
	}

	public void setInnerStorePic(String innerStorePic) {
		this.innerStorePic = innerStorePic;
	}

	public String getCashierDeskPic() {
		return cashierDeskPic;
	}

	public void setCashierDeskPic(String cashierDeskPic) {
		this.cashierDeskPic = cashierDeskPic;
	}

	public String getBankId() {
		return bankId;
	}

	public void setBankId(String bankId) {
		this.bankId = bankId;
	}

	public String getCallbackUrl() {
		return callbackUrl;
	}

	public void setCallbackUrl(String callbackUrl) {
		this.callbackUrl = callbackUrl;
	}

	public String getReportFlag() {
		return reportFlag;
	}

	public void setReportFlag(String reportFlag) {
		this.reportFlag = reportFlag;
	}

	public String getMerchantNo() {
		return merchantNo;
	}

	public void setMerchantNo(String merchantNo) {
		this.merchantNo = merchantNo;
	}

	public String getThirdMerchantId() {
		return thirdMerchantId;
	}

	public void setThirdMerchantId(String thirdMerchantId) {
		this.thirdMerchantId = thirdMerchantId;
	}

	public String getMchDealType() {
		return mchDealType;
	}

	public void setMchDealType(String mchDealType) {
		this.mchDealType = mchDealType;
	}

	public String getBizCategory() {
		return bizCategory;
	}

	public void setBizCategory(String bizCategory) {
		this.bizCategory = bizCategory;
	}

	public String getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(String provinceId) {
		this.provinceId = provinceId;
	}

	public String getCityId() {
		return cityId;
	}

	public void setCityId(String cityId) {
		this.cityId = cityId;
	}

	public String getDistrictId() {
		return districtId;
	}

	public void setDistrictId(String districtId) {
		this.districtId = districtId;
	}

	public String getAppid() {
		return appid;
	}

	public void setAppid(String appid) {
		this.appid = appid;
	}

	public String getPayAuthCatalog() {
		return payAuthCatalog;
	}

	public void setPayAuthCatalog(String payAuthCatalog) {
		this.payAuthCatalog = payAuthCatalog;
	}

	public String getPayAttentionFlag() {
		return payAttentionFlag;
	}

	public void setPayAttentionFlag(String payAttentionFlag) {
		this.payAttentionFlag = payAttentionFlag;
	}

	public String getAppPayId() {
		return appPayId;
	}

	public void setAppPayId(String appPayId) {
		this.appPayId = appPayId;
	}

	public String getEsignStatus() {
		return esignStatus;
	}

	public void setEsignStatus(String esignStatus) {
		this.esignStatus = esignStatus;
	}

    @Override
    public void validate() {
        if (merchantNo == null || "".equals(merchantNo)){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，商户号不能为空");
        }
        if (companyId == null || "".equals(companyId)){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，企业id不能为空");
        }
        if (thirdMerchantId == null || "".equals(thirdMerchantId)){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，三级商户id不能为空");
        }
        if (mchDealType == null || "".equals(mchDealType)){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，经营类型不能为空");
        }
        if (bizCategory == null || "".equals(bizCategory)){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，经营类目不能为空");
        }
        if (merchantName == null || "".equals(merchantName)){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，商户名称不能为空");
        }
        if (merchantShortName == null || "".equals(merchantShortName)){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，商户简称不能为空");
        }
        if (provinceId == null || "".equals(provinceId)){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，省编码不能为空");
        }
        if (cityId == null || "".equals(cityId)){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，市编码不能为空");
        }
        if (districtId == null || "".equals(districtId)){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，区编码不能为空");
        }
        if (registerAddress == null || "".equals(registerAddress)){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，注册地址不能为空");
        }
        if (legalPerson == null || "".equals(legalPerson)){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，法人姓名不能为空");
        }
        if (legalPerPhoneNo == null || "".equals(legalPerPhoneNo)){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，法人联系方式不能为空");
        }
        if (legalPerCtfNo == null || "".equals(legalPerCtfNo)){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，法人证件号不能为空");
        }
        if (servicePhone == null || "".equals(servicePhone)){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，客服电话不能为空");
        }
        if (merchantContactPerson == null || "".equals(merchantContactPerson)){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，业务联系人姓名不能为空");
        }
        if (merchantContactPhone == null || "".equals(merchantContactPhone)){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，业务联系方式不能为空");
        }
        if (merchantContactEmail == null || "".equals(merchantContactEmail)){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，业务联系邮箱不能为空");
        }
//        if (legalPerCtfNo == null || "".equals(legalPerCtfNo)){
//            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，legalPerCtfNo不能为空");
//        }
        if (licenseScope == null || "".equals(licenseScope)){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，经营范围不能为空");
        }
        if (licenseNum == null || "".equals(licenseNum)){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，营业执照注册号不能为空");
        }
        if (licenseStartDate == null || "".equals(licenseStartDate)){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，营业执照开始时间不能为空");
        }
        if ((licenseEndDate == null || "".equals(licenseEndDate))&&(licensePeriod == null || "".equals(licensePeriod))){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，营业执照结束时间和营业执照是否长期有效不能同时为空");
        }
        if (legalPerCtfPath == null || "".equals(legalPerCtfPath)){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，法人证件照-正面不能为空");
        }
        if (legalPersonPicBack == null || "".equals(legalPersonPicBack)){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，法人证件照-反面不能为空");
        }
        if (busLicenceCftPath == null || "".equals(busLicenceCftPath)){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，营业执照不能为空");
        }
        if (prosceniumPic == null || "".equals(prosceniumPic)){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，门脸照不能为空");
        }
        if (innerStorePic == null || "".equals(innerStorePic)){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，店内照不能为空");
        }
        if (legalPerCtfPath.contains("http")){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，法人证件照-正面地址不正确");
        }
        if (legalPersonPicBack.contains("http")){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，法人证件照-反面地址不正确");
        }
        if (busLicenceCftPath.contains("http")){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，营业执照地址不正确");
        }
        if (prosceniumPic.contains("http")){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，门脸照地址不正确");
        }
        if (innerStorePic.contains("http")){
            throw new ZpayTradeServiceException(ZpayTradeErrorCode.REQUEST_MESSAGE_ERROR,"商户信息缺失，店内照地址不正确");
        }


    }

    @Override
    public String toString() {
        return "MerchantPieceInfo{" +
                "mchDealType='" + mchDealType + '\'' +
                ", bizCategory='" + bizCategory + '\'' +
                ", provinceId='" + provinceId + '\'' +
                ", cityId='" + cityId + '\'' +
                ", districtId='" + districtId + '\'' +
                ", appid='" + appid + '\'' +
                ", payAuthCatalog='" + payAuthCatalog + '\'' +
                ", payAttentionFlag='" + payAttentionFlag + '\'' +
                ", appPayId='" + appPayId + '\'' +
                ", id=" + id +
                ", merchantNo='" + merchantNo + '\'' +
                ", thirdMerchantId='" + thirdMerchantId + '\'' +
                ", pieceMerchantNo='" + pieceMerchantNo + '\'' +
                ", pieceBatchNo='" + pieceBatchNo + '\'' +
                ", pieceStatus='" + pieceStatus + '\'' +
                ", pieceTime=" + pieceTime +
                ", examineStaff='" + examineStaff + '\'' +
                ", examineTime=" + examineTime +
                ", merchantName='" + merchantName + '\'' +
                ", merchantShortName='" + merchantShortName + '\'' +
                ", merchantClass='" + merchantClass + '\'' +
                ", merchantType='" + merchantType + '\'' +
                ", merchantIndustry='" + merchantIndustry + '\'' +
                ", websiteDomain='" + websiteDomain + '\'' +
                ", merchantBusCode='" + merchantBusCode + '\'' +
                ", merchantFeature='" + merchantFeature + '\'' +
                ", belongAgentMctNo='" + belongAgentMctNo + '\'' +
                ", registerAddress='" + registerAddress + '\'' +
                ", contactAddress='" + contactAddress + '\'' +
                ", ipList='" + ipList + '\'' +
                ", salesman='" + salesman + '\'' +
                ", salesmanPhone='" + salesmanPhone + '\'' +
                ", legalPerson='" + legalPerson + '\'' +
                ", legalPerPhoneNo='" + legalPerPhoneNo + '\'' +
                ", legalPerCtfType='" + legalPerCtfType + '\'' +
                ", legalPerCtfNo='" + legalPerCtfNo + '\'' +
                ", legalPerCtfDate='" + legalPerCtfDate + '\'' +
                ", merchantContactPerson='" + merchantContactPerson + '\'' +
                ", merchantContactPhone='" + merchantContactPhone + '\'' +
                ", merchantContactEmail='" + merchantContactEmail + '\'' +
                ", busLicenceNo='" + busLicenceNo + '\'' +
                ", taxRegCtfNo='" + taxRegCtfNo + '\'' +
                ", orgCode='" + orgCode + '\'' +
                ", speIndusLicenceNo='" + speIndusLicenceNo + '\'' +
                ", icpRecordNumber='" + icpRecordNumber + '\'' +
                ", legalPerCtfPath='" + legalPerCtfPath + '\'' +
                ", busLicenceCftPath='" + busLicenceCftPath + '\'' +
                ", taxRegCtfPath='" + taxRegCtfPath + '\'' +
                ", orgCodeCtfPath='" + orgCodeCtfPath + '\'' +
                ", accountOpenCtfPath='" + accountOpenCtfPath + '\'' +
                ", speIndusLicenceCtfPath='" + speIndusLicenceCtfPath + '\'' +
                ", riskLever='" + riskLever + '\'' +
                ", status='" + status + '\'' +
                ", createOperator='" + createOperator + '\'' +
                ", createTime=" + createTime +
                ", updateOperator='" + updateOperator + '\'' +
                ", updateTime=" + updateTime +
                ", virtualAccCurrency='" + virtualAccCurrency + '\'' +
                ", feePayType='" + feePayType + '\'' +
                ", accountOpenBank='" + accountOpenBank + '\'' +
                ", bankAddress='" + bankAddress + '\'' +
                ", accountType='" + accountType + '\'' +
                ", accountName='" + accountName + '\'' +
                ", accountOpenCtfType='" + accountOpenCtfType + '\'' +
                ", accountOpenCtfNo='" + accountOpenCtfNo + '\'' +
                ", accountRemainPhone='" + accountRemainPhone + '\'' +
                ", settleType='" + settleType + '\'' +
                ", settleCycle='" + settleCycle + '\'' +
                ", reportData=" + Arrays.toString(reportData) +
                ", feeData=" + Arrays.toString(feeData) +
                ", accountNo='" + accountNo + '\'' +
                ", isItSptByAgent='" + isItSptByAgent + '\'' +
                ", companyId='" + companyId + '\'' +
                ", merchantNature='" + merchantNature + '\'' +
                ", product='" + product + '\'' +
                ", servicePhone='" + servicePhone + '\'' +
                ", legalPersonPicBack='" + legalPersonPicBack + '\'' +
                ", foodBusPermissionCtf='" + foodBusPermissionCtf + '\'' +
                ", prosceniumPic='" + prosceniumPic + '\'' +
                ", innerStorePic='" + innerStorePic + '\'' +
                ", cashierDeskPic='" + cashierDeskPic + '\'' +
                ", bankId='" + bankId + '\'' +
                ", callbackUrl='" + callbackUrl + '\'' +
                ", reportFlag='" + reportFlag + '\'' +
                ", esignStatus='" + esignStatus + '\'' +
                ", licenseScope='" + licenseScope + '\'' +
                ", licenseNum='" + licenseNum + '\'' +
                ", licenseStartDate='" + licenseStartDate + '\'' +
                ", licenseEndDate='" + licenseEndDate + '\'' +
                ", licensePeriod='" + licensePeriod + '\'' +
                '}';
    }
}