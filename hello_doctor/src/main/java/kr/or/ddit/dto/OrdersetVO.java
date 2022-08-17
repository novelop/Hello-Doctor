package kr.or.ddit.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class OrdersetVO {

	private String oNo;
	private String dId;
	private String docId;  //작성자(의사아이디)
	private String dName;  //작성자이름(의사이름)
	private String oDname; // 주상병
	private String oViewcnt;
	private String oCla;
	private String oTarget; //급여대상
	private String oRegdate;
	private String oCaution;
	private String oResult;
	private String delYn;
	private String oDrug;
	private String quantity;
	private String dgAday;
	private String dgDays;
	private String oTitle;
	private int recoCnt;
	private String oNoti;
	private String cureName;
	private int pQuantity;
	private int pAday;
	private int pDays;
	private String fbNo;
	private String dPic;
	private String fbResult;
	private String fbRegdate;
	private String maName;
	private String myCla;
	// 오더세트 추천상태
	private String rStatus;
	private String osNo;
	private String osRegdate;
	private String doId;

	//my
	private String moNo;
	private String aday;
	private String days;
	
	
	
	public String getdId() {
		return dId;
	}

	public void setdId(String dId) {
		this.dId = dId;
	}

	public String getAday() {
		return aday;
	}

	public void setAday(String aday) {
		this.aday = aday;
	}

	public String getDays() {
		return days;
	}

	public void setDays(String days) {
		this.days = days;
	}

	public String getMoNo() {
		return moNo;
	}

	public void setMoNo(String moNo) {
		this.moNo = moNo;
	}
	public String getDoId() {
		return doId;
	}

	public void setDoId(String doId) {
		this.doId = doId;
	}

	public String getOsRegdate() {
		return osRegdate;
	}

	public void setOsRegdate(String osRegdate) {
		this.osRegdate = osRegdate;
	}




	public String getOsNo() {
		return osNo;
	}

	public void setOsNo(String osNo) {
		this.osNo = osNo;
	}

	public String getFbNo() {
		return fbNo;
	}

	public void setFbNo(String fbNo) {
		this.fbNo = fbNo;
	}

	public String getdPic() {
		return dPic;
	}

	public void setdPic(String dPic) {
		this.dPic = dPic;
	}

	public String getFbResult() {
		return fbResult;
	}

	public void setFbResult(String fbResult) {
		this.fbResult = fbResult;
	}

	public String getFbRegdate() {
		return fbRegdate;
	}

	public void setFbRegdate(String fbRegdate) {
		this.fbRegdate = fbRegdate;
	}

	public String getMaName() {
		return maName;
	}

	public void setMaName(String maName) {
		this.maName = maName;
	}


	public String getMyCla() {
		return myCla;
	}

	public void setMyCla(String myCla) {
		this.myCla = myCla;
	}




	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	public String getoNo() {
		return oNo;
	}

	public void setoNo(String oNo) {
		this.oNo = oNo;
	}

	public String getDocId() {
		return docId;
	}

	public void setDocId(String docId) {
		this.docId = docId;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	public String getoDname() {
		return oDname;
	}

	public void setoDname(String oDname) {
		this.oDname = oDname;
	}

	public String getoViewcnt() {
		return oViewcnt;
	}

	public void setoViewcnt(String oViewcnt) {
		this.oViewcnt = oViewcnt;
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

	public String getoRegdate() {
		return oRegdate;
	}

	public void setoRegdate(String oRegdate) {
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

	public String getoDrug() {
		return oDrug;
	}

	public void setoDrug(String oDrug) {
		this.oDrug = oDrug;
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

	public String getoTitle() {
		return oTitle;
	}

	public void setoTitle(String oTitle) {
		this.oTitle = oTitle;
	}

	public int getRecoCnt() {
		return recoCnt;
	}

	public void setRecoCnt(int recoCnt) {
		this.recoCnt = recoCnt;
	}

	public String getoNoti() {
		return oNoti;
	}

	public void setoNoti(String oNoti) {
		this.oNoti = oNoti;
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
