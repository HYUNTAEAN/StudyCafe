package net.scit.std.controllers;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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
import net.scit.std.vo.tradeVO;

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
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");
		return "redirect:/";
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
		
		model.addAttribute("productType", productType);
		model.addAttribute("list", list);
		model.addAttribute("lavetime", result);
		
		return "purchaseForm";
	}
	
	@RequestMapping("/research")
	public @ResponseBody Map<String, Integer> research(String productcode, int lvtime){
		
		laveVO lave = service.research(productcode);

		Map<String, Integer> map = new HashMap<>();
		
		int result = 0;
		if(lave != null){
			result += lave.getLavetime();
		}
		
		lvtime += result;
		
		map.put("result", result);
		map.put("lvtime", lvtime);
		map.put("expiry", lave.getExpirytime());
		map.put("price", lave.getPrice());
		
		return map;
	}
	
	@RequestMapping("/payment")
	public String payment(String lavetime, String chargetime, String plustime, String type, int expiry, int price, String cod, Model model){

		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		calendar.add(Calendar.DAY_OF_MONTH, expiry);
		int nYear = calendar.get(Calendar.YEAR);
		int nMonth = calendar.get(Calendar.MONTH) + 1;
		int nDay = calendar.get(Calendar.DAY_OF_MONTH);
		int nHour = calendar.get(Calendar.HOUR_OF_DAY);
		int nMinu = calendar.get(Calendar.MINUTE);
		
		
		System.out.println(nHour + " " + nMinu);
		System.out.println(nYear + " " + nMonth + " " + nDay);
		
		String eMonth = service.monthCal(nMonth);
		
		model.addAttribute("productcode", cod);
		model.addAttribute("nYear", nYear);
		model.addAttribute("eMonth", eMonth);
		model.addAttribute("nDay", nDay);
		model.addAttribute("nHour", nHour);
		model.addAttribute("nMinu", nMinu);
		model.addAttribute("lavetime", lavetime);
		model.addAttribute("chargetime", chargetime);
		model.addAttribute("plustime", plustime);
		model.addAttribute("type", type);
		model.addAttribute("expiry", expiry);
		model.addAttribute("price", price);
		
		return "paymentForm";
	}
	
	@RequestMapping("/endPay")
	public String endPay(String productcode, HttpSession session){
		
		String userid = (String) session.getAttribute("loginId");
		
		
		
		tradeVO trade = new tradeVO(0, userid, null, null, productcode, 0);
		
		int result = service.insertTrade(trade);
		
		return "redirect:/";
	}
	
	@RequestMapping("/charge")
	public String chargeForm() {
		return "chargeForm";
	}
}
