package kr.or.ddit.dto;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class JoinCooperVO {  //해당 의사가 참여중인 협진리스트

private String pNo ;
private String pName;
private String pRnum;
private String coDisease;
private String coNo;
private String coDoc;
private Date maxDate;
private String coFreqYn;
private String dName;
private String dPic;
private String maName;

private Date cofRegdate;






public Date getCofRegdate() {
	return cofRegdate;
}
public void setCofRegdate(Date cofRegdate) {
	this.cofRegdate = cofRegdate;
}
public String getMaName() {
	return maName;
}
public void setMaName(String maName) {
	this.maName = maName;
}
public String getdName() {
	return dName;
}
public void setdName(String dName) {
	this.dName = dName;
}
public String getdPic() {
	return dPic;
}
public void setdPic(String dPic) {
	this.dPic = dPic;
}
public String getCoFreqYn() {
	return coFreqYn;
}
public void setCoFreqYn(String coFreqYn) {
	this.coFreqYn = coFreqYn;
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
public String getpRnum() {
	return pRnum;
}
public void setpRnum(String pRnum) {
	this.pRnum = pRnum;
}
public String getCoDisease() {
	return coDisease;
}
public void setCoDisease(String coDisease) {
	this.coDisease = coDisease;
}
public String getCoNo() {
	return coNo;
}
public void setCoNo(String coNo) {
	this.coNo = coNo;
}
public String getCoDoc() {
	return coDoc;
}
public void setCoDoc(String coDoc) {
	this.coDoc = coDoc;
}
public Date getMaxDate() {
	return maxDate;
}
public void setMaxDate(Date maxDate) {
	this.maxDate = maxDate;
}


@Override
public String toString() {
	return "JoinCooperVO [pNo=" + pNo + ", pName=" + pName + ", pRnum=" + pRnum + ", coDisease=" + coDisease + ", coNo="
			+ coNo + ", coDoc=" + coDoc + ", maxDate=" + maxDate + ", coFreqYn=" + coFreqYn + ", dName=" + dName
			+ ", dPic=" + dPic + ", maName=" + maName + ", cofRegdate=" + cofRegdate + "]";
}









}
