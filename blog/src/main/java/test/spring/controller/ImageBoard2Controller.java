package test.spring.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import test.spring.service.ImageBoard2Service;

@Controller
@RequestMapping("/img_board2/*")
public class ImageBoard2Controller {
	
	@Autowired
	private ImageBoard2Service service;
	
	
	@RequestMapping("main")
	public String main() {
		return "blog/main";
	}
	@RequestMapping("post")
	public String post() {
		return "blog/post";
	}
	@RequestMapping("list")
	public String list(Model model) {
		model.addAttribute("count",service.countList());
		model.addAttribute("list",service.getList(1,10));
		
		return "blog/img_board2_List";
	}
	@RequestMapping("writeForm")
	public String writeForm() {
		return "blog/writeForm";
	}
	
	@RequestMapping("test3")
	// 변수 이름 파라미터와 동일하게, MultipartFile
	public String ex11Pro(MultipartFile save, HttpServletRequest request) {
		String type = save.getContentType();
		String types[] = type.split("/");
		String uploadPath = request.getRealPath("/resources/upload/board2");
		
		if(types[0].equals("image")) {
			String uuid = UUID.randomUUID().toString();
			File copy = new File(uploadPath +"/"+ uuid + save.getOriginalFilename());
			if(!(copy.isFile())) {
				try { 
					save.transferTo(copy); // 업로드 된 파일을 카피
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}else {
			System.out.println("사진만 업로드 가능합니다.");
		}
		return "/sample/test3"; 
	}	
}
