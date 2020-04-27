package com.teaspoon.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teaspoon.member.model.service.MemberService;
import com.teaspoon.member.model.vo.MenToMen;

/**
 * Servlet implementation class MemberQnaDetailServlet
 */
@WebServlet("/QnaDetail.me")
public class MemberQnaDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberQnaDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int mtmNo = Integer.parseInt(request.getParameter("mtmNo"));
		System.out.println(mtmNo);
	
		String reComment = request.getParameter("reComment");
	
	
		int result = new MemberService().insertAnswer(mtmNo,reComment);
		if (result != 0) {
			MenToMen mtm = new MemberService().mtmQnaAnswer(mtmNo);
			request.setAttribute("mtm", mtm);
			RequestDispatcher view = request.getRequestDispatcher("views/admin/admin_1to1Detail.jsp");
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
