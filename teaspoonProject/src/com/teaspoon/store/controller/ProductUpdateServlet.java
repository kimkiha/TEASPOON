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
 * Servlet implementation class ProductUpdateServlet
 */
@WebServlet("/update.st")
public class ProductUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductUpdateServlet() {
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
			
			// 상품객체  
			int pcode = Integer.parseInt(multiRequest.getParameter("pcode"));
			String pname = multiRequest.getParameter("pname");
			int supPrice =  Integer.parseInt(multiRequest.getParameter("supPrice"));
			int price =  Integer.parseInt(multiRequest.getParameter("price"));
			int stock =  Integer.parseInt(multiRequest.getParameter("stock"));
			String keyword = multiRequest.getParameter("keyword");
			String kind = multiRequest.getParameter("kind");
			String pcontent = multiRequest.getParameter("pcontent");
			
			Product p = new Product();
			p.setPcode(pcode);
			p.setPname(pname);
			p.setSupPrice(supPrice);
			p.setPrice(price);
			p.setStock(stock);
			p.setKeyword(keyword);
			p.setKind(kind);
			p.setPcontent(pcontent);
			
			
			// 파일리스트
			ArrayList<Attachment> list = new ArrayList<>();
			
			for(int i=0; i<list.size(); i++) {
				String name = "file"+ (i+1); 
				System.out.print(name);
				
				if(multiRequest.getOriginalFileName("name") != null) {
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName("name")); // 새로 추가된 파일의 원본명 추가
					at.setChangeName(multiRequest.getFilesystemName("name")); // 새로 추가된 파일의 수정명 추가
					at.setFilePath(savePath);
					
					if(multiRequest.getParameter("originFileNo") != null) {
						at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
						
						// 기존에 서버에 업로드된 파일 삭제
						File deleteFile = new File(savePath + multiRequest.getParameter("originFileName"));
						deleteFile.delete();
						
					} else { // 기존의 첨부파일이 없었을 경우 --> 새로이 attachment 테이블에 insert
						at.setRefBoardNo(pcode);
						
					}
					list.add(at);
				}
			}
			
			int result = new ProductService().updateProduct(p, list);
			
			if(result>0) {
				request.getSession().setAttribute("msg", "상품이 수정되었습니다");
				response.sendRedirect("list.st?currentPage=1");
				
			}else { // 사진 등록 실패
				request.setAttribute("msg", "상품수정에 실패했습니다");
				for(int i=0; i<list.size(); i++) { // Attachment == list.get(i)
					File deleteFile = new File(savePath + list.get(i).getChangeName());
					deleteFile.delete();
				}
				// 에러페이지로 포워딩
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage_admin.jsp");
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
