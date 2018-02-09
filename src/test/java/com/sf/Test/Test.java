package com.sf.Test;

import java.util.Timer;
import java.util.TimerTask;

public class Test {
	public static void main(String[] args) {
		Timer timer = new Timer();  
		  timer.schedule(new MyTask(), 1000, 2000);  
		  //没隔2秒钟执行一次
		  
	}
	
}
