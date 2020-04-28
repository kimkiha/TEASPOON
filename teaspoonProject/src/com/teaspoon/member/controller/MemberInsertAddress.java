package com.teaspoon.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teaspoon.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertAddress
 */
@WebServlet("/insertAddress.me")
public class MemberInsertAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertAddress() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1.전달값중에 한글이 있을 경우를 대비해서 인코딩 작업 필수
		request.setCharacterEncoding("utf-8");
		
		// 2. request에 담겨있는 요청시 전달값 뽑아서 변수 또는 객체에 기록하기(getParameter/getParameterValues)
		String addressinfo = request.getParameter("addressinfo");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
