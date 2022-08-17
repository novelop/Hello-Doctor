package kr.or.ddit.controller;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.UnknownHostException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.dao.DoctorDAO;
import kr.or.ddit.dao.HospitalIpDAO;
import kr.or.ddit.dto.AdminVO;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.HospitalIpVO;
import kr.or.ddit.dto.LoginLogVO;
import kr.or.ddit.exception.InvalidPasswordException;
import kr.or.ddit.exception.NotFoundIdException;
import kr.or.ddit.service.DoctorService;
import kr.or.ddit.service.HospitalService;
import kr.or.ddit.service.LoginSearchDoctorService;

@Controller
@RequestMapping("login")
public class login {

	@Autowired
	private DoctorService doctorService;

	@Autowired
	private HospitalService hospitalService;
	@Autowired
	private LoginSearchDoctorService loginSearchDoctorService;

	// login check filter
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm(@RequestParam(defaultValue = "") String error, HttpServletResponse response)
			throws SQLException, UnknownHostException {
//		String url = "login/blockLogin";
		String url = "login/loginForm";
		if (error.equals("-1")) {
			response.setStatus(302);
		}

//		// 병원 IP 모든 출력
//		List<HospitalIpVO> hosIp = hospitalService.blockHospitalIp();
//
//		System.out.println("hosIp!@~#@~"+hosIp);
//
//		// ip 출력
//		InetAddress ip = InetAddress.getLocalHost();
//
//		// 내 컴퓨터 IP 출력
//		String ipcheck=ip.getHostAddress();
//
//		System.out.println("나의 ip 주소!"+ipcheck);
//
//		// 내 컴퓨터 IP와 병원 IP가 일치할시 로그인 화면으로 이동
//		for(HospitalIpVO vo: hosIp) {
//			if(ipcheck.equals(vo.getIpNo())) {
//				url = "login/loginForm";
//				break;
//			}
//		}

		return url;
	}

//	@RequestMapping("/login")
//	public String originallogin(DoctorVO vo, HttpSession session, RedirectAttributes rttr,AdminVO avo) throws Exception {
//
//
//		avo.setAdminId(vo.getdId());
//
//		System.out.println(vo.getdId());
//		System.out.println(vo.getPwd());
//		System.out.println(avo.getAdminId());
////		String url ="login/loginForm2";
//		String url ="redirect:/index.do";
//
//		try {
//
//			DoctorVO doctorLogin = doctorService.doctorLogin(vo);
//
//
//				session.setAttribute("doctorLogin", doctorLogin);
//				//model.addAttribute("doctorLogin", doctorLogin);
////				System.out.println("session!~!~@~!@~!@~!@~!@~~@!");
//
//
//			} catch (NotFoundIdException | InvalidPasswordException e) {
//
//				rttr.addFlashAttribute("loginfail","login");
//				url ="redirect:/login/loginForm";
//			} catch(SQLException e) {
//				e.printStackTrace();
//				throw e;
//			}
//
//
//		if(vo.getdId().equals("admin")) {
//			// pwd 틀림
//			System.out.println(vo.getdId());
//			if(vo.getPwd().equals("admin")) {
//
//				session.setAttribute("admin", avo.getAdminId());
//
//				url = "redirect:/manager/manager";
//
//
//			}
//
//		}
//
//		return url;
//
//	}

	@ResponseBody
	@RequestMapping("/login")
	public ResponseEntity<Map<String, String>> login(@RequestBody Map<String, String> map, HttpSession session)throws Exception {

		ResponseEntity<Map<String, String>> entity = null;
		Map<String, String> dataMap = new HashMap<String, String>();
		DoctorVO vo = new DoctorVO();
		LoginLogVO logVO = new LoginLogVO();



		vo.setdId(map.get("dId"));
		vo.setPwd(map.get("pwd"));
		try {
//			 로그인
			DoctorVO doctorLogin = doctorService.doctorLogin(vo);
			System.out.println("logindoctorLogin!!@!@!"+doctorLogin);
			doctorService.doctorStatusStart(map.get("dId"));
			doctorLogin.setStatus(1);
			doctorLogin.setSmName(doctorLogin.getSmName());
			System.out.println("smName!@!!!!"+doctorLogin.getSmName());
			session.setAttribute("doctorLogin", doctorLogin);

			//doc IP 체크
			String docipresult =doctorService.docIp(doctorLogin.getdId());


			// 의사 상태 변경

			// 로그 기록 추가

			// ip 출력
			// 내 컴퓨터 IP 출력
			String getuserIp = getUserIp();
			System.out.println("getuserIp!!@!!!"+getuserIp);

			logVO.setdName(doctorLogin.getdName());
			logVO.setdId(doctorLogin.getdId());
			logVO.setIpaddress(getuserIp);
			logVO.setLogCla(1);
			loginSearchDoctorService.insertLoginUserLog(logVO);
			dataMap.put("dId", doctorLogin.getdId());
			dataMap.put("pwd", doctorLogin.getPwd());

			dataMap.put("loginchoice", doctorLogin.getOtpCheck());

			//doc IP 체크
			dataMap.put("docipresult", docipresult);

			if (doctorLogin.getAuthority().equals("9")) {
				// pwd 틀림
				dataMap.put("admin", vo.getdId());
			}
		} catch (NotFoundIdException | InvalidPasswordException e) {
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		entity = new ResponseEntity<Map<String, String>>(dataMap, HttpStatus.OK);

		return entity;

	}

	@RequestMapping(value = "/loginForm2")
	public String loginForm2() {
		String url = "login/loginForm2";
		return url;


	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) throws Exception{
		String url = "redirect:/login/loginForm";
		LoginLogVO logVO = new LoginLogVO();
		session = request.getSession();
		DoctorVO doctorvo = (DoctorVO) session.getAttribute("doctorLogin");
		System.out.println("vogetID!!@~@~" + doctorvo.getdId());
		//doctorService.doctorStatusReset(doctorvo.getdId());
		// 서버 ip 출력
		InetAddress ip = InetAddress.getLocalHost();
		// 서버 컴퓨터 IP 출력
		String ipcheck = ip.getHostAddress();

		//


		logVO.setdName(doctorvo.getdName());
		logVO.setdId(doctorvo.getdId());
		logVO.setIpaddress(ipcheck);
		logVO.setLogCla(2);
		loginSearchDoctorService.insertLoginUserLog(logVO);
		session.invalidate();
		return url;

	}


	public String getUserIp() throws Exception {

        String ip = null;
        HttpServletRequest request =
        ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();

        ip = request.getHeader("X-Forwarded-For");

        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Real-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-RealIP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("REMOTE_ADDR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }

		return ip;
	}



}
