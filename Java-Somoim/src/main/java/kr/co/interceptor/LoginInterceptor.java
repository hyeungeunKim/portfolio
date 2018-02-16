package kr.co.interceptor;

import java.util.concurrent.SynchronousQueue;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private final String LOGIN="login";

	
	// 로그인포스트 실행직후
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HttpSession session = request.getSession();
		
		ModelMap modelMap = modelAndView.getModelMap();
		Object memberVO = modelMap.get("MemberVO");
		
		if(memberVO != null){
			session.setAttribute(LOGIN, memberVO);						
		}
	}
	
	// 로그인포스트 실행전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();		
		if(session.getAttribute(LOGIN) != null){
			session.removeAttribute(LOGIN);
		}
		return true;
	}

	
	
	
}
