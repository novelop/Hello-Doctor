package kr.or.ddit.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class PrescriptVO {
	private String mNo        ;
	private String preNo      ;
	private String cureName   ;
	private int pQuantity    ;
	private int pAday        ;
	private int pDays        ;



	public String getmNo() {
		return mNo;
	}



	public void setmNo(String mNo) {
		this.mNo = mNo;
	}



	public String getPreNo() {
		return preNo;
	}



	public void setPreNo(String preNo) {
		this.preNo = preNo;
	}



	public String getCureName() {
		return cureName;
	}



	public void setCureName(String cureName) {
		this.cureName = cureName;
	}



	public int getpQuantity() {
		return pQuantity;
	}



	public void setpQuantity(int pQuantity) {
		this.pQuantity = pQuantity;
	}



	public int getpAday() {
		return pAday;
	}



	public void setpAday(int pAday) {
		this.pAday = pAday;
	}



	public int getpDays() {
		return pDays;
	}



	public void setpDays(int pDays) {
		this.pDays = pDays;
	}



	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}


}
