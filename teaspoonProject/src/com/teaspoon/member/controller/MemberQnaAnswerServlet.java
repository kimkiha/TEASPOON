package com.teaspoon.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teaspoon.board.model.vo.Attachment;
import com.teaspoon.member.model.service.MemberService;
import com.teaspoon.member.model.vo.MenToMen;

/**
 * Servlet implementation class MemberQnaAnswerServlet
 */
@WebServlet("/QnaAnswer.me")
public class MemberQnaAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberQnaAnswerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mtmNo = Integer.parseInt(request.getParameter("mtmNo"));
		
		MenToMen mtm = new MemberService().mtmQnaAnswer(mtmNo);
		Attachment at = new MemberService().selectQnaAttachment(mtmNo);
		
		request.setAttribute("at", at);
		request.setAttribute("mtm", mtm);
		RequestDispatcher view = request.getRequestDispatcher("views/admin/admin_1to1Answer.jsp");
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
