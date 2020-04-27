package com.teaspoon.store.model.dao;

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
import com.teaspoon.store.model.vo.Product;
import com.teaspoon.store.model.vo.Review;

public class ProductDao {
	
	private Properties prop = new Properties();
		
		public ProductDao() {
			String filePath = Product.class.getResource("/sql/store/product-query.properties").getPath();
				try {
					prop.load(new FileReader(filePath));
				} catch (IOException e) {
					e.printStackTrace();
		}
	}
		
		// 관리자 상품 전체조회페이지 서비스 시 페이징바(상품전체갯수)
		public int getListCount(Connection conn) {
			int listCount = 0;

			Statement stmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("getListCount");
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
		
		
	// 관리자 상품 insert
	public int insertProduct(Connection conn, Product p) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, p.getPname());
			pstmt.setInt(2, p.getSupPrice());
			pstmt.setInt(3, p.getPrice());
			pstmt.setInt(4, p.getStock());
			pstmt.setString(5, p.getKeyword());
			pstmt.setString(6, p.getKind());
			pstmt.setString(7, p.getPcontent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;		
	}

	
	// 관리자 상품 insert 시 첨부파일 attachment로 저장
	public int insertAttachment(Connection conn, ArrayList<Attachment> list) {
		int result = 1;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			for(int i=0; i<list.size(); i++) {
				Attachment at = list.get(i);
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				
				if(i==0) { // 대표이미지(레벨이 1)
					pstmt.setInt(4, 1);
				}else {	// 상세이미지(레벨이 2)
					pstmt.setInt(4, 2);
				}
				
				result = pstmt.executeUpdate();
				
				if(result ==0 ) {
					return 0;
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	// 관리자 상품 select ListView구문
	public ArrayList<Product> selectProductList(Connection conn, PageInfo pi){
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductList");
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setPcode(rset.getInt("PCODE"));
				p.setPname(rset.getString("PNAME"));
				p.setSupPrice(rset.getInt("SUP_PRICE"));
				p.setPrice(rset.getInt("PRICE"));
				p.setStock(rset.getInt("STOCK"));
				p.setStatus(rset.getString("STATUS"));
				p.setKeyword(rset.getString("KEYWORD"));
				p.setTotalCount(rset.getInt("TOTAL_COUNT"));
				p.setKind(rset.getString("KIND"));
				p.setPcontent(rset.getString("PCONTENT"));
				list.add(p);	
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	// 사용자 커피 리스트 뷰 페이징 바 (전체 커피상품 갯수)
	public int getCoffeeListCount(Connection conn) {
		int listCount = 0;

		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getCoffeeListCount");
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
	
	
	
	// 사용자 coffeeListView 구문
	public ArrayList<Product> selectCoffeeList(Connection conn, PageInfo pi){
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCoffeeThumbnailList");
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setPcode(rset.getInt("PCODE"));
				p.setPname(rset.getString("PNAME"));
				p.setSupPrice(rset.getInt("SUP_PRICE"));
				p.setPrice(rset.getInt("PRICE"));
				p.setStock(rset.getInt("STOCK"));
				p.setStatus(rset.getString("STATUS"));
				p.setKeyword(rset.getString("KEYWORD"));
				p.setTotalCount(rset.getInt("TOTAL_COUNT"));
				p.setKind(rset.getString("KIND"));
				p.setPcontent(rset.getString("PCONTENT"));
				p.setTitleImg(rset.getString("CHANGE_NAME"));
				list.add(p);	
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	
	// 사용자 storeBest ListView구문
	public ArrayList<Product> selectBestList(Connection conn){
		
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBestThumbnailList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setPcode(rset.getInt("PCODE"));
				p.setPname(rset.getString("PNAME"));
				p.setSupPrice(rset.getInt("SUP_PRICE"));
				p.setPrice(rset.getInt("PRICE"));
				p.setStock(rset.getInt("STOCK"));
				p.setStatus(rset.getString("STATUS"));
				p.setKeyword(rset.getString("KEYWORD"));
				p.setTotalCount(rset.getInt("TOTAL_COUNT"));
				p.setKind(rset.getString("KIND"));
				p.setPcontent(rset.getString("PCONTENT"));
				p.setTitleImg(rset.getString("CHANGE_NAME"));
				list.add(p);	
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	

	// 사용자 아이템 리스트 뷰 페이징 바 (전체 아이템 갯수)
		public int getItemListCount(Connection conn) {
			int listCount = 0;

			Statement stmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("getItemListCount");
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
	
	// 사용자 item ListView구문
	public ArrayList<Product> selectItemList(Connection conn, PageInfo pi){
	
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectItemThumbnailList");
		int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
		int endRow = startRow + pi.getBoardLimit()-1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p  = new Product();
				p.setPcode(rset.getInt("PCODE"));
				p.setPname(rset.getString("PNAME"));
				p.setSupPrice(rset.getInt("SUP_PRICE"));
				p.setPrice(rset.getInt("PRICE"));
				p.setStock(rset.getInt("STOCK"));
				p.setStatus(rset.getString("STATUS"));
				p.setKeyword(rset.getString("KEYWORD"));
				p.setTotalCount(rset.getInt("TOTAL_COUNT"));
				p.setKind(rset.getString("KIND"));
				p.setPcontent(rset.getString("PCONTENT"));
				p.setTitleImg(rset.getString("CHANGE_NAME"));
				list.add(p);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	
	public Product selectProduct(Connection conn, int pcode) {
		
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pcode);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p  = new Product();
				p.setPcode(rset.getInt("PCODE"));
				p.setPname(rset.getString("PNAME"));
				p.setSupPrice(rset.getInt("SUP_PRICE"));
				p.setPrice(rset.getInt("PRICE"));
				p.setStock(rset.getInt("STOCK"));
				p.setStatus(rset.getString("STATUS"));
				p.setKeyword(rset.getString("KEYWORD"));
				p.setTotalCount(rset.getInt("TOTAL_COUNT"));
				p.setKind(rset.getString("KIND"));
				p.setPcontent(rset.getString("PCONTENT"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}
	
	
	public ArrayList<Attachment> selectAttachment(Connection conn, int pcode){
		
		ArrayList<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pcode);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setOriginName(rset.getString("origin_name"));
				at.setChangeName(rset.getString("change_name"));
				list.add(at);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		//System.out.println(list);
		return list;
		
	}
	
	
	
	// 관리자 상품 수정용 서비스(상품객체 및 첨부파일 조회-업데이트 전 폼에 값을 불러온다)
	public int updateProduct(Connection conn, Product p) {
		 int result = 0;
		 PreparedStatement pstmt = null;
		 String sql = prop.getProperty("updateProduct");
		 
		 try {
			pstmt  = conn.prepareStatement(sql);
			pstmt.setString(1, p.getPname());
			pstmt.setInt(2, p.getSupPrice());
			pstmt.setInt(3, p.getPrice());
			pstmt.setInt(4, p.getStock());
			pstmt.setString(5, p.getKeyword());
			pstmt.setString(6, p.getKind());
			pstmt.setString(7,p.getPcontent());
			pstmt.setInt(8, p.getPcode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
//	
//	public int updateAttachment(Connection conn, ArrayList<Attachment> list) {
//		int result = 1;
//		PreparedStatement pstmt = null;
//		String sql = prop.getProperty("updateAttachment");
//		
//		try {
//			for(int i=0; i<list.size(); i++) {
//				Attachment at = list.get(i);
//				pstmt = conn.prepareStatement(sql);
//				
//				pstmt.setString(1, at.getChangeName());
//				pstmt.setString(2, at.getOriginName());
//				pstmt.setString(3, at.getFilePath());
//				pstmt.setInt(4, at.getFileNo());
//				
//				result = pstmt.executeUpdate();
//				
//				if(result == 0 ) {
//					return 0;
//				}
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//		return result;
//		
//	}
//	
//	
//	public int insertNewAttachment(Connection conn, ArrayList<Attachment> list) {
//		int result = 1;
//		PreparedStatement pstmt = null;
//		String sql = prop.getProperty("insertNewAttachment");
//		
//		try {
//			for(int i=0; i<list.size(); i++) {
//				Attachment at = list.get(i);
//				
//				pstmt = conn.prepareStatement(sql);
//				
//				pstmt.setInt(1, at.getRefBoardNo());
//				pstmt.setString(2, at.getOriginName());
//				pstmt.setString(3, at.getChangeName());
//				pstmt.setString(4, at.getFilePath());
//				
//				if(i==0) { // 대표이미지(레벨이 1)
//					pstmt.setInt(4, 1);
//				}else {	// 상세이미지(레벨이 2)
//					pstmt.setInt(4, 2);
//				}
//				
//				result = pstmt.executeUpdate();
//				
//				if(result == 0 ) {
//					return 0;
//				}
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//		return result;
//		
//	}
	

	public int updateAttachment(Connection conn, Attachment at) {
		int result = 1;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getChangeName());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
			
			result = pstmt.executeUpdate();
				
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	
	public int insertNewAttachment(Connection conn, Attachment at) {
		int result = 1;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, at.getRefBoardNo());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			pstmt.setInt(5, at.getFileLevel());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	// 사용자 상품 디테일 페이지에서 첨부파일 불러오는 서비스
	public ArrayList<Attachment> selectAtList(Connection conn, int pcode) {
		ArrayList<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pcode);
			rset = pstmt.executeQuery();

			while(rset.next()) {
				Attachment at = new Attachment();
				at.setFileNo(rset.getInt("file_no"));
				at.setOriginName(rset.getString("origin_name"));
				at.setChangeName(rset.getString("change_name"));
	
				list.add(at);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	
	// 관리자 리뷰 전체 조회 시 페이징바 (리뷰 전체 갯수)
	public int getReviewListCount(Connection conn) {
		int listCount = 0;

		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getReviewListCount");

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
	
	
	// 사용자 리뷰 전체 조회시 서비스
	public ArrayList<Review> selectReviewList(Connection conn, int pcode){
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
	
		String sql = prop.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pcode);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review r  = new Review();
				r.setReviewNo(rset.getInt("review_no"));
				r.setPcode(rset.getInt("pcode"));
				r.setUserNo(rset.getInt("user_no"));
				r.setContent(rset.getString("content"));
				r.setCreateDate(rset.getDate("create_date"));
				r.setUserId(rset.getString("RPAD(SUBSTR(USER_ID,1,3),5,'*')"));
				r.setUserName(rset.getString("RPAD(SUBSTR(USER_NAME,1,1),3,'*')"));
				r.setPname(rset.getString("pname"));
				
				list.add(r);
			} 
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 사용자 리뷰 전체 조회시 서비스
	public ArrayList<Review> selectAddReviewList(Connection conn,int addReview,int pcode){
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
	
		String sql = prop.getProperty("selectAddReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pcode);
			pstmt.setInt(2, addReview);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review r  = new Review();
				r.setReviewNo(rset.getInt("review_no"));
				r.setPcode(rset.getInt("pcode"));
				r.setUserNo(rset.getInt("user_no"));
				r.setContent(rset.getString("content"));
				r.setCreateDate(rset.getDate("create_date"));
				r.setUserId(rset.getString("RPAD(SUBSTR(USER_ID,1,3),5,'*')"));
				r.setUserName(rset.getString("RPAD(SUBSTR(USER_NAME,1,1),3,'*')"));
				r.setPname(rset.getString("pname"));
				
				list.add(r);
			} 
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
		
		// 관리자 리뷰 전체 조회시 서비스
		public ArrayList<Review> selectProductReviewList(Connection conn, PageInfo pi){
			ArrayList<Review> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
		
			String sql = prop.getProperty("selectProductReviewList");
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit()-1;
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Review r  = new Review();
					r.setReviewNo(rset.getInt("review_no"));
					r.setPcode(rset.getInt("pcode"));
					r.setUserNo(rset.getInt("user_no"));
					r.setContent(rset.getString("content"));
					r.setCreateDate(rset.getDate("create_date"));
					r.setUserId(rset.getString("user_id"));
					r.setUserName(rset.getString("user_name"));
					r.setPname(rset.getString("pname"));
					
					list.add(r);
				} 
			}catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return list;
		}
		
		
	// 관리자 리뷰 상세조회 서비스
	public Review selectReviewDetail(Connection conn, int reviewNo) {
		Review r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new Review();
				r.setReviewNo(rset.getInt("review_no"));
				r.setPname(rset.getString("pname"));
				r.setUserName(rset.getString("user_name"));
				r.setUserId(rset.getString("user_id"));
				r.setCreateDate(rset.getDate("create_date"));
				r.setContent(rset.getString("content"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return r;
	}
	
	public ArrayList<Review> selectProductReview(Connection conn, int pcode){
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pcode);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review r  = new Review();
				r.setReviewNo(rset.getInt("review_no"));
				r.setUserId(rset.getString("user_id"));
				r.setUserName(rset.getString("user_name"));
				r.setContent(rset.getString("content"));
				r.setCreateDate(rset.getDate("create_date"));
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public int deleteReview(Connection conn, int reviewNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 관리자페이지 상품삭제
	public int deleteProduct(Connection conn, int pcode) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pcode);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 사용자 상품상세 하단 리뷰작성 서비스
	public int insertReview(Connection conn, Review r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, r.getPcode());
			pstmt.setInt(2, r.getUserNo());
			pstmt.setString(3, r.getContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	// 관리자 상품 키워드검색 서비스 
	public int getProductKeywordListCount(Connection conn, String productKeyword) {
		
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getProductKeywordListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productKeyword);
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

	public ArrayList<Product> selectProductKeywordList(Connection conn, String productKeyword, PageInfo pi){
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductKeywordList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+productKeyword+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Product(rset.getInt("pcode"), rset.getString("pname"),
						rset.getInt("sup_price"),rset.getInt("price"),
						rset.getInt("stock"),rset.getString("status"),
						rset.getString("keyword"),rset.getInt("total_count"),
						rset.getString("kind"),rset.getString("pcontent")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	// 관리자 리뷰 키워드검색 서비스 
	public int getReviewKeywordListCount(Connection conn, String reviewKeyword) {
		
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getReviewKeywordListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reviewKeyword);
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

	public ArrayList<Review> selectReviewKeywordList(Connection conn, String reviewKeyword, PageInfo pi){
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewKeywordList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+reviewKeyword+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Review(rset.getInt("REVIEW_NO"), rset.getString("pname"),
						rset.getString("USER_ID"),rset.getDate("CREATE_DATE"),
						rset.getString("CONTENT")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	
	public int selectOptionCode(Connection conn,String optionGram,String optionGrind) {
		int optionCode = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOptionCode");
		//System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, optionGram);
			pstmt.setString(2, optionGrind);
			rset = pstmt.executeQuery();

			if (rset.next()) { // 컬럼인덱스로 추출
				optionCode = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	
		return optionCode;
	}		
	
	
	public int insertPdetailNo(Connection conn,int cartPcode,int optionCode) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPdetailNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setInt(1, cartPcode);
			pstmt.setInt(2, optionCode);
		
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;		
	}
	
	public int insertOrderBy(Connection conn,int userNo,int pCount) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertOrderBy");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2,pCount);
//			System.out.println(userNo);
//			System.out.println(pCount);
//			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;		
	}

}
