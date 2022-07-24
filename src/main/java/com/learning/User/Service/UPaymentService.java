package com.learning.User.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.User.DAO.UPaymentDAO;
import com.learning.User.DTO.UPaymentDTO;
import com.learning.User.Form.URegiForm;

@Service
public class UPaymentService {

	@Autowired
	private UPaymentDAO paymentDAO;
	
	public int PayDone(URegiForm regiform, UPaymentDTO paydto) {
		
		if(paymentDAO.PaymentRegist(paydto) == 1) {
			
			return paymentDAO.LectureRegist(regiform);
		}else {
			
			return 0;
		}
		
	}
}
