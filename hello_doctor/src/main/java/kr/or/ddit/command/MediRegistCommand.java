package kr.or.ddit.command;

import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.web.multipart.MultipartFile;

public class MediRegistCommand {
	private String pNo;
	private String nextpNo;
	private String chart;
	private String issue;
	private String nextptaNo;
	private String coNo;
	private String orderuse;
	private String taNo;
	private String rsvNo;
	private List<String> diseaseName;
	private List<String> account;
	private List<String> medicineName;
	private List<Integer> quantity;
	private List<Integer> aday;
	private List<Integer> days;
	private List<MultipartFile> pictureFile;
	private List<MultipartFile> textFile;
	private List<String> temppic;


	public String getRsvNo() {
		return rsvNo;
	}

	public void setRsvNo(String rsvNo) {
		this.rsvNo = rsvNo;
	}

	public String getTaNo() {
		return taNo;
	}

	public void setTaNo(String taNo) {
		this.taNo = taNo;
	}

	public List<Integer> getQuantity() {
		return quantity;
	}

	public List<Integer> getAday() {
		return aday;
	}

	public List<Integer> getDays() {
		return days;
	}

	public void setQuantity(List<Integer> quantity) {
		this.quantity = quantity;
	}

	public void setAday(List<Integer> aday) {
		this.aday = aday;
	}

	public void setDays(List<Integer> days) {
		this.days = days;
	}

	public String getOrderuse() {
		return orderuse;
	}

	public void setOrderuse(String orderuse) {
		this.orderuse = orderuse;
	}

	public String getCoNo() {
		return coNo;
	}

	public void setCoNo(String coNo) {
		this.coNo = coNo;
	}

	public List<MultipartFile> getPictureFile() {
		return pictureFile;
	}

	public void setPictureFile(List<MultipartFile> pictureFile) {
		this.pictureFile = pictureFile;
	}

	public List<MultipartFile> getTextFile() {
		return textFile;
	}

	public void setTextFile(List<MultipartFile> textFile) {
		this.textFile = textFile;
	}

	public String getNextptaNo() {
		return nextptaNo;
	}

	public void setNextptaNo(String nextptaNo) {
		this.nextptaNo = nextptaNo;
	}

	public String getIssue() {
		return issue;
	}

	public void setIssue(String issue) {
		this.issue = issue;
	}

	public String getpNo() {
		return pNo;
	}

	public void setpNo(String pNo) {
		this.pNo = pNo;
	}

	public String getNextpNo() {
		return nextpNo;
	}

	public void setNextpNo(String nextpNo) {
		this.nextpNo = nextpNo;
	}

	public String getChart() {
		return chart;
	}

	public void setChart(String chart) {
		this.chart = chart;
	}

	public List<String> getDiseaseName() {
		return diseaseName;
	}

	public void setDiseaseName(List<String> diseaseName) {
		this.diseaseName = diseaseName;
	}

	public List<String> getAccount() {
		return account;
	}

	public void setAccount(List<String> account) {
		this.account = account;
	}

	public List<String> getMedicineName() {
		return medicineName;
	}

	public void setMedicineName(List<String> medicineName) {
		this.medicineName = medicineName;
	}


	public List<String> getTemppic() {
		return temppic;
	}

	public void setTemppic(List<String> temppic) {
		this.temppic = temppic;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}

}
