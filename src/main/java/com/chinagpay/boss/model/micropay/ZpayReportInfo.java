package com.chinagpay.boss.model.micropay;

import java.sql.Timestamp;

public class ZpayReportInfo {
	private String id;
    //业务提交信息
    private String merchantNo;
    private String companyId;  				//代理商下子商户标识号
    private String thirdMerchantId;			//三级商户ID 部分商户特有需求 如吉店
    private String merchantFullName;		//公司全称
	private String displayShortName;		//支付显示名称
	private String mchDealType;		//经营类型
	private String bizCategory;				//经营类目
	private String provinceId;				//省编码
	private String cityId;				//市编码
	private String districtId;	//区县
	private String merchantAddress;			//商户地址
	
	private String legalPhone;		//法人电话
	private String legalName;		//法人联系人
	private String legalIdCard;		//法人联系人
	
	private String serviceContactPhone;		//客服电话
	private String serviceContactName;		//客服联系人
	private String serviceContactIdCard;		//客服联系人
	
	private String bizContactPhone;			//业务联系人电话
	private String bizContactName;			//业务联系人姓名
	private String bizContactEmail;			//业务联系人邮箱
	private String bizContactIdCard;		//业务联系人证件
	
	private String appId;					//APPID  公众号   微信才有
	private String appPayId;				//AppId(APP支付)
	private String payAuthCatalog;			//支付授权目录
	private String payAttentionFlag;		//支付即关注标记
	
	
	//报备产生或主动生成信息
	private String reportChannel;			//报备渠道
    private String reportPayMethod;			//报备支付方式(微信支付,支付宝支付)
    private String patternMark;             //报备模式   一户一码  大商户
    private String reportCode;				//传给通道的报备代码
    
    private String bankMerchantCode;		//报备商户码
	private String merchantStatus;			//商户状态 0：待审核/报备中 ，1：可用 ，-1 ：禁用
	private String defaultUsed;
	private String appIdApplyFlag;          //公众号申请标记
	private String appPayIdApplyFlag;       //app支付申请标记
	
	
	private String createStaff;
    private Timestamp createTime;
    private String updateStaff;
    private Timestamp updateTime;
    private String description;

	private String bankMerchantKey;
	private String singleBizCodeFlag;
	
	private String bankCode;		//银行返回码
	private String bankMessage;			//银行返回信息
	private String bankMarkCode;// 商户识别码--民生
	
	
	
	/**下面是一些页面显示用的字段，与数据库demo无关**/
	private String p_ChannelName;//通道名称
	private String supportTemplet;//支持模板APP,PUB
	private String channelName;

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

	public String getBankMerchantKey() {
		return bankMerchantKey;
	}

	public void setBankMerchantKey(String bankMerchantKey) {
		this.bankMerchantKey = bankMerchantKey;
	}

	public String getBankCode() {
		return bankCode;
	}

	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}

	public String getBankMessage() {
		return bankMessage;
	}

	public void setBankMessage(String bankMessage) {
		this.bankMessage = bankMessage;
	}

	public String getBankMarkCode() {
		return bankMarkCode;
	}

	public void setBankMarkCode(String bankMarkCode) {
		this.bankMarkCode = bankMarkCode;
	}

	public String getSingleBizCodeFlag() {
		return singleBizCodeFlag;
	}

	public void setSingleBizCodeFlag(String singleBizCodeFlag) {
		this.singleBizCodeFlag = singleBizCodeFlag;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMerchantNo() {
		return merchantNo;
	}
	public void setMerchantNo(String merchantNo) {
		this.merchantNo = merchantNo;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public String getThirdMerchantId() {
		return thirdMerchantId;
	}
	public String getAppIdApplyFlag() {
		return appIdApplyFlag;
	}
	public void setAppIdApplyFlag(String appIdApplyFlag) {
		this.appIdApplyFlag = appIdApplyFlag;
	}
	public String getAppPayIdApplyFlag() {
		return appPayIdApplyFlag;
	}
	public void setAppPayIdApplyFlag(String appPayIdApplyFlag) {
		this.appPayIdApplyFlag = appPayIdApplyFlag;
	}
	public void setThirdMerchantId(String thirdMerchantId) {
		this.thirdMerchantId = thirdMerchantId;
	}
	public String getMerchantFullName() {
		return merchantFullName;
	}
	public void setMerchantFullName(String merchantFullName) {
		this.merchantFullName = merchantFullName;
	}
	public String getDisplayShortName() {
		return displayShortName;
	}
	public void setDisplayShortName(String displayShortName) {
		this.displayShortName = displayShortName;
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
	public String getMerchantAddress() {
		return merchantAddress;
	}
	public void setMerchantAddress(String merchantAddress) {
		this.merchantAddress = merchantAddress;
	}
	public String getLegalPhone() {
		return legalPhone;
	}
	public void setLegalPhone(String legalPhone) {
		this.legalPhone = legalPhone;
	}
	public String getLegalName() {
		return legalName;
	}
	public void setLegalName(String legalName) {
		this.legalName = legalName;
	}
	public String getLegalIdCard() {
		return legalIdCard;
	}
	public void setLegalIdCard(String legalIdCard) {
		this.legalIdCard = legalIdCard;
	}
	public String getServiceContactPhone() {
		return serviceContactPhone;
	}
	public void setServiceContactPhone(String serviceContactPhone) {
		this.serviceContactPhone = serviceContactPhone;
	}
	public String getServiceContactName() {
		return serviceContactName;
	}
	public void setServiceContactName(String serviceContactName) {
		this.serviceContactName = serviceContactName;
	}
	public String getServiceContactIdCard() {
		return serviceContactIdCard;
	}
	public void setServiceContactIdCard(String serviceContactIdCard) {
		this.serviceContactIdCard = serviceContactIdCard;
	}
	public String getBizContactPhone() {
		return bizContactPhone;
	}
	public void setBizContactPhone(String bizContactPhone) {
		this.bizContactPhone = bizContactPhone;
	}
	public String getBizContactName() {
		return bizContactName;
	}
	public void setBizContactName(String bizContactName) {
		this.bizContactName = bizContactName;
	}
	public String getBizContactEmail() {
		return bizContactEmail;
	}
	public void setBizContactEmail(String bizContactEmail) {
		this.bizContactEmail = bizContactEmail;
	}
	public String getBizContactIdCard() {
		return bizContactIdCard;
	}
	public void setBizContactIdCard(String bizContactIdCard) {
		this.bizContactIdCard = bizContactIdCard;
	}
	public String getAppId() {
		return appId;
	}
	public void setAppId(String appId) {
		this.appId = appId;
	}
	public String getAppPayId() {
		return appPayId;
	}
	public void setAppPayId(String appPayId) {
		this.appPayId = appPayId;
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
	public String getReportChannel() {
		return reportChannel;
	}
	public void setReportChannel(String reportChannel) {
		this.reportChannel = reportChannel;
	}
	public String getReportPayMethod() {
		return reportPayMethod;
	}
	public void setReportPayMethod(String reportPayMethod) {
		this.reportPayMethod = reportPayMethod;
	}
	public String getPatternMark() {
		return patternMark;
	}
	public void setPatternMark(String patternMark) {
		this.patternMark = patternMark;
	}
	public String getReportCode() {
		return reportCode;
	}
	public void setReportCode(String reportCode) {
		this.reportCode = reportCode;
	}
	public String getBankMerchantCode() {
		return bankMerchantCode;
	}
	public void setBankMerchantCode(String bankMerchantCode) {
		this.bankMerchantCode = bankMerchantCode;
	}
	public String getMerchantStatus() {
		return merchantStatus;
	}
	public void setMerchantStatus(String merchantStatus) {
		this.merchantStatus = merchantStatus;
	}
	public String getDefaultUsed() {
		return defaultUsed;
	}
	public void setDefaultUsed(String defaultUsed) {
		this.defaultUsed = defaultUsed;
	}
	public String getCreateStaff() {
		return createStaff;
	}
	public void setCreateStaff(String createStaff) {
		this.createStaff = createStaff;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public String getUpdateStaff() {
		return updateStaff;
	}
	public void setUpdateStaff(String updateStaff) {
		this.updateStaff = updateStaff;
	}
	public Timestamp getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	public String getP_ChannelName() {
		return p_ChannelName;
	}

	public void setP_ChannelName(String p_ChannelName) {
		this.p_ChannelName = p_ChannelName;
	}

	public String getSupportTemplet() {
		return supportTemplet;
	}

	public void setSupportTemplet(String supportTemplet) {
		this.supportTemplet = supportTemplet;
	}

	public String getDistrictId() {
		return districtId;
	}

	public void setDistrictId(String districtId) {
		this.districtId = districtId;
	}
    
    
}
