package com.sf.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;

import com.sf.lanjieqi.Auth;
import com.sf.service.UserListService;

/**
 * Servlet implementation class one
 */

public class one extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			this.doPost(request, response);
	}
	
	//使用初始化 功能
	
/*	
	@Override
	public void init() throws ServletException {
		System.out.println("我只会被执行一次");
		//每次进来的时候就调用方法  让程序每1分钟就执行一次 查询有多少 用户 多少帖子 还有今日昨日的
		//		int num = userListService.counttable("user");
		//		System.out.println(num);//看中间有多少条记录
		super.init();
	}*/
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//System.out.println("11");

		//request.getRequestDispatcher("http://127.0.0.1:888/bilibili/static/adminjs/index.html").forward(request,response);
		//System.out.println("测试");
		request.getRequestDispatcher("logoone.sf").forward(request, response);
	}


}
