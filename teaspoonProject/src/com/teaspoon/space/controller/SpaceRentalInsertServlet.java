package com.teaspoon.space.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.teaspoon.member.model.vo.Member;
import com.teaspoon.space.model.service.SpaceService;
import com.teaspoon.space.model.vo.Goods;
import com.teaspoon.space.model.vo.Space;



/**
 * 1. 회원이 대관예약 내용 입력값 뽑기 
 ** Servlet implementation class SpaceRentalInsertServlet
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
		String [] goods = request.getParameterValues("good");
		
		String good = "";
		if(goods != null) {
			good = String.join(",", goods);
		}
		
		ArrayList<Goods> list = new SpaceService().selectGoodsList();
		
		request.setAttribute("list", list);	
			
		int gradeCode = ((Member)request.getSession().getAttribute("loginUser")).getGradeCode();
		
		Space s = new Space(userNo, reservDate, reservTime, visitNum, Phone, reservReason, good, gradeCode);
			
		// 3. 서비스 클래스에 메소드 호출(전달값 전달) 및 처리 결과 받기
     	
		
     		request.getSession().setAttribute("s", s);
     		request.setAttribute("s", s);
				
			HttpSession session = request.getSession();
			session.setAttribute("msg", "결제하고 승인을 기다리세요!!");
		
			RequestDispatcher view = request.getRequestDispatcher("views/space/space_payment.jsp");
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
