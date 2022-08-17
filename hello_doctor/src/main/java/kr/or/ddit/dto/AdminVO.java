package kr.or.ddit.dto;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

@SuppressWarnings("serial")
public class AdminVO implements Serializable{

private String	adminId;
private String	pwd;

public String getAdminId() {
	return adminId;
}
public void setAdminId(String adminId) {
	this.adminId = adminId;
}
public String getPwd() {
	return pwd;
}

public void setPwd(String pwd) {
	this.pwd = pwd;
}

	@Override
		public String toString() {
			// TODO Auto-generated method stub
			return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
		}


}
