package com.teaspoon.space.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.teaspoon.common.JDBCTemplate.*;

import com.teaspoon.member.model.dao.MemberDao;
import com.teaspoon.space.model.vo.Goods;
import com.teaspoon.space.model.vo.Payment;
import com.teaspoon.space.model.vo.Space;

public class SpaceDao {
	
	Properties prop = new Properties();

	public SpaceDao() {
		String filePath = MemberDao.class.getResource("/sql/space/space-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	
	public int insertSpace(Connection conn, Space s) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertSpace");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, s.getUserNo());
			pstmt.setString(2, s.getReservDate());
			pstmt.setString(3, s.getReservTime());
			pstmt.setInt(4, s.getVisitNum());
			pstmt.setString(5, s.getPhone()); 
			pstmt.setString(6, s.getReservReason());
			pstmt.setString(7, s.getGood());
			pstmt.setInt(8, s.getGradeCode());
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
				
	}
	
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
				g.setGsName(rset.getString("GS_NAME"));
				g.setGsPrice(rset.getInt("GS_PRICE"));
				g.setGsCount(rset.getInt("GS_COUNT"));
				g.setGsUsing(rset.getInt("GS_USING"));
				g.setGsSaving(rset.getInt("GS_SAVING"));
				
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
	
	
	public int insertPayment(Connection conn, Payment p) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertPayment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p.getGoodsPay());
			pstmt.setInt(2, p.getTotal());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	
	}
	
}
