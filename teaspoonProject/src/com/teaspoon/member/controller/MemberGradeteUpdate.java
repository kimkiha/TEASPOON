package com.teaspoon.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.teaspoon.member.model.service.MemberService;
import com.teaspoon.member.model.vo.Grade;

/**
 * Servlet implementation class MemberGradateUpdate
 */
@WebServlet("/gradeUpdate.me")
public class MemberGradeteUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberGradeteUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int gNo = Integer.parseInt(request.getParameter("gNo"));
		String updateGradeName = request.getParameter("updateGradeName");
		int updateMinMoney = Integer.parseInt(request.getParameter("updateMinMoney"));
		int updateDiscountRate =   Integer.parseInt(request.getParameter("updateDiscountRate"));
		
		Grade g = new Grade();
		g.setGradeCode(gNo);
		g.setGradeName(updateGradeName);
		g.setMinAcount(updateMinMoney);
		g.setGradeRate(updateDiscountRate);
		
		
		int result = new MemberService().updateGrade(g);
		
		
		if(result > 0) { 
			
			HttpSession session= request.getSession();
			session.setAttribute("msg", "등급수정 성공!!");
			response.sendRedirect("level.me");
		
		}else { // insert안됨 --> 회원가입실패
			
			request.setAttribute("msg", "등급수정 실패!");
			RequestDispatcher view = request.getRequestDispatcher("views/common/admin_errorPage.jsp");
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
