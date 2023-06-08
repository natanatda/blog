package com.example.demo.smarteditor.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SmartEditorController {
	
	
	@RequestMapping("/smarteditor")
	public String smartEditor() {
		return "smartEditor";
	}
	
	
}