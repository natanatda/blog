package test.spring.controller;

import java.io.File;
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
		int pageSize = 5; // 페이지당 5개 씩 출력
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum); // 페이지 번호 대입
		int start = (currentPage - 1) * pageSize + 1;
		int count = service.countList(); // 글 개수
		int end = currentPage * pageSize;

		// 하단 페이지버
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (currentPage / 10) * 10 + 1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		List<Img_Board2DTO> list = service.getList(start, end);

		model.addAttribute("currentPage", currentPage);
		model.addAttribute("count", count);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("list", list);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		return "img_board2/list";
	}

	@RequestMapping("post")
	public String post(Model model, int img_board2_num) {
		model.addAttribute("board", service.getBoard(img_board2_num));
		return "img_board2/post";
	}

	@RequestMapping("write")
	public String write(Model model, HttpServletRequest request) {
		if (request.getParameter("img_board2_num") != null) {
			int img_board2_num = Integer.parseInt(request.getParameter("img_board2_num"));
			model.addAttribute("board", service.getBoard(img_board2_num));
			model.addAttribute("num", img_board2_num);
		}
		return "img_board2/write";
	}

	@RequestMapping("writeForm")
	public String writeForm(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		model.addAttribute("memId", session.getAttribute("memId"));
		if (request.getParameter("img_board2_num") != null) {
			int img_board2_num = Integer.parseInt(request.getParameter("img_board2_num"));
			model.addAttribute("board", service.getBoard(img_board2_num));

		}
		return "img_board2/writeForm";
	}

	@RequestMapping("writePro")
	public String writePro(Img_Board2DTO dto, MultipartFile imgFile, HttpServletRequest request, HttpSession session) {
//		String id = (String)session.getAttribute("memId");
		dto.setId("ee");
		dto.setIp(request.getRemoteAddr());
		String uploadPath = "";
		if (File.separator.equals("/")) { // File.separator = 운영체제에 따라 다르게 "/" 출력
			uploadPath = "/Users/parkseunghun/blog/blog/src/main/webapp/resources/imgBoard2";
		} else {
			uploadPath = request.getRealPath("/resources/imgBoard2");

		}
		int index = 0;
		String orgName = imgFile.getOriginalFilename();
		String name = orgName.substring(0, orgName.indexOf("."));
		String ext = orgName.substring(orgName.lastIndexOf("."));
		String fileName = "";

		File copy = new File(uploadPath + File.separator + imgFile.getOriginalFilename());
		String type = imgFile.getContentType();

		try {
			while (copy.isFile()) {
				index++;
				copy = new File(uploadPath + File.separator + name + "(" + index + ")" + ext);
				fileName = name + "(" + index + ")" + ext;
			}
			if (type.split("/")[0].equals("image") || type.split("/")[0].equals("png")) {
				imgFile.transferTo(copy);
				dto.setImg(fileName);
			} else {
				System.out.println("중복");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		service.writeBoard(dto);
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
