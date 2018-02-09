package com.sf.entity;

//留言实体表
public class messageEntity {
	
		/*	messageID            varchar(32) not null,
	   messagevideoID       varchar(32) not null,
	   messageuserID        varchar(32) not null,
	   messageuserName      varchar(32) not null,
	   message              text not null,
	   messageTime          varchar(0) not null,
	   primary key (messageID)*/
	
		private String messageID; //留言ID
		private String messagevideoID;//留言视频ID
		private String messageuserID;//留言用户ID
		private String messageuserName;//留言用户名字
		private String message;//留言内容
		private String messageTime;//留言时间
		private String messageHand;//用户头像
		public String getMessageID() {
			return messageID;
		}
		public void setMessageID(String messageID) {
			this.messageID = messageID;
		}
		public String getMessagevideoID() {
			return messagevideoID;
		}
		public void setMessagevideoID(String messagevideoID) {
			this.messagevideoID = messagevideoID;
		}
		public String getMessageuserID() {
			return messageuserID;
		}
		public void setMessageuserID(String messageuserID) {
			this.messageuserID = messageuserID;
		}
		public String getMessageuserName() {
			return messageuserName;
		}
		public void setMessageuserName(String messageuserName) {
			this.messageuserName = messageuserName;
		}
		public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
		}
		public String getMessageTime() {
			return messageTime;
		}
		public void setMessageTime(String messageTime) {
			this.messageTime = messageTime;
		}
		public String getMessageHand() {
			return messageHand;
		}
		public void setMessageHand(String messageHand) {
			this.messageHand = messageHand;
		}
		
		
		
	
		
		
}
