package com.chinagpay.boss.model;

import java.util.Date;

/**
 * @ClassName: CustomerWhiteList
 * @Description: 商户白名单表,登记商户白名单表基本信息
 * @author: lw
 * @date: 2016年8月24日 上午10:59:01
 */
public class CustomerWhiteList {
	private Long id;

	/**
	 * @Description: 商户编号
	 */
	private String customerNumber;
	/**
	 * @Description: 商户名称
	 */
	private String customerName;
	/**
	 * @Description: 商户类型，D-对私，C-对公
	 */
	private String customerType;
	/**
	 * @Description: 组织机构代码
	 */
	private String orgInsOcde;
	/**
	 * @Description: 营业执照注册号
	 */
	private String bizLicRegCode;
	/**
	 * @Description: 证件类型
	 */
	private String certificateType;
	/**
	 * @Description: 证件号
	 */
	private String certificateNumber;
	/**
	 * @Description: 状态，valid :有效，invalid： 无效',
	 */
	private String status;
	/**
	 * @Description: 创建人
	 */
	private String createStaff;
	/**
	 * @Description: 创建时间
	 */
	private Date createTime;
	/**
	 * @Description: 修改人
	 */
	private String updateStaff;
	/**
	 * @Description: 修改时间
	 */
	private Date updateTime;
	/**
	 * @Description: 描述
	 */
	private String description;
	private String companyId;
	private String salesMan;
	private String operateDate;
	private String allowBiz;
	private String legalDescription;
	private String legalName;
	private String source;
	private String customerShortName;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCustomerNumber() {
		return customerNumber;
	}

	public void setCustomerNumber(String customerNumber) {
		this.customerNumber = customerNumber == null ? null : customerNumber.trim();
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName == null ? null : customerName.trim();
	}

	public String getCustomerType() {
		return customerType;
	}

	public void setCustomerType(String customerType) {
		this.customerType = customerType == null ? null : customerType.trim();
	}


	public String getBizLicRegCode() {
		return bizLicRegCode;
	}

	public void setBizLicRegCode(String bizLicRegCode) {
		this.bizLicRegCode = bizLicRegCode == null ? null : bizLicRegCode.trim();
	}

	public String getCertificateType() {
		return certificateType;
	}

	public void setCertificateType(String certificateType) {
		this.certificateType = certificateType == null ? null : certificateType.trim();
	}

	public String getCertificateNumber() {
		return certificateNumber;
	}

	public void setCertificateNumber(String certificateNumber) {
		this.certificateNumber = certificateNumber == null ? null : certificateNumber.trim();
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status == null ? null : status.trim();
	}

	public String getCreateStaff() {
		return createStaff;
	}

	public void setCreateStaff(String createStaff) {
		this.createStaff = createStaff == null ? null : createStaff.trim();
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getUpdateStaff() {
		return updateStaff;
	}

	public void setUpdateStaff(String updateStaff) {
		this.updateStaff = updateStaff == null ? null : updateStaff.trim();
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description == null ? null : description.trim();
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getSalesMan() {
		return salesMan;
	}

	public void setSalesMan(String salesMan) {
		this.salesMan = salesMan;
	}

	public String getOperateDate() {
		return operateDate;
	}

	public void setOperateDate(String operateDate) {
		this.operateDate = operateDate;
	}

	public String getAllowBiz() {
		return allowBiz;
	}

	public void setAllowBiz(String allowBiz) {
		this.allowBiz = allowBiz;
	}

	public String getLegalDescription() {
		return legalDescription;
	}

	public void setLegalDescription(String legalDescription) {
		this.legalDescription = legalDescription;
	}

	public String getLegalName() {
		return legalName;
	}

	public void setLegalName(String legalName) {
		this.legalName = legalName;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getCustomerShortName() {
		return customerShortName;
	}

	public void setCustomerShortName(String customerShortName) {
		this.customerShortName = customerShortName;
	}

	public String getOrgInsOcde() {
		return orgInsOcde;
	}

	public void setOrgInsOcde(String orgInsOcde) {
		this.orgInsOcde = orgInsOcde;
	}

}