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

import com.teaspoon.member.model.service.MemberService;
import com.teaspoon.member.model.vo.Grade;

/**
 * Servlet implementation class MemberMaxGradeEnroll
 */
@WebServlet("/maxGradeInsert.me")
public class MemberMaxGradeEnroll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMaxGradeEnroll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gradeName = request.getParameter("maxGradeName");
		int minMoney = Integer.parseInt(request.getParameter("maxMinMoney"));
		int discontRate = Integer.parseInt(request.getParameter("maxDiscountRate"));
	

		Grade grade = new Grade();
		grade.setGradeName(gradeName);
		grade.setMinAcount(minMoney);
		grade.setGradeRate(discontRate);
		int result1 = new MemberService().insertGrade(grade);
		ArrayList<Grade> gList = new MemberService().selectGradeList();
		
		
		int result2 = new MemberService().updateMemberMaxGrade(grade,gList);
		//4. 처리결과를 가지고 성공인지 실패인지 판단해서 사용자가 보게될 뷰 지정
			
		
				if(result1 * result2 >0) { //insert --> 회원가입 성공
					
					//forword방식이 아니므로 request를 전송하지않아 session객체에 남아서 어느페이지에서나 사용가능하게한다.
					HttpSession session = request.getSession();
					session.setAttribute("msg", "등급추가성공!");
					
					response.sendRedirect("level.me");
					
				}else { //insert --> 등급추가 실패
	
					request.setAttribute("msg", "등급추가실패!");
					RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage_admin.jsp");
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
