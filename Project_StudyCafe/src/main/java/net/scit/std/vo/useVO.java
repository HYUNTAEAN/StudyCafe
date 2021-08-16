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
	private String starttime;	// 입실 시각
	private String endtime;		// 퇴실 예정 시각
	private int seatnum;		// 좌석 번호
}
