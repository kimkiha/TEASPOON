package com.teaspoon.store.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teaspoon.store.model.service.ProductService;

/**
 * Servlet implementation class ReviewDeleteServlet
 */
@WebServlet("/delete.re")
public class ReviewDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		int result = new ProductService().deleteReview(reviewNo);
		
		if(result>0) {	// 리뷰 삭제 성공
			request.getSession().setAttribute("msg", "리뷰가 삭제되었습니다");
			response.sendRedirect("review.st?currentPage=1");
		} else {
			request.setAttribute("msg", "리뷰삭제에 실패했습니다");
			request.getRequestDispatcher("views/common/errorPage_admin.jsp").forward(request, response);
			
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
