package kr.or.ddit.dto;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class CoTaskVO {
	private String taNo        ;
	private String coNo        ;
	private String dId         ;
	private String taName      ;
	private String taContent   ;
	private Date taDate      ;
	private int taStatus    ;
	private String reservYn    ;
	private String taReference;
	private String coDoc;
	private String dName;





	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}
	public String getCoDoc() {
		return coDoc;
	}
	public void setCoDoc(String coDoc) {
		this.coDoc = coDoc;
	}
	public String getTaReference() {
		return taReference;
	}
	public void setTaReference(String taReference) {
		this.taReference = taReference;
	}
	public String getTaNo() {
		return taNo;
	}
	public void setTaNo(String taNo) {
		this.taNo = taNo;
	}
	public String getCoNo() {
		return coNo;
	}
	public void setCoNo(String coNo) {
		this.coNo = coNo;
	}
	public String getdId() {
		return dId;
	}
	public void setdId(String dId) {
		this.dId = dId;
	}
	public String getTaName() {
		return taName;
	}
	public void setTaName(String taName) {
		this.taName = taName;
	}
	public String getTaContent() {
		return taContent;
	}
	public void setTaContent(String taContent) {
		this.taContent = taContent;
	}
	public Date getTaDate() {
		return taDate;
	}
	public void setTaDate(Date taDate) {
		this.taDate = taDate;
	}
	public int getTaStatus() {
		return taStatus;
	}
	public void setTaStatus(int taStatus) {
		this.taStatus = taStatus;
	}
	public String getReservYn() {
		return reservYn;
	}
	public void setReservYn(String reservYn) {
		this.reservYn = reservYn;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}


}
