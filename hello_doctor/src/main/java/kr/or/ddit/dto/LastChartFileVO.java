package kr.or.ddit.dto;

public class LastChartFileVO {

	private String mNo;
	private String mfNo;
	private String mfFilename;
	private String mfFilepath;
	private String mfFiletype;


	public String getmNo() {
		return mNo;
	}
	public void setmNo(String mNo) {
		this.mNo = mNo;
	}
	public String getMfNo() {
		return mfNo;
	}
	public void setMfNo(String mfNo) {
		this.mfNo = mfNo;
	}
	public String getMfFilename() {
		return mfFilename;
	}
	public void setMfFilename(String mfFilename) {
		this.mfFilename = mfFilename;
	}
	public String getMfFilepath() {
		return mfFilepath;
	}
	public void setMfFilepath(String mfFilepath) {
		this.mfFilepath = mfFilepath;
	}
	public String getMfFiletype() {
		return mfFiletype;
	}
	public void setMfFiletype(String mfFiletype) {
		this.mfFiletype = mfFiletype;
	}

	@Override
	public String toString() {
		return "LastChartFileVO [mNo=" + mNo + ", mfNo=" + mfNo + ", mfFilename=" + mfFilename + ", mfFilepath="
				+ mfFilepath + ", mfFiletype=" + mfFiletype + "]";
	}



}
