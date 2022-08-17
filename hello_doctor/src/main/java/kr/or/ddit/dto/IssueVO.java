package kr.or.ddit.dto;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class IssueVO {

   private String dId         ;
   private String coNo        ;
   private String pNo         ;
   private String coDisease   ;
   private String coDoc       ;
   private String pName       ;
   private String pSex        ;
   private String pRnum       ;
   private String mNo         ;
   private String issNo       ;
   private String issTitle    ;
   private String issContent  ;
   private String mDate;
   private String dName;
   private String maName;

   //주치의 이름
   private String coDocName;






   public String getdName() {
	return dName;
}
public void setdName(String dName) {
	this.dName = dName;
}
public String getMaName() {
	return maName;
}
public void setMaName(String maName) {
	this.maName = maName;
}
public String getmDate() {
	return mDate;
}
public void setmDate(String mDate) {
	this.mDate = mDate;
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
public String getmNo() {
	return mNo;
}
public void setmNo(String mNo) {
	this.mNo = mNo;
}
public String getIssNo() {
	return issNo;
}
public void setIssNo(String issNo) {
	this.issNo = issNo;
}
public String getIssTitle() {
	return issTitle;
}
public void setIssTitle(String issTitle) {
	this.issTitle = issTitle;
}
public String getIssContent() {
	return issContent;
}
public void setIssContent(String issContent) {
	this.issContent = issContent;
}

public String getCoDocName() {
	return coDocName;
}
public void setCoDocName(String coDocName) {
	this.coDocName = coDocName;
}
@Override
public String toString() {
	return "IssueVO [dId=" + dId + ", coNo=" + coNo + ", pNo=" + pNo + ", coDisease=" + coDisease + ", coDoc=" + coDoc
			+ ", pName=" + pName + ", pSex=" + pSex + ", pRnum=" + pRnum + ", mNo=" + mNo + ", issNo=" + issNo
			+ ", issTitle=" + issTitle + ", issContent=" + issContent + ", mDate=" + mDate + ", dName=" + dName
			+ ", maName=" + maName + ", coDocName=" + coDocName + "]";
}





}
