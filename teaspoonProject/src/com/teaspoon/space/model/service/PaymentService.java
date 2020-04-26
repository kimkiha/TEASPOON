package com.teaspoon.space.model.service;

import static com.teaspoon.common.JDBCTemplate.close;
import static com.teaspoon.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.teaspoon.space.model.dao.PaymentDao;
import com.teaspoon.space.model.vo.Payment;

public class PaymentService {

	public Payment selectPayment(int pno) {
		
		Connection conn = getConnection();
		Payment p = new PaymentDao().selectPayment(conn, pno);
		close(conn);
		return p;
	}
	
}
