package com.sf.tool;

import java.text.SimpleDateFormat;
import java.util.Date;

public class GetDataTime {
	public static String DQtime(){
		/************ 获取当前时间 ***********/
		// 得到long类型当前时间
		long l = System.currentTimeMillis();
		// new日期对象
		Date date = new Date(l);
		// 转换提日期输出格式
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		String time  =	dateFormat.format(date);
		/************ 获取当前时间 *************/
		System.out.println(time);
		return time;
	}
}
