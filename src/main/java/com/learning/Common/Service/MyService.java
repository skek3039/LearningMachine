package com.learning.Common.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.Common.DAO.MyServiceDAO;
import com.learning.DTO.PaymentDTO;

@Service
public class MyService {
	@Autowired
	private MyServiceDAO myServiceDAO;

	public List<String> myLectureList(String u_id) {
		return myServiceDAO.myLectureList(u_id);
	}

	public List<String> myInfo(String u_id) {
		return myServiceDAO.myInfo(u_id);
	}

	public List<Map<String, String>> myPayment(Map<String, Object> map) {
		return myServiceDAO.myPayment(map);
	}

	public int totalCount() {
		return myServiceDAO.totalCount();
	}

	public int myPaymentRefund(PaymentDTO dto) {
		return myServiceDAO.myPaymentRefund(dto);
	}

	public int myInfoUpdate(Map<String, Object> map) {
		return myServiceDAO.myInfoUpdate(map);
	}
	
}
