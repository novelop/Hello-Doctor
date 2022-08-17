package kr.or.ddit.dto;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class ComComentVO {

private String	comCoNo        ;
private String	comNo          ;
private String	dId            ;
private String	coNo           ;
private String	comContent     ;
private String	comDate        ;
private String	delYn          ;

public String getComCoNo() {
	return comCoNo;
}


public void setComCoNo(String comCoNo) {
	this.comCoNo = comCoNo;
}


public String getComNo() {
	return comNo;
}


public void setComNo(String comNo) {
	this.comNo = comNo;
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


public String getComContent() {
	return comContent;
}


public void setComContent(String comContent) {
	this.comContent = comContent;
}


public String getComDate() {
	return comDate;
}


public void setComDate(String comDate) {
	this.comDate = comDate;
}


public String getDelYn() {
	return delYn;
}


public void setDelYn(String delYn) {
	this.delYn = delYn;
}


@Override
public String toString() {
	return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
}


}
