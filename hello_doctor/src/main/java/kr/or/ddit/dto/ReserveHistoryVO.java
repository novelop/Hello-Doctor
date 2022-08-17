package kr.or.ddit.dto;

import java.util.Date;

public class ReserveHistoryVO {

    private String taNo;
    private String coNo;
    private String dId;
    private String taName;
    private String taContent;
    private String taDate;
    private int taStatus;
    private String reservYn;
    private String pNo;
    private String coDisease;
    private String pName;
    private String pSex;
    private String pRnum;
    private Date comDate;
    private String ago;



    public Date getComDate() {
		return comDate;
	}
	public void setComDate(Date comDate) {
		this.comDate = comDate;
	}
	public String getAgo() {
		return ago;
	}
	public void setAgo(String ago) {
		this.ago = ago;
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

	public String getTaDate() {
		return taDate;
	}
	public void setTaDate(String taDate) {
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
	@Override
	public String toString() {
		return "ReserveHistoryVO [taNo=" + taNo + ", coNo=" + coNo + ", dId=" + dId + ", taName=" + taName
				+ ", taContent=" + taContent + ", taDate=" + taDate + ", taStatus=" + taStatus + ", reservYn="
				+ reservYn + ", pNo=" + pNo + ", coDisease=" + coDisease + ", pName=" + pName + ", pSex=" + pSex
				+ ", pRnum=" + pRnum + "]";
	}





}
