package com.learning.User.Controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.learning.DTO.PaymentDTO;
import com.learning.User.DTO.UPaymentDTO;
import com.learning.User.Form.PaymentForm;
import com.learning.User.Form.ULectureForm;
import com.learning.User.Service.ULectureService;
import com.learning.User.Service.UserService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class UserPaymentController {

	private IamportClient api;
	
	public UserPaymentController(){
		
		this.api = new IamportClient("2685278050107144", "SbAZoe0znCj58vNCpnbZCaVl54N7DoGCjXL8cKyXFvtqu4ps1CGxyA1DSZQla7wajns2nLNGUSSoEE7p");
	}
	@Autowired
	private ULectureService lectureService;
	
	@Autowired
	private UserService UserService;
	
	@GetMapping(value = "/Pay")
	public String LecturePay(HttpServletRequest rq, UPaymentDTO dto) {
		
		String u_id = (String) rq.getSession().getAttribute("u_id");
		String l_code = rq.getParameter("l_code");
		ULectureForm LectureInfo = null;
		
		if(u_id == null) {
			
			return "redirect:/login";
		}else if(l_code != null){
			
			LectureInfo = lectureService.LectureDetail(u_id, l_code);
			
			if(LectureInfo.getPayment_whether() == 1) {
				
				rq.setAttribute("error", "<script>alert('이미 결제한 강의입니다.');</script>");
				return "404";
			}
//			else if(!u_id.equals(dto.getU_id())) {
//				
//				rq.setAttribute("error", "<script>alert('잘못된 권한입니다.');</script>");
//				
//				return "404";
//			}
			else {
				
				String l_price = LectureInfo.getL_price().replaceAll(",", "");
				
				LectureInfo.setL_price(l_price);
				
				rq.setAttribute("UserInfo", UserService.UserInfo(u_id));
				rq.setAttribute("LectureInfo", LectureInfo);
				
				return "user/Pay";
			}
		}else {
			
			return "redirect:/404";
		}
	}
	
	@PostMapping(value = "/Pay.do/{imp_uid}")
	@ResponseBody
	public IamportResponse<Payment> LecturePay(@PathVariable(value = "imp_uid")String imp_uid,HttpServletRequest rq, PaymentForm payForm) throws IamportResponseException, IOException {
		
		return api.paymentByImpUid(imp_uid);
	}
}
