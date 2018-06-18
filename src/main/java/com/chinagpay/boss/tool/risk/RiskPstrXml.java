package com.chinagpay.boss.tool.risk;

import javax.xml.bind.annotation.*;
import java.util.List;

/**
 * Created by hanbinyu on 2017/6/27.
 */
@XmlRootElement(name = "PSTR")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(propOrder = {"RBIF","CTIFs","STIFs"})
public class RiskPstrXml {

    private RiskRbifXml RBIF;
    @XmlElementWrapper(name="CTIFs")
    @XmlElement(name="CTIF")
    private List<RiskCtifXml> CTIFs;
    @XmlElementWrapper(name="STIFs")
    @XmlElement(name="STIF")
    private List<RiskStifXml> STIFs;

    public RiskRbifXml getRBIF() {
        return RBIF;
    }

    public void setRBIF(RiskRbifXml RBIF) {
        this.RBIF = RBIF;
    }

    public List<RiskCtifXml> getCTIFs() {
        return CTIFs;
    }

    public void setCTIFs(List<RiskCtifXml> CTIFs) {
        this.CTIFs = CTIFs;
    }

    public List<RiskStifXml> getSTIFs() {
        return STIFs;
    }

    public void setSTIFs(List<RiskStifXml> STIFs) {
        this.STIFs = STIFs;
    }
}
