package kr.or.ddit.dto;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class ComRecoVO { //최근진료기록 구할 때!

	private String symptom;
	private Date mDate;
	private String comNo       ;
	private String mNo         ;
	private String coNo        ;
	private Date comDate     ;
	private String comStatus   ;

	private String taNo;
	private String dId;
	private String pNo;
	private String dName;
	private String pName;
	private String pSex;
	private String pRnum;




	public String getTaNo() {
		return taNo;
	}
	public void setTaNo(String taNo) {
		this.taNo = taNo;
	}
	public String getdId() {
		return dId;
	}
	public void setdId(String dId) {
		this.dId = dId;
	}
	public String getpNo() {
		return pNo;
	}
	public void setpNo(String pNo) {
		this.pNo = pNo;
	}
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
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
	public String getSymptom() {
		return symptom;
	}
	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}
	public Date getmDate() {
		return mDate;
	}
	public void setmDate(Date mDate) {
		this.mDate = mDate;
	}
	public String getComNo() {
		return comNo;
	}
	public void setComNo(String comNo) {
		this.comNo = comNo;
	}
	public String getmNo() {
		return mNo;
	}
	public void setmNo(String mNo) {
		this.mNo = mNo;
	}
	public String getCoNo() {
		return coNo;
	}
	public void setCoNo(String coNo) {
		this.coNo = coNo;
	}
	public Date getComDate() {
		return comDate;
	}
	public void setComDate(Date comDate) {
		this.comDate = comDate;
	}
	public String getComStatus() {
		return comStatus;
	}
	public void setComStatus(String comStatus) {
		this.comStatus = comStatus;
	}



	@Override
	public String toString() {
		return "ComRecoVO [symptom=" + symptom + ", mDate=" + mDate + ", comNo=" + comNo + ", mNo=" + mNo + ", coNo="
				+ coNo + ", comDate=" + comDate + ", comStatus=" + comStatus + ", taNo=" + taNo + ", dId=" + dId
				+ ", pNo=" + pNo + ", dName=" + dName + ", pName=" + pName + ", pSex=" + pSex + ", pRnum=" + pRnum
				+ "]";
	}



}
