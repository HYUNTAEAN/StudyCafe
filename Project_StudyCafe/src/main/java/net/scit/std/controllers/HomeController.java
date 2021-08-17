package net.scit.std.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.scit.std.service.StdService;
import net.scit.std.vo.laveVO;

@Controller
public class HomeController {
	
	@Autowired
	StdService service;
	
	@RequestMapping("/")
	public String main(Model model) {
		
		laveVO availSeat = service.availSeat();
		int avail = availSeat.getLavetime();
		
		laveVO unavailSeat = service.unavailSeat();
		int unavail = unavailSeat.getLavetime();
		
		int finalSeat = avail - unavail;
		model.addAttribute("availSeat", finalSeat);
		
		return "mainForm";
	}
	
}
