package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.CoMedVO;
import kr.or.ddit.dto.CoTaskVO;
import kr.or.ddit.dto.SchedulerVO;
import kr.or.ddit.dto.SchedulerVO2;

public class SchedulerDAOImpl implements SchedulerDAO {

	private SqlSession session;
	private SchedulerDAO schedulerDao;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	public void setSchedulerDao(SchedulerDAO schedulerDao) {
		this.schedulerDao = schedulerDao;
	}

	@Override
	public List<SchedulerVO> Cooperation() throws SQLException {
		List<SchedulerVO> Cooperation = session.selectList("Scheduler-Mapper.Cooperation");
		System.out.println("협진스케줄 확인중"+Cooperation);
		return Cooperation;
	}

	@Override
	public List<SchedulerVO> myCooperation(String dId) throws SQLException {
		List<SchedulerVO> MyCooperation = session.selectList("Scheduler-Mapper.myCooperation");
		return MyCooperation;
	}

	@Override
	public SchedulerVO selectByTaNo(int taNo) throws SQLException {
		return schedulerDao.selectByTaNo(taNo);
	}

	@Override
	public SchedulerVO deleteScheduler(int taNo) throws SQLException {
		return schedulerDao.selectByTaNo(taNo);
	}

	@Override
	public SchedulerVO updateScheduler(SchedulerVO scheduler) throws SQLException {
		return schedulerDao.updateScheduler(scheduler);
	}

	@Override
	public SchedulerVO insertScheduler(SchedulerVO scheduler) throws SQLException {
		return schedulerDao.insertScheduler(scheduler);
	}

	@Override
	public List<String> selectAllcoNo(String dId) throws SQLException {
		System.out.println(dId);
		List<String> result = session.selectList("Scheduler-Mapper.selectAllcoNo", dId);
		return result;
	}

	@Override
	public List<SchedulerVO> selectAllTask(CoTaskVO vo) throws SQLException {
		List<SchedulerVO> result = session.selectList("Scheduler-Mapper.selectAllTask", vo);
		return result;
	}

	@Override
	public List<CoMedVO> selectbox(String dId) throws SQLException {
		List<CoMedVO> result = session.selectList("Scheduler-Mapper.selectbox", dId);

		return result;
	}

	@Override
	public List<String> selectCoDoctor(String coNo) throws SQLException {

		List<String> result =session.selectList("Scheduler-Mapper.selectCoDoctor", coNo);
		return result;
	}

	@Override
	public List<SchedulerVO2> selectCoScheduler(SchedulerVO vo) throws SQLException {

			List<SchedulerVO2> result = session.selectList("Scheduler-Mapper.selectCoScheduler", vo);

		return result;
	}

	@Override
	public List<CoMedVO> searchselectbox(CoMedVO vo) throws SQLException {
		List<CoMedVO> result = session.selectList("Scheduler-Mapper.searchselectbox", vo);
		return result;
	}

//	@Override
//	public List<SchedulerVO> Cooperation() throws SQLException {
//		List<SchedulerVO> Cooperation = session.selectList("Scheduler-Mapper.Cooperation");
//		return Cooperation;
//	}

//	@Override
//	public List<SchedulerVO> myCooperation(String dId) throws SQLException {
//		String dId = session.selectOne("Scheduler-Mapper.myCooperation",dId);
//		List<SchedulerVO> myCooperationList = session.selectList("Scheduler-Mapper.")
//		return null;
//	}


}
