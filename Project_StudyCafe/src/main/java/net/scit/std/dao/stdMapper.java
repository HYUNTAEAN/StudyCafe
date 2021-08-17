package net.scit.std.dao;

import java.util.List;
import java.util.Map;

import net.scit.std.vo.chargeVO;
import net.scit.std.vo.laveVO;
import net.scit.std.vo.memberVO;
import net.scit.std.vo.productVO;
import net.scit.std.vo.seatVO;
import net.scit.std.vo.tradeVO;
import net.scit.std.vo.upChargeVO;
import net.scit.std.vo.useVO;

public interface stdMapper {

	public memberVO login(memberVO member);

	public int join(memberVO member);

	public memberVO joinChk(String userid);

	public List<productVO> selectType(String productType);

	public laveVO selectLave(Map<String, String> map);

	public laveVO research(String productcode);

	public productVO selectProductOne(String productcode);

	public int insertTrade(tradeVO trade);

	public List<tradeVO> selectTradeList(Map<String, String> map);

	public laveVO selectChargeOne(Map<String, String> map);

	public tradeVO selectTradeOne(int tradenum);

	public int insertCharge(chargeVO charge);

	public tradeVO selectTradeDay(Map<String, String> map);

	public int updateTrade(upChargeVO upCharge);

	public List<chargeVO> selectChargeInfo(Map<String, String> map);

	public List<seatVO> selectSeatList();

	public useVO selectSeatOne(int seatnum);

	public int insertUse(useVO use);

	public chargeVO selectChargeTime(Map<String, String> map);

	public int deleteUse(String userid);

	public useVO selectUse(String userid);

	public int paybackTime(upChargeVO payback);

	public int updateUse(useVO use);

	public List<chargeVO> selectChargeAll(String userid);

	public String selectPName(String productcode);

	public List<tradeVO> ticketChk(Map<String, String> map);

	public List<tradeVO> ticketChk2(Map<String, String> map);

	public int resetPassword(memberVO member);

	public laveVO availSeat();

	public laveVO unavailSeat();

}
