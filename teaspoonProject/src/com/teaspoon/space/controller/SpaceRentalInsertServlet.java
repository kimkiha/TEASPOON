package com.teaspoon.space.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.teaspoon.member.model.vo.Member;
import com.teaspoon.space.model.service.SpaceService;
import com.teaspoon.space.model.vo.Space;



/**
 * Servlet implementation class SpaceRentalInsertServlet
 */
@WebServlet("/insert.sp")
public class SpaceRentalInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpaceRentalInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 전달값중에 한글이 있을 경우 대비해서 인코딩 작업 필수
		request.setCharacterEncoding("utf-8");
		
		// 2. request에 담겨있는 요청시 전달값 뽑아서 변수 또는 객체에 기록하기 (getParameter/getParameterValues)
		
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		String reservDate = request.getParameter("reservDate");	
		String reservTime = request.getParameter("reservTime");
		int visitNum = Integer.parseInt(request.getParameter("visitNum"));
		String Phone = ((Member)request.getSession().getAttribute("loginUser")).getPhone();
		String reservReason = request.getParameter("reservReason");
		String accept = request.getParameter("accept");
		String [] goods = request.getParameterValues("good");
		
		System.out.println(userNo);
		System.out.println(reservDate);
		System.out.println(reservTime);
		System.out.println(visitNum);
		System.out.println(Phone);
		System.out.println(reservReason);
		System.out.println(accept);
		
		
		String good = "";
		if(goods != null) {
			good = String.join(",", goods); // "빔프로젝트, 노트북"
		}
//		
		System.out.println(good);
//		Space s = new Space(userNo, reservDate, reservTime, visitNum, Phone, reservReason, accept, good);
//		
//		
//		
//				
//		// 3. 서비스 클래스에 메소드 호출(전달값 전달) 및 처리 결과 받기
//		int result = new SpaceService().insertSpace(s);
//		
//		// 4. 처리 결과를 가지고 성공인지 실패인지 판단해서 사용자가 보게될 뷰 지정
//				if(result > 0) { // insert됨 --> 정보입력성공
//					
//					HttpSession session = request.getSession();
//					session.setAttribute("msg", "접수되었습니다. 승인을 기다리세요!!");
//					
//					response.sendRedirect(request.getContextPath());
//					
//				}else { // insert안됨 --> 정보입력실패
//					
//					request.setAttribute("msg", "정보입력 실패!!");
//					RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
//					view.forward(request, response);
//				}
			
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
