package com.learning.Admin.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.learning.Admin.Service.AdminService;
import com.learning.Admin.Service.PaymentService;

@Controller
public class PaymentController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private PaymentService paymentService;

	
	private LocalDate now = LocalDate.now();               
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy");
	DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("MM");

	
	//매출관리페이지
	@GetMapping(value = "/payment")
	   public ModelAndView payment(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	      if ((int) session.getAttribute("u_authority") == 7) {
	    	
	         ModelAndView mv = new ModelAndView("admin_payment");
	        
	         //세로막대 그래프 나타내는 메소드
	         int year = 0;
	         if(request.getParameter("checkPN")!=null) {
	        	 year = Integer.parseInt(request.getParameter("year"));
	        	 if(Integer.parseInt(request.getParameter("checkPN"))==1) {
	        		 year = year-1;
	        	 }else if(Integer.parseInt(request.getParameter("checkPN"))==2){
	        		 year = year+1;	        		 
	        	 }	        	 
	         }else {
	        		year = Integer.parseInt(now.format(formatter));
	         }
	         
	        String year1 = null;
	        
	         List<Map<String, Object>> list = paymentService.payment(year);
	         int cnt = 0;
	         for(int i=0; i<list.size(); i++) {
	        	 if(list.get(i).get("year") !=null) {
	        		 year1 = list.get(i).get("year").toString();
	        	 }else {
	        		 cnt += 1;
	        	 }
	         }
	             
	         if(cnt == 12) {
	        	 response.setContentType("text/html;charset=UTF-8");
	        	 PrintWriter out = response.getWriter();
	        	 out.println("<script>");
	        	 out.println("alert('매출데이터가 존재하지않은 년도입니다.')");
	        	 out.println("history.back()");
	        	 out.println("</script>");
	        	return null;
	         }
	         
	         
	         //원형 그래프 메소드
	        List<String> circle = paymentService.circle();

	        List<String> gender = paymentService.gender();
	        
	         mv.addObject("circle",circle);
	         mv.addObject("gender",gender);
	         mv.addObject("list",list);
	         mv.addObject("year",year1);
	         return mv;
	      } else {
	         ModelAndView mv = new ModelAndView("404");
	         return mv;
	      }
	      
	   }
	
	
	//전체결제내역리스트 보기
	@GetMapping(value = "/payment_list")
	public @ResponseBody ModelAndView payment_list(HttpServletRequest request, HttpSession session,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		if ((int) session.getAttribute("u_authority") == 7) {
			ModelAndView mv = new ModelAndView("admin_payment_list");
			
			String month = request.getParameter("month");
			String year = request.getParameter("year");
			if (month == null) {
				year = now.format(formatter);
				month = now.format(formatter1);
			}	
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("month",month);
			map.put("year",year);
			
			
			List<String> list = paymentService.paymentList(map);
			if(list.size() != 0) {
				mv.addObject("list",list); 				
			}else {
				mv.addObject("month",month);
				mv.addObject("year",year);
			}
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}
	
	
	
	//실제 환불승인된 내역 보기
	@GetMapping(value = "/payment_refund")
	public ModelAndView admin_payment_refund(HttpSession session, HttpServletRequest request) {
		if ((int) session.getAttribute("u_authority") == 7) {
			ModelAndView mv = new ModelAndView("admin_refund_list");
			String month = request.getParameter("month");
			String year = request.getParameter("year");
			if (month == null) {
				year = now.format(formatter);
				month = now.format(formatter1);
			}	
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("month",month);
			map.put("year",year);


			
			List<String> list = paymentService.refundList(map);
			if(list.size() != 0) {
				mv.addObject("list",list); 				
			}else {
				mv.addObject("month",month);
				mv.addObject("year",year);
			}
			return mv;
		
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}
	
	
	
	
	// 환불신청내역 불러오기
	@GetMapping(value = "/admin_student_refund")
	public ModelAndView admin_student_refund(HttpSession session, HttpServletRequest request) {
		if ((int) session.getAttribute("u_authority") == 7) {
			ModelAndView mv = new ModelAndView("admin_student_refund");
			
			List<String> list = adminService.refundList();
			mv.addObject("list", list);

			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}
	
	
	// 실제 환불처리가 될 메소드
	@ResponseBody
	@PostMapping(value = "/admin_student_refund")
	public void admin_student_refund(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		if ((int) session.getAttribute("u_authority") == 7) {
			PrintWriter pw = response.getWriter();

			int result = 0;
			String p_no = request.getParameter("p_no");
			String u_id = request.getParameter("u_id");
			result = adminService.lecture_refund(p_no, u_id);
			

			pw.print(result);
		}
	}
}
