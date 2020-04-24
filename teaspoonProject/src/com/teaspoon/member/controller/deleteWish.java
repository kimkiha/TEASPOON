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
 * Servlet implementation class deleteWish
 */
@WebServlet("/deleteWish.me")
public class deleteWish extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteWish() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(); 
		Member loginUser = (Member)session.getAttribute("loginUser");
		int pcode = Integer.parseInt(request.getParameter("pcode"));
		
		int userNo = loginUser.getUserNo();
		
		int result = new MemberService().deleteWish(userNo, pcode);
		
		if(result>0) { // 위시리스트 삭제성공
			if() {			// 요청페이지가 커피이면
				response.sendRedirect("coffee.st?currentPage=1");
			} else if() {	// 요청페이지가 아이템이면
				response.sendRedirect("item.st?currentPage=1");
			} else {		// 요청페이지가 베스트이면
				response.sendRedirect("storeBest.st");
			}
			 
			
		} else { // 삭제 실패
			request.setAttribute("msg", "위시리스트 삭제 실패했습니다");
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
