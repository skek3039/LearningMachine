package com.learning.Admin.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<String> paymentList(String u_id) {
		return  sqlSession.selectList("Payment.paymentList",u_id);
	}
}
