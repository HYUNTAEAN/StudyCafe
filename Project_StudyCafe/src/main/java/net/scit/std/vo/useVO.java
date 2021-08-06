package net.scit.std.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class useVO {
	private int usenum;			// 이용 번호
	private String userid;		// 유저 아이디
	private int chargingtime;	// 충전 시간
	private int chargingday;	// 충전 일수
	private String starttime;	// 입실 시간
	private String endtime;		// 퇴실 시간
	private int seatnum;		// 좌석 번호
	
}
