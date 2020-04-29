package com.teaspoon.space.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teaspoon.space.model.service.SpaceService;
import com.teaspoon.space.model.vo.Payment;
import com.teaspoon.space.model.vo.Space;

/**
 * Servlet implementation class SpacePaymentInsertServlet
 */
@WebServlet("/insert.py")
public class SpacePaymentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpacePaymentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int goodsPay = Integer.parseInt(request.getParameter("goodsPay"));
		int total = Integer.parseInt(request.getParameter("total"));
		Space s = (Space)request.getSession().getAttribute("s");
		Payment p = new Payment(goodsPay, total);
		
		int result = new SpaceService().insertPayment(p,s);
		request.setAttribute("total",total);
		
		RequestDispatcher view = request.getRequestDispatcher("views/space/payment.jsp");
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
