package com.teaspoon.store.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teaspoon.member.model.service.MemberService;
import com.teaspoon.member.model.vo.Member;
import com.teaspoon.member.model.vo.Orders;
import com.teaspoon.store.model.service.ProductService;
import com.teaspoon.store.model.vo.Option;

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
		
		int usePoint = Integer.parseInt(request.getParameter("usePoint"));
		int addPoint = Integer.parseInt(request.getParameter("addPoint"));
		
		
		String recipient = request.getParameter("recipient");
		String recipientPhone = request.getParameter("recipientPhone");
		String recipientAddress = "우편번호 : " + request.getParameter("address1")+ ", 주소 : " + request.getParameter("address2")+ ", 참고항목 : " +request.getParameter("address3")+ ", 상세주소 : "+ request.getParameter("address4");
		String orderMessage = request.getParameter("orderMessage");
		
		Orders order = new Orders();
		order.setRecipient(recipient);
		order.setRecipientPhone(recipientPhone);
		order.setRecipientAddress(recipientAddress);
		order.setOrderMessage(orderMessage);
		
		request.setAttribute("total", total);
		
		 ArrayList<Option> productInfo = new ProductService(). extractProductInfo(userNo);
		
		 int result1 = new MemberService().updatePoint(userNo, addPoint,usePoint);
		 
		 
		 String totalProductInfo ="";
		 
		 for(int i=0; i<productInfo.size(); i++) {
		  
			 totalProductInfo += "(" + i+ "번째 상품명 " + productInfo.get(i).getPname()+ ", 옵션1 : " + productInfo.get(i).getOptionType1() + ", 옵션2 : " + productInfo.get(i).getOptionType2() + "),";
		 
		 }
		
		 //System.out.println(totalProductInfo);
		 
		 int result = new ProductService().ordersInsert(order, userNo, userName, phone, total,totalProductInfo);
		 			  new ProductService().cartEmpty(userNo);
		
		RequestDispatcher view = request.getRequestDispatcher("views/store/storePayment.jsp");
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
