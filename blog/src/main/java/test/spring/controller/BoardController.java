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
	public String listAll(Model model, BoardDTO dto) {
		System.out.println(dto);
		List<BoardDTO> list = service.infoAll(dto);
		model.addAttribute("list", list);
		return "/board/list";
	}
	
	@RequestMapping("content")
	public String content(Model model, BoardDTO dto) {
		List<BoardDTO> list = service.infoAll(dto);
		model.addAttribute("list", list);
		return "/board/content";
	}
	
	
	@RequestMapping("writeForm")
	public String writeForm() {
		return "/board/writeForm";
	}
	
	@RequestMapping("writePro")
	public String writePro(BoardDTO dto) {
		service.contentWrite(dto);
		return "/board/list";
	}
	
	@RequestMapping("modifyForm")
	public String modifyForm(Model model, BoardDTO dto) {
		List<BoardDTO> list = service.infoAll(dto);
		model.addAttribute("list", list);
		return "/board/modifyForm";
	}
	
	@RequestMapping("modifyPro")
	public String modifyPro(BoardDTO dto) {
		service.contentModify(dto);
		return "redirect:/board/content?board_num="+dto.getBoard_num();
	}
	
	@RequestMapping("deletePro")
	public String deletePro(int board_num) {
		service.contentDel(board_num);
		return "/board/list";
	}

}
