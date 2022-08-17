package kr.or.ddit.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class CoworkerVO {

	private String mydId;
	private String CodId;
	private String dName;
	private String dPic;
	private String maName;
	private String dId;




	public String getdId() {
		return dId;
	}
	public void setdId(String dId) {
		this.dId = dId;
	}
	public String getMydId() {
		return mydId;
	}
	public void setMydId(String mydId) {
		this.mydId = mydId;
	}
	public String getCodId() {
		return CodId;
	}
	public void setCodId(String codId) {
		CodId = codId;
	}
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}
	public String getdPic() {
		return dPic;
	}
	public void setdPic(String dPic) {
		this.dPic = dPic;
	}
	public String getMaName() {
		return maName;
	}
	public void setMaName(String maName) {
		this.maName = maName;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
