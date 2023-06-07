package test.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import test.spring.component.GuestBookDTO;
import test.spring.service.GuestBookService;

@Controller
@RequestMapping("/guest/*")
public class GuestBookController {
	@Autowired
	private GuestBookService service;
	
	
	@RequestMapping("guestbook")
	public String guestbook(Model model) {
		List<GuestBookDTO> list = service.list();
		
		model.addAttribute("list", list);
		return "/blog/guestbook";
	}
	
	@RequestMapping("insert")
	public String sample(Model model, GuestBookDTO dto) {
		service.insert(dto);
		
		List<GuestBookDTO> list = service.list();
		
		model.addAttribute("list", list);
		return "/blog/guestbook";
	}
}
