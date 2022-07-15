package com.learning.Admin.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.Admin.DAO.PaymentDAO;
import com.learning.DTO.PaymentDTO;

@Service
public class PaymentService {
	@Autowired
	private PaymentDAO paymentDAO;

	public List<String> paymentList(Map<String, Object> map) {
		return paymentDAO.paymentList(map);
	}

}
