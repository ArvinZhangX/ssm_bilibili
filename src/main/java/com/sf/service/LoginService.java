package com.sf.service;

import com.sf.entity.ordertableEntity;

public interface LoginService {
	public boolean loginuser(String userName,String passWord);
	
	
	
	
	/**
	 *  查看支付密码是否正确
	 * @param userName
	 * @param pass
	 * @return
	 */
	public boolean paypassword(String userName,String pass);
	
	
	/**
	 * 如果支付密码正确. 则可以修改用户余额
	 * @param userName
	 * @param userRMB
	 * @return
	 */
	public boolean updateRMB(String userRMB,String userName);
	
	
	
	
	/**
	 * 用户下单之后 将订单存储到数据库
	 * @param ordertable
	 * @return
	 */
	
	public boolean ordertable(ordertableEntity ordertable);
	
	
	
	/**
	 * 根据商品ID 确认收货
	 * @param orderID
	 * @return
	 */
	public boolean Confirmorder(String orderID);
	
	
	
	/**
	 * 根据商品ID 取消订单
	 * @param orderID
	 * @return
	 */
	public boolean Cancellationoforder(String orderID);
	
	
	
	/**
	 * 根据商品ID 删除订单
	 * @param orderID
	 * @return
	 */
	public boolean delordertable(String orderID);
	
	
	
	
	/**
	 * 根据商品ID 立即发货
	 * @param orderID
	 * @return
	 */
	public boolean Delivergoods(String OrderStat,String orderID);
}
