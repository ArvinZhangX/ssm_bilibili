package com.sf.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sf.dao.impl.RegisterImpl;
import com.sf.entity.userEntity;
import com.sf.service.RegisterService;

@Service
public class RegisterServiceImpl implements RegisterService {

	@Autowired
	RegisterImpl registerImpl;
	
	public boolean RegisterService(userEntity user) {
		int num=registerImpl.Register(user);
		if(num>0){
			//注册成功
			return true;
		}
		return false;
	}

}
