package kr.or.ddit.dto;

public class MajorVO {
	private String maNo      ;
	private String maName    ;
    private String dId;
    private String dName;
    private String smName;
    private String dPic;
    private int status;
    private String statusResult;
    private String tel;


	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getStatusResult() {
		return statusResult;
	}
	public void setStatusResult(String statusResult) {
		this.statusResult = statusResult;
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
	public String getdId() {
		return dId;
	}
	public void setdId(String dId) {
		this.dId = dId;
	}
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}
	public String getSmName() {
		return smName;
	}
	public void setSmName(String smName) {
		this.smName = smName;
	}
	public String getMaNo() {
		return maNo;
	}
	public void setMaNo(String maNo) {
		this.maNo = maNo;
	}
	public String getMaName() {
		return maName;
	}
	public void setMaName(String maName) {
		this.maName = maName;
	}
	@Override
	public String toString() {
		return "MajorVO [maNo=" + maNo + ", maName=" + maName + ", dId=" + dId + ", dName=" + dName + ", smName="
				+ smName + ", dPic=" + dPic + ", status=" + status + ", statusResult=" + statusResult + ", tel=" + tel
				+ "]";
	}



}
