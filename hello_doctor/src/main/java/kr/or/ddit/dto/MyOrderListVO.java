package kr.or.ddit.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class MyOrderListVO {
	private String oDrug    ;
	private String moNo     ;
	private String quantity;
	private String dgAday;
	private String dgDays;
	private String oDname        ;
	private String delYn        ;
	private String dName;
	private String docId;
    private String oTitle;
    
    
    
	public String getDocId() {
		return docId;
	}






	public void setDocId(String docId) {
		this.docId = docId;
	}






	public String getoTitle() {
		return oTitle;
	}






	public void setoTitle(String oTitle) {
		this.oTitle = oTitle;
	}






	public String getdName() {
		return dName;
	}






	public void setdName(String dName) {
		this.dName = dName;
	}






	public String getoDrug() {
		return oDrug;
	}






	public String getQuantity() {
		return quantity;
	}






	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}






	public String getDgAday() {
		return dgAday;
	}






	public void setDgAday(String dgAday) {
		this.dgAday = dgAday;
	}






	public String getDgDays() {
		return dgDays;
	}






	public void setDgDays(String dgDays) {
		this.dgDays = dgDays;
	}






	public void setoDrug(String oDrug) {
		this.oDrug = oDrug;
	}




	public String getMoNo() {
		return moNo;
	}




	public void setMoNo(String moNo) {
		this.moNo = moNo;
	}






	public String getoDname() {
		return oDname;
	}




	public void setoDname(String oDname) {
		this.oDname = oDname;
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
