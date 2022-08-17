package kr.or.ddit.command;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class SearchCriteriaCommand2 {

	private String page;
	private String perPageNum;
	private String keyword;
	private String searchType;
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(String perPageNum) {
		this.perPageNum = perPageNum;
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

	public ReplyPagingCommand toReplyPagingCommand() {
		ReplyPagingCommand command = new ReplyPagingCommand();
		if(page !=null && !page.isEmpty() ) {
			command.setPage(Integer.parseInt(page));
		}
		if(perPageNum !=null && !perPageNum.isEmpty()) {
			command.setPerPageNum(Integer.parseInt(perPageNum));
		}

//		command.setSearchType(searchType);
//		command.setKeyword(keyword);

		return command;

	}


	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}



