package com.teaspoon.member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

				if(ServletFileUpload.isMultipartContent(request)) {
					
					int maxSize = 10 * 1024 * 1024;
					String resources = request.getSession().getServletContext().getRealPath("/resources");
					
					String savePath = resources + "\\thumbnail_upfiles\\";
					
					
					
					MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"utf-8",new MyFileRenamePolicy());
					
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
					
					if(multiRequest.getOriginalFileName("thumbnail_upfiles")!= null) {
						at= new Attachment();
						// 원본명 : getOriginalFileName("키")
						at.setOriginName(multiRequest.getOriginalFileName("thumbnail_upfiles"));
						// 수정명: getFilesystemName("키")
						at.setChangeName(multiRequest.getFilesystemName("thumbnail_upfiles"));
						
						at.setFilePath(savePath);
						
						
						
					}
					//System.out.println(m);
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
