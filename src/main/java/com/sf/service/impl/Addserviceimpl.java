package com.sf.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sf.dao.impl.LoginDaoimpl;
import com.sf.service.Addservice;
@Component
public class Addserviceimpl implements Addservice {

	@Autowired
	LoginDaoimpl login;
	
	public boolean login() {
		int num=login.login("1", "1");
		if(num>0){
			return true;
		}
		return false;
	}

}
