package kr.or.ddit.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class HospitalIpVO {

	private String ipNo;
	private String ipRoom;


	public String getIpNo() {
		return ipNo;
	}
	public void setIpNo(String ipNo) {
		this.ipNo = ipNo;
	}
	public String getIpRoom() {
		return ipRoom;
	}
	public void setIpRoom(String ipRoom) {
		this.ipRoom = ipRoom;
	}


	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
