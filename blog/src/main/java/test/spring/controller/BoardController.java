package test.spring.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
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
	public String listAll(Model model, BoardDTO dto, @RequestParam(defaultValue = "1") int pageNumber) {
		int pageSize = 5; // �������� ������ ����
	    int startIndex = (pageNumber - 1) * pageSize; // ���� �ε���
	    
		List<BoardDTO> list = service.infoAll(dto);
		//CSS �±� ����
		for (BoardDTO boardDTO : list) {
	        String content = boardDTO.getContent();
	        if (content != null) {
		        // content ���� �۾� ����
		        // ��: CSS �±� ����
		        String cleanedContent = content.replaceAll("<[^>]+>", "");
		        boardDTO.setContent(cleanedContent);
	        }
	    }
		
		// ���� �ε������� pageSize��ŭ�� ������ ����
	    List<BoardDTO> pagedData = new ArrayList<>();
	    for (int i = startIndex; i < startIndex + pageSize && i < list.size(); i++) {
	        pagedData.add(list.get(i));
	    }
	    
	    // ��ü ������ �� ���
	    int totalPages = (list.size() + pageSize - 1) / pageSize;
	    
	    model.addAttribute("totalPages", totalPages);
		model.addAttribute("list", list);
		model.addAttribute("pagedData", pagedData);
		model.addAttribute("pageNumber", pageNumber);
		return "/board/list";
	}
	
	@RequestMapping("content")
	public String content(Model model, BoardDTO dto) {
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
	
	@RequestMapping("time")
	public String time(Model model) {
		model.addAttribute("time", new Date());
		return "/board/time";
	}
	
	@RequestMapping("calendar")
	public String calendar(Model model) {
		Calendar calendar = new GregorianCalendar();
		
		int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH) + 1; // ���� 0���� �����ϹǷ� 1�� ������
        int day = calendar.get(Calendar.DAY_OF_MONTH);

        // �ش� ���� ù ��° ��¥�� ������ ���� (1: �Ͽ���, 2: ������, ..., 7: �����)
        GregorianCalendar firstDayOfMonth = new GregorianCalendar(year, month - 1, 1);
        int firstDayOfWeek = firstDayOfMonth.get(Calendar.DAY_OF_WEEK);

        // �ش� ���� ������ ��¥�� ����
        GregorianCalendar lastDayOfMonth = new GregorianCalendar(year, month - 1, 1);
        int lastDay = lastDayOfMonth.getActualMaximum(Calendar.DAY_OF_MONTH);

        // View�� �ʿ��� �����͸� Model�� �߰�
        model.addAttribute("year", year);
        model.addAttribute("month", month);
        model.addAttribute("toDay", day);
        model.addAttribute("firstDayOfWeek", firstDayOfWeek);
        model.addAttribute("lastDay", lastDay);
        
		return "/board/calendar";
	}
	
	

}
