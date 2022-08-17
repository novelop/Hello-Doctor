package kr.or.ddit.dto;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class SubTaskVO {
	private String subNo       ;
	private String taNo        ;
	private String subName     ;
	private Date subDate     ;
	private String lFile       ;
	private String lPath       ;
	private String lType       ;
	private Date endDay      ;
	private Date startDay    ;
	private String color        ;
	private String completeYn;




	public String getCompleteYn() {
		return completeYn;
	}


	public void setCompleteYn(String completeYn) {
		this.completeYn = completeYn;
	}


	public String getSubNo() {
		return subNo;
	}


	public void setSubNo(String subNo) {
		this.subNo = subNo;
	}


	public String getTaNo() {
		return taNo;
	}


	public void setTaNo(String taNo) {
		this.taNo = taNo;
	}


	public String getSubName() {
		return subName;
	}


	public void setSubName(String subName) {
		this.subName = subName;
	}


	public Date getSubDate() {
		return subDate;
	}


	public void setSubDate(Date subDate) {
		this.subDate = subDate;
	}


	public String getlFile() {
		return lFile;
	}


	public void setlFile(String lFile) {
		this.lFile = lFile;
	}


	public String getlPath() {
		return lPath;
	}


	public void setlPath(String lPath) {
		this.lPath = lPath;
	}


	public String getlType() {
		return lType;
	}


	public void setlType(String lType) {
		this.lType = lType;
	}


	public Date getEndDay() {
		return endDay;
	}


	public void setEndDay(Date endDay) {
		this.endDay = endDay;
	}


	public Date getStartDay() {
		return startDay;
	}


	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}


	public String getColor() {
		return color;
	}


	public void setColor(String color) {
		this.color = color;
	}


	@Override
	public String toString() {
		return "SubTaskVO [subNo=" + subNo + ", taNo=" + taNo + ", subName=" + subName + ", subDate=" + subDate
				+ ", lFile=" + lFile + ", lPath=" + lPath + ", lType=" + lType + ", endDay=" + endDay + ", startDay="
				+ startDay + ", color=" + color + ", completeYn=" + completeYn + "]";
	}



}
