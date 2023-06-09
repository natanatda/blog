package test.spring.controller;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import test.spring.component.Img_Board2DTO;
import test.spring.service.ImageBoard2Service;

@Controller
@RequestMapping("/img_board2/*")
public class ImageBoard2Controller {
	
	@Autowired
	private ImageBoard2Service service;
	
	@RequestMapping("list")
	public String main(Model model, HttpServletRequest request) {
		int pageSize = 5;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {pageNum = "1";}
		int currentPage = Integer.parseInt(pageNum);
		int start = (currentPage-1)*pageSize +1;
		int count = service.countList(); // 글 개수
		int end = currentPage * pageSize;
		
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (currentPage / 10) * 10 + 1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) {endPage = pageCount;}
		
		List<Img_Board2DTO> list = service.getList(start, end);
		List<Img_Board2DTO> countList = new ArrayList<>();
		for(int i = 0; i < list.size(); i++) {
			countList.add(list.get(i));
		}
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("count",count);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("list",list); 
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		return "img_board2/list";
	}
	
	@RequestMapping("post")
	public String post(Model model, int img_board2_num) {
		model.addAttribute("board",service.getBoard(img_board2_num));
		return "img_board2/post";
	}
	@RequestMapping("write")
	public String write(Model model, HttpServletRequest request) {
		if(request.getParameter("img_board2_num") != null) {
			int img_board2_num = Integer.parseInt(request.getParameter("img_board2_num"));
			model.addAttribute("board",service.getBoard(img_board2_num));
			model.addAttribute("num",img_board2_num);
		}
		return "img_board2/write";
	}
	
	@RequestMapping("writeForm")
	public String writeForm(Model model, HttpServletRequest request) {
		if(request.getParameter("img_board2_num") != null) {
			int img_board2_num = Integer.parseInt(request.getParameter("img_board2_num"));
			model.addAttribute("board",service.getBoard(img_board2_num));
		
		}
		return "img_board2/writeForm";
	}
	
	@RequestMapping("writePro")
	public String writePro(Img_Board2DTO dto, MultipartFile imgFile, HttpServletRequest request, HttpSession session) {
//		String id = (String)session.getAttribute("memId");
		dto.setId("ee");
		dto.setIp(request.getRemoteAddr());

		service.writeBoard(dto);

		String uploadPath = request.getRealPath("/resources/imgBoard2");
		
		int index = 0;
		String orgName = imgFile.getOriginalFilename(); 
		String name = orgName.substring(0, orgName.indexOf("."));
		String ext = orgName.substring( orgName.lastIndexOf("."));
		
		File copy = new File(uploadPath+"/"+imgFile.getOriginalFilename());
		String type = imgFile.getContentType();
		try {
			while(copy.isFile()) {
				index++;
				copy = new File(uploadPath+"/"+name+"("+index+")"+ext);
			}
			if(copy.exists()) {
				if(type.split("/")[0].equals("image")){
					imgFile.transferTo(copy);
				}
			}else {
				if(type.split("/")[0].equals("image")){
					imgFile.transferTo(copy);
				}
			}
		}catch(Exception e) {e.printStackTrace();}
			return "redirect:/img_board2/list";
		}
	@RequestMapping("deletePro")
	public String deletePro(int img_board2_num) {
		service.deleteBoard(img_board2_num); 
		return "redirect:/img_board2/list";
	}
	@RequestMapping("updatePro")
	public String updatePro(Img_Board2DTO dto, HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("img_board2_num"));
		dto.setImg_board2_num(num);
		service.updateBoard(dto); 
		return "redirect:/img_board2/list";
	}
}
