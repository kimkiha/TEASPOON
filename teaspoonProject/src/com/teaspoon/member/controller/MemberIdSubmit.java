package com.teaspoon.member.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberIdSubmit
 */
@WebServlet("/idSubmit.me")
public class MemberIdSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberIdSubmit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = String.valueOf(request.getSession().getAttribute("userId"));
		
		
		//mail server 설정
		String host = "smtp.naver.com";
        String user = "iieorhkd@naver.com"; //자신의 네이버 계정
        String password = "tkfk5184!";//자신의 네이버 패스워드
        
        //메일 받을 주소
        String email = String.valueOf(request.getSession().getAttribute("email"));
        System.out.println(email);
       //SMTP 서버 정보를 설정한다.
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", 465);
        props.put("mail.smtp.auth", "true");
       props.put("mail.smtp.ssl.enable", "true");
  
       //System.out.println(userId);
        
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user,password);
            }
        });
       
        //email 전송
        try {
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(user, "TeaSpoon"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            
            //메일 제목
            msg.setSubject("안녕하세요 Teaspoon 아이디 확인 메일입니다.");
            //메일 내용
            msg.setText("아이디는 :"+userId);
           
            Transport.send(msg);
            System.out.println("이메일 전송");
           
        }catch (Exception e) {
            e.printStackTrace();
        }

        request.getSession().setAttribute("msg", "아이디가 전송 되었습니다."); 
        response.sendRedirect("loginPage.me");
	}
		
		


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
