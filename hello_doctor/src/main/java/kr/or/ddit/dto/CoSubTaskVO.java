package kr.or.ddit.dto;

import java.util.Date;

public class CoSubTaskVO {

	private String subNo;
	private String subName;
	private String subDate;
	private String completeYn;
	private String taNo;
	private String coNo;
	private String dId;
	private String taName;
	private String taContent;
	private String taDate;
	private int taStatus;
	private String reservYn;




	public String getSubDate() {
		return subDate;
	}
	public void setSubDate(String subDate) {
		this.subDate = subDate;
	}



	public String getTaDate() {
		return taDate;
	}
	public void setTaDate(String taDate) {
		this.taDate = taDate;
	}
	public String getSubNo() {
		return subNo;
	}
	public void setSubNo(String subNo) {
		this.subNo = subNo;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}

	public String getCompleteYn() {
		return completeYn;
	}
	public void setCompleteYn(String completeYn) {
		this.completeYn = completeYn;
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
		return "CoSubTaskVO [subNo=" + subNo + ", subName=" + subName + ", subDate=" + subDate + ", completeYn="
				+ completeYn + ", taNo=" + taNo + ", coNo=" + coNo + ", dId=" + dId + ", taName=" + taName
				+ ", taContent=" + taContent + ", taDate=" + taDate + ", taStatus=" + taStatus + ", reservYn="
				+ reservYn + "]";
	}








}
