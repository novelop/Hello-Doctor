package kr.or.ddit.dto;


import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class ManagerNoticeVO {

	private String nNo = "";		// 공지사항 번호
	private String adminId = "";	// 관리자 아이디
	private String nTitle = "";		// 공지사항 제목
	private String nContent = "";	// 공지사항 내용
	private String nDate;				// 공지사항 작성일자
	private String delYn = "";		// 공지사항 삭제여부
	private String pickYn = "";		// 공지사항 고정 여부
	private String popYn = "";		// 공지사항 팝업 여부
	private String popPeriodStart;	// 공지사항 팝업 시작일
	private String popPeriodEnd;		// 공지사항 팝업 종료일
	private String count;





	public String getCount() {
		return count;
	}



	public void setCount(String count) {
		this.count = count;
	}



	public String getnNo() {
		return nNo;
	}



	public void setnNo(String nNo) {
		this.nNo = nNo;
	}



	public String getAdminId() {
		return adminId;
	}



	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}



	public String getnTitle() {
		return nTitle;
	}



	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}



	public String getnContent() {
		return nContent;
	}



	public void setnContent(String nContent) {
		this.nContent = nContent;
	}



	public String getnDate() {
		return nDate;
	}



	public void setnDate(String nDate) {
		this.nDate = nDate;
	}



	public String getDelYn() {
		return delYn;
	}



	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}



	public String getPickYn() {
		return pickYn;
	}



	public void setPickYn(String pickYn) {
		this.pickYn = pickYn;
	}



	public String getPopYn() {
		return popYn;
	}



	public void setPopYn(String popYn) {
		this.popYn = popYn;
	}



	public String getPopPeriodStart() {
		return popPeriodStart;
	}



	public void setPopPeriodStart(String popPeriodStart) {
		this.popPeriodStart = popPeriodStart;
	}



	public String getPopPeriodEnd() {
		return popPeriodEnd;
	}



	public void setPopPeriodEnd(String popPeriodEnd) {
		this.popPeriodEnd = popPeriodEnd;
	}



	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
