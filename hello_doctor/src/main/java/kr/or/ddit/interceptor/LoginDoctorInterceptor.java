package kr.or.ddit.interceptor;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.or.ddit.dto.DoctorVO;

public class LoginDoctorInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		boolean result=true;

		DoctorVO doctorVO = (DoctorVO)request.getSession().getAttribute("doctorLogin");
		System.out.println("세션이 있나요? " + doctorVO);
		if(doctorVO == null) {
			response.sendRedirect(request.getContextPath()+"/login/loginForm");
			result = false;
		}


		return result;


	}


}
