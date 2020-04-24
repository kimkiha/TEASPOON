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
import com.teaspoon.store.model.vo.Review;

public class ProductService {

	/**
	 * 상품 리스트 총 갯수 조회용 서비스
	 * 
	 * @return --> 상품총갯수
	 */

	public int getListCount() {
		Connection conn = getConnection();

		// 받아오는값 int형이라고 DML아님 SELECT문에서 갯수만뽑아올것임
		int listCount = new ProductDao().getListCount(conn);

		close(conn);

		return listCount;
	}

	/**
	 * @param p    --> Product 테이블에 추가할 상품 데이터를 담은 객체
	 * @param list --> Attachment 테이블에 반복문 돌려서 insert할 정보가 담겨있는 객체
	 * @return
	 */
	public int insertProduct(Product p, ArrayList<Attachment> list) {

		Connection conn = getConnection();

		int result1 = new ProductDao().insertProduct(conn, p);
		int result2 = new ProductDao().insertAttachment(conn, list);

		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;

	}

	/**
	 * 관리자 상품전체 리스트 조회용 서비스
	 * 
	 * @return list --> 조회할 Product객체가 담긴 리스트
	 */
	public ArrayList<Product> selectProductList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectProductList(conn, pi);

		close(conn);
		return list;
	}

	/**
	 * 사용자 커피제품 리스트 총 갯수 조회용 서비스
	 * 
	 * @return --> 상품총갯수
	 */

	public int getCoffeeListCount() {
		Connection conn = getConnection();
		int listCount = new ProductDao().getCoffeeListCount(conn);

		close(conn);
		return listCount;
	}

	/**
	 * 사용자 스토어 커피상품 썸네일 리스트 조회용 서비스
	 * 
	 * @return --> 조회할 Product객체가 담긴 리스트
	 */
	public ArrayList<Product> selectCoffeeList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectCoffeeList(conn, pi);

		close(conn);
		return list;
	}

	/**
	 * 사용자 베스트 상품 리스트 조회용 서비스
	 * 
	 * @return --> 조회할 Product객체가 담긴 리스트(누적판매개수 순으로 정렬)
	 */
	public ArrayList<Product> selectBestList() {
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectBestList(conn);

		close(conn);
		return list;
	}

	/**
	 * 사용자 아이템 리스트 총 갯수 조회용 서비스
	 * 
	 * @return --> 상품총갯수
	 */

	public int getItemListCount() {
		Connection conn = getConnection();
		int listCount = new ProductDao().getItemListCount(conn);

		close(conn);
		return listCount;
	}

	/**
	 * 사용자 스토어 아이템상품 썸네일 리스트 조회용 서비스
	 * 
	 * @return --> 조회할 Product객체가 담긴 리스트
	 */
	public ArrayList<Product> selectItemList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectItemList(conn, pi);

		close(conn);
		return list;
	}

	/**
	 * 관리자 상품 수정용 폼 조회서비스(2개)
	 * 
	 * @param pcode 조회하고자하는 해당 상품코드
	 * @return
	 */
	public Product selectProduct(int pcode) {
		Connection conn = getConnection();
		Product p = new ProductDao().selectProduct(conn, pcode);

		close(conn);
		return p;
	}

	public ArrayList<Attachment> selectAttachment(int pcode) {
		Connection conn = getConnection();
		ArrayList<Attachment> list = new ProductDao().selectAttachment(conn, pcode);

		close(conn);
		return list;
	}

	/**
	 * 관리자 상품 수정용 서비스
	 * 
	 * @param p
	 * @param list
	 * @return
	 */
	public int updateProduct(Product p, ArrayList<Attachment> list) {
		Connection conn = getConnection();

		int result1 = new ProductDao().updateProduct(conn, p);
		int result2 = 1;

		for(int i=0; i<list.size(); i++) {
			Attachment at = list.get(i);
			
			if(at.getRefBoardNo() != 0) { // 기존에 첨부파일이 없을 경우 --> inssert
				result2 += new ProductDao().insertNewAttachment(conn, at);
			}else {// 기존에 첨부파일이 있을 경우 --> update 
				result2 += new ProductDao().updateAttachment(conn, at);
			}
		}
		
		//if (!list.isEmpty()) { // 기존 첨부파일이 있을경우 --> update
		//	result2 = new ProductDao().updateAttachment(conn, list);
		//} else { // 기존 첨부파일이 없을경우 --> insert
		//	result2 = new ProductDao().insertNewAttachment(conn, list);
		//} 

		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		return result1 * result2;
	}

	/**
	 * 사용자 상품 디테일 페이지에서 첨부파일 불러오는 서비스
	 * 
	 * @param pcode
	 * @return
	 */
	public ArrayList<Attachment> selectAtList(int pcode) {
		Connection conn = getConnection();
		ArrayList<Attachment> list = new ProductDao().selectAtList(conn, pcode);

		close(conn);
		return list;
	}

	/**
	 * 상품 리스트 총 갯수 조회용 서비스
	 * 
	 * @return --> 상품총갯수
	 */

	public int getReviewListCount() {
		Connection conn = getConnection();

		// 받아오는값 int형이라고 DML아님 SELECT문에서 갯수만뽑아올것임
		int listCount = new ProductDao().getReviewListCount(conn);

		close(conn);

		return listCount;
	}

	/**
	 * 사용자 상품 리뷰 전체조회용 서비스
	 * 
	 * @param pi
	 * @return
	 */
	public ArrayList<Review> selectReviewList(int pcode) {
		Connection conn = getConnection();
		ArrayList<Review> list = new ProductDao().selectReviewList(conn, pcode);

		close(conn);
		return list;
	}

	/**
	 * 사용자 상품상세 조회시 리뷰 3개씩 더보기 기능
	 * 
	 * @param addReview
	 * @return
	 */
	public ArrayList<Review> selectAddReviewList(int addReview,int pcode) {
		Connection conn = getConnection();
		ArrayList<Review> list = new ProductDao().selectAddReviewList(conn, addReview,pcode);

		close(conn);
		return list;
	}

	/**
	 * 관리자 상품 리뷰 전체조회용 서비스
	 * 
	 * @param pi
	 * @return
	 */
	public ArrayList<Review> selectProductReviewList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Review> list = new ProductDao().selectProductReviewList(conn, pi);

		close(conn);
		return list;
	}

	/**
	 * 관리자 리뷰 상세조회 서비스
	 * 
	 * @param reviewNo 상세조회하고자하는 리뷰의 번호
	 * @return
	 */
	public Review selectReviewDetail(int reviewNo) {
		Connection conn = getConnection();
		Review r = new ProductDao().selectReviewDetail(conn, reviewNo);

		close(conn);
		return r;
	}

	/**
	 * 사용자 상품상세 조회시 리뷰 조회 서비스
	 * 
	 * @param pcode
	 * @return
	 */
	public ArrayList<Review> selectProductReview(int pcode) {
		Connection conn = getConnection();
		ArrayList<Review> list = new ProductDao().selectProductReview(conn, pcode);

		close(conn);
		return list;
	}

	/**
	 * 관리자 리뷰 삭제 서비스
	 * 
	 * @param reviewNo 삭제할 리뷰번호
	 * @return
	 */
	public int deleteReview(int reviewNo) {
		Connection conn = getConnection();
		int result = new ProductDao().deleteReview(conn, reviewNo);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public int deleteProduct(int pcode) {
		Connection conn = getConnection();
		int result = new ProductDao().deleteProduct(conn, pcode);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

}
