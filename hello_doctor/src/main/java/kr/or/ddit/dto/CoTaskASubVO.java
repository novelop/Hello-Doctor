package kr.or.ddit.dto;


import java.util.Date;
import java.util.List;

public class CoTaskASubVO {

	private String coDoc;
	private String taNo        ;
	private String coNo        ;
	private String dId         ;
	private String taName      ;
	private String taContent   ;
	private String taDate      ;
	private int taStatus    ;
	private String reservYn    ;
	private String taReference;
	private String vodId;
	private List<CoSubTaskVO> subTaskList;  //하위 업무리스트(yn상관없이)
	private int subTaskCount; //하위업무중에서 Y인것(완료된것)의 갯수!
	private int progressPercentage;
	private String dName;

	List<String> subName;
	List<String> subDate;
    String subNo;


	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	public String getTaReference() {
		return taReference;
	}

	public void setTaReference(String taReference) {
		this.taReference = taReference;
	}

	public String getVodId() {
		return vodId;
	}

	public void setVodId(String vodId) {
		this.vodId = vodId;
	}

	public String getSubNo() {
		return subNo;
	}

	public void setSubNo(String subNo) {
		this.subNo = subNo;
	}

	public String getCoDoc() {
		return coDoc;
	}

	public void setCoDoc(String coDoc) {
		this.coDoc = coDoc;
	}

	public int getProgressPercentage() {
		return progressPercentage;
	}

	public void setProgressPercentage(int progressPercentage) {
		this.progressPercentage = progressPercentage;
	}

	public int getSubTaskCount() {
		return subTaskCount;
	}

	public void setSubTaskCount(int subTaskCount) {
		this.subTaskCount = subTaskCount;
	}

	public String getTaNo() {
		return taNo;
	}

	public void setTaNo(String taNo) {
		this.taNo = taNo;
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

	public String getTaName() {
		return taName;
	}

	public void setTaName(String taName) {
		this.taName = taName;
	}

	public String getTaContent() {
		return taContent;
	}

	public void setTaContent(String taContent) {
		this.taContent = taContent;
	}





	public String getTaDate() {
		return taDate;
	}

	public void setTaDate(String taDate) {
		this.taDate = taDate;
	}

	public int getTaStatus() {
		return taStatus;
	}

	public void setTaStatus(int taStatus) {
		this.taStatus = taStatus;
	}

	public String getReservYn() {
		return reservYn;
	}

	public void setReservYn(String reservYn) {
		this.reservYn = reservYn;
	}

	public List<CoSubTaskVO> getSubTaskList() {
		return subTaskList;
	}

	public void setSubTaskList(List<CoSubTaskVO> subTaskList) {
		this.subTaskList = subTaskList;
	}

	public List<String> getSubName() {
		return subName;
	}

	public void setSubName(List<String> subName) {
		this.subName = subName;
	}

	public List<String> getSubDate() {
		return subDate;
	}

	public void setSubDate(List<String> subDate) {
		this.subDate = subDate;
	}

	@Override
	public String toString() {
		return "CoTaskASubVO [coDoc=" + coDoc + ", taNo=" + taNo + ", coNo=" + coNo + ", dId=" + dId + ", taName="
				+ taName + ", taContent=" + taContent + ", taDate=" + taDate + ", taStatus=" + taStatus + ", reservYn="
				+ reservYn + ", taReference=" + taReference + ", vodId=" + vodId + ", subTaskList=" + subTaskList
				+ ", subTaskCount=" + subTaskCount + ", progressPercentage=" + progressPercentage + ", dName=" + dName
				+ ", subName=" + subName + ", subDate=" + subDate + ", subNo=" + subNo + "]";
	}









}
