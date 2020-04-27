package com.teaspoon.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teaspoon.common.PageInfo;
import com.teaspoon.member.model.service.MemberService;
import com.teaspoon.member.model.vo.Grade;
import com.teaspoon.member.model.vo.MenToMen;

/**
 * Servlet implementation class MemberQnaListServlet
 */
@WebServlet("/qnalist.me")
public class MemberQnaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberQnaListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// -------------------- 페이징처리 -----------------
		int listCount; // 총 게시글 갯수
		int currentPage; // 현재페이지(즉, 요청한페이지)
		int startPage; // 현재페이지 하단에 보여지는 페이징바의 시작수
		int endPage; // 현재 페이지 하단에 보여지는 페이징바의 끝수
		int maxPage; // 전체페이지에서의 가장 마지막 페이지
		int pageLimit; // 한페이지 하단에 보여질 페이지 최대 갯수
		int boardLimit; // 한페이지에 보여질 게시글 최대 갯수

		// * listCount : 총 게시글 갯수
		listCount = new MemberService().selectMtmAdminCount();

		// * currentPage : 현재페이지 (즉,요청한페이지)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));

		// * pageLimit : 한 페이지 하단에 보여질 페이지 최대갯수
		pageLimit = 10;

		// * boardLimit : 한 페이지에 보여질 게시글 최대 갯수
		boardLimit = 5;

		// * maxPage : (마지막 페이지) 총 페이지수
		/*
		 * ex) boardLimt : 10이라는 가정 하에
		 * 
		 * 총게시글갯수 /boardLimit 100.0 / 10 = 10.0 --> 10페이지 101.0 / 10 = 10.1 --> 11페이지
		 * 105.0 / 10 = 10.5 --> 11페이지 109.0 / 10 = 10.9 --> 11페이지 (실수)listCount /
		 * boardLimit 의 결과값을 무조건 올림한값!!
		 */
		maxPage = (int) Math.ceil(((double) listCount / boardLimit));
		startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, boardLimit);
		// System.out.println(pi);
		ArrayList<MenToMen> list = new MemberService().selectMtmAdminList(pi);
		String mtmName = request.getParameter("mtmName");
		System.out.println(mtmName);
		ArrayList<MenToMen> TypeList = new MemberService().selectMtmAdminListType(mtmName,pi);
		System.out.println(TypeList);
		// 페이지바만들기위한 pi객체전달
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("TypeList", TypeList);
		RequestDispatcher view = request.getRequestDispatcher("views/admin/admin_1to1.jsp");
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
