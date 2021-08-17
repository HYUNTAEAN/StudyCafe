package net.scit.std.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.scit.std.dao.StdRepository;
import net.scit.std.vo.chargeVO;
import net.scit.std.vo.laveVO;
import net.scit.std.vo.memberVO;
import net.scit.std.vo.productVO;
import net.scit.std.vo.seatVO;
import net.scit.std.vo.tradeVO;
import net.scit.std.vo.upChargeVO;
import net.scit.std.vo.useVO;

@Service
public class StdService {
	
	@Autowired
	StdRepository repo;
	
	
	public void example(){
		
	}


	public memberVO login(memberVO member) {
		
		memberVO m = repo.login(member);
		
		return m;
	}


	public int join(memberVO member) {

		int result = repo.join(member);
		
		return result;
	}


	public memberVO joinChk(String userid) {

		memberVO member = repo.joinChk(userid);
		
		return member;
	}


	public List<productVO> selectType(String productType) {
		List<productVO> list = repo.selectType(productType);
		
		return list;
	}


	public int selectLave(Map<String, String> map) {
		laveVO lave = repo.selectLave(map);
		
		int result = 0;
		if(lave != null){
			result += lave.getLavetime();
		}
		
		return result;
	}


	public laveVO research(String productcode) {
		laveVO lave = repo.research(productcode);
		
		
		
		return lave;
	}


	public String monthCal(int nMonth) {
		String[] monthText = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
		
		String eMonth = monthText[nMonth-1];
		return eMonth;
	}


	public int insertTrade(tradeVO trade) {
		String productcode = trade.getProductcode();
		productVO product = selectProductOne(productcode);
		int expiry = product.getExpirytime();
		int producttime = product.getProducttime();
		String productname = product.getProductname();
		
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		calendar.add(Calendar.DAY_OF_MONTH, expiry);
		
		SimpleDateFormat fm = new SimpleDateFormat("yy/MM/dd hh:mm");
		String laveexpiry = fm.format(calendar.getTime());
		trade.setLaveexpiry(laveexpiry);
		trade.setLavetime(producttime);
		trade.setProductname(productname);
		
		int result = repo.insertTrade(trade);
		
		return result;
	}


	public productVO selectProductOne(String productcode) {
		productVO product = repo.selectProductOne(productcode);
		
		return product;
	}


	public List<tradeVO> selectTradeList(Map<String, String> map) {
		List<tradeVO> list = repo.selectTradeList(map);
		
		return list;
	}


	public laveVO selectChargeOne(Map<String, String> map) {
		laveVO lave = repo.selectChargeOne(map);
		
		return lave;
	}


	public tradeVO selectTradeOne(int tradenum) {
		tradeVO trade = repo.selectTradeOne(tradenum);
		
		return trade;
	}


	public int insertCharge(chargeVO charge) {
		int result = repo.insertCharge(charge);
		
		return result;
	}


	public tradeVO selectTradeDay(Map<String, String> map) {
		tradeVO trade = repo.selectTradeDay(map);
		
		return trade;
	}


	public int updateTrade(upChargeVO upCharge) {
		
		int result = repo.updateTrade(upCharge);
		
		return result;
	}


	public List<chargeVO> selectChargeInfo(Map<String, String> map) {
		List<chargeVO> charge = repo.selectChargeInfo(map);
		
		return charge;
	}


	public List<seatVO> selectSeatList() {
		List<seatVO> list = repo.selectSeatList();
		
		return list;
	}


	public useVO selectSeatOne(int seatnum) {
		useVO use = repo.selectSeatOne(seatnum);
		
		return use;
	}


	public int insertUse(useVO use) {
		
		
		int result = repo.insertUse(use);
		
		return result;
	}


	public chargeVO selectChargeTime(Map<String, String> map) {
		chargeVO list = repo.selectChargeTime(map);
		
		return list;
	}


	public int deleteUse(String userid) {
		int result = repo.deleteUse(userid);
		
		return result;
	}


	public useVO selectUse(String userid) {
		useVO use = repo.selectUse(userid);
		
		return use;
	}


	public int paybackTime(upChargeVO payback) {
		int result = repo.paybackTime(payback);
		
		return result;
	}


	public int updateUse(useVO use) {
		int result = repo.updateUse(use);
		
		return result;
	}


	public List<chargeVO> selectChargeAll(String userid) {
		List<chargeVO> charge = repo.selectChargeAll(userid);
		
		return charge;
	}


	public String selectPName(String productcode) {
		String productName = repo.selectPName(productcode);
		
		return productName;
	}


	public tradeVO ticketChk(Map<String, String> map) {
		tradeVO product = repo.ticketChk(map);
		
		return product;
	}


	public List<tradeVO> ticketChk2(Map<String, String> map) {
		List<tradeVO> tradelist = repo.ticketChk2(map);
		
		return tradelist;
	}


	
}
