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
	 * @return	 --> 
	 */
	public int insertBoard(Board b) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertBoard(conn, b);
		
		close(conn);
		
		return result;
	}
	
	public int getMagazineListCount() {
		Connection conn = getConnection();
		
		// 받아오는값 int형이라고 DML아님 SELECT문에서 갯수만뽑아올것임
		int listCount = new BoardDao().getMagazineListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<Board> selectMagazineList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectMagazineList(conn, pi);
		close(conn);
		return list;
	}
	
}
