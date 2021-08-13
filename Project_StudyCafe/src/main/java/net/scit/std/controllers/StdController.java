package net.scit.std.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.scit.std.service.StdService;
import net.scit.std.vo.memberVO;

@Controller
public class StdController {
	
	@Autowired
	StdService service;
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public @ResponseBody String login(String userid, String userpwd, HttpSession session){

		memberVO member = new memberVO(userid, userpwd);
		memberVO m = service.login(member);
		
		if(m == null){
			return "Plz Check your Account";
		}
		session.setAttribute("loginId", userid);
			
		return "Wassup";
	}
	
	@RequestMapping("/join")
	public String join(){
		return "joinForm";
	}
	
	@RequestMapping(value="/joinChk", method=RequestMethod.POST)
	public @ResponseBody String joinChk(String userid){
		System.out.println("sdfsdf");
		memberVO member = service.joinChk(userid);
		
		if(member == null){
			return "SUCCESS";
		}
		
		return "FALSE";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(memberVO member){
		System.out.println("도착함?");
		int result = service.join(member);
		
		if(result == 1){
			System.out.println(result);
			return "redirect:/";
		}
		return "joinForm";
	}
}
