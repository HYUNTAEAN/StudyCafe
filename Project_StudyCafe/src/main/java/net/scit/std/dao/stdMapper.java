package net.scit.std.dao;

import net.scit.std.vo.memberVO;

public interface stdMapper {

	public memberVO login(memberVO member);

	public int join(memberVO member);

	public memberVO joinChk(String userid);

}
