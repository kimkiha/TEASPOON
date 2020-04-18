package com.teaspoon.store.model.service;

import static com.teaspoon.common.JDBCTemplate.close;
import static com.teaspoon.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.teaspoon.store.model.dao.ProductDao;
import com.teaspoon.store.model.vo.Product;

public class ProductService {
	
	public ArrayList<Product> selectCoffeeList(){
		
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectCoffeeList(conn);
		
		close(conn);
		return list;
		
	}
	
	
	
	

}
