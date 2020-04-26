package com.teaspoon.space.model.service;

import static com.teaspoon.common.JDBCTemplate.close;
import static com.teaspoon.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.teaspoon.space.model.dao.GoodsDao;
import com.teaspoon.space.model.vo.Goods;

public class GoodsService {

	public ArrayList<Goods> selectGoodsList() {
		Connection conn = getConnection();
		ArrayList<Goods> list = new GoodsDao().selectGoodsList(conn);
		
		close(conn);
		return list;
	}

	
	
	
}
