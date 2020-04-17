package com.teaspoon.member.model.service;

import static com.teaspoon.common.JDBCTemplate.close;
import static com.teaspoon.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.teaspoon.member.model.dao.MemberDao;
import com.teaspoon.member.model.vo.Member;
import com.teaspoon.member.model.vo.PageInfo;

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
	 * 2_2. 해당페이지에 보여질 게시글 리스트 조회용 서비스
	 * @param pi	--> 요청한 페이지, 한페이지 보여질 게시글 최대수가 담겨있는 객체
	 * @return
	 */
	public ArrayList<Member> selectList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectList(conn, pi);
		close(conn);
		return list;
	}
	

	
}
