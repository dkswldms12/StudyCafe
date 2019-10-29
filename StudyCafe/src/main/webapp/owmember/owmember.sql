-- 점주회원 테이블
create table owmember(
	owid varchar(50) not null, -- 아이디
	owpasswd varchar(50)not null, -- 비밀번호
	owname varchar(20) not null, -- 이름
	owgender varchar(10) not null, -- 성별(1:남자, 2:여자)
	owbirth varchar(20) not null, -- 생년월일
	owphone varchar(50) not null, -- 전화번호
	owemail varchar(100) not null, -- 이메일
	owjoindate date not null, -- 가입일자
	primary key(owid)
);
 
drop table owmember;
 
select * from owmember;

delete from owmember;