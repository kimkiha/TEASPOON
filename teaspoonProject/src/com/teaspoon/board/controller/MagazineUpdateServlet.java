package com.teaspoon.board.controller;

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
import com.teaspoon.board.model.vo.Board;
import com.teaspoon.board.service.BoardService;
import com.teaspoon.common.MyFileRenamePolicy;

/**
 * Servlet implementation class MagazineUpdateServlet
 */
@WebServlet("/magazineUpdate.bo")
public class MagazineUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MagazineUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 1_1. 파일용량제한(10Mbyte)
			int maxSize = 10*1024*1024;
			
			// 1_2. 전달된 파일 업로드할 폴더 경로 지정 (String savePath)
			String resources = request.getSession().getServletContext().getRealPath("/resources");
			String savePath = resources + "\\img\\board\\";
			
			// 2. 전달된 파일 수정 작업 및 서버에 업로드 (MultipartRequest생성)
			// HttpServletRequest request --> MultipartRequest multiRequest
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());
			
			// 3. DB에 실행할 전달값 뽑는 과정
			// 3_1. Board테이블 업데이트 처리할 값 뽑아서 --> Board객체에 담아두기 
			Board b = new Board();
			b.setBoardTitle(multiRequest.getParameter("title"));
			b.setBoardContent(multiRequest.getParameter("Content"));
			b.setStatus(multiRequest.getParameter("status"));
			int bno = Integer.parseInt(multiRequest.getParameter("bno"));
			b.setBoardNo(bno);

			// 3_2. 새로이 추가된 첨부파일이 존재할 경우 넘길값들 --> Attachment 객체에 담기
			Attachment at = null;
			
			// 새로이 추가된 첨부터일이 있을 경우
			if(multiRequest.getOriginalFileName("file1") != null) {
				at = new Attachment();
		
				at.setOriginName(multiRequest.getOriginalFileName("file1")); // 새로 추가된 원본명
				at.setChangeName(multiRequest.getFilesystemName("file1")); // 새로 추가된 파일의 수정명
				at.setFilePath(savePath);
				
			
				if(multiRequest.getParameter("originFileNo") != null) { // 기존에 첨부파일이 있었을 경우
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));// 기존의 첨부파일 찾아서 update
					
					//기존에 서버에 업로드된 파일도 삭제
					File deleteFile = new File(savePath + multiRequest.getParameter("originFileName"));
					deleteFile.delete();
				}else { // 기존에 첨부파일이 없었을 경우 --> 새로이 attachment 테이블에 insert
					at.setRefBoardNo(bno);
				}
			} //if문 끝
			
			int result = new BoardService().updateBoard(b,at);
			
			if(result > 0) {//수정성공했을 경우 상세보기 페이지 요청
				request.getSession().setAttribute("msg", "매거진이 수정되었습니다");
				response.sendRedirect("magazineAdminList.bo?currentPage=1");
			}else {//에러페이지 포워딩
				request.setAttribute("msg", "등록실패!!");
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				view.forward(request, response);
			}
			
		}
	}
/*
		int bno = Integer.parseInt(request.getParameter("bno"));
		

		String title = request.getParameter("title");
		String content = request.getParameter("Content");
		
		Board b = new Board(bno, title, content);
		
		
		System.out.println(bno);
		
		
		int result = new BoardService().updateBoard(b);
		
		if(result > 0) {//수정성공했을 경우 상세보기 페이지 요청
			response.sendRedirect("magazineList.bo?currentPage=1");
		}else {//에러페이지 포워딩
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage/jsp");
			view.forward(request, response);
		}
	}
*/
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
