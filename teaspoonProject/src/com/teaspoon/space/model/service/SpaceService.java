package com.teaspoon.space.model.service;

import static com.teaspoon.common.JDBCTemplate.*;

import java.sql.Connection;

import com.teaspoon.space.model.dao.SpaceDao;
import com.teaspoon.space.model.vo.Space;

public class SpaceService {

	public int insertSpace(Space s) {
		
		Connection conn = getConnection();
		
		int result = new SpaceDao().insertSpace(conn, s);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
}
