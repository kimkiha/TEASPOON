package com.teaspoon.space.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.teaspoon.common.JDBCTemplate.*;
import com.teaspoon.member.model.dao.MemberDao;
import com.teaspoon.space.model.vo.Payment;

public class PaymentDao {
	
	Properties prop = new Properties();

	public PaymentDao() {
		String filePath = MemberDao.class.getResource("/sql/space/space-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}


	public Payment selectPayment(Connection conn, int pno) {
		Payment p = null;
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPayment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Payment();
				p.setGoodsPay(rset.getInt("goodspay"));
				p.setTotal(rset.getInt("total"));
				p.setReservPay(rset.getInt("reservpay"));
				
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
		
	}
}
