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
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet("/login.me")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			String userId = request.getParameter("userId");
			String userPwd = request.getParameter("userPwd");
			
		
			Member loginUser = new MemberService().loginMember(userId,userPwd);
			if(loginUser != null) { //로그인 성공했을 경우 --> index.jsp
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
				session.setAttribute("msg", "로그인성공");
				if(loginUser.getUserId().equals("admin")){
					response.sendRedirect(request.getContextPath()+"/main.ad");
				}else {
					
					response.sendRedirect(request.getContextPath());
				}
				
			}else { // 로그인 실패 했을 경우 --> 에러페이지
				request.setAttribute("msg","로그인에 실패 했습니다.");
				
				
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				
				view.forward(request,response);
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
