package com.sf.dao;

import com.sf.entity.userEntity;

public interface RegisterDao {
	
	/**
	 * 注册接口
	 * 
	 * 先根据用户名查询出是否有此用户
	 * 如果没有 即可注册
	 * @return
	 */
	public int Register(userEntity user );
}
