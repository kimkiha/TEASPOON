package com.teaspoon.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teaspoon.member.model.service.MemberService;
import com.teaspoon.member.model.vo.Grade;

/**
 * Servlet implementation class MemberGradeEnrollServlet
 */
@WebServlet("/gradeEnroll.me")
public class MemberGradeEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberGradeEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gradeName = request.getParameter("gradeName");
		int minMoney = Integer.parseInt(request.getParameter("minMoney"));
		int maxMoney = Integer.parseInt(request.getParameter("maxMoney"));
		int discontRate = Integer.parseInt(request.getParameter("discontRate"));
		
		Grade grade = new Grade();
		grade.setGradeName(gradeName);
		grade.setMinAcount(minMoney);
		grade.setMinAcount(maxMoney);
		grade.setGradeRate(discontRate);
		
		//int result = new MemberService().insertGrade();
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
