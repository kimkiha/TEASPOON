package com.teaspoon.space.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SpaceReservationDeny
 */
@WebServlet("/reservationDeny.re")
public class SpaceReservationDeny extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpaceReservationDeny() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reservNo = request.getParameter("reservNo");
		//System.out.println(reservNo);
		
		
		
		
		//응답데이터에 한글이 있을경우 인코딩 작업
		response.setCharacterEncoding("utf-8");
		
		//통로생성후 통로로 데이터 전달
		//PrintWriter out = response.getWriter();
		//응답페이지를 지정하는게 아닌 비동식임으로 페이지는 유지상태 데이터 그냥 데이터 전달하면
		//자동으로 응답한 페이지의 함수로 돌아감
		//index.jsp에 ajax success:function(){} 이함수에서 매개변수로 응답데이터를 받아줌
		//out.print(responseData);
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
