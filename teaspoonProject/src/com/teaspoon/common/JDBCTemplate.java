package com.teaspoon.common;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

public class JDBCTemplate {
	// 공통모듈 : 매번 작성하기 번거로워 빼둠
	

	// Connection객체 리턴하는 getConnection메소드
	public static Connection getConnection(){
		Connection conn = null;
		
		Properties prop = new Properties();
		// classes 하위안에 있는 driver.properties의 경로를 알아내기 위해 
		String filePath = JDBCTemplate.class.getResource("/sql/driver/driver.properties").getPath();
		// System.out.println(filePath);
		
		try {
			prop.load(new FileReader(filePath));
			// "driver.properties파일경로" --> filePath
			
			// 1. Driver등록하는 구문
			Class.forName(prop.getProperty("driver"));
			// "오라클드라이브경로" --> "driver"
			
			// 2. DBMS연결
			conn = DriverManager.getConnection(prop.getProperty("url"), 
												prop.getProperty("username"),
												prop.getProperty("password"));
			// "접속하고자하는url", "접속하고자하는 계정명", "계정비밀번호"
			
		} catch (ClassNotFoundException e) {  // library연동 및 오타확인
			e.printStackTrace();
		} catch (FileNotFoundException e) { // 제시한 경로 확인
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	// 전달받은 JDBC용 객체들 close메소드 3종(rset, conn, stmt) : 오버로딩 - 메소드명같고 매개변수다름
	public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rset) {
		try {
			if(rset != null && !rset.isClosed()) {
				rset.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
		
	public static void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	// 트랜잭션 처리 메소드 2종(commit, rollback)
	
	public static void commit(Connection conn) {
		try {
			if(conn !=null && !conn.isClosed()) {
				conn.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection conn) {
		try {
			if(conn !=null && !conn.isClosed()) {
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
