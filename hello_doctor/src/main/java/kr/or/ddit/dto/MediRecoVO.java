package kr.or.ddit.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class MediRecoVO {
	private String mNo         ;
	private String dId         ;
	private String pNo         ;
	private String issNo       ;
	private String mFilePath  ;
	private String symptom      ;
	private String mOpinion    ;
	private String mDate       ;
	private String mName       ;
	private String dName       ;


	public String getmNo() {
		return mNo;
	}


	public void setmNo(String mNo) {
		this.mNo = mNo;
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


	public String getIssNo() {
		return issNo;
	}


	public void setIssNo(String issNo) {
		this.issNo = issNo;
	}


	public String getmFilePath() {
		return mFilePath;
	}


	public void setmFilePath(String mFilePath) {
		this.mFilePath = mFilePath;
	}


	public String getSymptom() {
		return symptom;
	}


	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}


	public String getmOpinion() {
		return mOpinion;
	}


	public void setmOpinion(String mOpinion) {
		this.mOpinion = mOpinion;
	}


	public String getmDate() {
		return mDate;
	}


	public void setmDate(String mDate) {
		this.mDate = mDate;
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


	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}


}
