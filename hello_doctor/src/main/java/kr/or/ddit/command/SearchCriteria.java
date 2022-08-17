package kr.or.ddit.command;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class SearchCriteria {

	private String keyword;
	private String searchType ;

	// list filter
	private String userFilter;

	// 내가 쓴 글만 보기
	private String userChoice;
	private String dId;
	private String maName;

	private int page=1;
	private int perPageNum = 9;

	private int startRowNum=0;


	private String mineCheck;
	private String selectFilter;

	private String startDate;
	private String endDate;

	private String chkSelectMine;






	public String getdId() {
		return dId;
	}

	public void setdId(String dId) {
		this.dId = dId;
	}

	public String getChkSelectMine() {
		return chkSelectMine;
	}

	public void setChkSelectMine(String chkSelectMine) {
		this.chkSelectMine = chkSelectMine;
	}


	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getSelectFilter() {
		return selectFilter;
	}

	public void setSelectFilter(String selectFilter) {
		this.selectFilter = selectFilter;
	}

	public String getMineCheck() {
		return mineCheck;
	}

	public void setMineCheck(String mineCheck) {
		this.mineCheck = mineCheck;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page<1) {
			this.page=1;
		}else {
			this.page = page;
		}
		setStartRowNum();
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		if(perPageNum < 1) {
			this.perPageNum = 9;
		}else {
			this.perPageNum = perPageNum;
		}
		setStartRowNum();
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum() {
		this.startRowNum=(this.page-1)*perPageNum;
	}

	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getUserFilter() {
		return userFilter;
	}

	public void setUserFilter(String userFilter) {
		this.userFilter = userFilter;
	}

	public String getUserChoice() {
		return userChoice;
	}

	public void setUserChoice(String userChoice) {
		this.userChoice = userChoice;
	}
	public String getDId() {
		return dId;
	}

	public void setDId(String dId) {
		this.dId = dId;
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
