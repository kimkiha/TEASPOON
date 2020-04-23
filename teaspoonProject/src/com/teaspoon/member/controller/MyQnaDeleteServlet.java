package com.teaspoon.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teaspoon.member.model.service.MemberService;

/**
 * Servlet implementation class MyQnaDeleteServlet
 */
@WebServlet("/myqnadelete.me")
public class MyQnaDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyQnaDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] mno = request.getParameterValues("mno");
		
		int result = new MemberService().updateMtm(mno);

		if(result > 0) {
			
			request.getSession().setAttribute("msg","게시글 삭제 성공");
			response.sendRedirect("myqna.me?currentPage=1");
			
		}else {
			
			request.setAttribute("msg", "오늘도 절엇다. 삭제실패");
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
