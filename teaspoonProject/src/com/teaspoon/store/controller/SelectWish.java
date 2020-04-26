package com.teaspoon.store.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.teaspoon.member.model.service.MemberService;
import com.teaspoon.member.model.vo.Member;
import com.teaspoon.store.model.vo.Product;

/**
 * Servlet implementation class SelectWish
 */
@WebServlet("/selectWish.st")
public class SelectWish extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectWish() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		//System.out.println(session.getAttribute("loginUser"));
		ArrayList<Product> list = new MemberService().selectWishList(userNo);
		
		response.setContentType("application/json; charset=utf-8;");
		new Gson().toJson(list,response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
