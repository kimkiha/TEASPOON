package com.teaspoon.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teaspoon.board.model.vo.Attachment;
import com.teaspoon.board.model.vo.Board;
import com.teaspoon.board.service.BoardService;

/**
 * Servlet implementation class MagazineUpdateFormServlet
 */
@WebServlet("/magazineUpdateForm.bo")
public class MagazineUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MagazineUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
	
		Board b = new BoardService().selectBoard(bno);
		Attachment at =  new BoardService().selectAttachment(bno);
	
		if(b != null) {
		request.setAttribute("b", b);
		request.setAttribute("at", at);
		RequestDispatcher view = request.getRequestDispatcher("views/admin/admin_magazineUpdateForm.jsp");
		view.forward(request, response);
		}else {
		// 에러페이지로 포워딩
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
