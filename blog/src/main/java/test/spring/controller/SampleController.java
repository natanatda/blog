package test.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import test.spring.component.SampleDTO;
import test.spring.service.SampleService;

@Controller
@RequestMapping("/sample/*")
public class SampleController {
	@Autowired
	private SampleService service;
	

	
	@RequestMapping("test2")
	public String testPrint2() {
		return "/sample/test2";
	}
}
