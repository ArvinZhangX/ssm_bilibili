package com.sf.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sf.dao.MessageDao;
import com.sf.db.Data_jdbcTemplate;
import com.sf.entity.ShoppingCart;
import com.sf.entity.forumEntity;
import com.sf.entity.forumreplyEntity;
import com.sf.entity.messageEntity;
import com.sf.entity.ordertableEntity;


@Component
public class MessageImpl implements MessageDao {
	
	@Autowired
	Data_jdbcTemplate jdbcTemplate;//得到模板
	
	
	public int message(messageEntity message) {
		//String chaxunSql="insert into user(userID,userName,passWord,userPhone,userState,userEmial,userHand,userPaypassword) values(?,?,?,?,?,?,?,?)";
		
		String sql="insert into message(messageID,messagevideoID,"
				+ "messageuserID,messageuserName,message,"
				+ "messageTime,messageHand) values(?,?,?,?,?,?,?)";
		int num = jdbcTemplate.getJdbcTemplate().update(sql, new Object[]{message.getMessageID(),
					message.getMessagevideoID(),message.getMessageuserID()
					,message.getMessageuserName(),
					message.getMessage(),message.getMessageTime(),message.getMessageHand()});
		
		
		return num;
	}


	public int Shoppingcart(ShoppingCart shoppingCart) {
		String sql = "insert into shoppingcart(cartID,userName,shoopingID,shoopingName,shoopingImg,shoopingjiage) values (?,?,?,?,?,?)";
		int num = jdbcTemplate.getJdbcTemplate().update(sql,new Object[]{shoppingCart.getCartID(),shoppingCart.getUserName(),shoppingCart.getShoopingID(),shoppingCart.getShoopingName(),shoppingCart.getShoopingImg(),shoppingCart.getShoopingjiage()});
		return num;
	}


	public int forumfuck(forumEntity forument) {
		String sql = "insert into forum(forumID,forumBT,forummessage,forumuserName,forumTime,forumliebie,forumAmount,firumhand) values (?,?,?,?,?,?,?,?)";
		int num = jdbcTemplate.getJdbcTemplate().update(sql,new Object[]{forument.getForumID(),forument.getForumBT(),forument.getForummessage(),forument.getForumuserName(),forument.getForumTime(),forument.getForumliebie(),forument.getForumAmount(),forument.getFirumhand()});
		return num;
	}


	public int forumreply(forumreplyEntity forumreply) {/*
		public String replyid;//回复ID
		public String replyneirong;//回帖内容
		public String replytime;//回帖时间
		public String replyhand;//回帖人头像
		public String replytieziid;//回复帖子的ID
		*/
		String sql = "insert into forumreply (replyid,replyneirong,replytime,replyhand,replytieziid,replyname) values (?,?,?,?,?,?)";
		
		int num = jdbcTemplate.getJdbcTemplate().update(sql,new Object[]{forumreply.getReplyid(),forumreply.getReplyneirong(),forumreply.getReplytime(),forumreply.getReplyhand(),forumreply.getReplytieziid(),forumreply.getReplyname()});
		return num;
	}




}
