package net.scit.std.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.scit.std.service.StdService;

@Controller
public class StdController {
	
	@Autowired
	StdService service;
	
	@RequestMapping("")
	public String example(){
		return "";
	}
	
}
