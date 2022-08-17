package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.ChartPicFileVO;
import kr.or.ddit.dto.CoDocApproveVO;
import kr.or.ddit.dto.CoDoctorListVO;
import kr.or.ddit.dto.CoFreqVO;
import kr.or.ddit.dto.CoSubTaskVO;
import kr.or.ddit.dto.CoTaskASubVO;
import kr.or.ddit.dto.ComComentVO;
import kr.or.ddit.dto.ComRecoVO;
import kr.or.ddit.dto.IssueVO;
import kr.or.ddit.dto.LastChartFileVO;
import kr.or.ddit.dto.LastPrescriptVO;
import kr.or.ddit.dto.LogHistoryVO;
import kr.or.ddit.dto.MedFileVO;
import kr.or.ddit.dto.MyHistoryCommentVO;
import kr.or.ddit.dto.MyIssueVO;
import kr.or.ddit.dto.NotiVO;
import kr.or.ddit.dto.ReserveHistoryVO;
import kr.or.ddit.dto.SelDocVO;

public interface CooperMyDao {

	//해당 협진의 전체진료 리스트
	List<CoTaskASubVO> selectCoTaskList (String coNo) throws SQLException;
    //해당협진의 완료된 진료 리스트
	List<ReserveHistoryVO> selectHistoryList(String coNo) throws SQLException;
	//해당협진환자의 가장최근 진료기록
	ComRecoVO selectLast(String coNo)throws SQLException;
	//가장최근 진료기록에 대한 의료기록파일
	List<LastChartFileVO> selectChartFile(String mNo) throws SQLException;
	//가장최근 진료기록에대한 의료사진들
	List<ChartPicFileVO> selectChartPicFile(String mNo) throws SQLException;
	//해당협진환자의 가장최근진료기록에 대한 처방전
	List<LastPrescriptVO> selectLastPrescript (String mNo) throws SQLException;
	//해당협진환자의 특이사항 최신순
	List<MyIssueVO> myIssueList(String coNo) throws SQLException;
	//해당협진의 의료진정보리스트
	List<CoDoctorListVO> coDocList(String coNo)throws SQLException;
    //특정날짜 히스토리 결과 조회
	List<ReserveHistoryVO> selectDateHistory(Map<String,String> map)throws SQLException;
	//로그인한 의사의 자주찾는 의사 리스트
	List<CoFreqVO> selectCoFreq(String dId)throws SQLException;
	//협진예약 인서트!
	int insertReserve(CoTaskASubVO coTaskASubVO) throws SQLException;
	//시퀀스값가져오기
	int taNoSEQ () throws SQLException;

	//업무승인 시퀀스 값 가져오기
	int tnNoSEQ () throws SQLException;
	//업무승인 테이블에 insert하기
	int insertTaskApprove(CoDocApproveVO coDocApproveVO) throws SQLException;

	//하위업무등록
			int SubNoSEQ() throws SQLException;
			//하위업무테이블에 인서트하기
			int insertSubTask(CoSubTaskVO  coSubTaskVO) throws SQLException;

			//예약상세보기 (주치의포지션)
			CoTaskASubVO selectReserveDetail(String taNo) throws SQLException;
			//하위업무구하기
			List<CoSubTaskVO> selectSub(String taNo) throws SQLException;

			//주치의가 수 락 버튼 눌렀을 때
			int coTaskTaStatus(String taNo) throws SQLException;
			int taskApproveTnYn(String taNo)throws SQLException;

			//진료기록에서 해당것 클릭했을 때!
			//진료기록가져오기
			ComRecoVO selecthistoryDetail(String taNo)throws SQLException;
			//해당진료기록 mNo에 대한 코멘트 모음
			List<MyHistoryCommentVO> historyCommentList (String mNo)throws SQLException;

			//댓글 시퀀스 불러오기
			int comCoNoSeqNext() throws SQLException;
			//댓글 인서트하기
			int insertReply(MyHistoryCommentVO vo)throws SQLException;

			//댓글업데이트하기
			int replyUpdate(Map<String,String>map)throws SQLException;
			//업데이트결과 가져오기
			MyHistoryCommentVO selectReply(String comCoNo) throws SQLException;

			//댓글 삭제하기
			int replyRemove(String comCoNo) throws SQLException;

			//파일 정보 불러오기
			List<MedFileVO> selectAllCoFile(String coNo)throws SQLException;

			//의료진상세정보
			SelDocVO selectDoc(String dId)throws SQLException;
			// 해당의료진이 맡고 있는 진료
			List<CoTaskASubVO> task (Map<String,String> map) throws SQLException;
			//coTask의료진 dId업데이트
			int taskdIdUpdate (Map<String,String> map) throws SQLException;
	//예약 수정
    void updateReserve(CoTaskASubVO vo)throws SQLException;
    //수정 내역 업무 승인
    void updateTaskApprove(CoDocApproveVO vo)throws SQLException;
    //삭제 내역 업무 승인
    void deleteTaskApprove(String taNo)throws SQLException;
    //조직도에서 의료진 초대하기
    void inviteDoc(Map<String,String> map)throws SQLException;
    //업무 삭제
    void deleteCoTask(String taNo)throws SQLException;
    //조직도에서 해당 협진에 참여하고 있는 동료 의사 id
    List<String> selectCodId(String coNo) throws SQLException;
    //협진탈퇴
    void coExit(Map<String,String>map)throws SQLException;

    //로그 기록 남기기
    void insertLog(LogHistoryVO vo)throws SQLException;
    //로그 시퀀스
    int makeLogSeq()throws SQLException;
    //진료 코멘트 조회
    ComComentVO selectAllComComent(String coComNo)throws SQLException;
    //로그 출력
    List<LogHistoryVO> selectAllLog(String coNo)throws SQLException;


    //상세 페이지 특이사항 전체 조회
    List<IssueVO> detailAllIssue(String coNo)throws SQLException;
    //메인 페이지 특이사항 전체 조회
    List<IssueVO> mainAllIssue(String dId)throws SQLException;
    //주치의 구하기
    String selectCodoc(String coNo)throws SQLException;

    //메인 페이지 comment 전체 조회
    List<MyHistoryCommentVO> selectAllComment(String dId)throws SQLException;

    //noti read 1 변경
    void notiRead(NotiVO vo)throws SQLException;
    
    //상세 페이지 자주찾는 협진 
    List<CoFreqVO> selectDetailCoFreq(String dId)throws SQLException;

}

