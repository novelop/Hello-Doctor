package kr.or.ddit.dto;

import static org.hamcrest.CoreMatchers.theInstance;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class CaseVO {

	private String disNo = ""; // 게시판 코드
	private String dId = ""; // 의사 아이디
	private String disTitle = ""; // 제목
	private String disContent = ""; // 내용
	private String disDate; // 작성일
	private int disCnt = 0; // 조회수
	private String delYn = ""; // 삭제여부
	private String disDName = ""; // 주상병
	private String disSex = ""; // 환자성별
	private String disClass = ""; // 환자분류
	private String dName = "";
	private String maName = ""; // 전공분야명
	private int recom = 0; // 조회수
	private int reply = 0; // 댓글 수
	private String subDName = ""; // 부상병
	private int total = 0;

	private String disFileNo;
	private String disFilePath;
	private String disFileName;
	private String disFileType;
	private String dPic;


	public String getdPic() {
		return dPic;
	}

	public void setdPic(String dPic) {
		this.dPic = dPic;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	public String getDisFileNo() {
		return disFileNo;
	}

	public void setDisFileNo(String disFileNo) {
		this.disFileNo = disFileNo;
	}

	public String getDisFilePath() {
		return disFilePath;
	}

	public void setDisFilePath(String disFilePath) {
		this.disFilePath = disFilePath;
	}

	public String getDisFileName() {
		return disFileName;
	}

	public void setDisFileName(String disFileName) {
		this.disFileName = disFileName;
	}

	public String getDisFileType() {
		return disFileType;
	}

	public void setDisFileType(String disFileType) {
		this.disFileType = disFileType;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getReply() {
		return reply;
	}

	public void setReply(int reply) {
		this.reply = reply;
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

	public String getDisTitle() {
		return disTitle;
	}

	public void setDisTitle(String disTitle) {
		this.disTitle = disTitle;
	}

	public String getDisContent() {
		return disContent;
	}

	public void setDisContent(String disContent) {
		this.disContent = disContent;
	}





	public String getDisDate() {
		return disDate;
	}

	public void setDisDate(String disDate) {
		this.disDate = disDate;
	}

	public int getDisCnt() {
		return disCnt;
	}

	public void setDisCnt(int disCnt) {
		this.disCnt = disCnt;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	public String getDisDName() {
		return disDName;
	}

	public void setDisDName(String disDName) {
		this.disDName = disDName;
	}

	public String getDisSex() {
		return disSex;
	}

	public void setDisSex(String disSex) {
		this.disSex = disSex;
	}

	public String getDisClass() {
		return disClass;
	}

	public void setDisClass(String disClass) {
		this.disClass = disClass;
	}

	public String getMaName() {
		return maName;
	}

	public void setMaName(String maName) {
		this.maName = maName;
	}

	public int getRecom() {
		return recom;
	}

	public void setRecom(int recom) {
		this.recom = recom;
	}

	public String getSubDName() {
		return subDName;
	}

	public void setSubDName(String subDName) {
		this.subDName = subDName;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}

}
