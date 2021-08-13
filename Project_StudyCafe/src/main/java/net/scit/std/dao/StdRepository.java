package net.scit.std.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.scit.std.vo.memberVO;

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
}
