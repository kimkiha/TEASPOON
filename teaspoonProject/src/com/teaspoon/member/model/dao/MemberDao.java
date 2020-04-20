package com.teaspoon.member.model.dao;

import static com.teaspoon.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.teaspoon.common.PageInfo;
import com.teaspoon.member.model.vo.Grade;
import com.teaspoon.member.model.vo.Member;

public class MemberDao {

	Properties prop = new Properties();

	public MemberDao() {
		String filePath = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public Member loginMember(Connection conn, String userId, String userPwd) {
		Member loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();

			
			if(rset.next()) {
				loginUser = new Member(
							rset.getInt("USER_NO"),
							rset.getInt("GRADE_CODE"),
							rset.getString("USER_ID"),
							rset.getString("USER_PWD"),
							rset.getString("USER_NAME"),
							rset.getString("GENDER"),
							rset.getInt("BIRTHDAY"),
							rset.getString("PHONE"),
							rset.getString("EMAIL"),
							rset.getDate("ENROLL_DATE"),
							rset.getDate("MODIFY_DATE"),
							rset.getInt("POINT"),
							rset.getInt("BUY_POINT"),
							rset.getString("admin"),
							rset.getString("status")
						);
				
			}
			
			
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return loginUser;
	}
	
	public int getListCount(Connection conn) {
		int listCount = 0;

		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getListCount");

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

	public ArrayList<Member> selectList(Connection conn, PageInfo pi) {
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");

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
				list.add(new Member(rset.getInt("USER_NO"), rset.getString("USER_ID"),
						rset.getString("USER_NAME"), rset.getString("PHONE"),rset.getDate("ENROLL_DATE"),
						 rset.getString("GRADE_NAME"),
						 rset.getInt("BIRTHDAY"),
						 rset.getString("status")));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}
		return list;
	}
	
	public int getQnaListCount(Connection conn, int userNo) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getQnaListCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();

			if (rset.next()) {
				// 컬럼인덱스로 추출
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return listCount;
	}

	public ArrayList<Member> selectMyQnaList(Connection conn , PageInfo pi,int userNo) {
		ArrayList<Member> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMyQnaList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Member(rset.getInt("mtm_no"),
									rset.getInt("user_no"),
						            rset.getInt("mtm_type"),
						            rset.getString("mtm_title"),
						            rset.getDate("create_date")
						            ));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}
	
	
	
	public int getSearchListCount(Connection conn,String searchId) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getSearchListCount");
	
		try {
			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, "%"+searchId+"%");
			pstmt.setString(1, searchId);
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				// 컬럼인덱스로 추출
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return listCount;
	}
	
	
	public ArrayList<Member> selectSearchList(Connection conn,String searchId, PageInfo pi) {
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectIdList");

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
			pstmt.setString(1,"%"+searchId+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Member(rset.getInt("USER_NO"), rset.getString("USER_ID"),
						rset.getString("USER_NAME"), rset.getString("PHONE"),rset.getDate("ENROLL_DATE"),
						 rset.getString("GRADE_NAME"),
						 rset.getInt("BIRTHDAY"),
						 rset.getString("status")));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}
		return list;
	}

	public Member MyPageInfo(Connection conn, int userNo) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("MyPageInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, userNo);
			pstmt.setInt(3, userNo);
			
			if(rset.next()) {
				m=new Member();
				m.setUserNo(rset.getInt("userno"));
				m.setUserName(rset.getString("username"));
				m.setGradeName(rset.getString("grade_name"));
				m.setPoint(rset.getInt("point"));
				m.setW(rset.getInt("w"));
				m.setC(rset.getInt("c"));
				
			}
			
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(m);
		return m;
		
	}
	
	
	
	public ArrayList<Grade> selectSearchList(Connection conn){
		ArrayList<Grade> list = new ArrayList<Grade>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectGradeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				list.add(new Grade(rset.getInt("GRADE_CODE"),
								   rset.getString("GRADE_NAME"),
								   rset.getInt("MIN_ACOUNT"),
								   rset.getInt("GRADE_RATE")
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	
	
		return list;
	}
	
	
	
	

}
