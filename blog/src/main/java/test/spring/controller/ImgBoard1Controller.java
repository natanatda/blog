package test.spring.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import test.spring.component.ImgBoard1DTO;
import test.spring.service.ImgBoard1Service;

@Controller
@RequestMapping("/imgBoard1/*")
public class ImgBoard1Controller {
	
	@Autowired
	private ImgBoard1Service service;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	@RequestMapping("list")
	public String sample(Model model,HttpServletRequest request) {
		int pageSize=5;
		
		String pageNum = (String)request.getParameter("pageNum");
		if(pageNum == null){
			pageNum="1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		model.addAttribute("currentPage", currentPage); // currentPage
		int startRow = (currentPage-1)*pageSize +1;
		int endRow = currentPage * pageSize;
		int count = 0;
		//int number = 0;
		
		List<ImgBoard1DTO> dbdtoList = null;
		List<List<ImgBoard1DTO>> dtoList = null;
		count = service.getCount();
		//count = 100000;
		model.addAttribute("count",count);
		if(count>0){
			dbdtoList = service.getArticles(startRow, endRow);
			model.addAttribute("firstList", dbdtoList.get(0)); //6
			dtoList = new ArrayList<List<ImgBoard1DTO>>();
			for(int i = 1; i<dbdtoList.size(); i+=2) { // 1 3 5 123-4 1234-5 12345-6 123456-7
				ArrayList<ImgBoard1DTO> dtoListSemi = new ArrayList<ImgBoard1DTO>();
				dtoListSemi.add(dbdtoList.get(i));
				if(i+1!=dbdtoList.size()) { // 5 > 6 호출 에러
					dtoListSemi.add(dbdtoList.get(i+1));
				}
				dtoList.add(dtoListSemi);
			}
			//System.out.println(dtoList);
			model.addAttribute("dtoList", dtoList); //6
			int pageCount = count / pageSize + (count % pageSize==0 ? 0 :1);
			int startPage = (int)(currentPage/10)*10+1;
			int pageBlock = 10;
			int endPage = startPage + pageBlock -1;
			if (endPage > pageCount) endPage = pageCount;
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("pageCount", pageCount);
		}
		//number = count - (currentPage-1)*pageSize;
		//model.addAttribute("number", number); // number
		return "/imgBoard1/list";
	}
	
	@RequestMapping("content")
	public String content(HttpServletRequest request, Model model) {
		String board_num = (String)request.getParameter("num");
		if(board_num!=null) {
		}else {
			board_num = "1";
		}
		int img_board1_num = Integer.parseInt(board_num);
		ImgBoard1DTO dto = service.getArticle(img_board1_num);
		System.out.println(dto.getContent()+" "+img_board1_num);
		model.addAttribute("article", dto);
		return "/imgBoard1/content";
	}
	@RequestMapping("write")
	public String write( Model model) {
		return "/imgBoard1/write";
	}
	@RequestMapping("insert")
	public String insert(HttpServletRequest request, ImgBoard1DTO article, Model model) {
		article.setId("ee");
		article.setReg_date(new Timestamp(System.currentTimeMillis()));
		article.setIp(request.getRemoteAddr());
		article.setReadcount(0);
		System.out.println(article);
		service.insert(article);
		return "redirect:/imgBoard1/list";
	}
	
}
