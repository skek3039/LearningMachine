package com.learning.Admin.DAO;

import java.util.List;
import java.util.Map;

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
}
