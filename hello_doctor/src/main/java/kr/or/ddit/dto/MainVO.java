package kr.or.ddit.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.format.annotation.DateTimeFormat;

@SuppressWarnings("serial")
public class MainVO implements Serializable {

	// 메인 특이사항 리스트VO
	private String  issTitle   ;
	private String  issYn      ;
	private String  pName      ;

	private Date  	mDate      ;
	private String  dId        ;

	// 메인 최근 협진 진료기록VO
	private String dName;
	private String mName;
	private String comNo;
	private Date comDate;
	private String maName;

	// 메인 내가 주치의면서 환자상태 VO
	private String pRnum;
	private String mNo;
	private String symptom;

	// 환자의 특이사항
	private String issContent;
	private String issNo;
	private String pNo;



	public String getpNo() {
		return pNo;
	}
	public void setpNo(String pNo) {
		this.pNo = pNo;
	}
	public String getIssNo() {
		return issNo;
	}
	public void setIssNo(String issNo) {
		this.issNo = issNo;
	}
	public String getIssContent() {
		return issContent;
	}
	public void setIssContent(String issContent) {
		this.issContent = issContent;
	}
	public String getSymptom() {
		return symptom;
	}
	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}
	public String getpRnum() {
		return pRnum;
	}
	public String getmNo() {
		return mNo;
	}
	public void setmNo(String mNo) {
		this.mNo = mNo;
	}
	public void setpRnum(String pRnum) {
		this.pRnum = pRnum;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}

	public String getComNo() {
		return comNo;
	}
	public void setComNo(String comNo) {
		this.comNo = comNo;
	}
	public Date getComDate() {
		return comDate;
	}
	public void setComDate(Date comDate) {
		this.comDate = comDate;
	}
	public String getMaName() {
		return maName;
	}
	public void setMaName(String maName) {
		this.maName = maName;
	}
	public String getIssTitle() {
		return issTitle;
	}
	public void setIssTitle(String issTitle) {
		this.issTitle = issTitle;
	}
	public String getIssYn() {
		return issYn;
	}
	public void setIssYn(String issYn) {
		this.issYn = issYn;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public Date getmDate() {
		return mDate;
	}
	public void setmDate(Date mDate) {
		this.mDate = mDate;
	}
	public String getdId() {
		return dId;
	}
	public void setdId(String dId) {
		this.dId = dId;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}




}
