package kr.or.ddit.command;

import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.dto.CaseVO;

public class CaseRegistCommand extends CaseVO {

	private List<MultipartFile> file;

	public List<MultipartFile> getFile() {
		return file;
	}

	public void setFile(List<MultipartFile> file) {
		this.file = file;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}


}
