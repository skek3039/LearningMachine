package com.learning.Common.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.learning.DTO.PaymentDTO;

@Repository
public class MyServiceDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<String> myLectureList(String u_id) {
		return sqlSession.selectList("MyService.myLectureList",u_id);
	}

	public List<String> myInfo(String u_id) {
		return sqlSession.selectList("MyService.myInfo",u_id);
	}

	public List<Map<String, String>> myPayment(Map<String, Object> map) {
		return sqlSession.selectList("MyService.myPayment",map);
	}

	public int totalCount() {
		return sqlSession.selectOne("MyService.totalCount");
	}

	public int myPaymentRefund(PaymentDTO dto) {
		sqlSession.update("MyService.myPaymentRefund2",dto);
		return sqlSession.insert("MyService.myPaymentRefund",dto);
	}

	public int myInfoUpdate(Map<String, Object> map) {
		return sqlSession.update("MyService.myInfoUpdate", map);
	}
}
