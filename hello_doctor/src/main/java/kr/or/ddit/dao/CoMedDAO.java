package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.AttachVO;
import kr.or.ddit.dto.CoDoctorVO;
import kr.or.ddit.dto.CoMedVO;
import kr.or.ddit.dto.ComComentVO;
import kr.or.ddit.dto.ComRecoVO;
import kr.or.ddit.dto.LogHistoryVO;
import kr.or.ddit.dto.NotiVO;

public interface CoMedDAO {

	//내가 했던 협진
	List<CoMedVO> iCooperation(String dId,SearchCriteria cri) throws SQLException;
	int iCooperationCount(String dId, SearchCriteria cri) throws SQLException;

	//검색기능 + 페이징
	int selectSearchCooperationCount(SearchCriteria cri) throws Exception;

	//전체 협진리스트
	List<CoMedVO> selectAll(SearchCriteria cri)throws SQLException;
	//전체 협진 리스트 -> 의료진들
	List<CoMedVO> coopermain_doctors(String coNo)throws SQLException;


	//페이징
	int selectSearchMyCooperationCount(SearchCriteria cri) throws Exception;
	// 사용자의 전공과 일치하는 협진리스트
	List<CoMedVO> myCooperation(String maNo, SearchCriteria searchCri) throws SQLException;
	// 사용자의 전공과 일치하는 협진리스트 ->의료진들
	List<CoMedVO> myCooperation_doctors(String coNo) throws SQLException;


	//페이징
	int selectSearchProceeding(SearchCriteria cri) throws Exception;
	//진행중인 협진리스트
	List<CoMedVO> proceedingCooperation(SearchCriteria cri)throws SQLException;
	//진행중 협진리스트 -> 의료진들
	List<CoMedVO> proceeding_doctors(String coNo) throws SQLException;

	//페이징
	int selectSearchMyProceeding(SearchCriteria cri) throws Exception;
	//사용자의 전공과 일치하는 협진리스트
	List<CoMedVO> myCooperation_proceeding(String maNo) throws SQLException;
	//사용자의 전공과 일치하는 협진리스트 -> 의료진들
	List<CoMedVO> myCooperation_proceedingdoctors(String coNo) throws SQLException;


	//페이징
	int selectSearchComplete(SearchCriteria cri) throws Exception;
	//완료된 협진리스트
	List<CoMedVO> completeCooperation(SearchCriteria cri)throws SQLException;
	//완료된 협진리스트 -> 의료진들
	List<CoMedVO> complete_doctors(String coNo) throws SQLException;

	//페이징
	int selectSearchMyComplete(SearchCriteria cri) throws Exception;
	//사용자의 전공과 일치하는 협진리스트
	List<CoMedVO> myCooperation_complete(String maNo) throws SQLException;
	//사용자의 전공과 일치하는 협진리스트 -> 의료진들
	List<CoMedVO> myCooperation_completedoctors(String coNo) throws SQLException;

	//협진 시퀀스 생성
	int getCoSeq()throws SQLException;
	//알림 시퀀스 생성
	int getNotiSeq()throws SQLException;

	//협진 생성
	void registCoMedi(CoMedVO vo)throws SQLException;

	//전체 협진 진료 내역 조회
	List<ComRecoVO>selectAllComReco(String coNo) throws SQLException;
	//협진 전체 히스토리 조회
	List<LogHistoryVO>  selectAllLogHistory(String comNo)throws SQLException;
	//전체 자료조회
	AttachVO selectAllAttach(String comNo)throws SQLException;
	//전체 comment 조회
	ComComentVO selectAllComComent(String comNo)throws SQLException;
	//로그 히스토리 입력
	void insertLogHistroy(LogHistoryVO vo)throws SQLException;
	//자료실 입력
	void insertAttach(AttachVO vo)throws SQLException;
	//진료 comment 입력
	void insertComComent(ComComentVO vo)throws SQLException;

	//로그 히스토리 시퀀스 생성
	int getAttachSeq()throws SQLException;

	//자료실 시퀀스 생성
	int getLogHistorySeq()throws SQLException;

	//코멘트 시퀀스 생성
	int getComComentSeq()throws SQLException;


	//협진의사 입력
	void registCoDoctor(CoDoctorVO vo)throws SQLException;
	void registNoti(NotiVO vo)throws SQLException;


	int proceedingCooperationMineCount(SearchCriteria cri) throws Exception;
	List<CoMedVO> proceedingCooperationMine(SearchCriteria cri) throws SQLException;

	int completeCooperationMineCount(SearchCriteria cri) throws Exception;
	List<CoMedVO> completeCooperationMine(SearchCriteria cri) throws SQLException;
}
