package com.sf.tool;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.sf.entity.messageEntity;
import com.sf.entity.userEntity;

//留言表
public class RowMapperVideoEntity implements RowMapper<messageEntity>{

	public messageEntity mapRow(ResultSet arg0, int arg1) throws SQLException {
		messageEntity message = new messageEntity();
		message.setMessage(arg0.getString("message"));
		message.setMessageID(arg0.getString("messageID"));
		message.setMessageTime(arg0.getString("messageTime"));
		message.setMessageuserID(arg0.getString("messageuserID"));
		message.setMessageuserName(arg0.getString("messageuserName"));
		message.setMessagevideoID(arg0.getString("messagevideoID"));
		message.setMessageHand(arg0.getString("messageHand"));
		return message;
	}

}
