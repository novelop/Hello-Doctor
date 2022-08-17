package kr.or.ddit.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class DocuOrderVO {
	private String doNo     ;
	private String docId    ;
	private String doName   ;
	private String doInput  ;
	private String doMain   ;


	public String getDoNo() {
		return doNo;
	}


	public void setDoNo(String doNo) {
		this.doNo = doNo;
	}


	public String getDocId() {
		return docId;
	}


	public void setDocId(String docId) {
		this.docId = docId;
	}


	public String getDoName() {
		return doName;
	}


	public void setDoName(String doName) {
		this.doName = doName;
	}


	public String getDoInput() {
		return doInput;
	}


	public void setDoInput(String doInput) {
		this.doInput = doInput;
	}


	public String getDoMain() {
		return doMain;
	}


	public void setDoMain(String doMain) {
		this.doMain = doMain;
	}


	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}

}
