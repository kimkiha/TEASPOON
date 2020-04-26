package com.teaspoon.space.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.teaspoon.common.JDBCTemplate.*;
import com.teaspoon.space.model.vo.Goods;
import com.teaspoon.store.model.vo.Product;
public class GoodsDao {

	private Properties prop = new Properties();
	
	public ArrayList<Goods> selectGoodsList(Connection conn){
		
		ArrayList<Goods> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectGoodsList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Goods g = new Goods();
				g.setGsNo(rset.getInt("gsNo"));
				g.setGsName(rset.getString("gsName"));
				g.setGsPrice(rset.getInt("gsPrice"));
				g.setGsCount(rset.getInt("gsCount"));
				g.setGsUsing(rset.getInt("gsUsing"));
				
				list.add(g);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
}
