package kr.or.ddit.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class RecomVO {

	private String disNo = "";
	private String dId = "";



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



	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}


}
