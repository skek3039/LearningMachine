package com.learning.Admin.DAO;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<String> paymentList(Map<String, Object> map) {
		return  sqlSession.selectList("Payment.paymentList",map);
		
	}

	public List<Map<String, Object>> payment(int year) {
	
		return sqlSession.selectList("Payment.paymentmain",year);
	}

	public List<String> circle() {
		return sqlSession.selectList("Payment.circle");
	}

	public List<String> refundList() {
		return sqlSession.selectList("Payment.refundList");
	}
}
