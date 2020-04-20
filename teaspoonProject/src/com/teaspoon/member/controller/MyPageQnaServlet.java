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
import com.teaspoon.member.model.vo.Member;

/**
 * Servlet implementation class myPageQnaServlet
 */
@WebServlet("/myqna.me")
public class MyPageQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageQnaServlet() {
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
				
				//* listCount : 1:1 나의 총 게시글
				int userNo = Integer.parseInt(request.getParameter("userNo"));
				listCount = new MemberService().getQnaListCount(userNo);
				
				//* currentPage : 현재페이지 (즉,요청한페이지)
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
				
				//* pageLimit : 한 페이지 하단에 보여질 페이지 최대갯수
				pageLimit = 10;
				
				//* boardLimit : 한 페이지에 보여질 게시글 최대 갯수
				boardLimit = 10; 
				
				
				
				maxPage = (int)Math.ceil(((double)listCount / boardLimit));
				
				
				/* startPage : 현재 페이지의 보여질 페이징바의 시작 수 
				 * 
				 * ex) pageLimit : 10이라는 가정하에
				 * 1, 11, 21, 31, ......		=> n * 10(pageLimit) + 1
				 * 
				 * currentPage = 1 				=> 0 * 10 + 1 = 1
				 * currentPage = 5				=> 0 * 10 + 1 = 1
				 * currentPage = 10 		    => 0 * 10 + 1 = 1
				 * 
				 * currentPage = 11				=> 1 * 10 + 1 = 11
				 * currentPage = 15				=> 1 * 10 + 1 = 11
				 * currentPage = 20				=> 1 * 10 + 1 = 11
				 * 
				 * currentPage = 21				=> 2 * 10 + 1 = 21
				 * 
				 * currenPage = 1~10 	          n=0
				 * currenPage = 11~20 	          n=1
				 * currenPage = 21~30 	          n=2
				 * 							
				 * 								  n= (currentPage -1) /pageLimit	
				 */
				startPage = ((currentPage -1)/pageLimit) * pageLimit + 1;
				
				/*endPage : 한페이지 하단에 보여질 페이징바의 끝 수 
				 * 
				 * ex) pageLimit : 10이라는 가정하에
				 * 
				 * startPage : 1				=> endPage : 10 
				 * startPage : 11				=> endPage : 20
				 * 
				 */
				endPage = startPage + pageLimit -1;
				
				//단, maxPage가 고작 13까지 밖에 안되면? 
				if(endPage > maxPage) {
					endPage = maxPage;
				}
				
		PageInfo pi = new PageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, boardLimit);
		//System.out.println(pi);
		ArrayList<Member> list = new MemberService().selectMyQnaList(pi,userNo);
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		RequestDispatcher view = request.getRequestDispatcher("views/mypage/mypage_myqna.jsp");
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
