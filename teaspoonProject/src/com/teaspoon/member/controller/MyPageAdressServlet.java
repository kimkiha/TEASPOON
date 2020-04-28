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
 * Servlet implementation class MyPageAdressServlet
 */
@WebServlet("/myAdress.me")
public class MyPageAdressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageAdressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		

		String address = request.getParameter("address");
		
		HttpSession Session = request.getSession();
		String userId=((Member)Session.getAttribute("loginUser")).getUserId();		// userId로 가져오기
		String Address = ((Member)Session.getAttribute("loginUser")).getAddress();
		
		Member m = new Member();
		m.setAddress(address);
		
//		int result = new MemberService().insertAddress(m);
//		
//		if(result>0) { // result에 값이 담기면 -> 수정이 됐다는것
//			
//			Member addressUser = new MemberService().selectMember(userId);
//			
//			HttpSession session = request.getSession();
//			session.setAttribute("loginUser", addressUser);
//			session.setAttribute("msg", "배송지를 추가하였습니다.");
//			//response.sendRedirect("memberModifyComplete.me"); // memberModifyComplete.me url로 요청
//
//		}else { // 회원정보수정 실패시
//			request.setAttribute("msg", "배송지추가실패!!");
//
//		}
		
		RequestDispatcher view = request.getRequestDispatcher("views/mypage/mypage_address1.jsp");
		view.forward(request, response);
		
	
		
	}
			
	
		


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
