package com.teaspoon.board.dao;

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

import com.teaspoon.board.model.vo.Board;
import com.teaspoon.common.PageInfo;
import com.teaspoon.member.model.dao.MemberDao;
import com.teaspoon.member.model.vo.Member;

public class BoardDao {
	private Properties prop = new Properties();
	public BoardDao() {
		String filePath = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	public int insertBoard(Connection conn, Board b) {
		int result= 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBoard");
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public int getMagazineListCount(Connection conn) {
		int listCount = 0;

		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getMagazineListCount");

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
	
	
	public ArrayList<Board> selectMagazineList(Connection conn, PageInfo pi) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMagazineList");

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
				list.add(new Board(rset.getInt("BOARD_NO"),
						rset.getString("BOARD_TITLE"),
						rset.getInt("COUNT"),
						rset.getDate("CREATE_DATE"),
						rset.getDate("MODIFY_DATE"),
						rset.getString("STATUS")
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
	

}
