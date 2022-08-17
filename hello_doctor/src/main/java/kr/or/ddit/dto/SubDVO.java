package kr.or.ddit.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class SubDVO {
	private String subDName ;
	private String mNo       ;

	
	public String getSubDName() {
		return subDName;
	}


	public void setSubDName(String subDName) {
		this.subDName = subDName;
	}


	public String getmNo() {
		return mNo;
	}


	public void setmNo(String mNo) {
		this.mNo = mNo;
	}


	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}

}
