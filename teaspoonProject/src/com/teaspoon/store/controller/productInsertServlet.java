package com.teaspoon.store.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.teaspoon.board.model.vo.Attachment;
import com.teaspoon.store.model.service.ProductService;
import com.teaspoon.store.model.vo.Product;

/**
 * Servlet implementation class productInsertServlet
 */
@WebServlet("/insert.st")
public class productInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10 ;
			String resources = request.getSession().getServletContext().getRealPath("/resources");
			String savePath = resources + "\\thumbnail_upfiles\\";
			
			MultipartRequest multiRequest 
			= new MultipartRequest(request,savePath,maxSize,"utf-8", new com.teaspoon.common.MyFileRenamePolicy());
			
			
			String pname = multiRequest.getParameter("pname");
			int supPrice =  Integer.parseInt(multiRequest.getParameter("supPrice"));
			int price =  Integer.parseInt(multiRequest.getParameter("price"));
			int stock =  Integer.parseInt(multiRequest.getParameter("stock"));
			String keyword = multiRequest.getParameter("keyword");
			String kind = multiRequest.getParameter("kind");
			String pcontent = multiRequest.getParameter("pcontent");
			
			Product p = new Product();
			p.setPname(pname);
			p.setSupPrice(supPrice);
			p.setPrice(price);
			p.setStock(stock);
			p.setKeyword(keyword);
			p.setKind(kind);
			p.setPcontent(pcontent);
			
			ArrayList<Attachment> list = new ArrayList<>();
			
			for(int i=1; i<=4; i++) {
				String name = "file"+i; // "file1~file4"
				if(multiRequest.getOriginalFileName(name) != null) {
					Attachment at = new Attachment();
					at.setFilePath(savePath);
					at.setOriginName(multiRequest.getOriginalFileName(name));
					at.setChangeName(multiRequest.getFilesystemName(name));
					
					list.add(at);
				}
			}
			
			int result = new ProductService().insertProduct(p, list);
			
			if(result>0) {
				request.getSession().setAttribute("msg", "상품등록 성공!!");
				response.sendRedirect("list.st");
				
			}else { // 사진 등록 실패
				request.setAttribute("msg", "사진게시판 등록실패!!");
				for(int i=0; i<list.size(); i++) { // Attachment == list.get(i)
					File deleteFile = new File(savePath + list.get(i).getChangeName());
					deleteFile.delete();
				}
				// 에러페이지로 포워딩
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
