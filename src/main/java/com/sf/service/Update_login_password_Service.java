package com.sf.service;

import com.sf.entity.userEntity;

public interface Update_login_password_Service {
	
	public boolean Update_login_password(String userName,String passWord,String newpassWord);
	
	
	/**
	 * 	根据用户名查询出用户邮箱 如果正确则再去修改邮箱
	 * @param userName
	 * @param passWord
	 * @param newpassWord
	 * @return
	 */
	public boolean Update_login_Emial(String userName,String emial,String newemial);
	
	
	
	/**
	 * 	根据用户名查询出用户手机 如果正确则再去修改手机号码
	 * @param userName
	 * @param passWord
	 * @param newpassWord
	 * @return
	 */
	public boolean Update_login_Phone(String userName,String userPhone,String newuserPhone);
	
	
	
	/**
	 * 	根据用户名查询出用户支付密码  如果正确则再去修改支付密码
	 * @param userName
	 * @param passWord
	 * @param newpassWord
	 * @return
	 */
	public boolean Update_login_payPassword(String userName,String paypassword,String newpaypassword);
	
	
	
	/**
	 * 	根据用户名查询出用户头像  如果正确则再去修改头像地址
	 * @param userName
	 * @param passWord
	 * @param newpassWord
	 * @return
	 */
	public boolean Update_login_hand(String userName,String userHand,String newuserHand);
	
	
	/**
	 *  修改用户的全部信息
	 * @param user
	 * @return
	 */
	public boolean Update_user(userEntity user);
	
	
	/**
	 * 	修改用户地址
	 * @param userName
	 * @param passWord
	 * @param newpassWord
	 * @return
	 */
	public boolean Update_Addred(String sessionName,String dizhi,String xingming,String phone);
	
	
	/**
	 * 根据ID删除对应的购物车
	 * 
	 * @param cartID
	 * @return
	 */
	public boolean delectcartID (String cartID);
}
