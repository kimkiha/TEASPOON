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
import com.teaspoon.common.PageInfo;
import com.teaspoon.store.model.vo.Product;

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
		
		
		public int getListCount(Connection conn) {
			int listCount = 0;

			Statement stmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("getListCount");
			System.out.println(sql);
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
	
	
	// 사용자 coffeeListView 구문
	public ArrayList<Product> selectCoffeeList(Connection conn){
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCoffeeThumbnailList");
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
	

	
	// 사용자 item ListView구문
	public ArrayList<Product> selectItemList(Connection conn){
	
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectItemThumbnailList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
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
		System.out.println(list);
		return list;
		
	}
	
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
//	
//		
//		
//	}
//	
//	
//	public int insertNewAttachment(Connection conn, ArrayList<Attachment> list) {
//		
//		
//	}

}
