package com.sf.lanjieqi;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//判断用户是否登录 访问了不该访问的页面
		String userName = (String) request.getSession().getAttribute("userName");
			if(userName!=null){
				return true;
			}
			//访问的用户没有登录... 
			//跳转页面
			String addr = "";
			
			if(request.getQueryString()!=null){
				//这个是带参数的!
				addr = request.getRequestURI()+"?"+request.getQueryString();
			}else{
				//这个是不带参数的
				addr = request.getRequestURI();
			}
			String jiequ = addr.substring(9);
			// jiequ  这个地址是用户想访问的地址
			request.getSession().setAttribute("jiequ", jiequ);
			
			response.sendRedirect("login.sf");
				return false;
				
	}

}