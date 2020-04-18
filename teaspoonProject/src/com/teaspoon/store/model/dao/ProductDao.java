package com.teaspoon.store.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

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
	
	
	public ArrayList<Product> selectCoffeeList(Connection conn){
		
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCoffeeList");
		
		
	} 

}
