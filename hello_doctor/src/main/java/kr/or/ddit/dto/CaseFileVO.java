package kr.or.ddit.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class CaseFileVO {

	private String disFileNo = "";
	private String disFilePath = "";
	private String disNo = "";
	private String disFileName = "";
	private String disFileType = "";
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
	public String getDisNo() {
		return disNo;
	}
	public void setDisNo(String disNo) {
		this.disNo = disNo;
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

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}

}
