package kr.or.ddit.dto;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class LogHistoryVO {
private String	hiNo       ;
private String	coNo      ;
private String	hiContent  ;
private int	hiCla      ;
private Date	hiDate     ;
private String dName;
private String hiReference;





public String getHiReference() {
	return hiReference;
}



public void setHiReference(String hiReference) {
	this.hiReference = hiReference;
}



public String getdName() {
	return dName;
}



public void setdName(String dName) {
	this.dName = dName;
}



public String getHiNo() {
	return hiNo;
}



public void setHiNo(String hiNo) {
	this.hiNo = hiNo;
}



public String getCoNo() {
	return coNo;
}



public void setCoNo(String coNo) {
	this.coNo = coNo;
}



public String getHiContent() {
	return hiContent;
}



public void setHiContent(String hiContent) {
	this.hiContent = hiContent;
}



public int getHiCla() {
	return hiCla;
}



public void setHiCla(int hiCla) {
	this.hiCla = hiCla;
}



public Date getHiDate() {
	return hiDate;
}



public void setHiDate(Date hiDate) {
	this.hiDate = hiDate;
}



@Override
public String toString() {
	return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
}



}
