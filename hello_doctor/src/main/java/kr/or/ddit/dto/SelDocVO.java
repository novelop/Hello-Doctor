package kr.or.ddit.dto;

public class SelDocVO {

	private String	dId      ;
	private String   maNo    ;
	private String   dName   ;
	private String   tel     ;
	private String   dPic    ;
	private String  dOffice  ;
	private String   maName  ;
	private String  smName   ;
	public String getdId() {
		return dId;
	}
	public void setdId(String dId) {
		this.dId = dId;
	}
	public String getMaNo() {
		return maNo;
	}
	public void setMaNo(String maNo) {
		this.maNo = maNo;
	}
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getdPic() {
		return dPic;
	}
	public void setdPic(String dPic) {
		this.dPic = dPic;
	}
	public String getdOffice() {
		return dOffice;
	}
	public void setdOffice(String dOffice) {
		this.dOffice = dOffice;
	}
	public String getMaName() {
		return maName;
	}
	public void setMaName(String maName) {
		this.maName = maName;
	}
	public String getSmName() {
		return smName;
	}
	public void setSmName(String smName) {
		this.smName = smName;
	}
	@Override
	public String toString() {
		return "SelDocVO [dId=" + dId + ", maNo=" + maNo + ", dName=" + dName + ", tel=" + tel + ", dPic=" + dPic
				+ ", dOffice=" + dOffice + ", maName=" + maName + ", smName=" + smName + "]";
	}




}
