package com.chinagpay.boss.model;

public class PushInfoVo {
	private String id;

    private String type;

    private String regname;

    private String cusname;

    private String doctype;

    private String doccode;

    private String legdocname;

    private String legdoctype;

    private String legdoccode;

    private String risklevel;

    private String risktype;

    private String validdate;

    private String validstatus;

    private String uptime;
    
    private String beginDate;
    private String endDate;

    public String getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getRegname() {
        return regname;
    }

    public void setRegname(String regname) {
        this.regname = regname == null ? null : regname.trim();
    }

    public String getCusname() {
        return cusname;
    }

    public void setCusname(String cusname) {
        this.cusname = cusname == null ? null : cusname.trim();
    }

    public String getDoctype() {
        return doctype;
    }

    public void setDoctype(String doctype) {
        this.doctype = doctype == null ? null : doctype.trim();
    }

    public String getDoccode() {
        return doccode;
    }

    public void setDoccode(String doccode) {
        this.doccode = doccode == null ? null : doccode.trim();
    }

    public String getLegdocname() {
        return legdocname;
    }

    public void setLegdocname(String legdocname) {
        this.legdocname = legdocname == null ? null : legdocname.trim();
    }

    public String getLegdoctype() {
        return legdoctype;
    }

    public void setLegdoctype(String legdoctype) {
        this.legdoctype = legdoctype == null ? null : legdoctype.trim();
    }

    public String getLegdoccode() {
        return legdoccode;
    }

    public void setLegdoccode(String legdoccode) {
        this.legdoccode = legdoccode == null ? null : legdoccode.trim();
    }

    public String getRisklevel() {
        return risklevel;
    }

    public void setRisklevel(String risklevel) {
        this.risklevel = risklevel == null ? null : risklevel.trim();
    }

    public String getRisktype() {
        return risktype;
    }

    public void setRisktype(String risktype) {
        this.risktype = risktype == null ? null : risktype.trim();
    }

    public String getValiddate() {
        return validdate;
    }

    public void setValiddate(String validdate) {
        this.validdate = validdate == null ? null : validdate.trim();
    }

    public String getValidstatus() {
        return validstatus;
    }

    public void setValidstatus(String validstatus) {
        this.validstatus = validstatus == null ? null : validstatus.trim();
    }

    public String getUptime() {
        return uptime;
    }

    public void setUptime(String uptime) {
        this.uptime = uptime == null ? null : uptime.trim();
    }
}