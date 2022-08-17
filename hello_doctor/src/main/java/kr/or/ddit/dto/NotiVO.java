package kr.or.ddit.dto;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class NotiVO {
private Date notiDate;
private String reqdId;
private String resdId;
private int response;
private String mysetting;
private String notiNo;
private String coNo;
private int claNo;
private int read;
private String reasonRef;
private String coOpinion;
private String coDisease;
private String pName;
private String dName;
private String dPic;
private String coName;
private String ago;
private int count;
private String pRnum;
private String maName;


private String resName;



public String getResName() {
	return resName;
}





public void setResName(String resName) {
	this.resName = resName;
}





public String getMaName() {
	return maName;
}





public void setMaName(String maName) {
	this.maName = maName;
}




public String getpRnum() {
	return pRnum;
}





public void setpRnum(String pRnum) {
	this.pRnum = pRnum;
}





private String reqdName;
private String resdName;




public String getReqdName() {
	return reqdName;
}





public void setReqdName(String reqdName) {
	this.reqdName = reqdName;
}





public String getResdName() {
	return resdName;
}





public void setResdName(String resdName) {
	this.resdName = resdName;
}





public int getCount() {
	return count;
}





public void setCount(int count) {
	this.count = count;
}





public String getAgo() {
	return ago;
}





public void setAgo(String ago) {
	this.ago = ago;
}





public String getdPic() {
	return dPic;
}





public void setdPic(String dPic) {
	this.dPic = dPic;
}





public String getCoName() {
	return coName;
}





public void setCoName(String coName) {
	this.coName = coName;
}





public String getdName() {
	return dName;
}





public void setdName(String dName) {
	this.dName = dName;
}





public String getCoOpinion() {
	return coOpinion;
}





public void setCoOpinion(String coOpinion) {
	this.coOpinion = coOpinion;
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





public String getNotiNo() {
	return notiNo;
}





public void setNotiNo(String notiNo) {
	this.notiNo = notiNo;
}





public String getCoNo() {
	return coNo;
}





public void setCoNo(String coNo) {
	this.coNo = coNo;
}





public int getClaNo() {
	return claNo;
}





public void setClaNo(int claNo) {
	this.claNo = claNo;
}





public int getRead() {
	return read;
}





public void setRead(int read) {
	this.read = read;
}





public String getReasonRef() {
	return reasonRef;
}





public void setReasonRef(String reasonRef) {
	this.reasonRef = reasonRef;
}





public Date getNotiDate() {
	return notiDate;
}





public void setNotiDate(Date notiDate) {
	this.notiDate = notiDate;
}





public String getReqdId() {
	return reqdId;
}





public void setReqdId(String reqdId) {
	this.reqdId = reqdId;
}





public String getResdId() {
	return resdId;
}





public void setResdId(String resdId) {
	this.resdId = resdId;
}





public int getResponse() {
	return response;
}





public void setResponse(int response) {
	this.response = response;
}





public String getMysetting() {
	return mysetting;
}





public void setMysetting(String mysetting) {
	this.mysetting = mysetting;
}





@Override
public String toString() {
	return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
}


}
