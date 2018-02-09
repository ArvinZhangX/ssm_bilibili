package com.sf.dao.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sf.dao.UserListDao;
import com.sf.db.Data_jdbcTemplate;
import com.sf.entity.ShoppingCart;
import com.sf.entity.forumEntity;
import com.sf.entity.forumreplyEntity;
import com.sf.entity.gridsEntity;
import com.sf.entity.messageEntity;
import com.sf.entity.ordertableEntity;
import com.sf.entity.userEntity;
import com.sf.entity.videoEntity;
import com.sf.tool.GridsRowMapperEntity;
import com.sf.tool.RowMapperEntity;
import com.sf.tool.RowMapperVideoEntity;
import com.sf.tool.ShoppingCartRowMapperEntity;
import com.sf.tool.VideoRowMapperEntity;
import com.sf.tool.forumEntityRowMapper;
import com.sf.tool.forumreplyEntityRowMapper;
import com.sf.tool.ordertableRowMapperEntity;

@Component
public class UserListDaoImpl implements UserListDao {
	
		@Autowired
		Data_jdbcTemplate jdbcTemplate;
	
	public userEntity userlist(String userName) {
		//根据名字查询出用户对象. - - 
			String sql="select * from user where userName=?";
			userEntity user=jdbcTemplate.getJdbcTemplate().queryForObject(sql,new Object[]{userName},new RowMapperEntity());		
		return user;
	}

	
	public List<videoEntity> videolist(String videocAtegory) {
		//将全部视频查询出来
		String sql="select * from video where videocAtegory=? order by rand() limit 8";//将视频标记为1的正常视频全部查询出
				List<videoEntity> list=jdbcTemplate.getJdbcTemplate().query(sql,new Object[]{videocAtegory} ,new VideoRowMapperEntity());		
				
			return list;
	}


	//SELECT * from video ORDER BY RAND() LIMIT 5;随机在数据库里面查询出5条记录
	
	public List<videoEntity> videolistimit7() {
		String sql="select * from video order by rand() limit 7";
		List<videoEntity> list=jdbcTemplate.getJdbcTemplate().query(sql,new Object[]{} ,new VideoRowMapperEntity());		
		
		return list;
	}


	public List<videoEntity> videolistimit5MAD() {
		String sql="select * from video order by rand() limit 5 ";
		List<videoEntity> list=jdbcTemplate.getJdbcTemplate().query(sql,new Object[]{} ,new VideoRowMapperEntity());		
		
		return list;
	}


	public List<messageEntity> messagelist(String videoID) {
		 List<messageEntity> list=null;
		//根据用户传过来的ID 查询出当前视频的所有留言
		//根据名字查询出用户对象. - - 
		String sql="select * from message WHERE messagevideoID=? order by STR_TO_DATE(messageTime,'%m/%d/%Y %h:%i:%s %p') desc";
		//select * from message WHERE messagevideoID="1" order by STR_TO_DATE(messageTime,'%m/%d/%Y %h:%i:%s %p') desc;
		list=jdbcTemplate.getJdbcTemplate().query(sql,new Object[]{videoID},new RowMapperVideoEntity());		
		//将查询出来的所有结果全部放入到list集合当中
		return list;
		
	}


	public List<userEntity> userlistpage(int pageInt) {
		List<userEntity> user=null;
		/*limit arg1,arg2 arg1指定查询记录的起始位置；arg2用于指定查询数据所返回的记录数
		select * from tablename limit 0,1
		即取出第一条记录。
		select * from tablename limit 1,1
		第二条记录
		select * from tablename limit 10,20
		从第11条到31条（共计20条）
		select * from tablename limit 0,2
		取出2条数据 第一条和第二条
		这个 limit 是实现分页的关键，每次取出数据库的内容，分页在页面上怎么去操作实现的，这好像很麻烦，要是每次数据库取出特定页的数据就好了，limit 实现这样的功能，对数据升序或降序排序后，利用 SQL 取出特定页的数据，直接显示就行了

		比如数据库返回的数据是
		*/
		
		String sql="SELECT * FROM user LIMIT ?,15";
		 user=jdbcTemplate.getJdbcTemplate().query(sql,new Object[]{pageInt},new RowMapperEntity());		
		return user;
	}


	public List<userEntity> listmohu(String usermohu) {
		//SELECT * FROM user where userMingzi LIKE '%爱仕达%';
		//模糊查询 根据输入的名字查询
		String sql="select * from user where userMingzi LIKE ?";
		List<userEntity> list = jdbcTemplate.getJdbcTemplate().query(sql,new Object[]{usermohu},new RowMapperEntity());
		return list;
	}


	public List<userEntity> userPhone(String userPhone) {
		//模糊查询 根据输入的名字查询
				String sql="select * from user where userPhone LIKE ? order by rand() limit 3";
				List<userEntity> list = jdbcTemplate.getJdbcTemplate().query(sql,new Object[]{userPhone},new RowMapperEntity());
				return list;
	}


	public List<userEntity> userID(String userID) {
		String sql="select * from user where userID=?";
		List<userEntity> list = jdbcTemplate.getJdbcTemplate().query(sql,new Object[]{userID},new RowMapperEntity());
		return list;
	}


	public List<userEntity> xiaoheiwu(String userStat) {
		//根据名字查询出用户对象. - - 
		String sql="select * from user where userState=?";
		//System.out.println("进来了");
		List<userEntity> list=jdbcTemplate.getJdbcTemplate().query(sql,new Object[]{userStat},new RowMapperEntity());	
		return list;
	}


	public List<videoEntity> Pagevideolist(String State, int dangqianye,int meiyexianshiduoshaoge) {
		//SELECT * FROM video WHERE videoID<=5 LIMIT 0,6
		String sql="SELECT * FROM video WHERE videocAtegory = ? LIMIT ?,?";
		List<videoEntity> list=jdbcTemplate.getJdbcTemplate().query(sql,new Object[]{State,dangqianye,meiyexianshiduoshaoge} ,new VideoRowMapperEntity());		
		return list;
	}


	public int videocoun(String countvideo) {
		//根据标记查询出对应的条数
		String sql="select count(*) from video";// where videocAtegory = ? 
		int num = jdbcTemplate.getJdbcTemplate().queryForObject(sql, new Object[]{},Integer.class);
		return num;
	}


	public List<gridsEntity> gridslist() {
		String sql="select * from grids";
		 List<gridsEntity> gridslist = jdbcTemplate.getJdbcTemplate().query(sql,new GridsRowMapperEntity());
		
		return gridslist;
	}


	public gridsEntity gridsIDlist(String gridsID) {
		String sql="select * from grids where gridsID = ?";
		 gridsEntity gridsIDlist = (gridsEntity) jdbcTemplate.getJdbcTemplate().queryForObject(sql,new Object[]{gridsID} ,new GridsRowMapperEntity());
		return gridsIDlist;
	}


	public List<userEntity> userlistUserName(String userName) {
		//根据名字查询出用户对象. - - 
		String sql="select * from user where userName=?";
		List<userEntity> user=jdbcTemplate.getJdbcTemplate().query(sql,new Object[]{userName},new RowMapperEntity());	
		return user;
	}


	public List<ShoppingCart> shoppingcart(String userName) {
		String sql = "select * from shoppingcart where userName = ?";
		List<ShoppingCart> user = jdbcTemplate.getJdbcTemplate().query(sql,new Object[]{userName},new ShoppingCartRowMapperEntity());
		
		return user;
	}


	public List<videoEntity> videolistimit6MAD() {
		String sql="select * from video order by rand() limit 6";
		List<videoEntity> list=jdbcTemplate.getJdbcTemplate().query(sql,new Object[]{} ,new VideoRowMapperEntity());		
		
		return list;
	}


	public List<ordertableEntity> ordertable(String userName) {
		String sql = "select * from ordertable where OrderuserName=?";
		List<ordertableEntity> ordertable = jdbcTemplate.getJdbcTemplate().query(sql,new Object[]{userName} ,new ordertableRowMapperEntity());
		
		return ordertable;
	}


	public List<ordertableEntity> ordertablelist() {
		String sql = "select * from ordertable";
		List<ordertableEntity> ordertable = jdbcTemplate.getJdbcTemplate().query(sql,new Object[]{} ,new ordertableRowMapperEntity());
		return ordertable;
	}


	public List<ordertableEntity> orderStat(String orderStat) {
		String sql = "select * from ordertable where orderStat = ?";
		List<ordertableEntity> ordertable = jdbcTemplate.getJdbcTemplate().query(sql,new Object[]{orderStat} ,new ordertableRowMapperEntity());
		return ordertable;
	}


	public int countordertable() {
		String sql = "SELECT count(*) FROM ordertable";
		int num = jdbcTemplate.getJdbcTemplate().queryForObject(sql, new Object[]{},Integer.class);
		return num;
	}


	public List<forumEntity> forumEnt(String forumliebie) {
		//select * from forum where forumliebie = "1" Order By forumTime Desc 
		String sql = "select * from forum where forumliebie = ? Order By forumTime Desc";
		List<forumEntity> forum = jdbcTemplate.getJdbcTemplate().query(sql,new Object[]{forumliebie} ,new forumEntityRowMapper());
		//将查询出来的全部信息保存的List当中
		return forum;
	}


	public forumEntity forumentitymmp(String forumID) {
		//根ID查询出帖子内容
		String sql="select * from forum where forumID=?";
		forumEntity user=jdbcTemplate.getJdbcTemplate().queryForObject(sql,new Object[]{forumID},new forumEntityRowMapper());		
		return user;
	}


	public int counttable(String tableName) {
		String sql = "SELECT count(*) FROM user";
		int num = jdbcTemplate.getJdbcTemplate().queryForObject(sql, new Object[]{},Integer.class);
		return num;
	}


	public List<forumreplyEntity> forumreply(String forumreplyID) {
		//select * from forum where forumliebie = "1" Order By forumTime Desc 
				String sql = "select * from forumreply where replytieziid = ? Order By replytime Desc";
				List<forumreplyEntity> forum = jdbcTemplate.getJdbcTemplate().query(sql,new Object[]{forumreplyID} ,new forumreplyEntityRowMapper());
				//将查询出来的全部信息保存的List当中
				return forum;
	}
	
	


}
