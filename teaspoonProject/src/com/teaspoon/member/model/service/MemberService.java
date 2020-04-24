package com.teaspoon.member.model.service;

import static com.teaspoon.common.JDBCTemplate.close;
import static com.teaspoon.common.JDBCTemplate.commit;
import static com.teaspoon.common.JDBCTemplate.getConnection;
import static com.teaspoon.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.teaspoon.board.model.vo.Attachment;
import com.teaspoon.common.PageInfo;
import com.teaspoon.member.model.dao.MemberDao;
import com.teaspoon.member.model.vo.Grade;
import com.teaspoon.member.model.vo.Member;
import com.teaspoon.member.model.vo.MenToMen;
import com.teaspoon.store.model.vo.Product;

public class MemberService {

	/**
	 * 1.로그인용 서비스
	 * @param userId  --> 사용자가 입력한 아이디
	 * @param userPwd --> 사용자가 입력한 비밀번호
	 * @return 조회된 회원정보가 담겨있는 member객체
	 */
	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		
		Member loginUser = new MemberDao().loginMember(conn,userId,userPwd);
		
		close(conn);
		
		return loginUser;
	}
	
	/**
	 * 2_1. 관리자회원명단 리스트 총 갯수 조회용 서비스
	 * @return	--> 회원명단 총 인원수
	 */
	public int getListCount() {
		Connection conn = getConnection();
		
		// 받아오는값 int형이라고 DML아님 SELECT문에서 갯수만뽑아올것임
		int listCount = new MemberDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * 2_2. 관리자 멤버현황페이지에 보여질 게시글 리스트 조회용 서비스
	 * @param pi	--> 요청한 페이지, 한페이지 보여질 게시글 최대수가 담겨있는 객체
	 * @return
	 */
	public ArrayList<Member> selectList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectList(conn, pi);
		close(conn);
		return list;
	}
	/**
	 * 3_1. 마이페이지 1:1리스트 총갯수 조회용 서비스
	 * @return 내1:1문의글 카운트갯수
	 */
	public int getQnaListCount(int userNo) {
		Connection conn = getConnection();
		
		// 받아오는값 int형이라고 DML아님 SELECT문에서 갯수만뽑아올것임
		int listCount = new MemberDao().getQnaListCount(conn,userNo);
		
		close(conn);
		
		return listCount;
	}
	
	
	/**
	 * 3_2. 마이페이지 1:1qna 리스트 조회용
	 * @return
	 */
	public ArrayList<Member> selectMyQnaList(PageInfo pi,int userNo) {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectMyQnaList(conn, pi,userNo);
		
		close(conn);
		
		return list;
	}
	
	
	/**
	 * 관리자 멤버현황 아이디로 검색시 총갯수 카운트
	 * @return
	 */
	public int getSearchListCount(String searchId) {
		Connection conn = getConnection();
		
		// 받아오는값 int형이라고 DML아님 SELECT문에서 갯수만뽑아올것임
		int listCount = new MemberDao().getSearchListCount(conn,searchId);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 *  관리자 멤버현황페이지에 보여질 게시글 아이디 검색 리스트 조회용 서비스
	 * @param pi	--> 요청한 페이지, 한페이지 보여질 게시글 최대수가 담겨있는 객체
	 * @return
	 */
	public ArrayList<Member> selectSearchList(String searchId,PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectSearchList(conn,searchId, pi);
		close(conn);
		return list;
	}
	
	
	/**
	 * 마이페이지용 상단 메뉴바
	 * @param userNo -->유저 번호가 담겨있다
	 * @return  이름,등급,쿠폰,위시리스트,포인트 값이 담겨있다
	 */
	public Member MyPageInfo(int userNo) {
		Connection conn = getConnection();
		
		Member myInfo =new MemberDao().MyPageInfo(conn,userNo);
		
		close(conn);
		return myInfo;
	}
	
	
	 /** 등급현황 페이지에 보일 등급 객체조회 서비스
	 * @return
	 */
	public ArrayList<Grade> selectGradeList(){
		Connection conn = getConnection();
		
		ArrayList<Grade> list = new MemberDao().selectGradeList(conn);
		close(conn);
		return list;
	}
	
	public int getSearchKeywordListCount(String searchKeyword1,String searchKeyword2) {
		Connection conn = getConnection();
		
		// 받아오는값 int형이라고 DML아님 SELECT문에서 갯수만뽑아올것임
		int listCount = new MemberDao().getSearchKeywordListCount(conn,searchKeyword1,searchKeyword2);
		
		close(conn);
		
		return listCount;
	}
	
	
	/**
	 *  관리자 멤버현황페이지에 키워드조회시 보여질 게시글  리스트 조회용 서비스
	 * @param pi	--> 요청한 페이지, 한페이지 보여질 게시글 최대수가 담겨있는 객체
	 * @return
	 */
	public ArrayList<Member> selectSearchKeywordList(String searchKeyword1,String searchKeyword2,PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectSearchKeywordList(conn,searchKeyword1,searchKeyword2, pi);
		close(conn);
		return list;
	}
	
	/**
	 *  회원가입용 서비스
	 * @param m 회원가입폼에서 입력한 값들이 담겨있는 Member 객체
	 * @return 처리된 행의 갯수
	 */
	public int insertMember(Member m) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
			
		}
		
		close(conn);
		
		return result;
		
	}
	

	/**
	 * 회원정보 수정용 서비스
	 * @param userId		--> 수정요청한 회원아이디와, 변경할 내용들이 담겨있는 Member 객체
	 * @return		--> 처리된 행의 갯수
	 */
	public int updateMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn, m);
		
		if(result>0) {
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	}
	
	/**
	 * 회원 재 조회용 서비스
	 * @param userId		--> 다시 조회하고자 하는 회원 아이디
	 * @return				--> 조회된 정보들이 담겨있는 Member 객체
	 */
	public Member selectMember(String userid) {
		
		Connection conn = getConnection();
		
		Member updateUser = new MemberDao().selectMember(conn, userid);
		
		close(conn);
		
		return updateUser;
		
	}

	public int getSearchAllStatusListCount(String searchKeyword2) {
		Connection conn = getConnection();
		
		// 받아오는값 int형이라고 DML아님 SELECT문에서 갯수만뽑아올것임
		int listCount = new MemberDao().getSearchAllStatusListCount(conn,searchKeyword2);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 *  관리자 멤버현황페이지에 전체회원 등급조회시 보여질 게시글  리스트 조회용 서비스
	 * @param pi	--> 요청한 페이지, 한페이지 보여질 게시글 최대수가 담겨있는 객체
	 * @return
	 */
	public ArrayList<Member> selectAllStatusList(String searchKeyword2,PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectAllStatusList(conn,searchKeyword2, pi);
		close(conn);
		return list;
	}
	
	
	public int getSearchAllGradeListCount(String searchKeyword1) {
		Connection conn = getConnection();
		
		// 받아오는값 int형이라고 DML아님 SELECT문에서 갯수만뽑아올것임
		int listCount = new MemberDao().getSearchAllGradeListCount(conn,searchKeyword1);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 *  관리자 멤버현황페이지에 전체등급 회원조회시 보여질 게시글  리스트 조회용 서비스
	 * @param pi	--> 요청한 페이지, 한페이지 보여질 게시글 최대수가 담겨있는 객체
	 * @return
	 */
	public ArrayList<Member> selectAllGradeList(String searchKeyword1,PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectAllGradeList(conn,searchKeyword1, pi);
		close(conn);
		return list;
	}
	
	/**
	 *  1:1문의 작성하기
	 * @param m db에 넣을 파일이 담겨있다
	 * @param at 이미지 파일이 담겨있다
	 * @return
	 */
	public int insertMtm(MenToMen m, Attachment at) {
		
		Connection conn = getConnection();
		
		int result1 = new MemberDao().insertMtm(conn, m);
		int result2 = 1; // 초기값 1 주기 중요함 
		
		if(at != null) { 
			result2 = new MemberDao().insertAttachment(conn,at); 
		}
		
		if(result1>0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result1*result2;
	}
	/**
	 *     1:1문의 상세조회용 서비스(게시판정보)
	 * @param uno >>조회하고자하는 해당 게시글 번호
	 * @return    
	 */
	public MenToMen selectMtm(int mno) {
		Connection conn= getConnection();
		
		MenToMen m = new MemberDao().selectMtm(conn,mno);
		close(conn);
		return m;
	}
	
	
	/**
	 *     1:1 문의 게시판 상세조회용 서비스(첨부파일 정보)
	 * @param uno      -->조회하고자하는 해당게시글 번호
	 * @return
	 */
	public Attachment selectAttachment(int uno) {
		Connection conn = getConnection();
		
		Attachment at = new MemberDao().selectAttachment(conn,uno);
		
		close(conn);
		return at;
		
	}
	
	public int insertGrade(Grade grade) {
		
		Connection conn = getConnection();
		int result = new MemberDao().insertGrade(conn,grade);
		
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
		public int updateMemberGrade(Grade grade, ArrayList<Grade> gList) {
		
		Connection conn = getConnection();
		int addGradeCode=0;
		String nextG="";
		for(int i=0; i<gList.size(); i++) {
			if(grade.getGradeName().equals(gList.get(i).getGradeName())){
				nextG=gList.get(i+1).getGradeName();
				addGradeCode=gList.get(i).getGradeCode();
			}
		}
		int result = new MemberDao().updateMemberGrade(conn,grade,nextG,addGradeCode);
		
		
		
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
		
		public int updateMemberMaxGrade(Grade grade, ArrayList<Grade> gList) {
			
			Connection conn = getConnection();
			int addGradeCode = gList.get(gList.size()-1).getGradeCode();
			
			int result = new MemberDao().updateMemberMaxGrade(conn,grade,addGradeCode);
			
			
			
			
			if(result>0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			
			return result;
		}

	/**
	 * 아이디 중복체크용 서비스
	 * @param userId	--> 중복확인하고자 하는 사용자가 입력한 아이디값
	 * @return			--> 해당 아이디와 일치하는 갯수
	 */
	public int idCheck(String userId) {
		Connection conn = getConnection();
		
		int count = new MemberDao().idCheck(conn, userId);
		
		close(conn);
		
		return count;
		
	}
	
	// 상품 페이지에서 위시리스트로 상품 삽입
	public int insertWish(int pcode, int userNo) {
		Connection conn = getConnection();
		int result = new MemberDao().insertWish(conn, pcode, userNo);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
	// 해당 유저의 위시리스트 목록 불러오기 
	public ArrayList<Product> selectWishList(int pcode){
		Connection conn = getConnection();
		ArrayList<Product> list = new MemberDao().selectWishList(conn, pcode);
		
		close(conn);
		return list;
	}
	
	
	// 위시리스트 중복검사
	public int selectOneWishList(int pcode, int userNo) {
		Connection conn = getConnection();
		int count = new MemberDao().selectOneWishList(conn, pcode, userNo);
		
		close(conn);
		return count;
	}
	
	// 위시리스트 삭제
	public int deleteWish(int pcode, int userNo) {
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteWish(conn, userNo, pcode);
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int updateMtm(String[] mno) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMtm(conn,mno);
		
		close(conn);
		
		return result;
	}
	
	public int updateGrade(Grade g) {
		Connection conn = getConnection();
		int result = 0;
		
			result = new MemberDao().updateGrade(conn,g);

		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
}
