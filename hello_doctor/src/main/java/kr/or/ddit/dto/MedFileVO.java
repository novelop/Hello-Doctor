package kr.or.ddit.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class MedFileVO {
	private String mfNo         ;
	private String mNo          ;
	private String mfFilename   ;
	private String mfFilepath   ;
	private String mfFiletype   ;
	private String mDate;
	private String dId;


	public String getdId() {
		return dId;
	}
	public void setdId(String dId) {
		this.dId = dId;
	}
	public String getmDate() {
		return mDate;
	}
	public void setmDate(String mDate) {
		this.mDate = mDate;
	}
	public String getMfNo() {
		return mfNo;
	}
	public void setMfNo(String mfNo) {
		this.mfNo = mfNo;
	}
	public String getmNo() {
		return mNo;
	}
	public void setmNo(String mNo) {
		this.mNo = mNo;
	}
	public String getMfFilename() {
		return mfFilename;
	}
	public void setMfFilename(String mfFilename) {
		this.mfFilename = mfFilename;
	}
	public String getMfFilepath() {
		return mfFilepath;
	}
	public void setMfFilepath(String mfFilepath) {
		this.mfFilepath = mfFilepath;
	}
	public String getMfFiletype() {
		return mfFiletype;
	}
	public void setMfFiletype(String mfFiletype) {
		this.mfFiletype = mfFiletype;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}

}
