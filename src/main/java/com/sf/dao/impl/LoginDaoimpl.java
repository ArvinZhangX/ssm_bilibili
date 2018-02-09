package com.sf.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sf.dao.LoginDao;
import com.sf.db.Data_jdbcTemplate;
import com.sf.entity.ordertableEntity;

@Component
public class LoginDaoimpl implements LoginDao {

	@Autowired
	Data_jdbcTemplate jdbcTemplate;
	
	public int login(String userName,String passWord) {
		//添加一条数据
			//String chaxunSql="insert into sda(sda) values('张三')";
			//int num=jdbcTemplate.getJdbcTemplate().update(chaxunSql);
		
		//根据用户名查询
		//String sql = "SELECT count(*) FROM user WHERE userName = ?";  
		//int num=jdbcTemplate.getJdbcTemplate().queryForObject(sql, new Object[] { "12312" },Integer.class);
		
		//添加数据
		//String chaxunSql="insert into user(userID,userName,passWrod,userPhone,userState) values(?,?,?,?,?)";
		//int num=jdbcTemplate.getJdbcTemplate().update(chaxunSql,new Object[]{"张三1","爱仕达","123","123","测试"});
		
		//select * from user where userName="admin" and `passWord`="123321aaa";
		
		String  sql="select count(*) from user where userName = ? and passWord = ?";
			int num=jdbcTemplate.getJdbcTemplate().queryForObject(sql, new Object[]{userName,passWord},Integer.class);
			//jdbcTemplate.getJdbcTemplate().queryf
			return num;
	}

	public int paypassword(String userName,String pass) {
		// SELECT * from `user` where userName="admin" and `passWord`="123321aaa"
			String sql = "select count(*) from user where userName=? and userPaypassword=?";
			int num = jdbcTemplate.getJdbcTemplate().queryForObject(sql, new Object[]{userName,pass},Integer.class);
		
		return num;
	}

	public int updateRMB(String userRMB, String userName) {
		String update="update user set userRMB=? where userName=?";
		int num = jdbcTemplate.getJdbcTemplate().update(update,new Object[]{userRMB,userName});
		return num;
	}

	public int ordertable(ordertableEntity ordertable) {
		String sql = "insert into ordertable (OrderID,OrderuserName,OrderIgridsName,OrdergridsImg,OrderzongRMB,OrderStat,OrderTime,OrderAddr) values(?,?,?,?,?,?,?,?)";
		int num = jdbcTemplate.getJdbcTemplate().update(sql,new Object[]{ordertable.getOrderID(),ordertable.getOrderuserName(),ordertable.getOrderIgridsName(),ordertable.getOrdergridsImg(),ordertable.getOrderzongRMB(),ordertable.getOrderStat(),ordertable.getOrderTime(),ordertable.getOrderAddr()});
		return num;
	}

	public int Confirmorder(String orderID) {
		int b = 0;
		//根据ID查询出是否存在这个订单 是否为发货状态
		String sql = "select count(*) from ordertable where OrderID = ? and OrderStat = 2";//是否有这个商品 并且是代发货状态
		int num = jdbcTemplate.getJdbcTemplate().queryForObject(sql, new Object[]{orderID},Integer.class);
			if(num>0){
				//有此订单.. 代发货状态
				String sql2 = "update  ordertable set OrderStat=4 where OrderID=?";//更改为收货
						b= jdbcTemplate.getJdbcTemplate().update(sql2,new Object[]{orderID});
			}else{
				b=0;//查不到此订单
			}
		return b;
	}

	
	public int Cancellationoforder(String orderID) {
		String sql2 = "update  ordertable set OrderStat=3 where OrderID=?";//更改为待取消订单
		int num = jdbcTemplate.getJdbcTemplate().update(sql2,new Object[]{orderID});
		return num;
	}

	public int delordertable(String orderID) {
		String sql2 = "update  ordertable set OrderStat=5 where OrderID=?";//更改为待取消订单
		int num = jdbcTemplate.getJdbcTemplate().update(sql2,new Object[]{orderID});
		return num;
	}

	public int Delivergoods(String OrderStat,String orderID) {
		String sql2 = "update  ordertable set OrderStat=? where OrderID=?";//立即发货
		int num = jdbcTemplate.getJdbcTemplate().update(sql2,new Object[]{OrderStat,orderID});
		return num;
	}

}
