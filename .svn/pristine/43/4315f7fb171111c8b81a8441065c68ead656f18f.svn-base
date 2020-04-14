package kr.co.jhta.erp.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String path = request.getRequestURI();
		
		if("/home.erp".equals(path)) {
			return true;
		}
		if("/login.erp".equals(path)) {
			return true;
		}
		
		HttpSession session = request.getSession();
		if (session.getAttribute("LE") == null) {
			response.sendRedirect("/home.erp");
			return false;
		}
		
		return true;
		
	}
}
