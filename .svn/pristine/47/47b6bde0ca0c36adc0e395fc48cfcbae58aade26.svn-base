package kr.co.jhta.erp.web.socket;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import kr.co.jhta.erp.vo.Employee;

public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor  {

	
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		
		ServletServerHttpRequest ssr = (ServletServerHttpRequest) request;
		HttpServletRequest httpRequest = ssr.getServletRequest();
		
		Employee employee = (Employee) httpRequest.getSession().getAttribute("LE");
		if (employee != null) {
			attributes.put("LOGIN_USER_NO", employee.getNo());
		}
		
		return super.beforeHandshake(request, response, wsHandler, attributes);
	}
	
}
