package kr.or.ddit.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class ChartFormVO {
	private String pNo;
	private String pName;
	private String reservedate;
	private String rsvName;
	private String pRnum;
	private String coNo;
	private String taNo;
	private String taContent;
	private String rsvDay;
	private String dId;
	private String rsvNo;
	private String dName;
	private String maNo;
	private String maName;
	private String pSex;




	public String getdId() {
		return dId;
	}
	public void setdId(String dId) {
		this.dId = dId;
	}
	public String getRsvNo() {
		return rsvNo;
	}
	public void setRsvNo(String rsvNo) {
		this.rsvNo = rsvNo;
	}
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}
	public String getMaNo() {
		return maNo;
	}
	public void setMaNo(String maNo) {
		this.maNo = maNo;
	}
	public String getMaName() {
		return maName;
	}
	public void setMaName(String maName) {
		this.maName = maName;
	}
	public String getpSex() {
		return pSex;
	}
	public void setpSex(String pSex) {
		this.pSex = pSex;
	}
	public String getRsvDay() {
		return rsvDay;
	}
	public void setRsvDay(String rsvDay) {
		this.rsvDay = rsvDay;
	}
	public String getTaContent() {
		return taContent;
	}
	public void setTaContent(String taContent) {
		this.taContent = taContent;
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
	public String getReservedate() {
		return reservedate;
	}
	public void setReservedate(String reservedate) {
		this.reservedate = reservedate;
	}
	public String getRsvName() {
		return rsvName;
	}
	public void setRsvName(String rsvName) {
		this.rsvName = rsvName;
	}
	public String getpRnum() {
		return pRnum;
	}
	public void setpRnum(String pRnum) {
		this.pRnum = pRnum;
	}
	public String getCoNo() {
		return coNo;
	}
	public void setCoNo(String coNo) {
		this.coNo = coNo;
	}
	public String getTaNo() {
		return taNo;
	}
	public void setTaNo(String taNo) {
		this.taNo = taNo;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}


}
