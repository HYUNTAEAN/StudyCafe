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
    userpwd varchar2(30) not null 			-- 사용자 비밀번호
);

CREATE TABLE Cafe_SeatInfo
(
	seat_num number primary key, 			-- 좌석 번호
	section_num varchar2(50)                -- 구역 번호
);

CREATE TABLE Cafe_ProductInfo
(
	product_code varchar2(30) primary key, 	-- 상품 코드
	product_time number not null, 			-- 상품 시간
	price number not null, 					-- 상품 가격
	expiry_time number not null, 			-- 상품 유효 일시
	product_name varchar(70)				-- 상품 이름
);

CREATE TABLE Cafe_TradeInfo
(
	trade_num number primary key,												-- 거래 번호
	userid varchar2(30) not null references Cafe_Member(userid),				-- 사용자 아이디
	trade_time date default sysdate,											-- 거래 시각
	lave_expiry date,															-- 잔여 유효 일시	
	product_code varchar2(30) references Cafe_ProductInfo(product_code),		-- 상품 코드
	lave_time number, 															-- 잔여 시간
	product_name varchar(70)													-- 상품 이름															
);

CREATE TABLE Cafe_ChargeInfo
(
	charge_num number primary key,												--충전 번호
	userid varchar2(30) not null,												-- 사용자 아이디
	lave_expiry date,															-- 잔여 유효 일시
	charge_time number,															-- 충전 시간
	product_code varchar2(30) not null references Cafe_ProductInfo(product_code),-- 상품 코드
	charge_date date not null													-- 충전 일시
);
CREATE TABLE Cafe_UseInfo
(
	use_num number primary key,													-- 이용 번호
	userid varchar2(30) not null references Cafe_Member(userid),				-- 사용자 아이디
	start_time date default sysdate not null,									-- 입실 시각
	end_time date not null,														-- 퇴실 예정 시각
	seat_num number not null references Cafe_SeatInfo(seat_num)				-- 좌석 번호
);

CREATE SEQUENCE trade_num_seq;	-- 거래 번호 시퀀스
CREATE SEQUENCE use_num_seq;	-- 이용 번호 시퀀스
CREATE SEQUENCE charge_num_seq;	-- 충전 번호 시퀀스
CREATE SEQUENCE seat_num_seq;   -- 좌석 번호 시퀀스

DROP TABLE Cafe_Member;
DROP TABLE Cafe_SeatInfo;
DROP TABLE Cafe_ProductInfo;
DROP TABLE Cafe_TradeInfo;
DROP TABLE Cafe_ChargeInfo;
DROP TABLE Cafe_UseInfo;
DROP SEQUENCE trade_num_seq;
DROP SEQUENCE use_num_seq;
DROP SEQUENCE charge_num_seq;

rollback;
commit;
delete from Cafe_ProductInfo;
delete from Cafe_TradeInfo;
insert into
    Cafe_ProductInfo(
        product_code
        ,product_time
        ,price
        ,expiry_time
        ,product_name
    )values(
        'A001'
        ,2
        ,3500
        ,1
        ,'2hours Ticket'
    );
insert into
    Cafe_ProductInfo(
        product_code
        ,product_time
        ,price
        ,expiry_time
        ,product_name
    )values(
        'A002'
        ,3
        ,5000
        ,1
        ,'3hours Ticket'
    );
insert into
    Cafe_ProductInfo(
        product_code
        ,product_time
        ,price
        ,expiry_time
        ,product_name
    )values(
        'A003'
        ,4
        ,6000
        ,1
        ,'4hours Ticket'
    );
insert into
    Cafe_ProductInfo(
        product_code
        ,product_time
        ,price
        ,expiry_time
        ,product_name
    )values(
        'A004'
        ,6
        ,8000
        ,1
        ,'6hours Ticket'
    );
insert into
    Cafe_ProductInfo(
        product_code
        ,product_time
        ,price
        ,expiry_time
        ,product_name
    )values(
        'A005'
        ,8
        ,9500
        ,1
        ,'8hours Ticket'
    );
insert into
    Cafe_ProductInfo(
        product_code
        ,product_time
        ,price
        ,expiry_time
        ,product_name
    )values(
        'A006'
        ,10
        ,11000
        ,1
        ,'10hours Ticket'
    );
insert into
    Cafe_ProductInfo(
        product_code
        ,product_time
        ,price
        ,expiry_time
        ,product_name
    )values(
        'A007'
        ,12
        ,12000
        ,1
        ,'12hours Ticket'
    );
insert into
    Cafe_ProductInfo(
        product_code
        ,product_time
        ,price
        ,expiry_time
        ,product_name
    )values(
        'A008'
        ,15
        ,14000
        ,1
        ,'15hours Ticket'
    );
insert into
    Cafe_ProductInfo(
        product_code
        ,product_time
        ,price
        ,expiry_time
        ,product_name
    )values(
        'A009'
        ,24
        ,20000
        ,1
        ,'24hours Ticket'
    );
insert into
    Cafe_ProductInfo(
        product_code
        ,product_time
        ,price
        ,expiry_time
        ,product_name
    )values(
        'B001'
        ,30
        ,49000
        ,30
        ,'30hours Packege'
    );
insert into
    Cafe_ProductInfo(
        product_code
        ,product_time
        ,price
        ,expiry_time
        ,product_name
    )values(
        'B002'
        ,50
        ,70000
        ,50
        ,'50hours Packege'
    );
insert into
    Cafe_ProductInfo(
        product_code
        ,product_time
        ,price
        ,expiry_time
        ,product_name
    )values(
        'B003'
        ,100
        ,130000
        ,100
        ,'100hours Packege'
    );
insert into
    Cafe_ProductInfo(
        product_code
        ,product_time
        ,price
        ,expiry_time
        ,product_name
    )values(
        'C001'
        ,7
        ,49000
        ,7
        ,'1Week Free Pass'
    );
insert into
    Cafe_ProductInfo(
        product_code
        ,product_time
        ,price
        ,expiry_time
        ,product_name
    )values(
        'C002'
        ,14
        ,85000
        ,14
        ,'2Weeks Free Pass'
    );
insert into
    Cafe_ProductInfo(
        product_code
        ,product_time
        ,price
        ,expiry_time
        ,product_name
    )values(
        'C003'
        ,28
        ,139000
        ,28
        ,'4Weeks Free Pass'
    );