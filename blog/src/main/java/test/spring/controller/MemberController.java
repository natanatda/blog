package test.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import test.spring.component.MemberDTO;
import test.spring.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService service;
	
	@RequestMapping("blogHome")
	public String blogHome() {
		return "/sample/blogHome";
	}
	
	@RequestMapping("inputForm")
	public String inputForm() {
		return "/member/inputForm";
	}
	
	@RequestMapping("inputPro")
	public String inputPro(MemberDTO dto) {
		service.inputPro(dto);
		return "/member/login";
	}
	
	@RequestMapping("login")
	public String login() {
		return "/member/login";
	}
	
	@RequestMapping("loginPro")
	public String loginPro(String id, String pw, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String url ="";
		if(service.loginCheck(id, pw) == 1) {
			session.setAttribute("memId", id);
			url = "/sample/blogHome";
			System.out.println("성공");
		}else {
			url = "/member/login";
			System.out.println("실패");
		}
		return url;
	}
	
	@RequestMapping("updateForm")
	public String updateForm(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");
		if(id != null) {
			MemberDTO dto = service.memberAll(id);
			model.addAttribute("dto", dto);
		}
		return "/member/updateForm";
	}
	
	@RequestMapping("updatePro")
	public String updatePro(HttpServletRequest request, MemberDTO dto) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");
		dto.setId(id);
		service.updatePro(dto);
		return "/sample/blogHome";
	}
	
	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "/member/login";
	}
}
