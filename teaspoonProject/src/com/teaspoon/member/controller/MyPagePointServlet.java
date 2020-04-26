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

import com.teaspoon.common.PageInfo;
import com.teaspoon.member.model.service.MemberService;
import com.teaspoon.member.model.vo.Member;
import com.teaspoon.member.model.vo.Point;

/**
 * Servlet implementation class MyPagePointServlet
 */
@WebServlet("/mypoint.me")
public class MyPagePointServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPagePointServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		int listCount;		//총 게시글 갯수
		int currentPage;	//현재페이지(즉, 요청한페이지)
		int startPage;		//현재페이지 하단에 보여지는 페이징바의 시작수
		int endPage;		//현재 페이지 하단에 보여지는 페이징바의 끝수 
		int maxPage; 		//전체페이지에서의 가장 마지막 페이지
		int pageLimit;		//한페이지 하단에 보여질 페이지 최대 갯수
		int boardLimit;		//한페이지에 보여질 게시글 최대 갯수
		
		//* listCount : 총 게시글 갯수
		HttpSession session = request.getSession();
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		listCount = new MemberService().getPointListCount(userNo);
		
		//* currentPage : 현재페이지 (즉,요청한페이지)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		//* pageLimit : 한 페이지 하단에 보여질 페이지 최대갯수
		pageLimit = 5;
		
		//* boardLimit : 한 페이지에 보여질 게시글 최대 갯수
		boardLimit = 12; 
		
		
		//* maxPage : (마지막 페이지) 총 페이지수 
		maxPage = (int)Math.ceil(((double)listCount / boardLimit));
		startPage = ((currentPage -1)/pageLimit) * pageLimit + 1;
		endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, boardLimit);
		
		
		ArrayList<Point> list=  new MemberService().selectPointList(userNo,pi);
	
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		RequestDispatcher view = request.getRequestDispatcher("views/mypage/mypage_point.jsp");
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
