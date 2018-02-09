package com.sf.tool;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.sf.entity.forumEntity;

//论坛表实体
public class forumEntityRowMapper implements RowMapper<forumEntity>{

	public forumEntity mapRow(ResultSet arg0, int arg1) throws SQLException {
		forumEntity forumEntity = new forumEntity();
		//user.setUseryinghangka(arg0.getString("useryinghangka"));
		/*grids.setGridsID(arg0.getString("gridsID"));*/
		forumEntity.setForumID(arg0.getString("forumID"));
		forumEntity.setForumAmount(arg0.getString("forumAmount"));
		forumEntity.setForumBT(arg0.getString("forumBT"));
		forumEntity.setForumliebie(arg0.getString("forumliebie"));
		forumEntity.setForummessage(arg0.getString("forummessage"));
		forumEntity.setForumTime(arg0.getString("forumTime"));
		forumEntity.setForumuserName(arg0.getString("forumuserName"));
		forumEntity.setFirumhand(arg0.getString("firumhand"));
		
		return forumEntity;
	}
	
}	