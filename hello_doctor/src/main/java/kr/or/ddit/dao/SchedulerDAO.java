package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionException;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.ChartFormVO;
import kr.or.ddit.dto.CoMedVO;
import kr.or.ddit.dto.CoTaskVO;
import kr.or.ddit.dto.SchedulerVO;
import kr.or.ddit.dto.SchedulerVO2;

public interface SchedulerDAO {

	//오늘 예약 일정 리스트
//	List<ChartFormVO> TodayList(String dId) throws SQLException;
//	List<ChartFormVO> TodayCooperation(String dId) throws SQLException;

	//협진 스케줄러
	List<SchedulerVO> Cooperation() throws SQLException;

	//협진 스케줄러 내 일정만 보기
	List<SchedulerVO> myCooperation(String dId) throws SQLException;

	//협진 스케줄러 상세조회 (1)
	SchedulerVO selectByTaNo(int taNo) throws SQLException;

	//협진 스케줄러 상세조회 (2)

	//협진 스케줄러 삭제
	SchedulerVO deleteScheduler(int taNo) throws SQLException;

	//협진 스케줄러 수정
	SchedulerVO updateScheduler(SchedulerVO scheduler) throws SQLException;

	//협진 스케줄러 등록
	SchedulerVO insertScheduler(SchedulerVO scheduler) throws SQLException;

	//협진 코드 조회
	List<String> selectAllcoNo(String dId)throws SQLException;

	//협진 예약 전체 조회
	List<SchedulerVO> selectAllTask(CoTaskVO vo)throws SQLException;

	List<CoMedVO> selectbox(String dId)throws SQLException;

	//개별 협진 예약 전체 조회
	List<String> selectCoDoctor(String coNo)throws SQLException;

	List<SchedulerVO2> selectCoScheduler(SchedulerVO vo)throws SQLException;

	List<CoMedVO> searchselectbox(CoMedVO vo)throws SQLException;

}
