package kr.or.ddit.dto;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class ManagerDoctorListVO {
	private String dId; // 의사 아이디
	private String maNo; // 의사 전공 번호
	private String dName; // 의사 이름
	private String tel; // 의사 전화번호
	private String status; // 의사 상태
	private Date regDate; //가입일자
	private String residentNum; // 의사 주민번호
	private int accountStatus; // 계정 상태
	private Date retireDate; // 퇴직일
	private Date susStartDate; // 정직시작일
	private Date susEndDate; // 정직종료일
	private String maName; // 전공명
	private String statusString; // 의사 상태 String
	private String dOffice; // 진료실
	private String dExam; // 검사실
	// ip
	private String ipNo;
	private String ipRoom;
	private String use;
	private String ipAddress;
	private String inDate;




	private List<String>ipNo2;

	public List<String> getIpNo2() {
		return ipNo2;
	}
	public void setIpNo2(List<String> ipNo2) {
		this.ipNo2 = ipNo2;
	}
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}


	public String getInDate() {
		return inDate;
	}
	public void setInDate(String inDate) {
		this.inDate = inDate;
	}


	private String ipNum; // ip번호



	public String getUse() {
		return use;
	}
	public void setUse(String use) {
		this.use = use;
	}

	private List<String> no;



	public List<String> getNo() {
		return no;
	}
	public void setNo(List<String> no) {
		this.no = no;
	}
	public String getIpNum() {
		return ipNum;
	}
	public void setIpNum(String ipNum) {
		this.ipNum = ipNum;
	}
	public String getdOffice() {
		return dOffice;
	}
	public void setdOffice(String dOffice) {
		this.dOffice = dOffice;
	}
	public String getdExam() {
		return dExam;
	}
	public void setdExam(String dExam) {
		this.dExam = dExam;
	}
	public String getIpNo() {
		return ipNo;
	}
	public void setIpNo(String ipNo) {
		this.ipNo = ipNo;
	}
	public String getIpRoom() {
		return ipRoom;
	}
	public void setIpRoom(String ipRoom) {
		this.ipRoom = ipRoom;
	}
	public String getStatusString() {
		return statusString;
	}
	public void setStatusString(String statusString) {
		this.statusString = statusString;
	}
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getResidentNum() {
		return residentNum;
	}
	public void setResidentNum(String residentNum) {
		this.residentNum = residentNum;
	}
	public int getAccountStatus() {
		return accountStatus;
	}
	public void setAccountStatus(int accountStatus) {
		this.accountStatus = accountStatus;
	}
	public Date getRetireDate() {
		return retireDate;
	}
	public void setRetireDate(Date retireDate) {
		this.retireDate = retireDate;
	}
	public Date getSusStartDate() {
		return susStartDate;
	}
	public void setSusStartDate(Date susStartDate) {
		this.susStartDate = susStartDate;
	}
	public Date getSusEndDate() {
		return susEndDate;
	}
	public void setSusEndDate(Date susEndDate) {
		this.susEndDate = susEndDate;
	}
	public String getMaName() {
		return maName;
	}
	public void setMaName(String maName) {
		this.maName = maName;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
