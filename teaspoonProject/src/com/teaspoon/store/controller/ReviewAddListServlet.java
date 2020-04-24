package com.teaspoon.store.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.teaspoon.store.model.service.ProductService;
import com.teaspoon.store.model.vo.Review;

/**
 * Servlet implementation class ReviewAddListServlet
 */
@WebServlet("/list.re")
public class ReviewAddListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewAddListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int pcode = Integer.parseInt(request.getAttribute("pcode"));
		ArrayList<Review> list = new ProductService().selectReviewList(pcode);
		//자동으로 키값이 필드명으로 생김
		response.setContentType("aplication/json; charset=utf-8");
				
		Gson gson = new Gson();
		//gson.toJson(어레이객체,통로);
		gson.toJson(list,response.getWriter()); // 이렇게하면 객체 배열로 변환후 전달됨
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
