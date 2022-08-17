package kr.or.ddit.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class CoDocApproveVO {

	String coNo;
	String pNo;
	String coDisease;
	String coDoc;
	String pName;
	String pRnum;
	String dId;
	String taNo;
	int tnStatus;
	String tnStatusResult;

	String tnNo;
	String tnYn;

	String reqdName;

	int taStatus;
	String taStatusResult;










	public String getTaStatusResult() {
		return taStatusResult;
	}
	public void setTaStatusResult(String taStatusResult) {
		this.taStatusResult = taStatusResult;
	}
	public int getTaStatus() {
		return taStatus;
	}
	public void setTaStatus(int taStatus) {
		this.taStatus = taStatus;
	}
	public String getReqdName() {
		return reqdName;
	}
	public void setReqdName(String reqdName) {
		this.reqdName = reqdName;
	}
	public String getTnYn() {
		return tnYn;
	}
	public void setTnYn(String tnYn) {
		this.tnYn = tnYn;
	}
	public String getTnNo() {
		return tnNo;
	}
	public void setTnNo(String tnNo) {
		this.tnNo = tnNo;
	}
	public String getCoNo() {
		return coNo;
	}
	public void setCoNo(String coNo) {
		this.coNo = coNo;
	}
	public String getpNo() {
		return pNo;
	}
	public void setpNo(String pNo) {
		this.pNo = pNo;
	}
	public String getCoDisease() {
		return coDisease;
	}
	public void setCoDisease(String coDisease) {
		this.coDisease = coDisease;
	}
	public String getCoDoc() {
		return coDoc;
	}
	public void setCoDoc(String coDoc) {
		this.coDoc = coDoc;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpRnum() {
		return pRnum;
	}
	public void setpRnum(String pRnum) {
		this.pRnum = pRnum;
	}
	public String getdId() {
		return dId;
	}
	public void setdId(String dId) {
		this.dId = dId;
	}
	public String getTaNo() {
		return taNo;
	}
	public void setTaNo(String taNo) {
		this.taNo = taNo;
	}
	public int getTnStatus() {
		return tnStatus;
	}
	public void setTnStatus(int tnStatus) {
		this.tnStatus = tnStatus;
	}
	public String getTnStatusResult() {
		return tnStatusResult;
	}
	public void setTnStatusResult(String tnStatusResult) {
		this.tnStatusResult = tnStatusResult;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}


}
