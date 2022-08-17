package kr.or.ddit.dto;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class MyOrder {
	private String moNo;
	private String docId;
	private String oDname;
	private String oCla;
	private String oTarget;
	private String oTitle;
	private Date oRegdate;
	private String oCaution;
	private String oResult;
	private String delYn;

	
	
	public String getoTitle() {
		return oTitle;
	}

	public void setoTitle(String oTitle) {
		this.oTitle = oTitle;
	}

	public String getDocId() {
		return docId;
	}

	public void setDocId(String docId) {
		this.docId = docId;
	}

	public String getoDname() {
		return oDname;
	}

	public void setoDname(String oDname) {
		this.oDname = oDname;
	}

	public String getMoNo() {
		return moNo;
	}

	public void setMoNo(String moNo) {
		this.moNo = moNo;
	}

	public String getoCla() {
		return oCla;
	}

	public void setoCla(String oCla) {
		this.oCla = oCla;
	}

	public String getoTarget() {
		return oTarget;
	}

	public void setoTarget(String oTarget) {
		this.oTarget = oTarget;
	}

	public Date getoRegdate() {
		return oRegdate;
	}

	public void setoRegdate(Date oRegdate) {
		this.oRegdate = oRegdate;
	}

	public String getoCaution() {
		return oCaution;
	}

	public void setoCaution(String oCaution) {
		this.oCaution = oCaution;
	}

	public String getoResult() {
		return oResult;
	}

	public void setoResult(String oResult) {
		this.oResult = oResult;
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
