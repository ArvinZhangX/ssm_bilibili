package com.sf.chaxun;

import java.util.Timer;


public class TestMain {
	public static void main(String[] args) {
		Timer timer = new Timer();  
	
		  timer.schedule(new Callingmethod(), 1000, 120000);  
		//查询出有多少用户 每隔2分钟查询一次
		  	
	}
	
}
