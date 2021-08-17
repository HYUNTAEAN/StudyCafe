package net.scit.std.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
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
	public String join(String cod, Model model){
		model.addAttribute("key", cod);
		return "joinForm";
	}
	
	@RequestMapping(value="/joinChk", method=RequestMethod.POST)
	public @ResponseBody String joinChk(String userid){

		memberVO member = service.joinChk(userid);
		
		if(member == null){
			return "SUCCESS";
		}
		
		return "FALSE";
	}
	
	@RequestMapping(value="/resetPassword", method=RequestMethod.GET)
	public String resetPassword(String userid, String userpwd){
		memberVO member = new memberVO(userid, userpwd);
		
		int result = service.resetPassword(member);
		
		return "redirect:/";
	}
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(memberVO member){
		int result = service.join(member);
		
		if(result == 1){
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
		if(!"C".equals(productType)){
			result /= 60;
		}
		
				
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
		
		String type = code.substring(0,1);
		if(!"C".equals(type)){
		result /= 60;
		lvtime /= 60;
		}
		
		map.put("result", result);
		map.put("lvtime", lvtime);
		map.put("expiry", lave.getExpirytime());
		map.put("price", lave.getPrice());

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
	public String endPay(String productcode, Model model, HttpSession session, HttpServletResponse response) throws IOException{
		
		String userid = (String) session.getAttribute("loginId");
		
		
		
		tradeVO trade = new tradeVO(0, userid, null, null, productcode, 0, null);
		
		int result = service.insertTrade(trade);
		String type = productcode.substring(0,1);
		
		if("A".equals(type)){
			productcode = trade.getProductcode();
			productVO product = service.selectProductOne(productcode);
			int expiry = product.getExpirytime();
			int producttime = product.getProducttime();
			
			Calendar calendar = new GregorianCalendar(Locale.KOREA);
			calendar.add(Calendar.DAY_OF_MONTH, expiry);
			
			SimpleDateFormat fm = new SimpleDateFormat("yy/MM/dd hh:mm");
			String laveexpiry = fm.format(calendar.getTime());
			
			chargeVO charge = new chargeVO(0, userid, laveexpiry, producttime, productcode, null);
			
			useVO use = service.selectUse(userid);

			Map<String, String> map = new HashMap<>();
			
			map.put("userid", userid);
			map.put("productType", type);
			
			List<chargeVO> chargedList = service.selectChargeInfo(map);
			
			if(chargedList.size() > 0 || use != null){
				
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('충전 정보가 존재합니다'); location.href='/std/'; </script>");
					out.flush();
			}
			
			int result2 = service.insertCharge(charge);
			
			List<seatVO> list = service.selectSeatList();

			model.addAttribute("list", list);
			model.addAttribute("productType", type);
			
			return "seatForm";
			
		}
		return "redirect:/";
	}
	
	@RequestMapping("/charge")
	public String chargeForm(String productType, Model model, HttpSession session) {
		Map<String,String> map = new HashMap<>();

		String userid = (String) session.getAttribute("loginId");
		
		map.put("userid", userid);
		map.put("productType", productType);
		
		List<tradeVO> list = service.selectTradeList(map);
		laveVO charged = service.selectChargeOne(map);
		int lavetime = 0;
		if(charged != null){
			lavetime = charged.getLavetime();
		}
		if("B".equals(productType)){
			for(tradeVO t : list){
				int lv = t.getLavetime();
				lv /= 60;
				t.setLavetime(lv);
			}
			lavetime /=60;
		}
		
		model.addAttribute("lavetime", lavetime);
		model.addAttribute("productType", productType);
		model.addAttribute("list", list);
		
		return "chargeForm";
	}
	
	@RequestMapping("/chargeChk")
	public @ResponseBody String chargeChk(String type, HttpSession session){
		String userid = (String) session.getAttribute("loginId");		
		Map<String, String> map = new HashMap<>();
		
		map.put("userid", userid);
		map.put("productType", type);
		
		List<chargeVO> charge = service.selectChargeInfo(map);
		
		if(charge.size() < 1){
			return "SUCCESS";
		}
		
		return "FAIL";
	}
	
	@RequestMapping("/inputCharge")
	public String inputCharge(String type, String cod, String chargetime, HttpSession session){
		String userid = (String) session.getAttribute("loginId");

		// 타입, 코드(시간-거래번호 , 기간제-상품코드, 충전할시간)
		
		int finalCharge = (Integer.parseInt(chargetime));

		if("B".equals(type)){
			finalCharge *= 60;
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
			
			SimpleDateFormat fm = new SimpleDateFormat("yy/MM/dd hh:mm");// 프로덕트에서 시간 가져와서 차지타임 대체
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
	
	@RequestMapping("/useChk")
	public @ResponseBody String useChk(String productType, HttpSession session){
		String userid = (String) session.getAttribute("loginId");
		Map <String, String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("productType", productType);
		
		List<chargeVO> charge = service.selectChargeInfo(map);
		useVO use = service.selectUse(userid);
		
		if(charge.size() < 1){
			return "NoCharged";
		}
		if(use != null){
			return "Used";
		}
		return "SUCCESS";
	}
	
	@RequestMapping("/use")
	public String use(String productType, Model model, HttpSession session){
		
		List<seatVO> list = service.selectSeatList();

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
			
			SimpleDateFormat fm = new SimpleDateFormat("yy/MM/dd HH24:MI");
			endtime = fm.format(calendar.getTime());
		} else {
			Calendar calendar = new GregorianCalendar(Locale.KOREA);
			calendar.add(Calendar.HOUR, chargetime);
			
			SimpleDateFormat fm = new SimpleDateFormat("yy/MM/dd hh:mm");
			endtime = fm.format(calendar.getTime());	
		}
		
		useVO use = new useVO(0, userid, null, endtime, seatnum);
		
		int result = service.insertUse(use);
		
		if(result == 1){
			return "redirect:/";
		}
		return "redirect:/";
	}
	
	@RequestMapping("/leave")
	public String leave(HttpSession session){
		String userid = (String) session.getAttribute("loginId");
		String type = "B";
		
		Map<String, String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("productType", type);
		
		useVO use = service.selectUse(userid);
		
		if(use == null){
			return "redirect:/";
		}
		
		String starttime = use.getStarttime();
		String nYear1 = "20" + starttime.substring(0, 2);
		String nMonth1 = starttime.substring(3, 5);
		String nDay1 = starttime.substring(6, 8);
		String nHour1 = starttime.substring(9, 11);
		String nMin1 = starttime.substring(12);
		
		Calendar cal1 = new GregorianCalendar();
		cal1.set(Integer.parseInt(nYear1), (Integer.parseInt(nMonth1)-1), Integer.parseInt(nDay1), Integer.parseInt(nHour1), Integer.parseInt(nMin1));
		
		Calendar calnow = new GregorianCalendar(Locale.KOREA);

		long diffSec = (calnow.getTimeInMillis() - cal1.getTimeInMillis())/1000;
		long diffMin = diffSec/60;
		
		int paybackMin = (int) diffMin;
		
		chargeVO charge = service.selectChargeTime(map);
		
		int chargetime = 0; 
		if(charge != null){
		chargetime = charge.getChargetime();
		chargetime += paybackMin;
		upChargeVO payback = new upChargeVO(0, userid, chargetime, null);
		
		int result = service.deleteUse(userid);
		int result2 = service.paybackTime(payback); 
		}
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping("/seatChange")
	public @ResponseBody String seatChange(HttpSession session){

		String userid = (String) session.getAttribute("loginId");
		useVO use = service.selectUse(userid);
		
		if(use == null){
			return "FAIL";
		}
		return "SUCCESS";
	}
	
	@RequestMapping("/useChange")
	public String useChange(int seatnum, String proType, HttpSession session){
		String userid = (String) session.getAttribute("loginId"); 
		useVO use = service.selectUse(userid);
		
		use.setSeatnum(seatnum);
		
		int result = service.updateUse(use);
		
		if(result == 1){
			return "redirect:/";
		}
		return "redirect:/";
	}
	
	@RequestMapping("/userInfo")
	public String userInfo(Model model, HttpSession session){
		String userid = (String) session.getAttribute("loginId");
		Map<String, String> map = new HashMap<>();
		
		map.put("userid", userid);
		map.put("productType", "C");
		
		String cName = null;
		String bName = null;
		String aName = null;
		
		List<chargeVO> chargeC = service.selectChargeInfo(map);
		if(chargeC.size() > 0){
		cName = service.selectPName(chargeC.get(0).getProductcode());
		}
		map.put("productType", "B");
		
		List<chargeVO> chargeB = service.selectChargeInfo(map);
		if(chargeB.size() > 0){
			bName = service.selectPName(chargeB.get(0).getProductcode());
			}
		map.put("productType", "A");
		
		List<chargeVO> chargeA = service.selectChargeInfo(map);
		if(chargeA.size() > 0){
			aName = service.selectPName(chargeA.get(0).getProductcode());
			}
		
		
		int cTime = 0;
		int bTime = 0;
		int aTime = 0;
		
		if(chargeC.size() > 0){
			cTime = chargeC.get(0).getChargetime();	
		}
		if(chargeB.size() > 0){
			bTime = chargeB.get(0).getChargetime()/60;
		}
		if(chargeA.size() > 0){
			aTime = chargeA.get(0).getChargetime()/60; 
		}
		model.addAttribute("chargeC", chargeC);
		model.addAttribute("chargeB", chargeB);
		model.addAttribute("chargeA", chargeA);
		model.addAttribute("cTime", cTime);
		model.addAttribute("bTime", bTime);
		model.addAttribute("aTime", aTime);
		model.addAttribute("cName", cName);
		model.addAttribute("bName", bName);
		model.addAttribute("aName", aName);
		
		return "userinfoForm";
	}
	
	@RequestMapping("ticketChk")
	public @ResponseBody String ticketChk(String type, HttpSession session){
		String userid = (String) session.getAttribute("loginId");
		Map <String, String> map = new HashMap<>();
		
		map.put("userid", userid);
		map.put("productType", type);
		
		if("A".equals(type)){
		List<tradeVO> trade = service.ticketChk(map);
			if(trade.size() > 1){
				return "FAIL";
			}
		}
		if("B".equals(type)){
			List<tradeVO> tradelist = service.ticketChk2(map);
				if(tradelist.size() > 0){
					return "FAIL";
				}
			}
		
		return "SUCCESS";
	}
}
