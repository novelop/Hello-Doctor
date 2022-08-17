package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.ChartFormVO;
import kr.or.ddit.dto.CoTaskVO;
import kr.or.ddit.dto.SubTaskVO;

public interface CoTaskDAO {

	List<ChartFormVO> selectAllReco(String dId)throws SQLException;

	CoTaskVO mycotask(String taNo)throws SQLException;

	List<SubTaskVO> mySubCoTask(String taNo)throws SQLException;

}
