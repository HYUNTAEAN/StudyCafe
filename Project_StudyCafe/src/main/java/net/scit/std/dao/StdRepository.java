package net.scit.std.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.scit.std.vo.laveVO;
import net.scit.std.vo.memberVO;
import net.scit.std.vo.productVO;

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

		System.out.println("는:" + lave);
		return lave;
	}


	public laveVO research(String productcode) {
		stdMapper mapper = session.getMapper(stdMapper.class);
		
		laveVO lave = mapper.research(productcode);
		
		return lave;
	}
}
