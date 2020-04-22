package com.teaspoon.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teaspoon.board.model.vo.Board;
import com.teaspoon.board.service.BoardService;

/**
 * Servlet implementation class MagazineUpdateServlet
 */
@WebServlet("/MagazineUpdate.bo")
public class MagazineUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MagazineUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		Board b = new Board();
		b.setBoardNo(bno);
		b.setBoardTitle(request.getParameter("title"));
		b.setBoardContent(request.getParameter("content"));
		
		
		int result = new BoardService().updateBoard(b);
		
		if(result > 0) {//수정성공했을 경우 상세보기 페이지 요청
			response.sendRedirect("magazineList.bo?currentPage=1");
		}else {//에러페이지 포워딩
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage/jsp");
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
