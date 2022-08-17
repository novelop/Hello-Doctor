package kr.or.ddit.dto;


import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class MedicineVO {

	private String meName          ;
	private String meNo            ;
	private String meCompany       ;
	private String meCode          ;
	private String mePermitdate    ;
	private String meModidate      ;
	private int meLimit         ;
	private String existYn         ;
	private String meUseage        ;
	private String meInserance     ;
	private String updateDate;

	


	protected String getUpdateDate() {
		return updateDate;
	}



	protected void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}



	public String getMeName() {
		return meName;
	}



	public void setMeName(String meName) {
		this.meName = meName;
	}



	public String getMeNo() {
		return meNo;
	}



	public void setMeNo(String meNo) {
		this.meNo = meNo;
	}



	public String getMeCompany() {
		return meCompany;
	}



	public void setMeCompany(String meCompany) {
		this.meCompany = meCompany;
	}



	public String getMeCode() {
		return meCode;
	}



	public void setMeCode(String meCode) {
		this.meCode = meCode;
	}



	public String getMePermitdate() {
		return mePermitdate;
	}



	public void setMePermitdate(String mePermitdate) {
		this.mePermitdate = mePermitdate;
	}



	public String getMeModidate() {
		return meModidate;
	}



	public void setMeModidate(String meModidate) {
		this.meModidate = meModidate;
	}



	public int getMeLimit() {
		return meLimit;
	}



	public void setMeLimit(int meLimit) {
		this.meLimit = meLimit;
	}



	public String getExistYn() {
		return existYn;
	}



	public void setExistYn(String existYn) {
		this.existYn = existYn;
	}



	public String getMeUseage() {
		return meUseage;
	}



	public void setMeUseage(String meUseage) {
		this.meUseage = meUseage;
	}



	public String getMeInserance() {
		return meInserance;
	}



	public void setMeInserance(String meInserance) {
		this.meInserance = meInserance;
	}



	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}


}
