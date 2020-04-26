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
 * Servlet implementation class EventInsertServlet
 */
@WebServlet("/eventInsert.bo")
public class EventInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(ServletFileUpload.isMultipartContent(request)) {
			//1_1. 파일 용량제한값
			int maxSize = 10*1024*1024;
			//1_2. 폴더경로지정
			String resources = request.getSession().getServletContext().getRealPath("/resources");
			String savePath = resources + "\\img/board\\";
			
			//2. 전달된 파일들의 파일명 수정작업 및 폴더에 업로드(Http객체를 multipart객체로 변환하는 구문)
			//MultipartRequest 쓰려면 cos.jar 필요함
			MultipartRequest multiRequest = 
					new MultipartRequest(request, savePath, maxSize, "utf-8", /*new DefaultFileRenamePolicy()*/new MyFileRenamePolicy());
			
			//3. DB에 INSERT할 데이터들 뽑아서 VO객체 담기
			//3_1. Board 객체
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("Content");
			
			Board b = new Board();
			b.setBoardTitle(title);
			b.setBoardContent(content);
			
			//3_2. Attachment 테이블에 insert할 정보
			Attachment at = new Attachment();
			
					if(multiRequest.getOriginalFileName("file1") != null) {//해당 key값에 첨부파일이 있을 경우
						
						at.setFilePath(savePath);
						at.setOriginName(multiRequest.getOriginalFileName("file1"));
						at.setChangeName(multiRequest.getFilesystemName("file1"));
					
			}
		
		int result = new BoardService().insertEvent(b, at);
		
		

		if(result > 0) { //성공했을경우
			request.getSession().setAttribute("msg", "이벤트가 등록되었습니다");
			response.sendRedirect("eventAdminList.bo?currentPage=1");
		}else { //실패했을경우
			
			// 서버에 업로드된 파일 찾아서 삭제
			File deleteFile = new File(savePath+at.getChangeName());
			deleteFile.delete();
		    
			//에러페이지로 포워딩
			request.setAttribute("msg", "등록실패!!");
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
