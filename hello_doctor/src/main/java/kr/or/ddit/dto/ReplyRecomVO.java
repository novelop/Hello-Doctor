package kr.or.ddit.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class ReplyRecomVO {

	private String disRplyNo = "";
	private String dId = "";
	private String myClick = "";

	public String getMyClick() {
		return myClick;
	}
	public void setMyClick(String myClick) {
		this.myClick = myClick;
	}
	public String getDisRplyNo() {
		return disRplyNo;
	}
	public void setDisRplyNo(String disRplyNo) {
		this.disRplyNo = disRplyNo;
	}
	public String getdId() {
		return dId;
	}
	public void setdId(String dId) {
		this.dId = dId;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}

}
