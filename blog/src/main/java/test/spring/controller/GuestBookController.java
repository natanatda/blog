package test.spring.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import test.spring.component.GuestBookDTO;
import test.spring.service.GuestBookService;
import test.spring.service.MemberService;

@Controller
@RequestMapping("/guest/*")
public class GuestBookController {
	@Autowired
	private GuestBookService service;
	
	@Autowired
	private MemberService mservice;
	
	
	@RequestMapping("guestbook")
	public String guestbook(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String memId = (String)session.getAttribute("memId");
		
		String a = request.getParameter("a");
		model.addAttribute("a",a);
		
		if(a != null) {
			int num = Integer.parseInt(request.getParameter("num"));
			model.addAttribute("num",num);
		}
		
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
        
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("pageBlock", pageBlock);
        model.addAttribute("pageCount", pageCount);

		return "/blog/guestbook";
	}
	
	@RequestMapping("insert")
	public String sessioninsert(Model model, GuestBookDTO dto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String memId = (String)session.getAttribute("memId");
		dto.setId(memId);
		
		service.insert(dto);
		
        return "redirect:/guest/guestbook";
	}
	
	@RequestMapping("update")
	public String sessionupdate(Model model, String subject, int num, HttpServletRequest request) {
		service.update(subject,num);
		
		return "redirect:/guest/guestbook";
	}
	
	@RequestMapping("delete")
	public String sessionDelete(Model model, int num, HttpServletRequest request) {
		service.delete(num);
		
		return "redirect:/guest/guestbook";
	}
	
	@RequestMapping("timeK")
	public String timeK(Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		model.addAttribute("timeK", sdf.format(new Date()));
		
		return "/blog/time";
	}
	
	@RequestMapping("timeN")
	public String timeN(Model model) {
		// 현재 시간 가져오기
        Date currentDate = new Date();

        // 뉴욕 타임존으로 변경
        TimeZone nyTimeZone = TimeZone.getTimeZone("America/New_York");

        // Date 객체의 타임존 설정
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(nyTimeZone);
        String nyTime = sdf.format(currentDate);
        
        model.addAttribute("timeN", nyTime);
		return "/blog/time";
	}
	
	@RequestMapping("timeL")
	public String timeT(Model model) {
		// 현재 시간 가져오기
        Date currentDate = new Date();

        TimeZone ldTimeZone = TimeZone.getTimeZone("Europe/London");

        // Date 객체의 타임존 설정
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(ldTimeZone);
        String ldTime = sdf.format(currentDate);
        
        model.addAttribute("timeL", ldTime);
		return "/blog/time";
	}
}
