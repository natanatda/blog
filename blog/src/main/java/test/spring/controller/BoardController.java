package test.spring.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import test.spring.component.BoardDTO;
import test.spring.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping("list")
	public String sessionListAll(Model model, BoardDTO dto, @RequestParam(defaultValue = "1") int pageNumber) {
		int pageSize = 5; // 페이지당 데이터 개수
	    int startIndex = (pageNumber - 1) * pageSize; // 시작 인덱스
	    
		List<BoardDTO> list = service.infoAll(dto);
		//CSS 태그 제거
		for (BoardDTO boardDTO : list) {
	        String content = boardDTO.getContent();
	        if (content != null) {
		        // content 수정 작업 수행
		        // 예: CSS 태그 제거
		        String cleanedContent = content.replaceAll("<[^>]+>", "");
		        boardDTO.setContent(cleanedContent);
	        }
	    }
		
		// 시작 인덱스부터 pageSize만큼의 데이터 추출
	    List<BoardDTO> pagedData = new ArrayList<>();
	    for (int i = startIndex; i < startIndex + pageSize && i < list.size(); i++) {
	        pagedData.add(list.get(i));
	    }
	    
	    // 전체 페이지 수 계산
	    int totalPages = (list.size() + pageSize - 1) / pageSize;
	    
	    model.addAttribute("totalPages", totalPages);
		model.addAttribute("list", list);
		model.addAttribute("pagedData", pagedData);
		model.addAttribute("pageNumber", pageNumber);
		return "/board/list";
	}
	
	@RequestMapping("content")
	public String sessionContent(Model model, BoardDTO dto) {
		List<BoardDTO> list = service.infoAll(dto);
		model.addAttribute("list", list);
		return "/board/content";
	}
	
	
	@RequestMapping("writeForm")
	public String sessionWriteForm() {
		return "/board/writeForm";
	}
	
	@RequestMapping("writePro")
	public String sessionWritePro(BoardDTO dto) {
		service.contentWrite(dto);
		return "redirect:/board/list";
	}
	
	@RequestMapping("modifyForm")
	public String sessionModifyForm(Model model, BoardDTO dto) {
		List<BoardDTO> list = service.infoAll(dto);
		model.addAttribute("list", list);
		return "/board/modifyForm";
	}
	
	@RequestMapping("modifyPro")
	public String sesseionModifyPro(BoardDTO dto) {
		service.contentModify(dto);
		return "redirect:/board/content?board_num="+dto.getBoard_num();
	}
	
	@RequestMapping("deletePro")
	public String sessionDeletePro(int board_num) {
		service.contentDel(board_num);
		return "/board/list";
	}

}
