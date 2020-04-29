package com.teaspoon.space.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import static com.teaspoon.common.JDBCTemplate.*;

import com.teaspoon.common.PageInfo;
import com.teaspoon.member.model.dao.MemberDao;
import com.teaspoon.member.model.vo.Member;
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
	
	public int getSpaceListCount(Connection conn) {
		int listCount = 0;

		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getSpaceListCount");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);

			if (rset.next()) {
				// 컬럼인덱스로 추출
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return listCount;
	}
	
	
	public ArrayList<Space> selectSpaceList(Connection conn, PageInfo pi) {
		ArrayList<Space> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSpaceList");

		/*
		 * pi에 담겨있는 현재 페이지값과 보여질게시글 수 을 이용해 보여질 페이시 수를 정한다. ex) boardLimit = 10
		 * currentPage = 1 --> startRow :1 endRow:10 currentPage = 2 --> startRow :11
		 * endRow:20 currentPage = 3 --> startRow :21 endRow:30
		 * 
		 * startRow : (currentPage-1) * boardLimit + 1 endRow : startRow + boardLimit -1
		 */
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Space(
							rset.getInt("RESERV_NO"),
							rset.getDate("APP_DATE"),
							rset.getString("RESERV_TIME"),
							rset.getString("RESERV_DATE"),
							rset.getString("USER_NAME"),
							rset.getString("PHONE"),
							rset.getInt("VISIT_NUM"),
							rset.getString("RESERV_REASON"),
							rset.getString("GOODS"),
							rset.getInt("GRADE_CODE"),
							rset.getString("ACCEPT"),
							rset.getInt("TOTAL")
						));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}
		return list;
	}
	
	
	public int reservationDeny(Connection conn, int reservNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("reservationDeny");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reservNo);

			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	
	}
	
public int reservationAccept(Connection conn, int reservNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("reservationAccept");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reservNo);

			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	
	}
	
	
	
	
}
