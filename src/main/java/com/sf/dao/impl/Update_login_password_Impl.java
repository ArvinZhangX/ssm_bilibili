package com.sf.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sf.dao.Update_login_password_Dao;
import com.sf.db.Data_jdbcTemplate;
import com.sf.entity.userEntity;

@Component
public class Update_login_password_Impl implements Update_login_password_Dao {
	
	@Autowired
	Data_jdbcTemplate jdbcTemplate;
	//SELECT count(*) FROM user WHERE userName="admin" and `passWord`="123321aaa";
	
	public int Update_login_password(String userName, String passWord, String newpassWord) {
		int what=0;
		//先查询出用户名和密码是否匹配 才能更改密码
		String sql="select count(*) from user where userName=? and passWord=?";
		int num=jdbcTemplate.getJdbcTemplate().queryForObject(sql, new Object[]{userName,passWord},Integer.class);
			if(num>0){
				//UPDATE user set `newpassWord`="111" where userName="admin";
				//此用户存在  并且密码匹配 可以进行修改密码
				String update="update user set passWord=? where userName=?";
				what=jdbcTemplate.getJdbcTemplate().update(update,new Object[]{newpassWord,userName});
			}else{
				return what;
			}
		return what;
	}

	public int Update_login_Emial(String userName, String emial, String newemial) {
		int what=0;
		//先查询出用户名和密码是否匹配 才能更改密码
		String sql="select count(*) from user where userName=? and userEmial=?";
		int num=jdbcTemplate.getJdbcTemplate().queryForObject(sql, new Object[]{userName,emial},Integer.class);
			if(num>0){
				//UPDATE user set `newpassWord`="111" where userName="admin";
				//此用户存在  并且密码匹配 可以进行修改密码
				String update="update user set userEmial=? where userName=?";
				what=jdbcTemplate.getJdbcTemplate().update(update,new Object[]{newemial,userName});
			}else{
				return what;
			}
		return what;
	}

	public int Update_login_Phone(String userName, String userPhone, String newuserPhone) {
		
		int what=0;
		//先查询出用户名和密码是否匹配 才能更改密码
		String sql="select count(*) from user where userName=? and userPhone=?";
		int num=jdbcTemplate.getJdbcTemplate().queryForObject(sql, new Object[]{userName,userPhone},Integer.class);
			if(num>0){
				//UPDATE user set `newpassWord`="111" where userName="admin";
				//此用户存在  并且密码匹配 可以进行修改密码
				String update="update user set userPhone=? where userName=?";
				what=jdbcTemplate.getJdbcTemplate().update(update,new Object[]{newuserPhone,userName});
			}else{
				return what;
			}
		return what;
	}

	
	public int Update_login_payPassword(String userName, String paypassword, String newpaypassword) {
		int what=0;
		//先查询出用户名和密码是否匹配 才能更改密码
		String sql="select count(*) from user where userName=? and userPaypassword=?";
		int num=jdbcTemplate.getJdbcTemplate().queryForObject(sql, new Object[]{userName,paypassword},Integer.class);
			if(num>0){
				//UPDATE user set `newpassWord`="111" where userName="admin";
				//此用户存在  并且密码匹配 可以进行修改密码
				String update="update user set userPaypassword=? where userName=?";
				what=jdbcTemplate.getJdbcTemplate().update(update,new Object[]{newpaypassword,userName});
			}else{
				return what;
			}
		return what;
	}

	public int Update_login_hand(String userName, String userHand, String newuserHand) {
		
		int what=0;
		//先查询出用户名和密码是否匹配 才能更改密码
		String sql="select count(*) from user where userName=? and userHand=?";
		int num=jdbcTemplate.getJdbcTemplate().queryForObject(sql, new Object[]{userName,userHand},Integer.class);
			if(num>0){
				//UPDATE user set `newpassWord`="111" where userName="admin";
				//此用户存在  并且密码匹配 可以进行修改密码
				String update="update user set userHand=? where userName=?";
				what=jdbcTemplate.getJdbcTemplate().update(update,new Object[]{newuserHand,userName});
			}else{
				return what;
			}
		return what;
			}

	public int Update_user(userEntity user) {
		
		//update user set userName = "admin" , 
		//userMingzi = "佘峰T" ,usersex = "男" , 
		//passWord = "123321aaa" , userAddress = "四川省遂宁" ,
		//userPhone = "17583108191" , userQQ = "794799102" , 
		//userEmial = "794799102@qq.com" where
		//userID = "004bcfc8d4bd407bb1a114785539006f"
/*		System.out.println(user.getUserID());
		System.out.println(user.getPassWord());
		System.out.println(user.getUserMingzi());
		System.out.println(user.getUsersex());
		System.out.println(user.getUserPhone());
		System.out.println(user.getUserQQ());
		System.out.println(user.getUserEmial());
		System.out.println(user.getUserAddress());
		System.out.println(user.getUserName());*/
		
		String sql="update  user set userName = ? , userMingzi = ? ,usersex = ? , passWord = ? , userAddress = ? ,userPhone = ? , userQQ = ? , userEmial = ?   where userID = ?";
		int bl = jdbcTemplate.getJdbcTemplate().update(sql,new Object[]{user.getUserName(),user.getUserMingzi(),user.getUsersex(),user.getPassWord(),user.getUserAddress(),user.getUserPhone(),user.getUserQQ(),user.getUserEmial(),user.getUserID()});
		return bl;
	}

	public int Update_Addred(String sessionName, String dizhi, String xingming, String phone) {
		//此用户存在  并且密码匹配 可以进行修改密码
		String update="update user set userMingzi=?,userPhone=?,userAddress=? where userName=?";
		int i =jdbcTemplate.getJdbcTemplate().update(update,new Object[]{xingming,phone,dizhi,sessionName});
		return i;
	}

	public int delectcartID(String cartID) {
		String sql = "delete from shoppingcart where cartID = ?";
		int num = jdbcTemplate.getJdbcTemplate().update(sql,new Object[]{cartID});
		return num;
	}



}
