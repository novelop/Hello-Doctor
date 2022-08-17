package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.CoDocApproveVO;
import kr.or.ddit.dto.DidApproveVO;
import kr.or.ddit.dto.IssueVO;

import kr.or.ddit.dto.MyHistoryCommentVO;
import kr.or.ddit.dto.NotiVO;


public interface CooperMainService {

		//해당의사가 참여중인 협진 리스트
		Map<String,Object> selectCooperList(String dId,SearchCriteria cri) throws SQLException;
		//특이사항 리스트
		List<IssueVO> selectIssueList(String dId) throws SQLException;

		//내가 올린 히스토리에 대한 협진코멘트리스트
		List<MyHistoryCommentVO> selectHistoryComment (String dId)throws SQLException;
		List<NotiVO> selectNoti(String dId)throws SQLException;
		//내가 주치의인 경우 받은 요청들 리스트
		List<CoDocApproveVO> selectapproveList(String dId) throws SQLException;
		//내가 주치의가 아닌 경우 요청한 사항들에 대한 결과값(업무)
	    List<DidApproveVO> selectmyapproveList(String dId) throws SQLException;
	    //협진 요청 페이지 출력
	    Map<String,Object> cooperationRequest(String notiNo)throws SQLException;

	    //자주찾는 협진에 등록
	    void FreqRegist(Map<String,String>map)throws SQLException;
	    //자주찾는 협진에서 삭제
	    void RreqCancel(Map<String,String>map)throws SQLException;
	  //진료예약거절하기
	    void rejectRegist(Map<String,String>map)throws SQLException;
	    //참고taNo를 가지는지 체크
	    String checkReferTaNo(String taNo) throws SQLException;
	    //해당참고taNo의 status를 3으로 셋팅해준다!
	    void updateReferStatus(String taNo) throws SQLException;
	    void rejectStatus(Map<String,String>map)throws SQLException;
	  //삭제인지아닌지
	    int checkRemove(String taNo)throws SQLException;

	    void updateRemoveStatus(String taNo)throws SQLException;
	    //삭제 거절 시 셋팅
	   void updateRemoveReject(String taNo)throws SQLException;
       //협진메인페이지에서 협진요청 받은 요청에 대해서 변경할 때
	  void updateComed(Map<String,Object>map)throws SQLException;
	 //내가 요청한 협진들 상태
	  List<NotiVO> selectRequestNoti(String dId)throws SQLException;
	  //주치의 이름구하기
	  String selectCodocName(String dId)throws SQLException;
	  //내가 주치의일때 처리완료한 리스트
	  List<CoDocApproveVO> selectapproveComplete(String dId)throws SQLException;
}
