package net.scit.std.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.scit.std.service.StdService;

@Controller
public class StdController {
	
	StdService service = new StdService();
	
	@RequestMapping("")
	public String example(){
		return "";
	}
	
}
