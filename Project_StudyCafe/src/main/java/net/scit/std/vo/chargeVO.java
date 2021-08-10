package net.scit.std.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class chargeVO {
	private int chargenum;		// 충전 번호
	private String userid;		// 유저 아이디
	private String laveexpiry;	// 잔여 유효일시
	private int chargetime;		// 충전 시간
	
}
