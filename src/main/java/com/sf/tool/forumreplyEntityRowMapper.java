package com.sf.tool;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.sf.entity.forumreplyEntity;

public class forumreplyEntityRowMapper implements RowMapper<forumreplyEntity>{

	public forumreplyEntity mapRow(ResultSet arg0, int arg1) throws SQLException {
		// TODO Auto-generated method stub
		forumreplyEntity u = new forumreplyEntity();
		u.setReplyhand(arg0.getString("replyhand"));
		u.setReplyid(arg0.getString("replyid"));
		u.setReplyneirong(arg0.getString("replyneirong"));
		u.setReplytieziid(arg0.getString("replytieziid"));
		u.setReplytime(arg0.getString("replytime"));
		u.setReplyname(arg0.getString("replyname"));
		return u;
	}

}
