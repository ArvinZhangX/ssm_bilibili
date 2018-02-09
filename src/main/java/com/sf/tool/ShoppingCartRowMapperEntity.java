package com.sf.tool;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;

import com.sf.entity.ShoppingCart;
import com.sf.entity.gridsEntity;
import com.sf.entity.userEntity;


//用户表
public class ShoppingCartRowMapperEntity implements RowMapper<ShoppingCart>{

	public ShoppingCart mapRow(ResultSet arg0, int arg1) throws SQLException {
		//gridsEntity grids = new gridsEntity();
		//user.setUseryinghangka(arg0.getString("useryinghangka"));
		ShoppingCart shoopingCart = new ShoppingCart();
		shoopingCart.setCartID(arg0.getString("cartID"));
		shoopingCart.setShoopingID(arg0.getString("shoopingID"));
		shoopingCart.setShoopingImg(arg0.getString("shoopingImg"));
		shoopingCart.setShoopingjiage(arg0.getString("shoopingjiage"));
		shoopingCart.setShoopingName(arg0.getString("shoopingName"));
		shoopingCart.setUserName(arg0.getString("userName"));
		return shoopingCart;
	}

	
	
}
