package com.learning.User.Controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.learning.User.Form.PaymentForm;
import com.learning.User.Form.ULectureForm;
import com.learning.User.Service.ULectureService;
import com.learning.User.Service.UserService;
import com.siot.IamportRestClient.Iamport;
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
	public String LecturePay(HttpServletRequest rq) {
		
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
			}else {
				
				rq.setAttribute("UserInfo", UserService.UserInfo(u_id));
				rq.setAttribute("LectureInfo", LectureInfo);
				
				return "user/Pay";
			}
		}else {
			
			return "redirect:/404";
		}
	}
	
	@PostMapping(value = "Pay.do")
	@ResponseBody
	public IamportResponse<Payment> LecturePay(HttpServletRequest rq, PaymentForm payForm) throws IamportResponseException, IOException {
		
		String u_id = (String) rq.getSession().getAttribute("u_id");
		String l_code = payForm.getL_code();
		
		return api.paymentByImpUid(l_code);
	}
}
