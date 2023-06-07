package test.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import test.spring.component.MemberDTO;
import test.spring.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
	@RequestMapping("sample")
	public String memberAll(String id, Model model) {
		List<MemberDTO> dto = service.memberAll();
		model.addAttribute("dto", dto);
		return "/sample/sample";
	}
}
