package com.teaspoon.store.model.dao;

import static com.teaspoon.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.teaspoon.board.model.vo.Attachment;
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
	
	public ArrayList<Product> selectProductList(Connection conn){
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductList");
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
				list.add(p);	
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
	
	public ArrayList<Product> selectCoffeeList(Connection conn){
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectThumbnailList");
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

		

}
