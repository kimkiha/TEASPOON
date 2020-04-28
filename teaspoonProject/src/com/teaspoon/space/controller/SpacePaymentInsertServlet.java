package com.teaspoon.space.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teaspoon.space.model.service.SpaceService;
import com.teaspoon.space.model.vo.Payment;

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
		
		Payment p = new Payment(goodsPay, total);
		
		int result = new SpaceService().insertPayment(p);
		
		System.out.println(goodsPay);
		System.out.println(total);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
