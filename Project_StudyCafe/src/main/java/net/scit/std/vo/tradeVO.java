package net.scit.std.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class tradeVO {
	private int tradenum;		// 거래 번호
	private String userid;		// 유저 아이디
	private int producttime;	// 상품 시간
	private String tradetime;	// 거래 일시
	private String expirytime;	// 만료 기간
	
}
