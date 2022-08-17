package kr.or.ddit.dto;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class DoctorVO {
	private String dId=""            ;
	private String maNo=""           ;
	private String dName=""          ;
	private String pwd=""             ;
	private String tel ;
	private String email=""           ;
	private int status          ;
	private String dPic=""          ;
	private Date regdate         ;
	private int accountStatus  ;
	private String residentNum    ;
	private Date retiredate      ;
	private Date susStartdate   ;
	private Date susEnddate     ;
	private String maName;
	private String otpCo;
	private String otpQr;
	private String firstRnum;
	private String secondRnum;
	private String firsttel;
	private String secondtel;
	private String threetel;
	private String smName;
	private String authority; // 권한
	private String otpCheck;
	private int enabled;   // 사용여부
	private String newpwd;




	public DoctorVO() {}
	public DoctorVO(String dId, String pwd) {
		super();
		this.dId=dId;
		this.pwd=pwd;
	}



	public String getNewpwd() {
		return newpwd;
	}
	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}

	public String getOtpCheck() {
		return otpCheck;
	}
	public void setOtpCheck(String otpCheck) {
		this.otpCheck = otpCheck;
	}
	public String getSmName() {
		return smName;
	}
	public void setSmName(String smName) {
		this.smName = smName;
	}
	public String getFirsttel() {
		return firsttel;
	}
	public void setFirsttel(String firsttel) {
		this.firsttel = firsttel;
	}
	public String getSecondtel() {
		return secondtel;
	}
	public void setSecondtel(String secondtel) {
		this.secondtel = secondtel;
	}
	public String getThreetel() {
		return threetel;
	}
	public void setThreetel(String threetel) {
		this.threetel = threetel;
	}

	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public String getOtpQr() {
		return otpQr;
	}
	public void setOtpQr(String otpQr) {
		this.otpQr = otpQr;
	}
	public String getFirstRnum() {
		return firstRnum;
	}
	public void setFirstRnum(String firstRnum) {
		this.firstRnum = firstRnum;
	}
	public String getSecondRnum() {
		return secondRnum;
	}
	public void setSecondRnum(String secondRnum) {
		this.secondRnum = secondRnum;
	}
	public String getOtpCo() {
		return otpCo;
	}
	public void setOtpCo(String otpCo) {
		this.otpCo = otpCo;
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
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getAccountStatus() {
		return accountStatus;
	}
	public void setAccountStatus(int accountStatus) {
		this.accountStatus = accountStatus;
	}
	public String getResidentNum() {

		return residentNum;
	}
	public void setResidentNum(String residentNum) {
		this.residentNum = residentNum;
	}
	public Date getRetiredate() {
		return retiredate;
	}
	public void setRetiredate(Date retiredate) {
		this.retiredate = retiredate;
	}
	public Date getSusStartdate() {
		return susStartdate;
	}
	public void setSusStartdate(Date susStartdate) {
		this.susStartdate = susStartdate;
	}
	public Date getSusEnddate() {
		return susEnddate;
	}
	public void setSusEnddate(Date susEnddate) {
		this.susEnddate = susEnddate;
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
