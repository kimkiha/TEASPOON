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
 * Servlet implementation class EventDetailServlet
 */
@WebServlet("/eventDetail.bo")
public class EventDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int bno = Integer.parseInt(request.getParameter("bno"));
		
		Board b = new BoardService().selectEvent(bno);
		
			if(b != null) {// 조회성공
			
			// 조회성공했기 때문에 해당 글 조회수 1증가 시키는 서비스 요청
			new BoardService().increaseCount(bno);
			request.setAttribute("b", b);
			RequestDispatcher view = request.getRequestDispatcher("views/board/event_view.jsp");
			view.forward(request, response);
			
		}else {//조회실패
			request.setAttribute("msg", "이벤트 조회 실패했습니다.");
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
