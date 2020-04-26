package com.teaspoon.space.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.teaspoon.board.model.vo.Attachment;
import com.teaspoon.space.model.service.GoodsService;
import com.teaspoon.space.model.vo.Goods;
import com.teaspoon.store.model.service.ProductService;
import com.teaspoon.store.model.vo.Product;
import com.teaspoon.store.model.vo.Review;

/**
 * Servlet implementation class detailGoodsServlet
 */
@WebServlet("/detail.go")
public class detailGoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public detailGoodsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		ArrayList<Goods> list = new GoodsService().selectGoodsList();
		request.setAttribute("list", list);
		
		RequestDispatcher view = request.getRequestDispatcher("views/space/space_payment.jsp");
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
