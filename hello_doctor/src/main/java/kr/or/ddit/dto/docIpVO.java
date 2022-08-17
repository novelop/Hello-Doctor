package kr.or.ddit.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

@SuppressWarnings("serial")
public class docIpVO {

	private String dId;
	private String ipNo;

	public String getdId() {
		return dId;
	}
	public void setdId(String dId) {
		this.dId = dId;
	}
	public String getIpNo() {
		return ipNo;
	}
	public void setIpNo(String ipNo) {
		this.ipNo = ipNo;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.JSON_STYLE);
	}




}
