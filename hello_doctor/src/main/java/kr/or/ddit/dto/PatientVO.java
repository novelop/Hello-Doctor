package kr.or.ddit.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class PatientVO {

	private String pNo          ;
	private String pName        ;
	private String pSex         ;
	private String pRnum        ;
	private String pTel         ;
	private String pAddress     ;
	private String pInsurance   ;
	private String coNo;
	private String rsvNo;



	public String getRsvNo() {
		return rsvNo;
	}


	public void setRsvNo(String rsvNo) {
		this.rsvNo = rsvNo;
	}


	public String getCoNo() {
		return coNo;
	}


	public void setCoNo(String coNo) {
		this.coNo = coNo;
	}


	public String getpNo() {
		return pNo;
	}


	public void setpNo(String pNo) {
		this.pNo = pNo;
	}


	public String getpName() {
		return pName;
	}


	public void setpName(String pName) {
		this.pName = pName;
	}


	public String getpSex() {
		return pSex;
	}


	public void setpSex(String pSex) {
		this.pSex = pSex;
	}


	public String getpRnum() {
		return pRnum;
	}


	public void setpRnum(String pRnum) {
		this.pRnum = pRnum;
	}


	public String getpTel() {
		return pTel;
	}


	public void setpTel(String pTel) {
		this.pTel = pTel;
	}


	public String getpAddress() {
		return pAddress;
	}


	public void setpAddress(String pAddress) {
		this.pAddress = pAddress;
	}


	public String getpInsurance() {
		return pInsurance;
	}


	public void setpInsurance(String pInsurance) {
		this.pInsurance = pInsurance;
	}


	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}


}
