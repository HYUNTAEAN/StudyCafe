package net.scit.std.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class productVO {
	private String productcode;	// 상품 코드
	private int producttime;	// 상품 시간
	private int price;			// 가격
	private int expirytime;		// 상품 유효 기간
	private String productname; // 상품명
	
}
