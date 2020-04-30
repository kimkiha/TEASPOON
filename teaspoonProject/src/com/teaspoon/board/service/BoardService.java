package com.teaspoon.board.service;

import static com.teaspoon.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.teaspoon.board.dao.BoardDao;
import com.teaspoon.board.model.vo.Attachment;
import com.teaspoon.board.model.vo.Board;
import com.teaspoon.common.PageInfo;
public class BoardService {
	// -------------------------------  공통시작    ------------------------------- //
	/**
	 * 1. Board  수정 페이지에 보여줄 content
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
	 * 2. Board 수정 페이지 보여줄 대표이미지
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
	 * 3.Board 수정용
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
				result2 = new BoardDao().insertMagazineNewAttachment(conn, at);
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

	
	/**
	 * 4.Board 삭제용
	 * @param bno
	 * @return
	 */
	public int deleteBoard(int bno) {

		Connection conn = getConnection();
		
		int result = new BoardDao().deleteBoard(conn, bno);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * 5.count용
	 * @param bno
	 * @return
	 */
	public int increaseCount(int bno) {
		Connection conn = getConnection();
		
		int result = new BoardDao().increaseCount(conn, bno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	// -------------------------------  매거진시작    ------------------------------- //
	/**
	 * 1_1. 매거진 작성용 서비스
	 * @param b  --> Board 테이블에 insert할 데이터가 담겨있는 객체
	 * @return	 --> 성공한 행 갯수
	 */
	public int insertMagazine(Board b, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new BoardDao().insertMagazine(conn, b);
		int result2 = new BoardDao().insertMagazineAttachemnt(conn, at);
		
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
	 * 2.매거진 사용자단 대표이미지 리스트 조회용
	 * @param pi
	 * @return
	 */
	public ArrayList<Attachment> selectMagazineThumbnailList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Attachment> atlist = new BoardDao().selectMagazineThumbnailList(conn, pi);
		
		close(conn);
		
		return atlist;
	}
	
	// 매거진 키워드검색
	public int getMagazineKeywordListCount(String magazineKeyword) {
			Connection conn = getConnection();
			int listCount = new BoardDao().getMagazineKeywordListCount(conn,magazineKeyword);
			
			close(conn);
			return listCount;
	}
		
	public ArrayList<Board> selectMagazineKeywordList(String magazineKeyword, PageInfo pi){
			Connection conn = getConnection();
			ArrayList<Board> list = new BoardDao().selectMagazineKeywordList(conn, magazineKeyword, pi);
			
			close(conn);
			return list;
			
	}
	
	/**
	 * 3_1.매거진 디테일 이전글 페이지 정보
	 * @param bno
	 * @return
	 */
	public Board preSelectBoard(int bno){
		Connection conn = getConnection();
		
		Board b = new BoardDao().preSelectBoard(conn, bno);
		
		close(conn);
		return b;
	}
	
	/**
	 * 3_2.매거진 디테일 다음글 페이지 정보
	 * @param bno
	 * @return
	 */
	public Board nextSelectBoard(int bno){
		Connection conn = getConnection();
		
		Board b = new BoardDao().nextSelectBoard(conn, bno);
		
		close(conn);
		return b;
	}
	
	// -------------------------------  이벤트시작    ------------------------------- //
	/**
	 * 1_1. 이벤트 작성용 서비스
	 * @param b  --> Board 테이블에 insert할 데이터가 담겨있는 객체
	 * @return	 --> 성공한 행 갯수
	 */
	public int insertEvent(Board b, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new BoardDao().insertEvent(conn, b);
		int result2 = new BoardDao().insertEventAttachemnt(conn, at);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}
		
	/**
	 * 1-2. 이벤트 리스트 총 갯수 조회용 서비스
	 * @return
	 */
	public int getEventListCount() {
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
	public ArrayList<Board> selectEventList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectEventList(conn, pi);
		close(conn);
		
		return list;
	}
	
	/**
	 * 2.이벤트 사용자단 대표이미지 리스트 조회용
	 * @param pi
	 * @return
	 */
	public ArrayList<Attachment> selectEventThumbnailList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Attachment> atlist = new BoardDao().selectEventThumbnailList(conn, pi);
		
		close(conn);
		
		return atlist;
	}
	
	// 이벤트 키워드검색
	public int getEventKeywordListCount(String eventKeyword) {
		Connection conn = getConnection();
		int listCount = new BoardDao().getEventKeywordListCount(conn,eventKeyword);
		
		close(conn);
		return listCount;
	}
	
	public ArrayList<Board> eventKeywordList(String eventKeyword, PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().eventKeywordList(conn, eventKeyword, pi);
		
		close(conn);
		return list;
		
	}
	
	
	public Board selectEvent(int bno) {
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectEvent(conn, bno);
		
		close(conn);
		return b;
	}
	
	
	// -------------------------------  공지사항 시작    ------------------------------- //
	/**
	 * 1_1. 공지사항 작성용 서비스
	 * @param b  --> Board 테이블에 insert할 데이터가 담겨있는 객체
	 * @return	 --> 성공한 행 갯수
	 */
	public int insertNotice(Board b, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new BoardDao().insertNotice(conn, b);
		int result2 = new BoardDao().insertNoticeAttachemnt(conn, at);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}
	
	/**
	 * 1-2. 공지사항 리스트 총 갯수 조회용 서비스
	 * @return
	 */
	public int getNoticeListCount() {
		Connection conn = getConnection();
		
		// 받아오는값 int형이라고 DML아님 SELECT문에서 갯수만뽑아올것임
		int listCount = new BoardDao().getNoticeListCount(conn);
		
		close(conn);

		return listCount;
	}

	/**
	 * 1_3. 해당 페이지에 보여질 공지사항 게시글 리스트 조회용 서비스
	 * @param pi -> 요청한 페이지 currentPage, 한페이지에 보여질 게시글 최대수boardLimit가 담경있는 객체 
	 * @return
	 */
	public ArrayList<Board> selectNoticeList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectNoticeList(conn, pi);
		close(conn);

		return list;
	}
	
	/**
	 * 2.공지사항 사용자단 대표이미지 리스트 조회용
	 * @param pi
	 * @return
	 */
	public ArrayList<Attachment> selectNoticeThumbnailList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Attachment> atlist = new BoardDao().selectNoticeThumbnailList(conn, pi);
		
		close(conn);
		return atlist;
	}
		
	public Board selectNotice(){
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectNotice(conn);
		
		close(conn);
		return b;
	}
	
	// 공지사항 키워드검색
	public int getNoticeKeywordListCount(String noticeKeyword) {
		Connection conn = getConnection();
		int listCount = new BoardDao().getNoticeKeywordListCount(conn,noticeKeyword);
		
		close(conn);
		return listCount;
	}
	
	public ArrayList<Board> noticeKeywordList(String noticeKeyword, PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().noticeKeywordList(conn, noticeKeyword, pi);
		
		close(conn);
		return list;
		
	}
	
	
	
}
