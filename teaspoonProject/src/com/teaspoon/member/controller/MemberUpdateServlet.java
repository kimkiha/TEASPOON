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
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/update.me")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
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
		
	
		
		Member m = new Member();
		m.setUserName(userName);
		m.setBirthday(birthday);
		m.setPhone(gender);
		m.setPhone(firstnumber);
		m.setEmail(email);
		m.setPhone(phone);
		m.setUserId(userId);
		m.setUserPwd(userPwd);
		m.setEmail(email);
		
		int result = new MemberService().updateMember(m);
		
		if(result >0 ) { // 회원정보수정 성공시
			
			// 갱신된 회원 정보 조회 --> 세션에 담겨있는 기존의 loginUser을 갱신해주어야함
			Member updateUser = new MemberService().selectMember(userId);
			
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", updateUser);
			session.setAttribute("msg", "성공적으로 회원정보를 수정했습니다.");
			response.sendRedirect("mymain.me"); // myPage.me url로 요청

		}else { // 회원정보수정 실패시
			request.setAttribute("msg", "회원정보수정실패!!");
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
