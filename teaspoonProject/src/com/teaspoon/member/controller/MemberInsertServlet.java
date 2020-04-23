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
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/insert.me")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 1.전달값중에 한글이 있을 경우를 대비해서 인코딩 작업 필수
		request.setCharacterEncoding("utf-8");
		
		// 2. request에 담겨있는 요청시 전달값 뽑아서 변수 또는 객체에 기록하기(getParameter/getParameterValues)
		String userName = request.getParameter("username");							// 이름
		int birthday = Integer.parseInt(request.getParameter("birthday"));			// 생년월일
		String gender = request.getParameter("gender");								// 성별
		String firstnumber = request.getParameter("firstnumber");					// 퍼스트넘버
		String phone = request.getParameter("phonenum");							// 전화번호
		String userId = request.getParameter("UserId");								// 아이디
		String userPwd = request.getParameter("UserPwd1");							// 패스워드
		String email = request.getParameter("Email");								// 이메일
		
		
		System.out.println("username : " + userName);
		System.out.println("birthday : " + birthday);
		System.out.println("gender : " + gender);
		System.out.println("firstnumber : " + firstnumber);
		System.out.println("phonenum : " + phone);
		System.out.println("userId : " + userId); 
		System.out.println("userPwd : " + userPwd); 
		System.out.println("email : " + email); 
		
		
		
		String ph = firstnumber + "-" + phone.substring(0,4) + "-" + phone.substring(4);
		
		
		Member m = new Member(userName, birthday, gender, ph, userId, userPwd, email);
	
		
		
		
		int result = new MemberService().insertMember(m);
		
		
		if(result > 0) { // insert됨 --> 회원가입성공
			
			HttpSession session= request.getSession();
			session.setAttribute("msg", "회원가입 성공!!");
			
			response.sendRedirect(request.getContextPath());
		
		}else { // insert안됨 --> 회원가입실패
			
			request.setAttribute("msg", "회원가입 실패!");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
			
		}
	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
