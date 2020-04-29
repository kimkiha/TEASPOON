package com.teaspoon.store.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teaspoon.member.model.vo.Member;
import com.teaspoon.member.model.vo.Orders;
import com.teaspoon.store.model.service.ProductService;
import com.teaspoon.store.model.vo.Product;

/**
 * Servlet implementation class StorePayment
 */
@WebServlet("/storePayment.st")
public class StorePayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StorePayment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		String phone = ((Member)request.getSession().getAttribute("loginUser")).getPhone();
		String userName = ((Member)request.getSession().getAttribute("loginUser")).getUserName();
		int total = Integer.parseInt(request.getParameter("total"));
		
		String recipient = request.getParameter("recipient");
		String recipientPhone = request.getParameter("recipientPhone");
		String recipientAddress = request.getParameter("recipientAddress");
		String orderMessage = request.getParameter("orderMessage");
		
		Orders order = new Orders();
		order.setRecipient(recipient);
		order.setRecipientPhone(recipientPhone);
		order.setRecipientAddress(recipientAddress);
		order.setOrderMessage(orderMessage);
		
		int result = new ProductService().ordersInsert(order, userNo, userName, phone, total);

		if(result>0) {
			request.getSession().setAttribute("msg", "상품주문이 완료되었습니다");
			response.sendRedirect("orderBoard.me");
		} else {
			RequestDispatcher view = request.getRequestDispatcher("views/store/storePayment.jsp");
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
