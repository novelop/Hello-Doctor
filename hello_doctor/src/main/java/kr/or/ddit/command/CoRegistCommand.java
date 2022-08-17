package kr.or.ddit.command;

import java.util.List;

public class CoRegistCommand {
private List<String> subDName;
private String coDisease;
private String pNo;
private String coOpinion;
private String dId;
private String coRelease;
private List<String> doId;
private List<String> pastco;

public List<String> getPastco() {
	return pastco;
}
public void setPastco(List<String> pastco) {
	this.pastco = pastco;
}
public List<String> getDoId() {
	return doId;
}
public void setDoId(List<String> doId) {
	this.doId = doId;
}
public List<String> getSubDName() {
	return subDName;
}
public void setSubDName(List<String> subDName) {
	this.subDName = subDName;
}
public String getCoDisease() {
	return coDisease;
}
public void setCoDisease(String coDisease) {
	this.coDisease = coDisease;
}
public String getpNo() {
	return pNo;
}
public void setpNo(String pNo) {
	this.pNo = pNo;
}
public String getCoOpinion() {
	return coOpinion;
}
public void setCoOpinion(String coOpinion) {
	this.coOpinion = coOpinion;
}
public String getdId() {
	return dId;
}
public void setdId(String dId) {
	this.dId = dId;
}
public String getCoRelease() {
	return coRelease;
}
public void setCoRelease(String coRelease) {
	this.coRelease = coRelease;
}


}
