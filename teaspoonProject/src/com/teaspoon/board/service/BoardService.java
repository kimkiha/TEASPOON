package com.teaspoon.board.service;

import static com.teaspoon.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.teaspoon.board.dao.BoardDao;
import com.teaspoon.board.model.vo.Board;
import com.teaspoon.common.PageInfo;
import com.teaspoon.member.model.dao.MemberDao;
import com.teaspoon.member.model.vo.Member;
public class BoardService {
	
	/**
	 * 1_1. 매거진 작성용 서비스
	 * @param b  --> Board 테이블에 insert할 데이터가 담겨있는 객체
	 * @return	 --> 성공한 행 갯수
	 */
	public int insertBoard(Board b) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertBoard(conn, b);
		
		close(conn);
		
		return result;
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
	 * 4. 일반 게시판 수정용 서비스
	 * @param b		--> board 테이블 update할 데이터가 담겨있는 객체
	 * @param at	--> Attachment 테이블에 update 또는 insert할 데이터가 담겨있는 객체 (첨부파일 없을 경우 null)
	 * @return
	 */
	public Board selectBoard(int bno) {
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectBoard(conn, bno);
		
		close(conn);
		
		return b;
		
		
		
	}
	
	/**
	 * @param b	--> board 테이블 update할 데이터가 담겨있는 객체
	 * @return	 --> 성공한 행 갯수
	 */
	public int updateBoard(Board b) {
		Connection conn = getConnection();
		
		int result = new BoardDao().updateBoard(conn, b);
		
		return result;
	}
	
}
