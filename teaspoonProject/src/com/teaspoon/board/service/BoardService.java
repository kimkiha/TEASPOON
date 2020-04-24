package com.teaspoon.board.service;

import static com.teaspoon.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.teaspoon.board.dao.BoardDao;
import com.teaspoon.board.model.vo.Attachment;
import com.teaspoon.board.model.vo.Board;
import com.teaspoon.common.PageInfo;
public class BoardService {
	
	/**
	 * 1_1. 매거진 작성용 서비스
	 * @param b  --> Board 테이블에 insert할 데이터가 담겨있는 객체
	 * @return	 --> 성공한 행 갯수
	 */
	public int insertBoard(Board b, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new BoardDao().insertBoard(conn, b);
		int result2 = new BoardDao().insertAttachemnt(conn, at);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}
	
	/**
	 * 1-2. 매거진 리스트 총 갯수 조회용 서비스
	 * @return --> 총 게시글 갯수
	 */
	public int getMagazineListCount() {
		Connection conn = getConnection();
		
		// 받아오는값 int형이라고 DML아님 SELECT문에서 갯수만뽑아올것임
		int listCount = new BoardDao().getMagazineListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * 1_3. 해당 페이지에 보여질 매거진 게시글 리스트 조회용 서비스
	 * @param pi -> 요청한 페이지 currentPage, 한페이지에 보여질 게시글 최대수boardLimit가 담경있는 객체 
	 * @return
	 */
	public ArrayList<Board> selectMagazineList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectMagazineList(conn, pi);
		close(conn);
		return list;
	}
	
	/**
	 * 4_1. 매거진  수정 페이지에 보여줄 content
	 * @param bno	--> 해당 수정 글 번호
	 * @param b		--> board객체
	 * @return
	 */
	public Board selectBoard(int bno) {
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectBoard(conn, bno);
		
		close(conn);
		
		return b;
		
		
		
	}
	
	/**
	 * 4_2. 매거진 수정 페이지 보여줄 대표이미지
	 * @param bno -->  해당 수정 글 번호
	 * @return at --> Attachment 객체
	 */
	public Attachment selectAttachment(int bno) {
		Connection conn = getConnection();
		
		Attachment at = new BoardDao().selectAttachment(conn, bno);
		
		close(conn);
		
		return at;
	}
	
	/**
	 * @param b	--> board 테이블 update할 데이터가 담겨있는 객체
	 * @return	 --> 성공한 행 갯수
	 */
	public int updateBoard(Board b, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new BoardDao().updateBoard(conn, b);
		int result2 = 1;
		
		if(at != null) { //새로이 추가된 첨부파일이 있을 경우
			if(at.getFileNo() != 0) { // 기존에 첨부파일이 있었을 경우
				result2 = new BoardDao().updateAttachment(conn, at);
			}else {	// 기존에 첨부파일이 없었을 경우
				result2 = new BoardDao().insertNewAttachment(conn, at);
			}
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}

	public ArrayList<Attachment> selectMagazineThumbnailList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Attachment> atlist = new BoardDao().selectMagazineThumbnailList(conn, pi);
		
		close(conn);
		
		return atlist;
	}
	
	public int deleteBoard(int bno) {
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteBoard(conn, bno);
		
		close(conn);
		
		return result;
	}
	
}
