package com.teaspoon.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teaspoon.member.model.service.MemberService;
import com.teaspoon.member.model.vo.Member;

/**
 * Servlet implementation class InsertWish
 */
@WebServlet("/insertWish.me")
public class InsertWish extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertWish() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pcode = Integer.parseInt(request.getParameter("pcode"));
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int result;		
		response.setContentType("application/json; charset=utf-8;");
		
		if(loginUser == null) {
			result = 0;
			PrintWriter out = response.getWriter();
			out.print(result);
			return;
		}else if(loginUser != null){
			int userNo = loginUser.getUserNo();
			
			int count = new MemberService().selectWishList(pcode, userNo);
			if(count>0) {
				=
			}
			result = new MemberService().insertWish(pcode, userNo);
			PrintWriter out = response.getWriter();
			out.print(result);
			return;
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
