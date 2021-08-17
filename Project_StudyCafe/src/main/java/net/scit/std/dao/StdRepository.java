package net.scit.std.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.scit.std.vo.chargeVO;
import net.scit.std.vo.laveVO;
import net.scit.std.vo.memberVO;
import net.scit.std.vo.productVO;
import net.scit.std.vo.seatVO;
import net.scit.std.vo.tradeVO;
import net.scit.std.vo.upChargeVO;
import net.scit.std.vo.useVO;

@Repository
public class StdRepository {
	
	@Autowired
	SqlSession session;
	

	public memberVO login(memberVO member) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		System.out.println(member);
		memberVO m = mapper.login(member);
		
		return m;
	}


	public int join(memberVO member) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		int result = mapper.join(member);
		
		return result;
	}


	public memberVO joinChk(String userid) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		memberVO member = mapper.joinChk(userid);
		
		return member;
	}


	public List<productVO> selectType(String productType) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		List<productVO> list = mapper.selectType(productType);
		
		return list;
	}


	public laveVO selectLave(Map<String, String> map) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		laveVO lave = mapper.selectLave(map);

		return lave;
	}


	public laveVO research(String productcode) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		laveVO lave = mapper.research(productcode);
		
		return lave;
	}


	public productVO selectProductOne(String productcode) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		productVO product = mapper.selectProductOne(productcode);
		
		return product;
	}


	public int insertTrade(tradeVO trade) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		int result = mapper.insertTrade(trade);
		
		return result;
	}


	public List<tradeVO> selectTradeList(Map<String, String> map) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		List<tradeVO> list = mapper.selectTradeList(map);
		
		return list;
	}


	public laveVO selectChargeOne(Map<String, String> map) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		laveVO lave = mapper.selectChargeOne(map);
		
		return lave;
	}


	public tradeVO selectTradeOne(int tradenum) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		tradeVO trade = mapper.selectTradeOne(tradenum);
		
		return trade;
	}


	public int insertCharge(chargeVO charge) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		int result = mapper.insertCharge(charge);
		
		return result;
	}


	public tradeVO selectTradeDay(Map<String, String> map) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		tradeVO trade = mapper.selectTradeDay(map);
		
		return trade;
	}


	public int updateTrade(upChargeVO upCharge) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		int result = mapper.updateTrade(upCharge);
		
		return result;
	}


	public List<chargeVO> selectChargeInfo(Map<String, String> map) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		List<chargeVO> charge = mapper.selectChargeInfo(map);
		
		return charge;
	}


	public List<seatVO> selectSeatList() {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		List<seatVO> list = mapper.selectSeatList();
		
		return list;
	}


	public useVO selectSeatOne(int seatnum) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		useVO use = mapper.selectSeatOne(seatnum);
		
		return use;
	}


	public int insertUse(useVO use) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		int result = mapper.insertUse(use);
		
		return result;
	}


	public chargeVO selectChargeTime(Map<String, String> map) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		chargeVO list = mapper.selectChargeTime(map);
		
		return list;
	}


	public int deleteUse(String userid) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		int result = mapper.deleteUse(userid);
		
		return result;
	}


	public useVO selectUse(String userid) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		useVO use = mapper.selectUse(userid);
		
		return use;
	}


	public int paybackTime(upChargeVO payback) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		int result = mapper.paybackTime(payback);
		
		return result;
	}


	public int updateUse(useVO use) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		int result = mapper.updateUse(use);
		
		return result;
	}


	public List<chargeVO> selectChargeAll(String userid) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		List<chargeVO> charge = mapper.selectChargeAll(userid);
		
		return charge;
	}


	public String selectPName(String productcode) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		String productName = mapper.selectPName(productcode);
		
		return productName;
	}


	public List<tradeVO> ticketChk(Map<String, String> map) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		List<tradeVO> product = mapper.ticketChk(map);
		
		return product;
	}


	public List<tradeVO> ticketChk2(Map<String, String> map) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		List<tradeVO> tradelist = mapper.ticketChk2(map);
		
		return tradelist;
	}


	public int resetPassword(memberVO member) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		int result = mapper.resetPassword(member);
		
		return result;
	}
}
