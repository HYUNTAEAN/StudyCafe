package net.scit.std.dao;

import java.util.List;
import java.util.Map;

import net.scit.std.vo.laveVO;
import net.scit.std.vo.memberVO;
import net.scit.std.vo.productVO;

public interface stdMapper {

	public memberVO login(memberVO member);

	public int join(memberVO member);

	public memberVO joinChk(String userid);

	public List<productVO> selectType(String productType);

	public laveVO selectLave(Map<String, String> map);

	public laveVO research(String productcode);

}
