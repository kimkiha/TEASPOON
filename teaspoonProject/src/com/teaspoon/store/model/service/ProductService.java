package com.teaspoon.store.model.service;

import static com.teaspoon.common.JDBCTemplate.close;
import static com.teaspoon.common.JDBCTemplate.commit;
import static com.teaspoon.common.JDBCTemplate.getConnection;
import static com.teaspoon.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.teaspoon.store.model.dao.ProductDao;
import com.teaspoon.board.model.vo.Attachment;
import com.teaspoon.store.model.vo.Product;

public class ProductService {

	
	public int insertProduct(Product p, ArrayList<Attachment> list) {
		
		Connection conn = getConnection();
		
		int result1 = new ProductDao().insertProduct(conn, p);
		int result2 = new ProductDao().insertAttachment(conn, list);
		
		if(result1>0 && result2>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
		
	}
}
