package kr.or.ddit.dto;

public class CoFreqVO {

	private String coNo      ;
	private String dId       ;
	private String pNo       ;
	private String coDoc     ;
	private String coDisease ;
	private String pName     ;
	private String pSex      ;
	private String pRnum     ;
    private String cofRegdate;
    private String dName;
    private String dPic;
    private String maName;




	public String getMaName() {
		return maName;
	}
	public void setMaName(String maName) {
		this.maName = maName;
	}
	public String getdPic() {
		return dPic;
	}
	public void setdPic(String dPic) {
		this.dPic = dPic;
	}
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}
	public String getCofRegdate() {
		return cofRegdate;
	}
	public void setCofRegdate(String cofRegdate) {
		this.cofRegdate = cofRegdate;
	}
	public String getCoNo() {
		return coNo;
	}
	public void setCoNo(String coNo) {
		this.coNo = coNo;
	}
	public String getdId() {
		return dId;
	}
	public void setdId(String dId) {
		this.dId = dId;
	}
	public String getpNo() {
		return pNo;
	}
	public void setpNo(String pNo) {
		this.pNo = pNo;
	}
	public String getCoDoc() {
		return coDoc;
	}
	public void setCoDoc(String coDoc) {
		this.coDoc = coDoc;
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
	@Override
	public String toString() {
		return "CoFreqVO [coNo=" + coNo + ", dId=" + dId + ", pNo=" + pNo + ", coDoc=" + coDoc + ", coDisease="
				+ coDisease + ", pName=" + pName + ", pSex=" + pSex + ", pRnum=" + pRnum + ", cofRegdate=" + cofRegdate
				+ ", dName=" + dName + "]";
	}







}
