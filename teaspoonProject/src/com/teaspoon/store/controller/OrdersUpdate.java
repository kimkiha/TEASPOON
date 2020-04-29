package com.teaspoon.store.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.teaspoon.store.model.service.ProductService;

/**
 * Servlet implementation class OrdersUpdate
 */
@WebServlet("/ordersUpdate.st")
public class OrdersUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrdersUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mprice = Integer.parseInt(request.getParameter("mprice"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		int result = new ProductService().ordersUpdate(mprice, amount);
		
		response.setContentType("application/jason; charset=utf-8;");
		Gson gson = new GsonBuilder().create();
		gson.toJson(result, response.getWriter());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
