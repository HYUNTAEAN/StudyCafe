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
import net.scit.std.vo.laveVO;
import net.scit.std.vo.memberVO;
import net.scit.std.vo.productVO;
import net.scit.std.vo.tradeVO;

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
		System.out.println(nMonth);
		String[] monthText = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
		
		String eMonth = monthText[nMonth-1];
		return eMonth;
	}


	public int insertTrade(tradeVO trade) {
		String productcode = trade.getProductcode();
		productVO product = selectProductOne(productcode);
		int expiry = product.getExpirytime();
		int producttime = product.getProducttime();
		
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		calendar.add(Calendar.DAY_OF_MONTH, expiry);
		
		SimpleDateFormat fm = new SimpleDateFormat("yy/MM/dd");
		String laveexpiry = fm.format(calendar.getTime());
		trade.setLaveexpiry(laveexpiry);
		trade.setLavetime(producttime);
		
		int result = repo.insertTrade(trade);
		
		return result;
	}


	private productVO selectProductOne(String productcode) {
		productVO product = repo.selectProductOne(productcode);
		
		return product;
	}


	
}
