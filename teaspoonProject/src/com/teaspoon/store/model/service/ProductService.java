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

	
	/**
	 * @param p --> Product 테이블에 추가할 상품 데이터를 담은 객체
	 * @param list --> Attachment 테이블에 반복문 돌려서 insert할 정보가 담겨있는 객체
	 * @return
	 */
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
	
	/** 관리자 상품전체 리스트 조회용 서비스
	 * @return list  --> 조회할 Product객체가 담긴 리스트
	 */
	public ArrayList<Product> selectProductList(){
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectProductList(conn);
		
		close(conn);
		return list;
	}
	
	/** 사용자 스토어 썸네일 리스트 조회용 서비스
	 * @return  --> 조회할 Product객체가 담긴 리스트
	 */
	public ArrayList<Product> selectCoffeeList(){
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectCoffeeList(conn);
		
		close(conn);
		return list;
	}
}
