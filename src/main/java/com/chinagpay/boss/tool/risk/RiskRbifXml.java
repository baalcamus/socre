package com.chinagpay.boss.tool.risk;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by hanbinyu on 2017/6/27.
 */
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class RiskRbifXml {

    private String RINM;
    private String FIRC;
    private String FICE;
    private String RFSG;
    private String ORXN;
    private String SSTM;
    private String STCR;
    private String SSDS;
    private String UDSI;
    private String SCTN;
    private String TTNM;

    public String getRINM() {
        return RINM;
    }

    public void setRINM(String RINM) {
        this.RINM = RINM;
    }

    public String getFIRC() {
        return FIRC;
    }

    public void setFIRC(String FIRC) {
        this.FIRC = FIRC;
    }

    public String getFICE() {
        return FICE;
    }

    public void setFICE(String FICE) {
        this.FICE = FICE;
    }

    public String getRFSG() {
        return RFSG;
    }

    public void setRFSG(String RFSG) {
        this.RFSG = RFSG;
    }

    public String getORXN() {
        return ORXN;
    }

    public void setORXN(String ORXN) {
        this.ORXN = ORXN;
    }

    public String getSSTM() {
        return SSTM;
    }

    public void setSSTM(String SSTM) {
        this.SSTM = SSTM;
    }

    public String getSTCR() {
        return STCR;
    }

    public void setSTCR(String STCR) {
        this.STCR = STCR;
    }

    public String getSSDS() {
        return SSDS;
    }

    public void setSSDS(String SSDS) {
        this.SSDS = SSDS;
    }

    public String getUDSI() {
        return UDSI;
    }

    public void setUDSI(String UDSI) {
        this.UDSI = UDSI;
    }

    public String getSCTN() {
        return SCTN;
    }

    public void setSCTN(String SCTN) {
        this.SCTN = SCTN;
    }

    public String getTTNM() {
        return TTNM;
    }

    public void setTTNM(String TTNM) {
        this.TTNM = TTNM;
    }
}
