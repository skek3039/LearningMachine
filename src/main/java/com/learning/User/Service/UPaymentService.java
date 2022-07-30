package com.learning.User.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.User.DAO.UPaymentDAO;
import com.learning.User.DAO.UserDAO;
import com.learning.User.DTO.UPaymentDTO;
import com.learning.User.DTO.WishlistDTO;
import com.learning.User.Form.URegiForm;

@Service
public class UPaymentService {

	@Autowired
	private UPaymentDAO paymentDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	public int PayDone(URegiForm regiform, UPaymentDTO paydto) {
		
		if(paymentDAO.PaymentRegist(paydto) == 1) {
			
			WishlistDTO dto = new WishlistDTO();
			
			dto.setL_code(regiform.getL_code());
			dto.setU_id(regiform.getU_id());
			
			userDAO.DeleteWishList(dto);
			
			return paymentDAO.LectureRegist(regiform);
		}else {
			
			return 0;
		}
		
	}
}
