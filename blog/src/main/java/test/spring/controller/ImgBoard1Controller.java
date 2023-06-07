package test.spring.controller;

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
		int number = 0;
		
		List<ImgBoard1DTO> dtoList = null;
		count = service.getCount();
		//count = 100000;
		model.addAttribute("count",count);
		if(count>0){
			dtoList = service.getArticles(startRow, endRow);
			model.addAttribute("firstList", dtoList.get(0)); //6
			for(int i = 1; i<pageSize; i+=2) { // 1 3 5
				ArrayList<ImgBoard1DTO> dtoListSemi = new ArrayList<ImgBoard1DTO>();
				dtoListSemi.add(dtoList.get(i));
				if(dtoList.get(i+1)!=null) {
					dtoListSemi.add(dtoList.get(i+1));
				}
				System.out.println(dtoListSemi);
				System.out.println("List"+((i-1)/2+1));
				model.addAttribute("List"+((i-1)/2+1), dtoListSemi); //6
			}
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
		number = count - (currentPage-1)*pageSize;
		model.addAttribute("number", number); // number
		return "/imgBoard1/list";
	}
}
