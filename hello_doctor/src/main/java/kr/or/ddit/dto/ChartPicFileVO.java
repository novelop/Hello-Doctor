package kr.or.ddit.dto;

public class ChartPicFileVO {
private String mpNo;
private String mNo;
private String mpPic;
private String mpName;
public String getMpNo() {
	return mpNo;
}
public void setMpNo(String mpNo) {
	this.mpNo = mpNo;
}
public String getmNo() {
	return mNo;
}
public void setmNo(String mNo) {
	this.mNo = mNo;
}
public String getMpPic() {
	return mpPic;
}
public void setMpPic(String mpPic) {
	this.mpPic = mpPic;
}
public String getMpName() {
	return mpName;
}
public void setMpName(String mpName) {
	this.mpName = mpName;
}
@Override
public String toString() {
	return "ChartPicFileVO [mpNo=" + mpNo + ", mNo=" + mNo + ", mpPic=" + mpPic + ", mpName=" + mpName + "]";
}


}
