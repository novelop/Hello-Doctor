package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.ManagerDoctorListVO;
import kr.or.ddit.dto.ManagerNoticeVO;
import kr.or.ddit.dto.MedicineVO;

public interface ManagerDAO {

//	List<ManagerDoctorListVO> doctorListForPage(SearchCriteria cri) throws SQLException;
	ManagerDoctorListVO doctorListForPage(String dId)throws SQLException;
	List<ManagerDoctorListVO> insertDid()throws SQLException;

	int doctorListCount(SearchCriteria cri) throws SQLException;

	// 의사 상태 가져오기
	ManagerDoctorListVO doctorStatus(String dId) throws SQLException;

	// 정직
	void susDoctor(ManagerDoctorListVO doctorvo) throws SQLException;

	// 현직?
	void workDoctor(String dId) throws SQLException;

	// 퇴직
	void retireDoctor(ManagerDoctorListVO doctorvo) throws SQLException;

	// ipList
	ManagerDoctorListVO ipListForPage(ManagerDoctorListVO ipvo)throws SQLException;
	List<ManagerDoctorListVO> insertIpNO()throws SQLException;
	int ipListForCount()throws SQLException;

	// ip추가
	void ipInsert(ManagerDoctorListVO doctorvo)throws SQLException;

	// ip선택
	List<ManagerDoctorListVO> memberIp(String dId)throws SQLException;

	// ip삭제
	void deleteIp(String dId)throws SQLException;

	// 메인화면 팝업공지 출력용
	List<ManagerNoticeVO> popUpNotice()throws SQLException;

	// 메인 신규회원가입
	List<ManagerDoctorListVO> mainMemberList()throws SQLException;

	// 메인화면 고정공지 출력용
	List<ManagerNoticeVO> fixNotice()throws SQLException;

	// 메인화면 최근 공지 출력용
	List<ManagerNoticeVO> recentNotice()throws SQLException;

	// 퇴직자 수
	List<ManagerDoctorListVO> retireCountForChart()throws SQLException;

	// 현재 의료진수
	List<ManagerDoctorListVO> memberCountForChart()throws SQLException;

	// ipList 상세보기
	ManagerDoctorListVO ipDetail(String ipNo)throws SQLException;

	// 휴면에 넣을 ID
	List<String> dorInsertId()throws SQLException;

	// 휴면 계정 리스트 출력
	ManagerDoctorListVO dormantAccount(String dId)throws SQLException;

	// IP중복 검사
	int overlapIp(ManagerDoctorListVO ipvo)throws SQLException;

	// IP중복안되는거 리스트 가졍괴
	List<ManagerDoctorListVO> overIp(String dId)throws SQLException;

	// ipManager Ip삭제 비동기
	void ipManagerDeleteIp(ManagerDoctorListVO doctorVO)throws SQLException;
	
	// 메인 업데이트된 약품 출력
	List<MedicineVO> selectUpdateMedicine()throws SQLException;
	
}
