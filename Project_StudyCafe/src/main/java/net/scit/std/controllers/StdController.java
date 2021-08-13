package net.scit.std.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.scit.std.service.StdService;
import net.scit.std.vo.laveVO;
import net.scit.std.vo.memberVO;
import net.scit.std.vo.productVO;

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
		int result = service.join(member);
		
		if(result == 1){
			System.out.println(result);
			return "redirect:/";
		}
		return "joinForm";
	}
	
	@RequestMapping("/purchase")
	public String purchase(String productType, Model model, HttpSession session){
		List<productVO> list = service.selectType(productType);
		
		String userid = (String) session.getAttribute("loginId");
		Map<String, String> map = new HashMap<>();
		
		map.put("userid", userid);
		map.put("productType", productType);
		
		int result = service.selectLave(map);
		System.out.println(result);
		
		model.addAttribute("list", list);
		model.addAttribute("lavetime", result);
		
		return "purchaseForm";
	}
	
	@RequestMapping("/research")
	public @ResponseBody Map<String, Integer> research(String productcode, int lvtime){
		
		int result = service.research(productcode);
		System.out.println(result);
		
		lvtime += result;
		
		Map<String, Integer> map = new HashMap<>();
		
		map.put("result", result);
		map.put("lvtime", lvtime);
		
		return map;
	}
}
