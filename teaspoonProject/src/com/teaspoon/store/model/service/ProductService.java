package com.teaspoon.store.model.service;

import static com.teaspoon.common.JDBCTemplate.close;
import static com.teaspoon.common.JDBCTemplate.commit;
import static com.teaspoon.common.JDBCTemplate.getConnection;
import static com.teaspoon.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.teaspoon.board.model.vo.Attachment;
import com.teaspoon.common.PageInfo;
import com.teaspoon.store.model.dao.ProductDao;
import com.teaspoon.store.model.vo.Product;

public class ProductService {
	
	/**
	 *  상품 리스트 총 갯수 조회용 서비스
	 * @return	--> 상품총갯수
	 */
	
	public int getListCount() {
		Connection conn = getConnection();
		
		// 받아오는값 int형이라고 DML아님 SELECT문에서 갯수만뽑아올것임
		int listCount = new ProductDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
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
	public ArrayList<Product> selectProductList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectProductList(conn, pi);
		
		close(conn);
		return list;
	}
	
	/** 사용자 스토어 커피상품 썸네일 리스트 조회용 서비스
	 * @return  --> 조회할 Product객체가 담긴 리스트
	 */
	public ArrayList<Product> selectCoffeeList(){
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectCoffeeList(conn);
		
		close(conn);
		return list;
	}
	
	
	/** 사용자 베스트 상품 리스트 조회용 서비스
	 * @return --> 조회할 Product객체가 담긴 리스트(누적판매개수 순으로 정렬)
	 */
	public ArrayList<Product> selectBestList(){
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectBestList(conn);
		
		close(conn);
		return list;
	}
	
	
	/** 사용자 스토어 아이템상품 썸네일 리스트 조회용 서비스 
	 * @return --> 조회할 Product객체가 담긴 리스트
	 */
	public ArrayList<Product> selectItemList(){
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectItemList(conn);
		
		close(conn);
		return list;
	}
	
	
	/** 관리자 상품 수정용 서비스(상품객체 및 첨부파일 조회)
	 * @param pcode 조회하고자하는 해당 상품코드
	 * @return
	 */
	public Product updateProduct(Product p, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new ProductDao().updateProduct(conn, p);
		int result2 = new ProductDao().updateAttachment(conn, list);
		
		
	}
	
	
	
}
