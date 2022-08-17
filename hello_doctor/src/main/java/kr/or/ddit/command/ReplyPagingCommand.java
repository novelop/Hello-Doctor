package kr.or.ddit.command;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class ReplyPagingCommand extends SearchCriteria{

	private String disRplyNo; // 댓글 번호
	private String disContent; // 댓글 내용
	private Date disDate; // 댓글 입력일
	private String disNo; // 대글
	private String delYn; // 삭제 여부
	private String dName; // 의사명

	private int recom = 0;//조회수


	public String getDisRplyNo() {
		return disRplyNo;
	}





	public void setDisRplyNo(String disRplyNo) {
		this.disRplyNo = disRplyNo;
	}





	public String getDisContent() {
		return disContent;
	}





	public void setDisContent(String disContent) {
		this.disContent = disContent;
	}





	public Date getDisDate() {
		return disDate;
	}





	public void setDisDate(Date disDate) {
		this.disDate = disDate;
	}





	public String getDisNo() {
		return disNo;
	}





	public void setDisNo(String disNo) {
		this.disNo = disNo;
	}





	public String getDelYn() {
		return delYn;
	}





	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}





	public String getdName() {
		return dName;
	}





	public void setdName(String dName) {
		this.dName = dName;
	}





	public int getRecom() {
		return recom;
	}





	public void setRecom(int recom) {
		this.recom = recom;
	}





	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}


}
