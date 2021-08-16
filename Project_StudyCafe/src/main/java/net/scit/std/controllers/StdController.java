package net.scit.std.controllers;

import java.text.SimpleDateFormat;
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
import net.scit.std.vo.chargeVO;
import net.scit.std.vo.laveVO;
import net.scit.std.vo.memberVO;
import net.scit.std.vo.productVO;
import net.scit.std.vo.seatVO;
import net.scit.std.vo.tradeVO;
import net.scit.std.vo.upChargeVO;
import net.scit.std.vo.useVO;

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
	public @ResponseBody Map<String, Integer> research(String code, int lvtime){
		
		laveVO lave = service.research(code);

		Map<String, Integer> map = new HashMap<>();
		
		int result = 0;
		if(lave != null){
			result += lave.getLavetime();
		}
		
		lvtime += result;
		
		System.out.println(lave.getExpirytime());
		map.put("result", result);
		map.put("lvtime", lvtime);
		map.put("expiry", lave.getExpirytime());
		map.put("price", lave.getPrice());
		System.out.println(map);
		return map;
	}
	
	@RequestMapping("/research2")
	public @ResponseBody int research2(int lvtime, int hidCharge){
		
		lvtime += hidCharge;
		
		return lvtime;
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
		
		
		
		tradeVO trade = new tradeVO(0, userid, null, null, productcode, 0, null);
		
		int result = service.insertTrade(trade);
		
		return "redirect:/";
	}
	
	@RequestMapping("/charge")
	public String chargeForm(String productType, Model model, HttpSession session) {
		Map<String,String> map = new HashMap<>();

		String userid = (String) session.getAttribute("loginId");
		
		map.put("userid", userid);
		map.put("productType", productType);
		
		List<tradeVO> list = service.selectTradeList(map);
		laveVO charged = service.selectChargeOne(userid);
		int lavetime = 0;
		
		if(charged != null){
			lavetime = charged.getLavetime();
		}
		
		model.addAttribute("lavetime", lavetime);
		model.addAttribute("productType", productType);
		model.addAttribute("list", list);
		
		return "chargeForm";
	}
	
	@RequestMapping("/inputCharge")
	public String inputCharge(String type, String cod, String chargetime, HttpSession session){
		String userid = (String) session.getAttribute("loginId");

		// 타입, 코드(시간-거래번호 , 기간제-상품코드, 충전할시간)
		
		int finalCharge = Integer.parseInt(chargetime);

		if("B".equals(type)){
			int tradenum = Integer.parseInt(cod);
			tradeVO trade = service.selectTradeOne(tradenum);

			String productcode = trade.getProductcode();
			String laveexpiry = trade.getLaveexpiry();
			chargeVO charge = new chargeVO(0, userid, laveexpiry, finalCharge, productcode, null);
			
			int result = service.insertCharge(charge);
			
			int lavetime = trade.getLavetime();
			int finalLavetime = lavetime - finalCharge;
			
			upChargeVO upCharge = new upChargeVO(tradenum, userid, finalLavetime, null);
			int result2 = service.updateTrade(upCharge);
			
		} else {
			Map<String, String> map = new HashMap<>();
			map.put("userid", userid);
			map.put("productcode", cod);
			tradeVO trade = service.selectTradeDay(map);
			
			productVO product = service.selectProductOne(cod);
			
			int charget = product.getProducttime();
			
			Calendar calendar = new GregorianCalendar(Locale.KOREA);
			calendar.add(Calendar.DAY_OF_MONTH, charget);
			
			SimpleDateFormat fm = new SimpleDateFormat("yy/MM/dd");// 프로덕트에서 시간 가져와서 차지타임 대체
			String laveexpiry = fm.format(calendar.getTime());

			chargeVO charge = new chargeVO(0, userid, laveexpiry, finalCharge, cod, null);

			int result = service.insertCharge(charge);
			
		}
		return "redirect:/";
	}
	
	@RequestMapping("/timeChk")
	public @ResponseBody int timeChk(String code){
		int tradenum = Integer.parseInt(code);
		tradeVO trade = service.selectTradeOne(tradenum);
		int lvtime = trade.getLavetime();
		
		return lvtime;
	}
	
	@RequestMapping("/use")
	public String use(String productType, Model model, HttpSession session){
		String userid = (String) session.getAttribute("loginId");
		Map <String, String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("productType", productType);
		
		List<chargeVO> charge = service.selectChargeInfo(map);
		
		if(charge.size() < 1){
			return "redirect:/";
		}
		List<seatVO> list = service.selectSeatList();

		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("productType", productType);
		
		return "seatForm";
	}
	
	@RequestMapping("/seatChk")
	public @ResponseBody String seatChk(int seatnum){
		
		useVO use = service.selectSeatOne(seatnum);
		
		if(use != null){
			return "FAIL";
		}
		return "SUCCESS";
	}
	
	@RequestMapping("/inuse")
	public String use(int seatnum, String proType, HttpSession session){
		String userid = (String) session.getAttribute("loginId");
		
		Map<String, String> map = new HashMap<>();
		
		map.put("userid", userid);
		map.put("productType", proType);
		System.out.println("proType : " + proType);
		chargeVO alltime = service.selectChargeTime(map);
		
		if(alltime == null){
			System.out.println("nullPoint Exception");
			return "redirect:/";
		}
			
		int chargetime =  alltime.getChargetime();
	
		
		String endtime = null;
		
		if(proType == "C"){
			Calendar calendar = new GregorianCalendar(Locale.KOREA);
			calendar.add(Calendar.DAY_OF_MONTH, chargetime);
			
			SimpleDateFormat fm = new SimpleDateFormat("yy/MM/dd");
			endtime = fm.format(calendar.getTime());
		} else {
			Calendar calendar = new GregorianCalendar(Locale.KOREA);
			calendar.add(Calendar.HOUR, chargetime);
			System.out.println(calendar);
			SimpleDateFormat fm = new SimpleDateFormat("yy/MM/dd");
			endtime = fm.format(calendar.getTime());	
		}
		
		useVO use = new useVO(0, userid, null, endtime, seatnum);
		
		int result = service.insertUse(use);
		
		if(result == 1){
			System.out.println("success");
			return "redirect:/";
		}
		System.out.println("fail");
		return "redirect:/";
	}
}
