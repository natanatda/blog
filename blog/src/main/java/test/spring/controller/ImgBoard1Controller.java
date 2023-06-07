package test.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import test.spring.service.ImgBoard1Service;

@Controller
@RequestMapping("/imgBoard1/*")
public class ImgBoard1Controller {
	
	@Autowired
	private ImgBoard1Service service;
	
	@RequestMapping("sample")
	public String sample(Model model) {
		model.addAttribute("list", service.getArticles());
		return "/sample/sample";
	}
}
