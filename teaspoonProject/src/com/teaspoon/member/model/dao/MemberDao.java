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

import com.teaspoon.board.model.vo.Attachment;
import com.teaspoon.common.PageInfo;
import com.teaspoon.member.model.vo.Cart;
import com.teaspoon.member.model.vo.Grade;
import com.teaspoon.member.model.vo.Member;
import com.teaspoon.member.model.vo.MenToMen;
import com.teaspoon.member.model.vo.Orders;
import com.teaspoon.member.model.vo.Point;
import com.teaspoon.store.model.vo.Product;

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
			pstmt.setString(2, userId);
			pstmt.setString(3, userId);
			pstmt.setString(4, userPwd);
			
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
							rset.getInt("BUY_POINT"),
							rset.getString("ADMIN"),
							rset.getString("status"),
						
							rset.getInt("POINT"),
							rset.getString("grade_name"),
							rset.getInt("wishCount"),
							rset.getInt("couponCount")
						);
				
			}
			//System.out.println(loginUser);
			
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
						            rset.getString("mtm_name"),
						            rset.getString("mtm_title"),
						            rset.getDate("create_date"),
						            rset.getString("re_comment"),
						            rset.getString("answer")
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
		Member myInfo = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("MyPageInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, userNo);
			pstmt.setInt(3, userNo);
			rset= pstmt.executeQuery();
			
			
			if(rset.next()) {
				
				myInfo=new Member(rset.getInt(1),
								 rset.getString(2),
								 rset.getString(3),
								 rset.getInt(4),
								 rset.getInt(5),
								 rset.getInt(6));
				
				 
			}
	
					
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(myInfo);
		
		return myInfo;
		
	}
	
	
	
	public ArrayList<Grade> selectGradeList(Connection conn){
		ArrayList<Grade> list = new ArrayList<Grade>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectGradeList1");
		
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


	public int insertMember(Connection conn, Member m) {
		//System.out.println(m.getGender());
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());					// 아이디
			pstmt.setString(2, m.getUserPwd());					// 패스워드
			pstmt.setString(3, m.getUserName());				// 이름
			pstmt.setString(4, m.getGender());					// 성별
			pstmt.setInt(5, m.getBirthday());					// 생년월일
			pstmt.setString(6, m.getPhone());					// 전화번호
			pstmt.setString(7, m.getEmail());					// 이메일
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public int updateMember(Connection conn, Member m) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserPwd());					// 패스워드
			pstmt.setString(2, m.getPhone());					// 전화번호
			pstmt.setString(3, m.getEmail());					// 이메일
			pstmt.setInt(4, m.getUserNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Member selectMember(Connection conn, String userid) {
		Member m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMember");
		
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userid);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("USER_NO"),
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
						rset.getInt("BUY_POINT"),
						rset.getString("ADMIN"),
						rset.getString("STATUS"));
						//rset.getString("ADDRESS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
		
	}
	
	

	
	public int getSearchKeywordListCount(Connection conn,String searchKeyword1,String searchKeyword2) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getSearchKeywordListCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,searchKeyword1);
			pstmt.setString(2,searchKeyword2);
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
	
	
	public ArrayList<Member> selectSearchKeywordList(Connection conn,String searchKeyword1, String searchKeyword2,PageInfo pi) {
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSearchKeywordList");

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
			pstmt.setString(1,searchKeyword1);
			pstmt.setString(2,searchKeyword2);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);

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
	
	
	public int getSearchAllStatusListCount(Connection conn,String searchKeyword2) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getSearchAllStatusListCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,searchKeyword2);
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
	
	
	public ArrayList<Member> selectAllStatusList(Connection conn, String searchKeyword2,PageInfo pi) {
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllStatusList");

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
			pstmt.setString(1,searchKeyword2);
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
	
	
	
	public int getSearchAllGradeListCount(Connection conn,String searchKeyword1) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getSearchAllGradeListCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,searchKeyword1);
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
	
	
	public ArrayList<Member> selectAllGradeList(Connection conn, String searchKeyword1,PageInfo pi) {
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllGradeList");

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
			pstmt.setString(1,searchKeyword1);
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
	
	


	


	public int insertMtm(Connection conn, MenToMen m) {

		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertMtm");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m.getUserNo());
			pstmt.setInt(2, m.getMtmType());
			pstmt.setString(3, m.getMtmTitle());
			pstmt.setString(4, m.getMtmContent());
			
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}
	
public int insertAttachment(Connection conn, Attachment at) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, 1);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public MenToMen selectMtm(Connection conn, int mno) {
		MenToMen m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMtm");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m= new MenToMen ();
				m.setMtmNo(rset.getInt("mtm_no"));
				m.setMtmType(rset.getInt("mtm_type"));
				m.setMtmTitle(rset.getString("mtm_title"));
				m.setUserId(rset.getString("user_id"));
				m.setCreateDate(rset.getDate("create_date"));
				m.setMtmContent(rset.getString("mtm_content"));
				m.setReComment(rset.getString("re_comment"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return m;
		
		
		
	}
	public Attachment selectAttachment(Connection conn, int mno) {
		
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql  = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				at = new Attachment();
				at.setFileNo(rset.getInt("file_no"));
				at.setOriginName(rset.getString("origin_name"));
				at.setChangeName(rset.getString("change_name"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(rset);
		}
		
		return at;
	}

	public int idCheck(Connection conn, String userId) {

		int count = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
		
	}
	
	public int emailCheck(Connection conn, String email) {

		int count = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("emailCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
		
	}
	

	
	
		public int insertGrade(Connection conn, Grade grade) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertGrade");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,grade.getGradeName());
			pstmt.setInt(2, grade.getMinAcount());
			pstmt.setInt(3, grade.getGradeRate());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
		
		public int updateMemberGrade(Connection conn, Grade grade ,String nextG, int addGradeCode) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("updateMemberGrade");
		
			//System.out.println(nextG);
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,addGradeCode);
				pstmt.setString(2, grade.getGradeName());
				pstmt.setString(3, nextG);
				
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;	
		}
		
		
		public int updateMemberMaxGrade(Connection conn, Grade grade, int addGradeCode) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("updateMemberMaxGrade");
		
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,addGradeCode);
				pstmt.setString(2, grade.getGradeName());
			
				
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;	
		}
		
		public int insertWish(Connection conn, int pcode, int userNo) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertWishList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,userNo);
				pstmt.setInt(2, pcode);
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
			
		}
		
		public ArrayList<Product> selectWishList(Connection conn, int userNo){
			ArrayList<Product> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectWishList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, userNo);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Product p  = new Product();
					p.setPcode(rset.getInt("PCODE"));
					p.setPname(rset.getString("PNAME"));
					p.setPrice(rset.getInt("PRICE"));
					p.setKind(rset.getString("KIND"));
					p.setTitleImg(rset.getString("change_name"));
					
					list.add(p);
				}
				
				System.out.print(list);
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return list;
		}
		
		public int selectOneWishList(Connection conn, int pcode, int userNo) {
		
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectOneWishList");
			int count=0;
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, userNo);
				pstmt.setInt(2, pcode);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					count = rset.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			System.out.println(count);
			return count;
		}
		
		public int deleteWish(Connection conn, int pcode, int userNo) {
			int result = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("deleteWish");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, userNo);
				pstmt.setInt(2, pcode);
				
				result = pstmt.executeUpdate();
				
			
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return result;
			
			
		}

		public int updateMtm(Connection conn, String[] mno) {
			PreparedStatement pstmt =null;
			int result = 0;
			
			
			try {
				for(int i=0;i<mno.length;i++) {
				String sql = prop.getProperty("updateMtm");
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1,Integer.parseInt(mno[i]));
				
				}
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return result;
		}
		
		
		public int updateGrade(Connection conn, Grade g) {
			
			int result = 0;
			
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("updateGrade");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1,g.getGradeName());
				pstmt.setInt(2, g.getMinAcount());
				pstmt.setInt(3, g.getGradeRate());
				pstmt.setInt(4, g.getGradeCode());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
		
		public int newUpdateMemberGrade(Connection conn, Grade g,String nextG) {
			
			int result = 0;
			
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("newUpdateMemberGrade");
			//System.out.println(g.getGradeName());
			//System.out.println(nextG);
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1,g.getGradeCode()-10);
				pstmt.setString(2, g.getGradeName());
				pstmt.setString(3, nextG);
				pstmt.setInt(4, g.getGradeCode());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
		
public int newUpdateMaxMemberGrade(Connection conn, Grade g) {
			
			int result = 0;
			
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("newUpdateMaxMemberGrade");
			//System.out.println(g.getGradeName());
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1,g.getGradeCode()-10);
				pstmt.setString(2, g.getGradeName());
				pstmt.setInt(3, g.getGradeCode());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
		// 포인트 조회 관련 
		public ArrayList<Point> selectPointList(Connection conn, int userNo,PageInfo pi) {
			ArrayList<Point> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectPointList");
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit()-1;
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1,userNo);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Point(
							rset.getInt("user_No"),
							rset.getDate("point_date"),
							rset.getInt("Division"),
							rset.getString("content"),
							rset.getInt("point_price")));
										
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			
			
			
			return list;
		}
		//포인트 jsp페이징바 카운트
		public int getPointListCount(Connection conn,int userNo) {
			int listCount =0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("getPointListCount");
			
			try {
				pstmt= conn.prepareStatement(sql);
				pstmt.setInt(1, userNo);
				
				rset = pstmt.executeQuery();
				if(rset.next()) {
					listCount = rset.getInt(1);
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			
			System.out.println(listCount);
			return listCount;
			
		}

		public Member selectUserPwd(Connection conn, String userId) {
		
			PreparedStatement pstmt = null;
			Member m = new Member(); 
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectUserPwd");
			
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, userId);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					
					m.setUserPwd(rset.getString("user_pwd"));
					m.setEmail(rset.getString("EMAIL"));
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return m;
			
		}
		
		public Member selectUserId(Connection conn, String email) {
			
			PreparedStatement pstmt = null;
			Member m = new Member(); 
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectUserId");
			
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, email);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					
					m.setUserId(rset.getString("user_id"));
					
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return m;
			
		}	
			
		public int selectMtmAdminCount(Connection conn) {
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
				
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			
			return listCount;
		}

		public ArrayList<MenToMen> selectMtmAdminList(Connection conn, PageInfo pi) {
			ArrayList<MenToMen> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectMtmAdminList");
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit()-1;
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new MenToMen(rset.getInt("MTM_NO"),
								rset.getInt("MTM_TYPE"),
								rset.getString("MTM_title"),
								rset.getDate("CREATE_DATE"),
								rset.getString("MTM_NAME"),	
								rset.getString("answer")));
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			
		
			
			return list;
		}

		public ArrayList<MenToMen> selectMtmAdminListType(Connection conn, String mtmName,PageInfo pi) {
			ArrayList<MenToMen> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectMtmAdminListType");
			
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit()-1;
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mtmName);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				rset = pstmt.executeQuery();
				while(rset.next()) {
					list.add(new MenToMen(rset.getInt("MTM_NO"),
							rset.getInt("MTM_TYPE"),
							rset.getString("MTM_TITLE"),
							rset.getDate("CREATE_DATE"),
							rset.getString("MTM_NAME"),		
							rset.getString("answer")));
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

		public int selectMtmAdminCount(Connection conn, String mtmName) {
			int listCount = 0;

			PreparedStatement	pstmt  = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectMtmAdminCount");

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mtmName);
				rset = pstmt.executeQuery();

				if (rset.next()) {
					// 컬럼인덱스로 추출
					listCount = rset.getInt(1);
				}

			} catch (SQLException e) {
				
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return listCount;
		}

		public MenToMen mtmQnaAnswer(Connection conn, int mtmNo) {
			MenToMen mtm = new MenToMen();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("mtmQnaAnswer");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, mtmNo);
				rset= pstmt.executeQuery();
				if(rset.next()) {
					mtm.setMtmNo(rset.getInt("MTM_NO"));
					mtm.setMtmName(rset.getString("MTM_NAME"));
					mtm.setMtmTitle(rset.getString("MTM_TITLE"));
					mtm.setMtmContent(rset.getString("MTM_CONTENT"));
					mtm.setCreateDate(rset.getDate("CREATE_DATE"));
					mtm.setReComment(rset.getString("re_Comment"));
					mtm.setCommentDate(rset.getDate("comment_date"));
					mtm.setAnswer(rset.getString("answer"));
					mtm.setUserName(rset.getString("USER_NAME"));
					mtm.setUserId(rset.getString("USER_ID"));
					
					
					
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			System.out.println(mtm);
			return mtm;
			
		}
		
		
		
		public void MemberGradeDown(Connection conn, int deleteGradeCode) {
			
			PreparedStatement pstmt  = null;
			ResultSet rset = null;
			String sql = prop.getProperty("memberGradeDown");

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, deleteGradeCode-10);
				pstmt.setInt(2, deleteGradeCode);
			    pstmt.executeUpdate();
	

			} catch (SQLException e) {
				
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return;
		}
		
	public int deleteGrade(Connection conn, int deleteGradeCode) {
			int result=0;
			PreparedStatement pstmt  = null;
			ResultSet rset = null;
			String sql = prop.getProperty("deleteGrade");

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, deleteGradeCode);
			    pstmt.executeUpdate();
	

			} catch (SQLException e) {
				
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return result;
		}

	public int updateAnswer(Connection conn, int mtmNo, String reComment) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAnswer");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, reComment);
			pstmt.setInt(2, mtmNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	public ArrayList<Cart> selectMemberCart(Connection conn, int userNo) {
		ArrayList<Cart> list =new ArrayList<>();
		PreparedStatement pstmt  = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberCart");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset= pstmt.executeQuery();
			
		 
			while(rset.next()) {
				Cart c = new Cart();
				c.setCart(rset.getInt("cart"));
				c.setMadeDate(rset.getDate("madeDate"));
				c.setPcode(rset.getInt("pcode"));
				c.setOptionCode(rset.getInt("option_Code"));
				c.setpDetailNo(rset.getInt("p_Detail_No"));
				c.setAmount(rset.getInt("amount"));
				c.setAddPrice(rset.getInt("add_Price"));
				c.setOptionType1(rset.getString("option_Type1"));
				c.setOptionType2(rset.getString("option_Type2"));
				c.setPname(rset.getString("pname"));
				c.setSupPrice(rset.getInt("sup_price"));
				c.setPrice(rset.getInt("price"));
				c.setStock(rset.getInt("stock"));
				c.setStatus(rset.getString("status"));
				c.setKeyword(rset.getString("keyword"));
				c.setTotalCount(rset.getInt("total_count"));
				c.setKind(rset.getString("kind"));
				c.setPcontent(rset.getString("pcontent"));
				c.setChangeName(rset.getString("change_name"));

				list.add(c);
			}

		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	
	}
	
	public Attachment selectQnaAttachment(Connection conn, int mtmNo) {
		
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql  = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mtmNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				at = new Attachment();
				at.setFileNo(rset.getInt("file_no"));
				at.setOriginName(rset.getString("origin_name"));
				at.setChangeName(rset.getString("change_name"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(rset);
		}
		
		return at;
	}

	public int MemberInsertCart(Connection conn) {
		
		int result=0;
		PreparedStatement pstmt = null;
		String sql  = prop.getProperty("memberInsertCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		
		return result;
	}

	public ArrayList<Member> SelectReservCafe(Connection conn,int userNo,PageInfo pi) {
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		String sql = prop.getProperty("SelectReservCafe");
		
		int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
		int endRow = startRow + pi.getBoardLimit()-1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member m = new Member();
				m.setReservNo(rset.getInt("reserv_no"));
				m.setAppDate(rset.getDate("app_date"));
				m.setReservDate(rset.getString("reserv_date"));
				m.setReservTime(rset.getString("reserv_time"));
				m.setVisitNum(rset.getInt("visit_num"));
				m.setAccept(rset.getString("accept"));
				m.setTotal(rset.getInt("total"));
				
				
				list.add(m);
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		return list ;
			
			
		
		
	}

	public int reservListCount(Connection conn, int userNo) {
		int listCount =0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("reservListCount");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println(listCount);
		return listCount;
	}
	
		
	public int getOrderCount(Connection conn) {
		int listCount = 0;

		Statement stmt = null;
		ResultSet rset = null; 
		
		String sql = prop.getProperty("getOrderCount");
		//System.out.println(sql);
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);

			if (rset.next()) { // 컬럼인덱스로 추출
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}		
		
	
	public ArrayList<Orders> orderConditionList(Connection conn, PageInfo pi) {
		ArrayList<Orders> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("orderConditionList");
		
		int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
		int endRow = startRow + pi.getBoardLimit()-1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
			  Orders or = new Orders();
				or.setUserNo(rset.getInt("USER_NO"));
				or.setOrderNo(rset.getInt("ORDER_NO"));
				or.setOrderer(rset.getString("ORDERER"));
				or.setOrdererPhone(rset.getString("ORDERER_PHONE"));
				or.setRecipient(rset.getString("RECIPIENT"));
				or.setRecipientPhone(rset.getString("RECIPIENT_PHONE"));
				or.setRecipientAddress(rset.getString("RECIPIENT_ADDRESS"));
				or.setShippingFee(rset.getInt("shipping_fee"));
				or.setPayment(rset.getInt("PAYMENT"));
				or.setOrderDate(rset.getDate("ORDER_DATE"));
				or.setProgress(rset.getInt("PROGRESS"));
				or.setCart(rset.getInt("CART"));
				or.setOrderMessage(rset.getString("ORDER_MAESSAGE"));
				or.setProductInfo(rset.getString("PRODUCT_INFO"));
						list.add(or);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Orders orderConditionDetailList(Connection conn, int orderNo) {
		Orders or = new Orders();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("orderConditionDetailList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNo);
			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
			  
				or.setUserNo(rset.getInt("USER_NO"));
				or.setOrderNo(rset.getInt("ORDER_NO"));
				or.setOrderer(rset.getString("ORDERER"));
				or.setOrdererPhone(rset.getString("ORDERER_PHONE"));
				or.setRecipient(rset.getString("RECIPIENT"));
				or.setRecipientPhone(rset.getString("RECIPIENT_PHONE"));
				or.setRecipientAddress(rset.getString("RECIPIENT_ADDRESS"));
				or.setShippingFee(rset.getInt("shipping_fee"));
				or.setPayment(rset.getInt("PAYMENT"));
				or.setOrderDate(rset.getDate("ORDER_DATE"));
				or.setProgress(rset.getInt("PROGRESS"));
				or.setCart(rset.getInt("CART"));
				or.setOrderMessage(rset.getString("ORDER_MAESSAGE"));
				or.setProductInfo(rset.getString("PRODUCT_INFO"));
						
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return or;
	}


	public int orderHistoryListCount(Connection conn, int userNo) {
		
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("orderHistoryListCount");
		//System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();

			if (rset.next()) { // 컬럼인덱스로 추출
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<Orders> orderHistoryList(Connection conn, int userNo, PageInfo pi) {
		ArrayList<Orders> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("orderHistoryList");
		
		int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
		int endRow = startRow + pi.getBoardLimit()-1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				  Orders or = new Orders();
					or.setUserNo(rset.getInt("USER_NO"));
					or.setOrderNo(rset.getInt("ORDER_NO"));
					or.setOrderer(rset.getString("ORDERER"));
					or.setOrdererPhone(rset.getString("ORDERER_PHONE"));
					or.setRecipient(rset.getString("RECIPIENT"));
					or.setRecipient(rset.getString("RECIPIENT_PHONE"));
					or.setRecipientAddress(rset.getString("RECIPIENT_ADDRESS"));
					or.setShippingFee(rset.getInt("shipping_fee"));
					or.setPayment(rset.getInt("PAYMENT"));
					or.setOrderDate(rset.getDate("ORDER_DATE"));
					or.setProgress(rset.getInt("PROGRESS"));
					or.setCart(rset.getInt("CART"));
					or.setOrderMessage(rset.getString("ORDER_MAESSAGE"));
					or.setProductInfo(rset.getString("PRODUCT_INFO"));
							list.add(or);
				}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int MyPageOrderConfirm(Connection conn, int OrderNo) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("MyPageOrderConfirm");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, OrderNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	public int insertPoint(Connection conn, int userNo, int addPoint) {
		
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPoint");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, addPoint);
		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}

	public int deletePoint(Connection conn, int userNo, int usePoint) {
		
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deletePoint");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, usePoint);
		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}

	public int updatePoint(Connection conn, int userNo, int finalPoint) {

		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePoint");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, finalPoint);
			pstmt.setInt(2, userNo);
		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	
	
	}
	
	public int updateReservePoint(Connection conn, int userNo, int finalPoint) {

		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReservePoint");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, finalPoint);
			pstmt.setInt(2, userNo);
		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	
	
	}
	
public int insertReservPoint(Connection conn, int userNo, int addPoint) {
		
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReservPoint");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, addPoint);
		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}		
	

	public int deleteReservPoint(Connection conn, int userNo, int usePoint) {
		
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReservPoint");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, usePoint);
		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int eventUpdatePoint(Connection conn, int point, int userNo) {
		int result=0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("eventUpdatePoint");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, point);
			pstmt.setInt(2, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int insertEventPoint(Connection conn, int point, int userNo){
		int result=0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertEventPoint");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, point);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	public Orders MyOrderHistoryList(Connection conn, int userNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		 Orders or = new Orders();
		String sql = prop.getProperty("MyOrderHistoryList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,userNo);
			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				 
					or.setUserNo(rset.getInt("USER_NO"));
					or.setOrderNo(rset.getInt("ORDER_NO"));
					or.setOrderer(rset.getString("ORDERER"));
					or.setOrdererPhone(rset.getString("ORDERER_PHONE"));
					or.setRecipient(rset.getString("RECIPIENT"));
					or.setRecipient(rset.getString("RECIPIENT_PHONE"));
					or.setRecipientAddress(rset.getString("RECIPIENT_ADDRESS"));
					or.setShippingFee(rset.getInt("shipping_fee"));
					or.setPayment(rset.getInt("PAYMENT"));
					or.setOrderDate(rset.getDate("ORDER_DATE"));
					or.setProgress(rset.getInt("PROGRESS"));
					or.setCart(rset.getInt("CART"));
					or.setOrderMessage(rset.getString("ORDER_MAESSAGE"));
					or.setProductInfo(rset.getString("PRODUCT_INFO"));
							
				}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return or;
	}
		
}

