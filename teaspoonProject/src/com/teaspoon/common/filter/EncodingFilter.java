package com.teaspoon.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class EncodingFilter
 */

/*
 * 이렇게 만든 필터 클래스를 적용시키는 방법2가지
 * 1) 어노테이션을 이용한 방법
 * > 필터클래스 위에 @WebFilter 어노테이션을 활용해서 어떤 서블릿 실행되기 전에 이 필터를 거칠지 지정
 */
//
 /* 2) web.xml에 등록하는 방법
  * >web.mal파일에 이 필터클래슬를 등록하고 어떤 서블릿 실행됮기 전에 이 필터를 거쳐갈건지 지정
  */



@WebFilter(filterName="encodingFilter", urlPatterns="/*")
public class EncodingFilter implements Filter {

    /**
     * Default constructor. 
     */
    public EncodingFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 서블릿 호출 전 수행할 문장
		// 요청전송방식이 post|POST|Post일 경우 인코딩 작업이 되게끔
		if(((HttpServletRequest)request).getMethod().equalsIgnoreCase("post")){ 
			// 요청전송 방식이 대소문자 구분하지 않고 post인 경우  : equalsIgnoreCase
			request.setCharacterEncoding("utf-8");
		}
		chain.doFilter(request, response);
		// 이 구문은 현재 실행되는 필터가 최종 필터일 경우 Servlet을 호출하고
		// 최종필터가 아닌경우 또다른 필터를 호출한다
		// 서블릿 호출 하고 수행할 문장, 필터가 여러개일 경우 최종필터까지 계속 다음 필터를 호출
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
