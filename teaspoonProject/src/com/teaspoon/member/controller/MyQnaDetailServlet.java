package com.teaspoon.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.teaspoon.board.model.vo.Attachment;
import com.teaspoon.member.model.service.MemberService;
import com.teaspoon.member.model.vo.Member;
import com.teaspoon.member.model.vo.MenToMen;

/**
 * Servlet implementation class MyQnaDetailServlet
 */
@WebServlet("/myqnadetail.me")
public class MyQnaDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyQnaDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		int mno = Integer.parseInt(request.getParameter("mno"));
		
		MenToMen m = new MemberService().selectMtm(mno);
		Attachment at = new MemberService().selectAttachment(mno);
		
		if(m != null) {
			
			request.setAttribute("m", m);
			request.setAttribute("at", at);
			
			RequestDispatcher view = request.getRequestDispatcher("views/mypage/mypage_qnaDetail.jsp");
			view.forward(request, response);
			
		}else {
			request.setAttribute("msg", "조회실패");
			RequestDispatcher view  = request.getRequestDispatcher("views/common/errorPage.jsp");
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
