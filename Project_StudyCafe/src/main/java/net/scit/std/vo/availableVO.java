package net.scit.std.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class availableVO {
	private int tradenum;
	private String productcode;
	private String productname;
	private String laveexpiry;
	private String lavetime;
	
}