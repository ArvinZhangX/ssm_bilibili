package com.sf.Maping;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sf.entity.userEntity;
import com.sf.service.impl.RegisterServiceImpl;

@Controller
public class T2 {
	
	@Autowired
	RegisterServiceImpl registerService;
	
	@RequestMapping("registertest.sf")
	public String web3(){
		
		System.out.println("测试是否进入此方法");
		userEntity user = new userEntity();
		user.setUserID("1238");
		user.setUserName("123123");
		user.setUserMingzi("123123");
		user.setUserState("1");
		user.setUserPhone("123123");
		user.setPassWord("123");
		
		boolean bl=registerService.RegisterService(user);
		if(bl){
			System.out.println("注册成功");
		}else{
			System.out.println("注册失败");
		}
		
		
		return "login";
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
}
