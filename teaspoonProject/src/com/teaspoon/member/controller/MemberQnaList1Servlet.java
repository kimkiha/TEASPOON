package com.teaspoon.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.teaspoon.member.model.service.MemberService;
import com.teaspoon.member.model.vo.MenToMen;

/**
 * Servlet implementation class MemberQnaList1Servlet
 */
@WebServlet("/qnalist1.me")
public class MemberQnaList1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberQnaList1Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mtmName = request.getParameter("mtmName");
		System.out.println(mtmName);
		ArrayList<MenToMen> list = new MemberService().selectMtmAdminListType(mtmName);
		System.out.print(list);
		response.setContentType("application/json; charset=utf-8;");
		
		new Gson().toJson(list,response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
