package kr.or.ddit.dto;

import java.util.Date;

public class MyIssueVO {


	private String mNo;
	private String dId;
	private String issNo;
	private Date mDate;
	private String issTitle;
	private String issContent;
	private String dPic;
	private String dName;



	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}
	public String getdPic() {
		return dPic;
	}
	public void setdPic(String dPic) {
		this.dPic = dPic;
	}
	public String getmNo() {
		return mNo;
	}
	public void setmNo(String mNo) {
		this.mNo = mNo;
	}
	public String getdId() {
		return dId;
	}
	public void setdId(String dId) {
		this.dId = dId;
	}
	public String getIssNo() {
		return issNo;
	}
	public void setIssNo(String issNo) {
		this.issNo = issNo;
	}
	public Date getmDate() {
		return mDate;
	}
	public void setmDate(Date mDate) {
		this.mDate = mDate;
	}
	public String getIssTitle() {
		return issTitle;
	}
	public void setIssTitle(String issTitle) {
		this.issTitle = issTitle;
	}
	public String getIssContent() {
		return issContent;
	}
	public void setIssContent(String issContent) {
		this.issContent = issContent;
	}
	@Override
	public String toString() {
		return "MyIssueVO [mNo=" + mNo + ", dId=" + dId + ", issNo=" + issNo + ", mDate=" + mDate + ", issTitle="
				+ issTitle + ", issContent=" + issContent + ", dPic=" + dPic + ", dName=" + dName + "]";
	}






}
