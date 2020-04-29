package com.teaspoon.space.model.service;

import static com.teaspoon.common.JDBCTemplate.close;
import static com.teaspoon.common.JDBCTemplate.commit;
import static com.teaspoon.common.JDBCTemplate.getConnection;
import static com.teaspoon.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.teaspoon.common.PageInfo;
import com.teaspoon.member.model.dao.MemberDao;
import com.teaspoon.member.model.vo.Member;
import com.teaspoon.space.model.dao.SpaceDao;
import com.teaspoon.space.model.vo.Goods;
import com.teaspoon.space.model.vo.Payment;
import com.teaspoon.space.model.vo.Space;

public class SpaceService {

	public ArrayList<Goods> selectGoodsList() {

		Connection conn = getConnection();

		ArrayList<Goods> list = new SpaceDao().selectGoodsList(conn);

		close(conn);

		return list;
	}

	public int insertPayment(Payment p, Space s) {

		Connection conn = getConnection();
		int result1 = new SpaceDao().insertSpace(conn, s);
		int result2 = new SpaceDao().insertPayment(conn, p);

		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		return result1 * result2;
	}

	public int getSpaceListCount() {
		Connection conn = getConnection();
		int listCount = new SpaceDao().getSpaceListCount(conn);

		close(conn);

		return listCount;

	}
	
	public ArrayList<Space> selectSpaceList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Space> list = new SpaceDao().selectSpaceList(conn, pi);
		close(conn);
		return list;
	}

}
