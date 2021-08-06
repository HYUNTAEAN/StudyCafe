/* 
 * 		날짜 타입 뷰에 출력시에는 date 형식으로 출력하고
 * 		시간 계산 로직에서는 숫자 타입으로 계산하기 위해서
 * 		충전 시간/일수는 숫자 데이터 타입으로 저장하고
 * 		유효기간과 입실/퇴실 시간은 날짜 타입으로 설정함
 * 		
 * 		! 차후 구현 로직에 따라 수정 될 수 있음
 * 
 * 		테이블 속성명에 _ 포함한 것은 실무에서 붙이는 경우가 많은데
 * 		자바 VO에서는 _ 없이 쓰기 때문에
 * 		쿼리문에서 as로 속성명 일치 해주는 작업 필요하지만 연습하는 기회로 삼음
 * 		
 * 		<< 앞으로 깃허브에 commit할시 코멘트는 영문으로 간략하게 (포폴에 쓰기 위함) >>
 * 					차후에 주석들도 영문으로 수정할 것임
 */		

CREATE TABLE Cafe_Member
(
    userid varchar2(30) primary key, 		-- 사용자 아이디
    userpwd varchar2(30) not null, 			-- 사용자 비밀번호
    charging_time number default 0, 		-- 충전 시간
    charging_day number default 0 			-- 충전 일수
);

CREATE TABLE Cafe_SeatInfo
(
	seat_num number primary key 			-- 좌석 번호
);

CREATE TABLE Cafe_ProductInfo
(
	product_code varchar2(30) primary key, 	-- 상품 코드
	product_time number not null, 			-- 상품 시간
	price number not null, 					-- 상품 가격
	expiry_time date not null 				-- 상품 유효 일시
);

CREATE TABLE Cafe_TradeInfo
(
	trade_num number primary key,												-- 거래 번호
	userid varchar2(30) not null references Cafe_Member(userid),				-- 사용자 아이디
	product_time number not null references Cafe_ProductInfo(product_time),		-- 상품 시간
	trade_time date default sysdate,											-- 거래 시각
	expiry_time date not null references Cafe_ProductInfo(expiry_time)			-- 상품 유효 일시										-- 퇴실 예정 시간
);

CREATE TABLE Cafe_UseInfo
(
	use_num number primary key,
	userid varchar2(30) not null references Cafe_Member(userid),				-- 이용 번호
	charging_time number references Cafe_Member(charging_time),					-- 충전시간
	charging_day number references Cafe_Member(charging_day),					-- 충전일수
	start_time date default sysdate,											-- 입실 시각
	end_time date not null,														-- 퇴실 예정 시각
	seat_num number not null references Cafe_SeatInfo(seat_num)						-- 좌석 번호
);

CREATE SEQUENCE trade_num_seq;	-- 거래 번호 시퀀스
CREATE SEQUENCE use_num_seq;	-- 이용 번호 시퀀스


DROP TABLE Cafe_Member;
DROP TABLE Cafe_SeatInfo;
DROP TABLE Cafe_TradeInfo;
DROP TABLE Cafe_UseInfo;
DROP SEQUENCE trade_num_seq;
DROP SEQUENCE use_num_seq;
