package kr.or.ddit.dto;

public class SchedulerVO {
	private String coNo;
	private String dId;
	private String rsvNo;
	private String rsvDay;
	private String dName;
	private String maNo;
	private String maName;
	private String pNo;
	private String pName;
	private String pSex;
	private String pRnum;
	private String pInsurance;
	private String taNo;
	private String taDate;
	private String taName;
	private String Color;
	private String start;
	private String end;
	private String title;
	private String starttime;
	private String endtime;


	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getTitle() {
		return this.pName +"<"+this.taName+">";
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart() {
		return this.starttime;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return this.endtime;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getColor() {
		return Color;
	}
	public void setColor(String color) {
		Color = color;
	}
	public String getTaDate() {
		return taDate;
	}
	public void setTaDate(String taDate) {
		this.taDate = taDate;
	}
	public String getTaName() {
		return taName;
	}
	public void setTaName(String taName) {
		this.taName = taName;
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
	public String getRsvNo() {
		return rsvNo;
	}
	public void setRsvNo(String rsvNo) {
		this.rsvNo = rsvNo;
	}
	public String getRsvDay() {
		return rsvDay;
	}
	public void setRsvDay(String rsvDay) {
		this.rsvDay = rsvDay;
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
	public String getpInsurance() {
		return pInsurance;
	}
	public void setpInsurance(String pInsurance) {
		this.pInsurance = pInsurance;
	}
	public String getTaNo() {
		return taNo;
	}
	public void setTaNo(String taNo) {
		this.taNo = taNo;
	}

}
