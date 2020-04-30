package com.teaspoon.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.teaspoon.member.model.service.MemberService;

/**
 * Servlet implementation class EventPointServlet
 */
@WebServlet("/eventPoint.bo")
public class EventPointServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventPointServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int point = Integer.parseInt((String) request.getAttribute("random"));
		int userNo = Integer.parseInt((String) request.getAttribute("userNo"));
		
		int result = new MemberService().eventUpdatePoint(point, userNo);
			response.setContentType("application/json; charset=utf-8");
			Gson gson = new GsonBuilder().create();
			gson.toJson(result, response.getWriter());
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
