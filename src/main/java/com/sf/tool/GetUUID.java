package com.sf.tool;

import java.util.Random;
import java.util.UUID;

public class GetUUID {
	public static String getUUID(){
		String uuid="";
	uuid=	UUID.randomUUID().toString().replaceAll("-","");
		return uuid;
	}
	
	
	public static int yanzma(){
		int x;
		Random xs= new Random();
		x = xs.nextInt(9999-1000+1)+100000;
		return x;
		
	}
	

}
