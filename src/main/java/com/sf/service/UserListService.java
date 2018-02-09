package com.sf.service;

import java.util.List;

import com.sf.entity.ShoppingCart;
import com.sf.entity.forumEntity;
import com.sf.entity.forumreplyEntity;
import com.sf.entity.gridsEntity;
import com.sf.entity.messageEntity;
import com.sf.entity.ordertableEntity;
import com.sf.entity.userEntity;
import com.sf.entity.videoEntity;

public interface UserListService {
	
	/**
	 *  根据用户的名字 查询出用户的所有信息
	 * @return
	 */
	public userEntity userlist(String  userName);
	/**
	 *  将video 全部信息全部查询出来
	 * 
	 */
	public List<userEntity> userlistUserName(String userName);
	
	
	/**
	 * 根据ID查询出此条论坛的全部信息
	 * @param forumID
	 * @return
	 */
	public forumEntity forumentitymmp(String forumID);
	
	/**
	 * 根据ID查询出当前视频的所有留言
	 * @return
	 */
	public List<forumreplyEntity> forumreply(String forumreplyID);
	
	/**
	 *  将video 全部信息全部查询出来
	 * 
	 */
	public List<videoEntity> videolist(String videocAtegory);

	
	/**
	 * 随机在video 里面查询出5条记录
	 * @return
	 */
	public List<videoEntity> videolistimit7();
	
	/**
	 * 随机在video 里面查询出6条记录
	 * @return
	 */
	public List<videoEntity> videolistimit6MAD();
	
	
	/**
	 * 随机在video 里面查询出5条记录
	 * @return
	 */
	public List<videoEntity> videolistimit5MAD();
	
	
	/**
	 * 根据ID查询出当前视频的所有留言
	 * @return
	 */
	public List<messageEntity> messagelist(String videoID);
	
	
	
	/**
	 * 将用户表里面所有的用户只查询出15条. 到时候方便分页
	 * @return
	 */
	public List<userEntity> userlistpage(int pageInt);

	
	/**
	 * 根据用户输入的内容 进行模糊查询出所得
	 * @return
	 * 
	 */
	public List<userEntity> listmohu(String usermohu);
	
	
	/**
	 * 根据用户输入的手机号 进行模糊查询出所得
	 * @return
	 * 
	 */
	public List<userEntity> userPhone(String userPhone);
	
	
	/**
	 * 根据ID查询出用户的所有信息
	 * @return
	 * 
	 */
	public List<userEntity> userID(String userID);

	/**
	 *  根据用户的状态 查询出用户的所有信息
	 * @return
	 */
	public List<userEntity> xiaoheiwu(String  userStat);
	
	
	/**
	 * 根据当前页查询出6条记录
	 * @param dangqianye  页面传过来的当前页
	 * @param State			需要查询的视频列别
	 * @param meiyexianshiduoshaoge 每页显示多少个视频
	 * @return
	 */
	public List<videoEntity> Pagevideolist(String State,int dangqianye,int meiyexianshiduoshaoge);
	
	
	/**
	 * 根据标记 查询出一共有多少条记录
	 * @param countvideo
	 * @return
	 */
	public int videocoun(String countvideo);

	/**
	 * 将商品全部信息查询出来
	 * @return
	 */
	public List<gridsEntity> gridslist();
	
	
	
	/**
	 * 根据商品ID查询出商品信息
	 * @param gridsID
	 * @return
	 */
	public gridsEntity gridsIDlist(String gridsID);
	
	
	/**
	 * 根据登录的用户名 查询出购物车里面的商品
	 * @param userName
	 * @return
	 */
	public List<ShoppingCart> shoppingcart(String userName);
	
	
	
	
	/**
	 *  根据用户名查询出所有的订单
	 * 
	 */
	public List<ordertableEntity> ordertable(String userName);
	
	
	
	
	/**
	 *  查询出所有的订单
	 * 
	 */
	public List<ordertableEntity> ordertablelist();
	
	
	
	
	/**
	 *  查询出标记的订单
	 * 
	 */
	public List<ordertableEntity> orderStat(String orderStat);
	
	

	/**
	 * 查询出订单表里面有多少条记录
	 * @return
	 */
	public int countordertable();
	
	
	/**
	 * 根据论坛类型查询出符合条件的论坛
	 * @param forumliebie
	 * @return
	 */
	public List<forumEntity> forumEnt(String forumliebie);
	
	
	
	/**
	 * 根据表名查询出有多少记录
	 * @param tableName
	 * @return
	 */
	public int counttable(String tableName);
}
