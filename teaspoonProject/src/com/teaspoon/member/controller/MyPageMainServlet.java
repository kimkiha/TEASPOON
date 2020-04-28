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
 * Servlet implementation class MyPageMainServlet
 */
@WebServlet("/mymain.me")
public class MyPageMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		
		
		Member myInfo = new MemberService().MyPageInfo(loginUser.getUserNo());
		loginUser.setGradeName(myInfo.getGradeName());
		loginUser.setCount(myInfo.getCount());
		loginUser.setPcode(myInfo.getPcode());
		loginUser.setPoint(myInfo.getPoint());
		
		
		if(loginUser != null) {
			
			

			
			
			RequestDispatcher view = request.getRequestDispatcher("views/mypage/mypage_main.jsp");
			view.forward(request, response);
		}else {// 조회실패
			request.setAttribute("msg", "메인에서 실패했다  힘내자");
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
