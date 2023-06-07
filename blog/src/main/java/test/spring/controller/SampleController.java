package test.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import test.spring.component.SampleDTO;
import test.spring.service.SampleService;

@Controller
@RequestMapping("/blog/*")
public class SampleController {

	@Autowired
	private SampleService service;
	
	@RequestMapping("list")
	public String sample(Model model) {
		List<SampleDTO> list = service.all();
		System.out.println(list);
		
		model.addAttribute("list", list);
		return "/sample/list";
	}
}
