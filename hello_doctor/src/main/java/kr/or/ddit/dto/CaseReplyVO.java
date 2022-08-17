package kr.or.ddit.dto;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class CaseReplyVO {

	private String disRplyNo; // 댓글 번호
	private String disContent; // 댓글 내용
	private Date disDate; // 댓글 입력일
	private String disNo; // 대글
	private String dId; // 작성자 아이디
	private String delYn; // 삭제 여부
	private String dName; // 의사명
	private String maName; // 전공명
	private String dPic;
	private int recom = 0;// 조회수
	private String myClick = "";




	public String getdPic() {
		return dPic;
	}
	public void setdPic(String dPic) {
		this.dPic = dPic;
	}
	public String getMyClick() {
		return myClick;
	}
	public void setMyClick(String myClick) {
		this.myClick = myClick;
	}
	public int getRecom() {
		return recom;
	}
	public void setRecom(int recom) {
		this.recom = recom;
	}
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}
	public String getMaName() {
		return maName;
	}
	public void setMaName(String maName) {
		this.maName = maName;
	}
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
	public String getdId() {
		return dId;
	}
	public void setdId(String dId) {
		this.dId = dId;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}



}
