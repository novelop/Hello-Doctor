package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.ManagerDoctorListVO;
import kr.or.ddit.dto.ManagerNoticeVO;
import kr.or.ddit.dto.MedicineVO;

public class ManagerDAOImpl implements ManagerDAO {

	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public ManagerDoctorListVO doctorListForPage(String dId) throws SQLException {
		ManagerDoctorListVO doctor = session.selectOne("Manager-Mapper.doctorListForPage", dId);
		return doctor;
	}

	@Override
	public List<ManagerDoctorListVO> insertDid() throws SQLException {
		List<ManagerDoctorListVO> list = session.selectList("Manager-Mapper.insertDid");
		return list;
	}

	@Override
	public int doctorListCount(SearchCriteria cri) throws SQLException {
		int count = session.selectOne("Manager-Mapper.doctorListCount", cri);
		return count;
	}

	// 정직
	@Override
	public void susDoctor(ManagerDoctorListVO doctorvo) throws SQLException {
		session.update("Manager-Mapper.susDoctor", doctorvo);

	}

	@Override
	public ManagerDoctorListVO doctorStatus(String dId) throws SQLException {
		ManagerDoctorListVO doctorvo = session.selectOne("Manager-Mapper.doctorStatus", dId);
		return doctorvo;
	}

	@Override
	public void workDoctor(String dId) throws SQLException {
		session.update("Manager-Mapper.workDoctor", dId);

	}

	@Override
	public void retireDoctor(ManagerDoctorListVO doctorvo) throws SQLException {
		session.update("Manager-Mapper.retireDoctor", doctorvo);

	}

	@Override
	public ManagerDoctorListVO ipListForPage(ManagerDoctorListVO ipvo) throws SQLException {

		ManagerDoctorListVO command = session.selectOne("Manager-Mapper.ipListForPage", ipvo);
		return command;
	}

	@Override
	public List<ManagerDoctorListVO> insertIpNO() throws SQLException {
		List<ManagerDoctorListVO> list = session.selectList("Manager-Mapper.insertIpNo");
		return list;
	}

	@Override
	public int ipListForCount() throws SQLException {
		int count = session.selectOne("Manager-Mapper.ipListForCount");
		return count;
	}

	@Override
	public void ipInsert(ManagerDoctorListVO doctorvo) throws SQLException {
		session.update("Manager-Mapper.ipInsert", doctorvo);

	}

	@Override
	public List<ManagerDoctorListVO> memberIp(String dId) throws SQLException {
		List<ManagerDoctorListVO> iplist = session.selectList("Manager-Mapper.memberIp", dId);
		return iplist;
	}

	@Override
	public void deleteIp(String dId) throws SQLException {
		session.update("Manager-Mapper.deleteIp", dId);

	}

	@Override
	public List<ManagerNoticeVO> popUpNotice() throws SQLException {
		List<ManagerNoticeVO> list = session.selectList("Notice-Mapper.popUpNotice");
		return list;
	}

	@Override
	public List<ManagerDoctorListVO> mainMemberList() throws SQLException {
		List<ManagerDoctorListVO>list = session.selectList("Manager-Mapper.mainMemberList");
		return list;
	}

	@Override
	public List<ManagerNoticeVO> fixNotice() throws SQLException {
		List<ManagerNoticeVO> list = session.selectList("Notice-Mapper.fixNotice");
		return list;
	}

	@Override
	public List<ManagerNoticeVO> recentNotice() throws SQLException {
		List<ManagerNoticeVO> list = session.selectList("Notice-Mapper.recentNotice");
		return list;
	}

	@Override
	public List<ManagerDoctorListVO> retireCountForChart() throws SQLException {
		List<ManagerDoctorListVO> list = session.selectList("Manager-Mapper.retireCountForChart");
		return list;
	}

	@Override
	public List<ManagerDoctorListVO> memberCountForChart() throws SQLException {
		List<ManagerDoctorListVO> list = session.selectList("Manager-Mapper.memberCountForChart");
		return list;
	}

	@Override
	public ManagerDoctorListVO ipDetail(String ipNo) throws SQLException {
		ManagerDoctorListVO ip = session.selectOne("Manager-Mapper.ipDetail", ipNo);
		return ip;
	}

	@Override
	public List<String> dorInsertId() throws SQLException {
		List<String> list = session.selectList("Manager-Mapper.dorInsertId");
		return list;
	}

	@Override
	public ManagerDoctorListVO dormantAccount(String dId) throws SQLException {
		ManagerDoctorListVO listVO = session.selectOne("Manager-Mapper.dormantAccount", dId);
		return listVO;
	}

	@Override
	public int overlapIp(ManagerDoctorListVO ipvo) throws SQLException {
		int count = session.selectOne("Manager-Mapper.overlapIp", ipvo);
		return count;
	}

	@Override
	public List<ManagerDoctorListVO> overIp(String dId) throws SQLException {
		List<ManagerDoctorListVO> list = session.selectList("Manager-Mapper.overIp", dId);
		return list;
	}

	// ipManager Ip삭제 비동기
	@Override
	public void ipManagerDeleteIp(ManagerDoctorListVO doctorVO) throws SQLException {
		session.update("Manager-Mapper.ipManagerDeleteIp", doctorVO);

	}

	@Override
	public List<MedicineVO> selectUpdateMedicine() throws SQLException {
		List<MedicineVO> list = session.selectList("Manager-Mapper.selectUpdateMedicine");
		return list;
	}





}
