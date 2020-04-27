package com.teaspoon.store.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teaspoon.member.model.vo.Member;
import com.teaspoon.store.model.service.ProductService;

/**
 * Servlet implementation class InsertCartServlet
 */
@WebServlet("/insertCart.st")
public class InsertCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
	int cartPcode = Integer.parseInt(request.getParameter("cartPcode"));
	String optionGram = request.getParameter("optionGram");
	String optionGrind = request.getParameter("optionGrind");
	int pCount = Integer.parseInt(request.getParameter("pCount"));
	
	int optionCode = new ProductService().selectOptionCode(optionGram,optionGrind);
	int pDetailNo = new ProductService().insertPdetailNo(cartPcode,optionCode);
	
	int result = new ProductService().insertOrderBy(userNo,pDetailNo,pCount);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
