package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.OtherDoctorCommand;
import kr.or.ddit.dto.CoDoctorVO;
import kr.or.ddit.dto.CoworkerVO;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.MajorVO;

public class DoctorDAOImpl implements DoctorDAO {
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public DoctorVO doctorLogin(DoctorVO vo) throws SQLException {


		DoctorVO result = session.selectOne("Doctor-Mapper.doctorLogin", vo);

		return result;
	}

	@Override
	public DoctorVO profileChange(DoctorVO vo) throws SQLException {

		DoctorVO result = session.selectOne("Doctor-Mapper.profileChange",vo);

		return result;

	}

	@Override
	public String searchDoctorName(String dId) throws SQLException {
		String dName = session.selectOne("Doctor-Mapper.searchDoctorName",dId);
		return dName;
	}

	@Override
	public DoctorVO selectDoctorVO(String dId) throws SQLException {

		return session.selectOne("Doctor-Mapper.selectDoctorVO",dId);
	}

	@Override
	public List<MajorVO> majorList() throws SQLException {
		List<MajorVO> result = session.selectList("Doctor-Mapper.majorList");
		return result;
	}
	@Override
	public List<CoDoctorVO> coDoctor(OtherDoctorCommand command) throws SQLException {
		List<CoDoctorVO> result = session.selectList("Doctor-Mapper.coDoctor", command);
		return result;
	}

	@Override
	public MajorVO detailDoctor(String doId) throws SQLException {
		MajorVO result = session.selectOne("Doctor-Mapper.detailDoctor", doId);
		return result;
	}

	@Override
	public List<MajorVO> majorDoctors(MajorVO vo) throws SQLException {
		List<MajorVO> result = session.selectList("Doctor-Mapper.majorDoctors", vo);
		return result;

	}

	@Override
	public DoctorVO getDoctor(DoctorVO vo) throws SQLException {

		DoctorVO result =  session.selectOne("Doctor-Mapper.doctorLogin", vo);

		return result;
	}

	// 로그아웃 클릭시, 의사 상태 초기화
	@Override
	public void doctorStatusReset(String dId) throws SQLException {

		session.selectOne("Doctor-Mapper.doctorStatusReset", dId);

	}

	@Override
	public void doctorStatusStart(String dId) throws SQLException {

		session.selectOne("Doctor-Mapper.doctorStatusStart", dId);
	}

	// 아이디 찾기
	@Override
	public String findId(Map<String, String>dataMap) throws SQLException {

		String result = session.selectOne("Doctor-Mapper.findId",dataMap);
		return result;
	}

	@Override
	public String findpass(Map<String, String> dataMap) throws SQLException {
		String result = session.selectOne("Doctor-Mapper.findpass", dataMap);
		return result;
	}

	@Override
	public String sendMail(Map<String, String> dataMap) throws SQLException {
		String result = session.selectOne("Doctor-Mapper.sendMail",dataMap);
		return result;
	}

	@Override
	public void modifyPass(Map<String, String> dataMap) throws SQLException {
		 session.update("Doctor-Mapper.modifyPass",dataMap);
	}

	@Override
	public List<CoworkerVO> coworkerList(String dId) throws SQLException {
		List<CoworkerVO> result = session.selectList("Doctor-Mapper.coworkerList", dId);
		return result;
	}

	@Override
	public void addCoworker(CoworkerVO vo) throws SQLException {
		session.insert("Doctor-Mapper.addCoworker", vo);

	}

	@Override
	public void deleteCoworker(CoworkerVO vo) throws SQLException {
		session.insert("Doctor-Mapper.deleteCoworker", vo);
	}

	@Override
	public List<Map<String,String>>allDoctor(String dId) throws SQLException {
		List<Map<String,String>> result =session.selectList("Doctor-Mapper.allDoctor",dId);

		return result;
	}

	@Override
	public List<DoctorVO> selectAllDoctor() throws SQLException {
		List<DoctorVO> result = session.selectList("Doctor-Mapper.selectAllDoctor");
		return result;
	}

	@Override
	public void docinfomodify(DoctorVO vo) throws SQLException {

		session.update("Doctor-Mapper.docinfomodify",vo);

	}

	@Override
	public void docinfoprofilemodify(DoctorVO vo) throws SQLException {

		session.update("Doctor-Mapper.docinfoprofilemodify",vo);

	}

	@Override
	public String checkpwd(String dId) throws SQLException {

	String result=	session.selectOne("Doctor-Mapper.checkpwd",dId);
		return result;

	}

	@Override
	public void docpwdmodify(DoctorVO vo) throws SQLException {

		session.update("Doctor-Mapper.docpwdmodify", vo);

	}

	@Override
	public void docloginmodify(DoctorVO vo) throws SQLException {
		session.update("Doctor-Mapper.docloginmodify",vo);

	}

	@Override
	public void doctelmodify(DoctorVO vo) throws SQLException {

		session.update("Doctor-Mapper.doctelmodify",vo);

	}

	@Override
	public List<String> docIp(String dId) throws SQLException {

		List<String> result = null;

		 result = session.selectList("Doctor-Mapper.docIp",dId);

		System.out.println("doaImpldocIp"+result);

		return result;
	}


}
