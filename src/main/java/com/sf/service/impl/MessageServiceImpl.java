package com.sf.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sf.dao.impl.MessageImpl;
import com.sf.entity.ShoppingCart;
import com.sf.entity.forumEntity;
import com.sf.entity.forumreplyEntity;
import com.sf.entity.messageEntity;
import com.sf.service.MessageService;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	MessageImpl messageImpl;
	
	public boolean message(messageEntity message) {
		int bl = messageImpl.message(message);
			if(bl>0){
				return true;
			}
		return false;
	}

	public boolean Shoppingcart(ShoppingCart shoppingCart) {
		int bl = messageImpl.Shoppingcart(shoppingCart);
		if(bl>0){
			return true;
		}
		return false;
	}

	public boolean forumfuck(forumEntity forument) {
		int bl = messageImpl.forumfuck(forument);
		if(bl>0){
			return true;
		}
		return false;
	}

	public boolean forumreply(forumreplyEntity forumreply) {
		int bl = messageImpl.forumreply(forumreply);
		if(bl>0){
			return true;
		}
		return false;
	}

}
