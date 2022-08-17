package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.ChartFormVO;
import kr.or.ddit.dto.CoMedVO;
import kr.or.ddit.dto.SchedulerVO;
import kr.or.ddit.dto.SchedulerVO2;

import java.sql.SQLException;



public interface SchedulerService {

	//오늘 나의 일정 진료 왼쪽화면
	Map<String,Object> TodayMyList(String dId) throws SQLException;

	//협진스케줄러 리스트 오른쪽화면
	List<SchedulerVO> Cooperation(String dId) throws SQLException;

	//개별 협진 스케줄러 조회
	List<SchedulerVO2> selectCoScheduler(String coNo) throws SQLException;

	//나의 개별 협진 스케줄러 조회
	List<SchedulerVO2> selectMyCoScheduler(SchedulerVO vo)throws SQLException;
	//협진 상세조회 (1)

	//협진 상세조회 (2)

	//협진 등록

	//협진 수정

	//협진 삭제

	//협진 환자 조회 autocomplete
	List<CoMedVO> searchselectbox(CoMedVO vo)throws SQLException;

}
