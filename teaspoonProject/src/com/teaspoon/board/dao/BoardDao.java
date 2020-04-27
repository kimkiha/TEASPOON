package com.teaspoon.board.dao;

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
import com.teaspoon.board.model.vo.Board;
import com.teaspoon.common.PageInfo;

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
	
	
	// ------------------------------- 공통 ---------------------------------//
	/**
	 * 1.board 수정페이지 조회용(title,content)
	 * @param conn 
	 * @param bno --> 해당 글 번호
	 * @return 	  --> 조회된 board 객체 
	 */
	public Board selectBoard(Connection conn, int bno) {
		Board b = new Board();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoard");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board();
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardCategory(rset.getInt("BOARD_CATEGORY"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardContent(rset.getString("BOARD_CONTENT"));
				b.setCount(rset.getInt("COUNT"));
				b.setCreateDate(rset.getDate("CREATE_DATE"));
				b.setModifyDate(rset.getDate("MODIFY_DATE"));
				b.setStatus(rset.getString("STATUS"));
				b.setChangeName(rset.getString("CHANGE_NAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}
	
	/**
	 * 2.borad 수정페이지 조회용(대표이미지)
	 * @param conn 
	 * @param bno --> 해당 글 번호
	 * @return	  --> 해당 Attachment 객체
	 */
	public Attachment selectAttachment(Connection conn, int bno) {
		Attachment at = new Attachment();
		
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment();
				at.setFileNo(rset.getInt("file_no"));
				at.setRefBoardNo(rset.getInt("ref_bno"));
				at.setOriginName(rset.getString("origin_name"));
				at.setChangeName(rset.getString("change_name"));
				at.setFilePath(rset.getString("file_path"));
				at.setUploadDate(rset.getDate("upload_date"));
				at.setFileLevel(rset.getInt("file_level"));
				at.setStatus(rset.getString("status"));
				at.setBoardLevel(rset.getString("board_level"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return at;
	}
	
	/**
	 * 3.board 수정용(title,content)
	 * @param conn
	 * @param b
	 * @return
	 */
	public int updateBoard(Connection conn, Board b) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setString(3, b.getStatus());
			pstmt.setInt(4, b.getBoardNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
				
	}

	/**
	 * 4.board 수정용(대표이미지_이미지 있었을 경우)
	 * @param conn
	 * @param at
	 * @return
	 */
	public int updateAttachment(Connection conn, Attachment at) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getChangeName());
			pstmt.setString(2, at.getOriginName());
			pstmt.setInt(3, at.getFileNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/**
	 * 5.매거진 삭제용
	 * @param conn
	 * @param bno
	 * @return
	 */
	public int deleteBoard(Connection conn, int bno) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int increaseCount(Connection conn, int bno) {
		int result=0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// -------------------------------  매거진시작    ------------------------------- //
	/**
	 * 1_1.매거진  작성용(title,content)
	 * @param conn 
	 * @param b -->board 객체
	 * @return --> 성공항 행 갯수
	 */
	public int insertMagazine(Connection conn, Board b) {
		int result= 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMagazine");
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
	
	/**
	 * 1_2.매거진  작성용(대표이미지)
	 * @param conn
	 * @param at
	 * @return
	 */
	public int insertMagazineAttachemnt(Connection conn, Attachment at) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql =prop.getProperty("insertMagazineAttachemnt");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	/**
	 * 2_1.매거진 리스트 조회용 
	 * @param conn
	 * @return 
	 */
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
	
	/**
	 * 2_2.매거진 리스트 조회용 
	 * @param conn
	 * @param pi
	 * @return
	 */
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
						rset.getInt("BOARD_CATEGORY"),
						rset.getString("BOARD_TITLE"),
						rset.getString("BOARD_CONTENT"),
						rset.getInt("COUNT"),
						rset.getDate("CREATE_DATE"),
						rset.getDate("MODIFY_DATE"),
						rset.getString("STATUS"),
						rset.getString("CHANGE_NAME")
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


	/**
	 * 3.매거진 썸네일 수정용(대표이미지_이미지 없었을 경우)
	 * @param conn
	 * @param at
	 * @return
	 */
	public int insertMagazineNewAttachment(Connection conn, Attachment at) {
		int result =0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, at.getRefBoardNo());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * 사용자단 매거진 썸네일 조회용
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<Attachment> selectMagazineThumbnailList(Connection conn, PageInfo pi){
			
		ArrayList<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMagazineThumbnailList");
	
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
				list.add(new Attachment(rset.getInt("FILE_NO"),
						rset.getInt("REF_BNO"),
						rset.getString("ORIGIN_NAME"),
						rset.getString("CHANGE_NAME"),
						rset.getString("FILE_PATH"),
						rset.getDate("UPLOAD_DATE"),
						rset.getInt("FILE_LEVEL"),
						rset.getString("STATUS"),
						rset.getString("BOARD_LEVEL")
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
	
	// 매거진 키워드조회
	public int getMagazineKeywordListCount(Connection conn, String magazineKeyword) {
		
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getMagazineKeywordListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, magazineKeyword);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
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

	public ArrayList<Board> selectMagazineKeywordList(Connection conn, String magazineKeyword, PageInfo pi){
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMagazineKeywordList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+magazineKeyword+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("board_no"), rset.getString("board_title"),
						rset.getInt("count"),rset.getDate("create_date"),
						rset.getDate("modify_date"),rset.getString("status")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}
		return list;
	}



	
	// -------------------------------  이벤트시작    ------------------------------- //
	/**
	 * 1_1.이벤트  작성용(title,content)
	 * @param conn 
	 * @param b -->board 객체
	 * @return --> 성공항 행 갯수
	 */
	public int insertEvent(Connection conn, Board b) {
		int result= 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertEvent");
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

	/**
	 * 1_2.이벤트  작성용(대표이미지)
	 * @param conn
	 * @param at
	 * @return
	 */
	public int insertEventAttachemnt(Connection conn, Attachment at) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql =prop.getProperty("insertEventAttachemnt");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}

	/**
	 * 2_1.이벤트 리스트 조회용 
	 * @param conn
	 * @return 
	 */
	public int getEventListCount(Connection conn) {
		int listCount = 0;

		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getEventListCount");

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
	
	/**
	 * 2_2.이벤트 리스트 조회용 
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<Board> selectEventList(Connection conn, PageInfo pi) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectEventList");

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
						rset.getInt("BOARD_CATEGORY"),
						rset.getString("BOARD_TITLE"),
						rset.getString("BOARD_CONTENT"),
						rset.getInt("COUNT"),
						rset.getDate("CREATE_DATE"),
						rset.getDate("MODIFY_DATE"),
						rset.getString("STATUS"),
						rset.getString("CHANGE_NAME")
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
	
	
	/**
	 * 사용자단 이벤트 썸네일 조회용
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<Attachment> selectEventThumbnailList(Connection conn, PageInfo pi){
			
		ArrayList<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectEventThumbnailList");
	
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
				list.add(new Attachment(rset.getInt("FILE_NO"),
						rset.getInt("REF_BNO"),
						rset.getString("ORIGIN_NAME"),
						rset.getString("CHANGE_NAME"),
						rset.getString("FILE_PATH"),
						rset.getDate("UPLOAD_DATE"),
						rset.getInt("FILE_LEVEL"),
						rset.getString("STATUS"),
						rset.getString("BOARD_LEVEL")
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
	
	// 이벤트 키워드 조회
	public int getEventKeywordListCount(Connection conn, String eventKeyword) {
		
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getEventKeywordListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, eventKeyword);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
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

	public ArrayList<Board> eventKeywordList(Connection conn, String eventKeyword, PageInfo pi){
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("eventKeywordList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+eventKeyword+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("board_no"), rset.getString("board_title"),
						rset.getInt("count"),rset.getDate("create_date"),
						rset.getDate("modify_date"),rset.getString("status")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}
		return list;
		
		
	}
	
	
	// -------------------------------  공지사항시작    ------------------------------- //
	/**
	 * 1_1.공지사항  작성용(title,content)
	 * @param conn 
	 * @param b -->board 객체
	 * @return --> 성공항 행 갯수
	 */
	public int insertNotice(Connection conn, Board b) {
		int result= 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");
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

	/**
	 * 1_2.공지사항 작성용(대표이미지)
	 * @param conn
	 * @param at
	 * @return
	 */
	public int insertNoticeAttachemnt(Connection conn, Attachment at) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql =prop.getProperty("insertNoticeAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}

	/**
	 * 2_1.공지사항 리스트 조회용 
	 * @param conn
	 * @return 
	 */
	public int getNoticeListCount(Connection conn) {
		int listCount = 0;

		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getNoticeListCount");

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
	
	/**
	 * 2_2.공지사항 리스트 조회용 
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<Board> selectNoticeList(Connection conn, PageInfo pi) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNoticeList");

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
						rset.getInt("BOARD_CATEGORY"),
						rset.getString("BOARD_TITLE"),
						rset.getString("BOARD_CONTENT"),
						rset.getInt("COUNT"),
						rset.getDate("CREATE_DATE"),
						rset.getDate("MODIFY_DATE"),
						rset.getString("STATUS"),
						rset.getString("CHANGE_NAME")
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
	
	/**
	 * 사용자단 공지사항 썸네일 조회용
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<Attachment> selectNoticeThumbnailList(Connection conn, PageInfo pi){
			
		ArrayList<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNoticeThumbnailList");
	
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
				list.add(new Attachment(rset.getInt("FILE_NO"),
						rset.getInt("REF_BNO"),
						rset.getString("ORIGIN_NAME"),
						rset.getString("CHANGE_NAME"),
						rset.getString("FILE_PATH"),
						rset.getDate("UPLOAD_DATE"),
						rset.getInt("FILE_LEVEL"),
						rset.getString("STATUS"),
						rset.getString("BOARD_LEVEL")
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
	
	public Board selectNotice(Connection conn){
		Board b = new Board();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt= conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board();
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardCategory(rset.getInt("BOARD_CATEGORY"));
				b.setCount(rset.getInt("COUNT"));
				b.setCreateDate(rset.getDate("CREATE_DATE"));
				b.setModifyDate(rset.getDate("MODIFY_DATE"));
				b.setStatus(rset.getString("STATUS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		System.out.println(b);
		return b;
		 
		
		
	}
	
	// 공지사항 키워드 조회
	public int getNoticeKeywordListCount(Connection conn, String noticeKeyword) {
		
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getNoticeKeywordListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, noticeKeyword);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
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

	public ArrayList<Board> noticeKeywordList(Connection conn, String noticeKeyword, PageInfo pi){
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("noticeKeywordList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+noticeKeyword+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("board_no"), rset.getString("board_title"),
						rset.getInt("count"),rset.getDate("create_date"),
						rset.getDate("modify_date"),rset.getString("status")));
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

