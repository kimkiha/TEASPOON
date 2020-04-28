package com.teaspoon.member.controller;

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
import com.teaspoon.member.model.service.MemberService;
import com.teaspoon.member.model.vo.Cart;
import com.teaspoon.member.model.vo.Member;
import com.teaspoon.store.model.service.ProductService;
import com.teaspoon.store.model.vo.Product;

/**
 * Servlet implementation class MyPageCartServlet
 */
@WebServlet("/mycart.me")
public class MyPageCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(); 
		Member loginUser = (Member)session.getAttribute("loginUser");
		//System.out.print(loginUser);
		
		if(loginUser != null) {
			int userNo = loginUser.getUserNo();
			ArrayList<Cart> list = new MemberService().selectMemberCartList(userNo);
			
			request.setAttribute("list", list);
			
			RequestDispatcher view = request.getRequestDispatcher("views/mypage/mypage_cart.jsp");
			view.forward(request, response);
			
		} else {
			request.setAttribute("msg","로그인한 회원만 이용 가능한 서비스입니다.");
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
