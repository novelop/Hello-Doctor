package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.NotiVO;

public interface NotiDAO {

	List<NotiVO> notiList(String dId)throws SQLException;
	List<NotiVO> notiAllList(String dId)throws SQLException;

	int countnoti(String dId)throws SQLException;

}
