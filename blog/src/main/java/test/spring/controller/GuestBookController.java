package test.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import test.spring.component.GuestBookDTO;
import test.spring.service.GuestBookService;

@Controller
@RequestMapping("/guest/*")
public class GuestBookController {
	@Autowired
	private GuestBookService service;
	
	
	@RequestMapping("guestbook")
	public String guestbook(Model model, HttpServletRequest request) {
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
	    if (pageNum == null) {
	        pageNum = "1";
	    }

	    int currentPage = Integer.parseInt(pageNum);
	    int start = (currentPage - 1) * pageSize + 1;
	    int end = currentPage * pageSize;

		List<GuestBookDTO> list = service.list(start,end);
		
		int count = service.count();
		
		model.addAttribute("count",count);
		model.addAttribute("list", list);
		
		int pageCount = count / pageSize + (count % pageSize==0 ? 0 :1);
		int startPage = (int)(currentPage/10)*10+1;
        int pageBlock = 10;
        int endPage = startPage + pageBlock -1;
        if (endPage > pageCount) endPage = pageCount;
        
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("pageBlock", pageBlock);
        model.addAttribute("pageCount", pageCount);

		return "/blog/guestbook";
	}
	
	@RequestMapping("insert")
	public String sample(Model model, GuestBookDTO dto, HttpServletRequest request) {
		service.insert(dto);
		
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
	    if (pageNum == null) {
	        pageNum = "1";
	    }

	    int currentPage = Integer.parseInt(pageNum);
	    int start = (currentPage - 1) * pageSize + 1;
	    int end = currentPage * pageSize;

		List<GuestBookDTO> list = service.list(start,end);
		
		int count = service.count();
		
		model.addAttribute("count",count);
		model.addAttribute("list", list);
		
		int pageCount = count / pageSize + (count % pageSize==0 ? 0 :1);
		int startPage = (int)(currentPage/10)*10+1;
        int pageBlock = 10;
        int endPage = startPage + pageBlock -1;
        if (endPage > pageCount) endPage = pageCount;
        
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("pageBlock", pageBlock);
        model.addAttribute("pageCount", pageCount);
		return "/blog/guestbook";
	}
}
