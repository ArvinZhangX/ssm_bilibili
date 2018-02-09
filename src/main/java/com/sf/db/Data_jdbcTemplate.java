package com.sf.db;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Data_jdbcTemplate {
	@Autowired
	org.springframework.jdbc.core.JdbcTemplate jdbcTemplate;
	
		//得到spring注入的模板
		public org.springframework.jdbc.core.JdbcTemplate getJdbcTemplate() {
			return jdbcTemplate;
		}
		
}
