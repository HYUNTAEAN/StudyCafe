package net.scit.std.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.scit.std.dao.StdRepository;
import net.scit.std.vo.memberVO;

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
	
}
