package com.teaspoon.member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.teaspoon.board.model.vo.Attachment;
import com.teaspoon.common.MyFileRenamePolicy;
import com.teaspoon.member.model.service.MemberService;
import com.teaspoon.member.model.vo.Member;
import com.teaspoon.member.model.vo.MenToMen;

/**
 * Servlet implementation class MyPageQnaInsertServlet
 */
@WebServlet("/myQnaInsert.me")
public class MyPageQnaInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageQnaInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 폼 전송방식이 일반방식이 아닌 multipart/form-data 로 전송할 경우
				// 파일업로드를 위한 라이브러리 : cos.jar (com.orelilly.servlet)
				// http://www.servlets.com >> 받아서 WEB-INF/lib/cos.jar 붙여넣기
				
				
				// enctype이 multipart/form-data로 잘 전송되었을 경우 일련의 과정 진행
				if(ServletFileUpload.isMultipartContent(request)) {
					
					// 1. 전송된 파일을 위해 처리할 작업(전송되는 파일의 용량 제한, 전달된 파일을 업로드 할 폴더 경로)
					
					// 1_1. 전송되는 파일 용량 제한 (int maxSize)
					//      10Mbyte
					//      byte ->kbyte -> mbyte -> 
					//      1Kbyte = 1024byte
					//      1Mbyte = 1024Kbyte = 1024 * 1024 byte
					//      10Mbyte = 10*1024 *1024 byte
					int maxSize = 10 * 1024 * 1024;
					
					// 1_2.  전달되는 파일을 저장할 서버의 폴더 경로 알아내기(String savePath)
					//  >> 웹컨테이너(Webcontent) 경로 안의 resources 폴더까지의 경로 추출
					String resources = request.getSession().getServletContext().getRealPath("/resources");
					//System.out.println(resources);
					//C:\webserver_workspace2\jspProject\WebContent\resources
					
					//C:\webserver_workspace2\jspProject\WebContent\resources + \board_upfiles\
					String savePath = resources + "\\thumbnail_upfiles\\";
					//System.out.println(savePath);
					
					
					/*
					 * 2. 전달된 파일명 수정 및 업로드 작업
					 * 
					 * > HttpServletRequest --> MultipartRequest 로 변경
					 * 
					 * MultipartRequest multiRequest = new MultipartRequest(request,저장할폴더경로,파일용량제한,인코딩값, new DefaultFileRenamePolicy());
					 * 
					 * 
					 *  위구문 실행되는 순간 전달된 파일들이 지정한 폴더에 업로드됨!!
					 *  
					 *  --> 즉, 문제가 있든 없든 간에 무조건 서버에 업로드가 됨
					 *  --> db에 값을 넣는 과정중에 문제가 있을 경우 업로드된 파일을 삭제 해야됨!!
					 *  
					 *  사용자가 올린 파일 원본명 그대로 서버에 업로드 하지 않는게 일반적!!
					 *  
					 *  --> 같은 파일명이 있을 경우 더어씌워질  수 있고, 한글/ 특수기호/띄어쓰기가 포함된 파일명 서버에 따라 문제 발생!!
					 *      
					 * 기본적으로 제공하는 DefaultFileRenamePolicy 객체에서 기본적인 수정작업은 해줌
					 * ex) aaa.zip 가 있을경우 두번째 파일에 숫자를 부여함 aaa1.zip ,aaa2.zip
					 * 
					 * 우리가 직접 rename해볼것!!
					 * 
					 */
					
					MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"utf-8",new MyFileRenamePolicy());
					
					/*
					 * 3. db에 저정할 데이터들 뽑아서 vo에 담기
					 * > 글ㅈ목, 글내용, 카테고리, 작성자회원번호는 board테이블에 insert
					 * > 넘어온 첨부파일이 있을 경우 원본명, 수정명, 저장경로는 Attachment 테이블에 insert
					 *
					 */
					
					// 3_1. Mtm 테이블에 insert할 값뽑아서 Mtm객체 담기
					
					int mtmType = Integer.parseInt(multiRequest.getParameter("mtmType")); // "10";
					String mtmTitle = multiRequest.getParameter("mtmTitle");
					String mtmContent = multiRequest.getParameter("mtmContent");
					int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
					
					MenToMen m = new MenToMen();
					m.setMtmType(mtmType);
					m.setMtmTitle(mtmTitle);
					m.setMtmContent(mtmContent);
					m.setUserNo(userNo); // 1 --> "1"
					
					// 3_2 Attachment테이블에 insert할 원본명, 수정명, 폴더경로 Attachment 객체 담기
					
					Attachment at = null;
					
					// 첨부파일이 넘어왔을 경우 at 객체 생성
					// 원본명 : getOriginalFileName("키")
					
					if(multiRequest.getOriginalFileName("upfile")!= null) {
						at= new Attachment();
						// 원본명 : getOriginalFileName("키")
						at.setOriginName(multiRequest.getOriginalFileName("upfile"));
						// 수정명: getFilesystemName("키")
						at.setChangeName(multiRequest.getFilesystemName("upfile"));
						
						at.setFilePath(savePath);
						
						
						
					}
					System.out.println(m);
					// 4. 케시판 작성용 서비스 요청(b,at)
					int result = new MemberService().insertMtm(m, at);
					
					if(result > 0) {// 성공
						
						request.getSession().setAttribute("msg","게시글 등록 성공");
						response.sendRedirect("myqna.me?currentPage=1");
						
					}else {//실패
						
						// 서버에 업로드된 파일 찾아서 삭제
						if(at!=null) {
							// 삭제할 File 객체 생성
							File deleteFile = new File(savePath+at.getChangeName());
							deleteFile.delete();
							
						}
						request.setAttribute("msg", "오늘도 절엇다. 게시판등록실패");
						RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
						view.forward(request, response);
					}
					
					
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
