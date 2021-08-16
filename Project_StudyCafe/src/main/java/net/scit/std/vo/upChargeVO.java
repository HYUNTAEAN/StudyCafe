package net.scit.std.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class upChargeVO {
	private int tradenum;
	private String userid;
	private int chargetime;
	private String finalTime;
}
