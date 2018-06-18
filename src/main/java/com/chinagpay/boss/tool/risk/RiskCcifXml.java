package com.chinagpay.boss.tool.risk;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by hanbinyu on 2017/6/27.
 */
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class RiskCcifXml {
    private String CTAR;
    private String CCTL;
    private String CEML;

    public String getCTAR() {
        return CTAR;
    }

    public void setCTAR(String CTAR) {
        this.CTAR = CTAR;
    }

    public String getCCTL() {
        return CCTL;
    }

    public void setCCTL(String CCTL) {
        this.CCTL = CCTL;
    }

    public String getCEML() {
        return CEML;
    }

    public void setCEML(String CEML) {
        this.CEML = CEML;
    }
}
