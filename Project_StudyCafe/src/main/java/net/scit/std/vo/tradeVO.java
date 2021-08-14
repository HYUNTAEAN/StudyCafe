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
	private String tradetime;	// 거래 시각
	private String laveexpiry;	// 잔여 유효 일시
	private String productcode; // 상품 코드
	private int lavetime; 		// 잔여 시간
	
}
