package com.sf.jingtai;

import java.io.BufferedReader;  
import java.io.FileOutputStream;  
import java.io.InputStream;  
import java.io.InputStreamReader;  
import java.io.OutputStreamWriter;  
import java.net.HttpURLConnection;  
import java.net.URL;  
import java.util.Date; 

// 静态
public class JspToHtml {
	  private static long star = 0;  
	    private static long end = 0;  
	    private static long ttime = 0;  
	  
	    // 返回html代码  
	    public static String getHtmlCode(String httpUrl, String bianma) {  
	        Date before = new Date();  
	        star = before.getTime();  
	        String htmlCode = "";  
	        try {
	            InputStream in;  
	            URL url = new java.net.URL(httpUrl);  
	            HttpURLConnection connection = (HttpURLConnection) url.openConnection();  
	            connection = (HttpURLConnection) url.openConnection();  
	            connection.setRequestProperty("User-Agent", "Mozilla/4.0");  
	            connection.connect();  
	            in = connection.getInputStream();  
	            java.io.BufferedReader breader = new BufferedReader(new InputStreamReader(in, bianma));  
	            String currentLine;  
	            while ((currentLine = breader.readLine()) != null) {  
	                htmlCode += currentLine;  
	            }  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        } finally {  
	            //Date after = new Date();  
	            //end = after.getTime();  
	            //ttime = end - star; 
	            // System.out.println("执行时间:"+ttime +"秒");  
	        }  
	        return htmlCode;  
	    }
	    // 存储文件  
	    public static synchronized void writeHtml(String filePath, String info) {  
	        try {  
	            OutputStreamWriter out = new OutputStreamWriter(new FileOutputStream(filePath), "UTF-8");  
	            out.write(info);  
	            out.flush();  
	        } catch (Exception ex) {  
	            ex.getMessage();  
	        }  
	    }  
	      
	    //main调用
	    public static void main(String[] args) {  
	    	//http://127.0.0.1:888/bilibili/static/adminjs/index.html
	    	//http://119.23.216.18:8080/bilibili/logoone.sf
	    	//http://127.0.0.1:888/bilibili/logoone.sf
	        String url = "http://127.0.0.1:888/bilibili/logoone.sf";  
	         writeHtml("X:/Users/F-she-father/Workspaces/Eclipse IDE/bilibili/src/main/webapp/static/adminjs/index.html",getHtmlCode(url,"utf-8"));  
	         	//c:/1/html/index.html
	         //X:\Users\F-she-father\Workspaces\
	         //Eclipse IDE\bilibili\src\main\webapp\static\adminjs
	        long tmp = Long.parseLong("0");  
	        java.util.Date before = new java.util.Date();  
	        long currtime = before.getTime();  
	        System.out.println(currtime - tmp);  
	    }  
}
