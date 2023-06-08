package test.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import test.spring.component.BoardDTO;
import test.spring.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping("list")
	public String listAll(Model model, String id) {
		List<BoardDTO> list = service.listAll(id);
		model.addAttribute("list", list);
		return "/board/list";
	}
	
	@RequestMapping("writeForm")
	public String writeForm() {
		return "/board/writeForm";
	}
	

}
