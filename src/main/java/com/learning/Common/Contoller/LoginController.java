package com.learning.Common.Contoller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.learning.Common.Service.LoginService;
import com.learning.DTO.userDTO;
@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;
	
	//비밀번호 재설정 화면
	@RequestMapping(value = "/resetPw", method = RequestMethod.GET )
	public String resetPw() {
		return "resetPw";
	}
	
	//비밀번호 
	@PostMapping(value = "/resetPw")
	public String resetPw(@ModelAttribute userDTO user, HttpServletRequest request) {
		int Reset = loginService.resetPw(user);
		if (Reset == 1) {
			request.setAttribute("error", "<script>alert('비밀번호 변경 완료<br>로그인 화면으로 이동합니다.'); window.location.href = document.referrer; "
					+ "</script>");
			return "login";
		}else {
			return "404";
		}
	}
	
	//비밀번호 찾기
	@RequestMapping(value = "/forgotPW", method = RequestMethod.GET )
	public String findPwGET(){
		return "forgotPW";
	}
	
	//아이디, 이메일 확인
	@RequestMapping(value = "/forgotPW", method = RequestMethod.POST )
	public String findPwPost(@ModelAttribute userDTO user, HttpServletRequest request) throws IOException {
		user = loginService.forgotPW(user);
		
		if (user.getU_authority() != 0 ) {	
			request.setAttribute("user", user);
			return "resetPw";
			
		} else {
			request.setAttribute("error", "<script>alert('정보가 일치 하지 않습니다.'); window.location.href = document.referrer; "
					+ "</script>");
			return "forgotPW";
		}
}
	
	@PostMapping(value = "/checkID")
	public String checkID(HttpServletRequest request) throws IOException {
		String result = "1";
		int count = loginService.checkID(request.getParameter("u_id"));
		result = String.valueOf(count);
		
		return result;
	}
	
	
	@GetMapping(value = "/join")
	public String join() {
		return "join";
	}
	
	@PostMapping(value = "/join")
	public String join(HttpServletRequest request) throws UnsupportedEncodingException {
		
		request.getCharacterEncoding();
		request.setCharacterEncoding("UTF-8");
		
		userDTO dto = new userDTO();
		
		dto.setU_id(request.getParameter("u_id"));
		dto.setU_pw(request.getParameter("u_pw"));
		dto.setU_pw(request.getParameter("u_pw1"));
		dto.setU_email(request.getParameter("u_email"));
		dto.setU_name(request.getParameter("u_name"));
		dto.setU_nickname(request.getParameter("u_nickname"));
		dto.setU_gender(request.getParameter("u_gender"));
		dto.setU_birth(request.getParameter("u_birth"));
		
		int result = loginService.join(dto);
		
		return "redirect:/join";
	}
	
	
	
	@GetMapping(value = "/login")
	public String login() {
		return "login";
	}

	// 로그아웃처리
	@GetMapping (value = "/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if ((session.getAttribute("u_id") != null) && (session.getAttribute("u_authority") !=null)) {
			session.removeAttribute("u_id");
			session.removeAttribute("u_authority");
		}
		return "redirect:/login";
	}

}
