package com.chinagpay.boss.model;

import java.util.Date;

/** 
 * @ClassName: CustomerBlackList 
 * @Description: TODO
 * @author: lw
 * @date: 2016年8月24日 上午10:58:55  
 */
public class CustomerBlackList {
	private Long id;
	private String customerNumber;
	private String customerName;
	private String customerShortName;
	private String customerType;
	private String orgInsCode;
	private String bizLicRegCode;
	private String certificateType;
	private String certificateNumber;
	private String status;
	private String createStaff;
	private Date createTime;
	private String updateStaff;
	private Date updateTime;
	private String description;
	private String companyId;
	private String salesMan;
	private String operateType;
	private String illegalChannel;
	private String illegalBiz;
	private String illegalDescription;
	private String legalName;
	private String illegalBizEntrance;
	private String source;
	private String triggerRule;
	private String assistantInfo;
	

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

    public String getOrgInsCode() {
        return orgInsCode;
    }

    public void setOrgInsCode(String orgInsCode) {
        this.orgInsCode = orgInsCode == null ? null : orgInsCode.trim();
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

	public String getOperateType() {
		return operateType;
	}

	public void setOperateType(String operateType) {
		this.operateType = operateType;
	}

	public String getIllegalChannel() {
		return illegalChannel;
	}

	public void setIllegalChannel(String illegalChannel) {
		this.illegalChannel = illegalChannel;
	}

	public String getIllegalBiz() {
		return illegalBiz;
	}

	public void setIllegalBiz(String illegalBiz) {
		this.illegalBiz = illegalBiz;
	}

	public String getIllegalDescription() {
		return illegalDescription;
	}

	public void setIllegalDescription(String illegalDescription) {
		this.illegalDescription = illegalDescription;
	}

	public String getLegalName() {
		return legalName;
	}

	public void setLegalName(String legalName) {
		this.legalName = legalName;
	}

	public String getIllegalBizEntrance() {
		return illegalBizEntrance;
	}

	public void setIllegalBizEntrance(String illegalBizEntrance) {
		this.illegalBizEntrance = illegalBizEntrance;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getTriggerRule() {
		return triggerRule;
	}

	public void setTriggerRule(String triggerRule) {
		this.triggerRule = triggerRule;
	}

	public String getAssistantInfo() {
		return assistantInfo;
	}

	public void setAssistantInfo(String assistantInfo) {
		this.assistantInfo = assistantInfo;
	}

	public String getCustomerShortName() {
		return customerShortName;
	}

	public void setCustomerShortName(String customerShortName) {
		this.customerShortName = customerShortName;
	}
}