package com.learning.Admin.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.Admin.DAO.PaymentDAO;

@Service
public class PaymentService {
	@Autowired
	private PaymentDAO paymentDAO;

	public List<String> paymentList(String u_id) {
		return paymentDAO.paymentList(u_id);
	}
}
