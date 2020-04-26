package com.teaspoon.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.teaspoon.member.model.service.MemberService;
import com.teaspoon.member.model.vo.Member;

/**
 * Servlet implementation class MemberIdFindServlet
 */
@WebServlet("/idfind.me")
public class MemberIdFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberIdFindServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	/*
	 * // 1.전달값중에 한글이 있을 경우를 대비해서 인코딩 작업 필수 request.setCharacterEncoding("utf-8");
	 * 
	 * // 2. request에 담겨있는 요청시 전달값 뽑아서 변수 또는 객체에
	 * 기록하기(getParameter/getParameterValues) String email =
	 * request.getParameter("email"); // 퍼스트넘버
	 * 
	 * 
	 * HttpSession Session = request.getSession(); String
	 * userId=((Member)Session.getAttribute("loginUser")).getUserId(); // userId로
	 * 가져오기
	 * 
	 * // 회원이 입력한 이메일에 맞는 아이디값 가져오기!!!!
	 * 
	 * 
	 * Member m = new Member(); m.setUserId(userId); m.setEmail(email);
	 * System.out.println(userId); System.out.println(email);
	 * 
	 * int result = new MemberService().idfindMember(email);
	 * 
	 * if(result>0 ) { // 이메일 인증 성공시
	 * 
	 * // 갱신된 회원 정보 조회 --> 세션에 담겨있는 기존의 loginUser을 갱신해주어야함 //Member updateUser = new
	 * MemberService().selectMember(userId);
	 * 
	 * HttpSession session = request.getSession();
	 * 
	 * response.sendRedirect("idComplete.me"); // memberModifyComplete.me url로 요청
	 * 
	 * }else { // 이메일 인증 실페시
	 * 
	 * request.setAttribute("msg", "회원인증실패!"); RequestDispatcher view =
	 * request.getRequestDispatcher("views/common/errorPage.jsp");
	 * view.forward(request, response); }
	 * 
	 * }
	 * 
	 * 
	 * 
	 * 
	 */
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
