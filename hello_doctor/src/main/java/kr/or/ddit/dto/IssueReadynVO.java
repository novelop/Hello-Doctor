package kr.or.ddit.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class IssueReadynVO {
	private String issNo    ;
	private String dId      ;
	private String coNo     ;
	private String issYn    ;
	private String issreNo  ;

	public String getIssNo() {
		return issNo;
	}

	public void setIssNo(String issNo) {
		this.issNo = issNo;
	}

	public String getdId() {
		return dId;
	}

	public void setdId(String dId) {
		this.dId = dId;
	}

	public String getCoNo() {
		return coNo;
	}

	public void setCoNo(String coNo) {
		this.coNo = coNo;
	}

	public String getIssYn() {
		return issYn;
	}

	public void setIssYn(String issYn) {
		this.issYn = issYn;
	}

	public String getIssreNo() {
		return issreNo;
	}

	public void setIssreNo(String issreNo) {
		this.issreNo = issreNo;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}

}
