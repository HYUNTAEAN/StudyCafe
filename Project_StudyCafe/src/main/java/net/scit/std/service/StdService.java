package net.scit.std.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.scit.std.dao.StdRepository;
import net.scit.std.vo.laveVO;
import net.scit.std.vo.memberVO;
import net.scit.std.vo.productVO;

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


	public int research(String productcode) {
		laveVO lave = repo.research(productcode);
		
		int result = 0;
		if(lave != null){
			result += lave.getLavetime();
		}
		
		return result;
	}
	
}
