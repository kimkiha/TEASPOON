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

/**
 * Servlet implementation class MemberGradeDelete
 */
@WebServlet("/deleteGrade.me")
public class MemberGradeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberGradeDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int deleteGradeCode = Integer.parseInt(request.getParameter("deleteGradeCode"));
		//System.out.println(deleteGradeCode);
	    
		int result = new MemberService().deleteGrade(deleteGradeCode);
		

		if(result>0) { //insert --> 회원가입 성공
			
			//forword방식이 아니므로 request를 전송하지않아 session객체에 남아서 어느페이지에서나 사용가능하게한다.
			HttpSession session = request.getSession();
			session.setAttribute("msg", "등급삭제성공!");
			
			response.sendRedirect("level.me");
			
		}else { //insert --> 등급추가 실패

			request.setAttribute("msg", "등급삭제실패!");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage_admin.jsp");
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
