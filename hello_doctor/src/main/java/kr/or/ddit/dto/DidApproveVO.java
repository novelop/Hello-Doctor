package kr.or.ddit.dto;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class DidApproveVO {

	private String dId;
	private String coNo;
	private String pNo;
	private String coDisease;
	private String coDoc;
	private String pName;
	private String pRnum;
	private String taNo;
	private String taName;
	private String taContent;
	private Date taDate;
	private int taStatus;
	private String taStatusResult;

	private String coDocName;
	
	
	
	public String getCoDocName() {
		return coDocName;
	}
	public void setCoDocName(String coDocName) {
		this.coDocName = coDocName;
	}
	public String getdId() {
		return dId;
	}
	public void setdId(String dId) {
		this.dId = dId;
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
	public String getCoDisease() {
		return coDisease;
	}
	public void setCoDisease(String coDisease) {
		this.coDisease = coDisease;
	}
	public String getCoDoc() {
		return coDoc;
	}
	public void setCoDoc(String coDoc) {
		this.coDoc = coDoc;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpRnum() {
		return pRnum;
	}
	public void setpRnum(String pRnum) {
		this.pRnum = pRnum;
	}
	public String getTaNo() {
		return taNo;
	}
	public void setTaNo(String taNo) {
		this.taNo = taNo;
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
	public String getTaStatusResult() {
		return taStatusResult;
	}
	public void setTaStatusResult(String taStatusResult) {
		this.taStatusResult = taStatusResult;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}



}
