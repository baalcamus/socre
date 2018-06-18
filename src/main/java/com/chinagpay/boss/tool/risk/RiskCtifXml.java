package com.chinagpay.boss.tool.risk;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;

/**
 * Created by hanbinyu on 2017/6/27.
 */
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class RiskCtifXml {
    @XmlAttribute
    private String seqno;
    private String CTNM;
    private String SMID;
    private String CITP;
    private String CTID;
    private RiskCcifXml CCIF;
    private String CTVC;
    private String CRNM;
    private String CRIT;
    private String CRID;

    public String getSeqno() {
        return seqno;
    }

    public void setSeqno(String seqno) {
        this.seqno = seqno;
    }

    public String getCTNM() {
        return CTNM;
    }

    public void setCTNM(String CTNM) {
        this.CTNM = CTNM;
    }

    public String getSMID() {
        return SMID;
    }

    public void setSMID(String SMID) {
        this.SMID = SMID;
    }

    public String getCITP() {
        return CITP;
    }

    public void setCITP(String CITP) {
        this.CITP = CITP;
    }

    public String getCTID() {
        return CTID;
    }

    public void setCTID(String CTID) {
        this.CTID = CTID;
    }

    public RiskCcifXml getCCIF() {
        return CCIF;
    }

    public void setCCIF(RiskCcifXml CCIF) {
        this.CCIF = CCIF;
    }

    public String getCTVC() {
        return CTVC;
    }

    public void setCTVC(String CTVC) {
        this.CTVC = CTVC;
    }

    public String getCRNM() {
        return CRNM;
    }

    public void setCRNM(String CRNM) {
        this.CRNM = CRNM;
    }

    public String getCRIT() {
        return CRIT;
    }

    public void setCRIT(String CRIT) {
        this.CRIT = CRIT;
    }

    public String getCRID() {
        return CRID;
    }

    public void setCRID(String CRID) {
        this.CRID = CRID;
    }
}
