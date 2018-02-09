package com.sf.chaxun;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.TimerTask;

import javax.servlet.http.HttpServletRequest;

import com.sf.jingtai.JspToHtml;



public class Callingmethod extends TimerTask {
	
	public static int count=0; //总共多少个用户
	public static int messacount=0;//总共有多少条帖子论坛
	public static int onedaycount=0;//今天一共有多少帖子
	public static int yessdaycount=0;//昨日一共有多少帖子
	public static int servedatcount=0;//7天内
/*    System.out.println("htp"+Callingmethod.count);*/
    
	@Override
	public void run(){
		//查询出有多少用户 每隔2分钟查询一次
	       // System.out.println("我的查询方法!");  
	        //int num =  userListService.counttable("");
	       // System.out.println(num);	
	        try {  
	        	

	      /*      JspToHtml StaticHtml = new JspToHtml();
	            StaticHtml.main(null);
	            System.out.println("我在被调用 静态html 测试时间");*/
	        	
	        	  //System.out.println("count="+count);
                //加载数据库驱动，注册到去送管理器  0-
                Class.forName("com.mysql.jdbc.Driver");  

                String url = "jdbc:mysql://127.0.0.1:3306/bilibili?useUnicode=true&characterEncoding=utf-8&autoReconnect=true&amp;failOverReadOnly=false";  

                String username = "root";  

                String password = "root";  

                Connection conn = DriverManager.getConnection(url , username , password);  

                if (conn != null)  {
                		
                      // System.out.println("数据库连接成功!");  
                	/*******************************************************************/
                							//有多少用户
                	/*******************************************************************/
                       Statement stmt = conn.createStatement(); //创建Statement对象
                       String sql = "SELECT count(*) FROM user";    //要执行的SQL
                       ResultSet rs = stmt.executeQuery(sql);
                     while (rs.next()) {
                    	// System.out.println(rs.getInt(1));	
                    	 count=rs.getInt(1);//得到有多少条数据
                    	 //HttpServletRequest.class.getServletContext().setAttribute("count", rs.getInt(1));
                    	 //request.getServletContext().setAttribute("getUserName",user.getUserName());
					}

                 	/*******************************************************************/
                 							//有多少帖子
                 	/*******************************************************************/
                     String sql2 = "SELECT count(*) FROM forum";    //要执行的SQL
                     ResultSet rs2 = stmt.executeQuery(sql2);
                     while (rs2.next()) {
                    	 messacount=rs2.getInt(1);
                     }

                 	/*******************************************************************/
                 							//今日发布了多少帖子
                 	/*******************************************************************/
                     String sql3 = "SELECT count(*) from forum where TO_DAYS(NOW()) - TO_DAYS(forumTime) <=1";    //要执行的SQL
                     ResultSet rs3 = stmt.executeQuery(sql3);
                     while (rs3.next()) {
                    	 onedaycount=rs3.getInt(1);
                     }
                 	/*******************************************************************/
                 							//昨日发布了多少帖子
                 	/*******************************************************************/
                     String sql4 = "SELECT count(*) from forum where TO_DAYS(forumTime)=TO_DAYS(NOW())";    //要执行的SQL
                     ResultSet rs4 = stmt.executeQuery(sql4);
                     while (rs4.next()) {
                    	 yessdaycount=rs4.getInt(1);
                     }
                     
                 	/*******************************************************************/
                 							//7天内发布了多少帖子
                 	/*******************************************************************/
                     String sql5 = "SELECT count(*) from forum where DATE_SUB(CURDATE(),INTERVAL 7 DAY) <=(forumTime)";    //要执行的SQL
                     ResultSet rs5 = stmt.executeQuery(sql5);
                     while (rs5.next()) {
                    	 servedatcount=rs5.getInt(1);
                     }
                     
                     
                     
                     
                     //SELECT * from forum where TO_DAYS(NOW()) - TO_DAYS(forumTime) <=1 今天的所有帖子
                     //SELECT * from forum where TO_DAYS(forumTime)=TO_DAYS(NOW()) 昨日的帖子数量
                     //SELECT * from forum where DATE_SUB(CURDATE(),INTERVAL 7 DAY) <=(forumTime) 7天内的所有帖子数量
                     
                     
                     
                     
                       //System.out.println("一共"+num);
                }
                else  {

                       System.out.println("数据库连接失败!");  

                //完成后记得关闭数据库连接  

                conn.close();  
                }

         } catch (ClassNotFoundException e) {  

                e.printStackTrace();  

         } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
}
