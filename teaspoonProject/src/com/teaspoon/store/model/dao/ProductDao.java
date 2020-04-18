package com.teaspoon.store.model.dao;

import static com.teaspoon.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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


		

}
