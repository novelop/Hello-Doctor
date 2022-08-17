package kr.or.ddit.dto;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;


public class CoMedVO {

    private String coNo;
    private String pNo;
    private String coOpinion;
    private String coOpenDate;
    private String coStartDate;
    private String coRelease;
    private String coDisease;
    private String maNo;
    private String maName;
    private String dName;
    private String endDate;
    private int coIngStatus;
    private String coDoc;
    private String patyYn;
    private String dId;
    private String pName;
    private String endReason;
    private String endOpinion;
    private String subDName;
    private String name;
    private String dPic;


    public String getName() {
		return name;
	}

	public String getdPic() {
		return dPic;
	}

	public void setdPic(String dPic) {
		this.dPic = dPic;
	}

	public void setName(String name) {
		this.name = name;
	}



	public String getSubDName() {
		return subDName;
	}

	public void setSubDName(String subDName) {
		this.subDName = subDName;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


public static void main(String[] args) {
	SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd HH");
	System.out.println(smf.format(new Date()));
}

    public String getEndReason() {
        return endReason;
    }

    public void setEndReason(String endReason) {
        this.endReason = endReason;
    }

    public String getEndOpinion() {
        return endOpinion;
    }

    public void setEndOpinion(String endOpinion) {
        this.endOpinion = endOpinion;
    }

    private List<CoMedVO> doctors;

    public String getpNo() {
        return pNo;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
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

    public String getCoOpenDate() {
        return coOpenDate;
    }

    public void setCoOpenDate(String coOpenDate) {
        this.coOpenDate = coOpenDate;
    }

    public List<CoMedVO> getDoctors() {
        return doctors;
    }

    public void setDoctors(List<CoMedVO> doctors) {
        this.doctors = doctors;
    }

    public String getCoNo() {
        return coNo;
    }

    public void setCoNo(String coNo) {
        this.coNo = coNo;
    }

    public String getCoStartDate() {
        return coStartDate;
    }

    public void setCoStartDate(String coStartDate) {
        this.coStartDate = coStartDate;
    }

    public String getCoRelease() {
        return coRelease;
    }

    public void setCoRelease(String coRelease) {
        this.coRelease = coRelease;
    }

    public String getCoDisease() {
        return coDisease;
    }

    public void setCoDisease(String coDisease) {
        this.coDisease = coDisease;
    }

    public String getMaNo() {
        return maNo;
    }

    public void setMaNo(String maNo) {
        this.maNo = maNo;
    }

    public String getMaName() {
        return maName;
    }

    public void setMaName(String maName) {
        this.maName = maName;
    }

    public String getdName() {
        return dName;
    }

    public void setdName(String dName) {
        this.dName = dName;
    }


    public int getCoIngStatus() {
        return coIngStatus;
    }

    public void setCoIngStatus(int coIngStatus) {
        this.coIngStatus = coIngStatus;
    }

    public String getCoDoc() {
        return coDoc;
    }

    public void setCoDoc(String coDoc) {
        this.coDoc = coDoc;
    }

    public String getPatyYn() {
        return patyYn;
    }

    public void setPatyYn(String patyYn) {
        this.patyYn = patyYn;
    }

    public String getdId() {
        return dId;
    }

    public void setdId(String dId) {
        this.dId = dId;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
    }
}
