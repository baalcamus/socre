package com.chinagpay.boss.model.risk.xml;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.stream.XMLStreamException;

import com.chinagpay.utils.common.xml.JaxbUtil;

/** 
	* @author  liws  
	* @date    2017年6月28日 下午5:46:03  
*/
@XmlRootElement(name="FDBK")
@XmlAccessorType(XmlAccessType.FIELD)
public class Fdbk {

	@XmlElement(name="SFID")
	private String sfid;
	
	@XmlElement(name="ERTN")
	private String ertn;
	
	@XmlElement(name="NMERs")
	private Nmers nmers;
	
	@XmlElement(name="FCERs")
	private Fcers fcers;

	public String getSfid() {
		return sfid;
	}

	public void setSfid(String sfid) {
		this.sfid = sfid;
	}

	public String getErtn() {
		return ertn;
	}

	public void setErtn(String ertn) {
		this.ertn = ertn;
	}

	public Nmers getNmers() {
		return nmers;
	}

	public void setNmers(Nmers nmers) {
		this.nmers = nmers;
	}
	
	public Fcers getFcers() {
		return fcers;
	}

	public void setFcers(Fcers fcers) {
		this.fcers = fcers;
	}

	@XmlRootElement(name="NMERs")
	@XmlAccessorType(XmlAccessType.FIELD)
	public static class Nmers{

		@XmlElement(name="NMER")
		private List<Nmer> nmerList;

		public List<Nmer> getNmerList() {
			return nmerList;
		}

		public void setNmerList(List<Nmer> nmerList) {
			this.nmerList = nmerList;
		}
	}

	@XmlRootElement(name="NMER")
	@XmlAccessorType(XmlAccessType.FIELD)
	public static class Nmer {

		@XmlElement(name="EFNM")
		private String efnm;
		
		@XmlElement(name="ERRS")
		private String errs;

		@XmlAttribute(name="seqno")
		private String seqno;
		
		public String getEfnm() {
			return efnm;
		}

		public void setEfnm(String efnm) {
			this.efnm = efnm;
		}

		public String getErrs() {
			return errs;
		}

		public void setErrs(String errs) {
			this.errs = errs;
		}
		
		public String getSeqno() {
			return seqno;
		}

		public void setSeqno(String seqno) {
			this.seqno = seqno;
		}
	}

	@XmlRootElement(name="NMERs")
	@XmlAccessorType(XmlAccessType.FIELD)
	public static class Fcers{
		@XmlElement(name="NMER")
		private List<Fcer> fcerList;

		public List<Fcer> getFcerList() {
			return fcerList;
		}

		public void setFcerList(List<Fcer> fcerList) {
			this.fcerList = fcerList;
		}
	}

	@XmlRootElement(name="FCER")
	@XmlAccessorType(XmlAccessType.FIELD)
	public static class Fcer{
		
		@XmlElement(name="ERLC")
		private String erlc;
		@XmlElement(name="ERRS")
		private String errs;

		public String getErlc() {
			return erlc;
		}

		public void setErlc(String erlc) {
			this.erlc = erlc;
		}

		public String getErrs() {
			return errs;
		}

		public void setErrs(String errs) {
			this.errs = errs;
		}
	}

	@Override
	public String toString(){
		try {
			return "Fdbk.xml:"+JaxbUtil.beanToXml(this, true);
		} catch (UnsupportedEncodingException | JAXBException | XMLStreamException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
//	public static void main(String[] args) {
//
//		Nmer aa = new Nmer();
//		aa.setEfnm("1");
//		aa.setErrs("2");
//		aa.setSeqno("1");
//		Nmer aa1 = new Nmer();
//		aa1.setEfnm("3");
//		aa1.setErrs("4");
//		aa1.setSeqno("2");
//		List<Nmer> list = new ArrayList<Nmer>();
//		list.add(aa);
//		list.add(aa1);
//
//		Nmers nn = new Nmers();
//		nn.setNmerList(list);
//		Fdbk bb = new Fdbk();
//		bb.setErtn("1");
//		bb.setSfid("2");
//		bb.setNmers(nn);
//		System.out.println(bb);
//	}
	
	public static void main(String[] args) {
        
        File file = new File("C:\\Users\\Administrator\\Desktop\\1.txt");
        try {
            JAXBContext context = JAXBContext.newInstance(Fdbk.class);
            Unmarshaller unMar = context.createUnmarshaller();
            Fdbk ff = (Fdbk) unMar.unmarshal(file);
            System.out.println(ff.getErtn());
            System.out.println(ff.getSfid());
            Nmers nn = ff.getNmers();
            List<Nmer> mm = nn.getNmerList();
            for(Nmer cc:mm){
            	System.out.println(cc.getEfnm());
            	System.out.println(cc.getErrs());
            	System.out.println(cc.getSeqno());
            }
        } catch (JAXBException e) {
            e.printStackTrace();
        }
    }
}