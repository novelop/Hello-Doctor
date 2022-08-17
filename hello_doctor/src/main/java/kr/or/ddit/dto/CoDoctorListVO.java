package kr.or.ddit.dto;

public class CoDoctorListVO {

	private String dId;
	private String coNo;
	private String maNo;
	private String dName;
	private int status;
	private String dPic;
	private String maName;
	private String statusResult;


	public String getStatusResult() {
		return statusResult;
	}
	public void setStatusResult(String statusResult) {
		this.statusResult = statusResult;
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


	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getdPic() {
		return dPic;
	}
	public void setdPic(String dPic) {
		this.dPic = dPic;
	}
	public String getMaName() {
		return maName;
	}
	public void setMaName(String maName) {
		this.maName = maName;
	}

	@Override
	public String toString() {
		return "CoDoctorListVO [dId=" + dId + ", coNo=" + coNo + ", maNo=" + maNo + ", dName=" + dName + ", status="
				+ status + ", dPic=" + dPic + ", maName=" + maName + "]";
	}




}
