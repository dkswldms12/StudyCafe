CREATE TABLE gmember(
	gid VARCHAR(20) NOT NULL,
	gpasswd VARCHAR(50) NOT NULL,
	gname VARCHAR(20) NOT NULL,
	ggender VARCHAR(20) NOT NULL,
	gbirth VARCHAR(30) NOT NULL,
	gphone VARCHAR(50) NOT NULL,
	gemail VARCHAR(100) NOT NULL,
	gaddr1 VARCHAR(10) NOT NULL,
	gaddr2 VARCHAR(255) NOT NULL,
	gaddr3 VARCHAR(255) NOT NULL,
	gjoindate DATE NOT NULL,
	PRIMARY KEY(gid)
);

INSERT INTO gmember(gid, gpasswd, gname, ggender, gbirth, gphone, gemail, gaddr1, gaddr2, gaddr3, gjoindate)
VALUES('user1','1234','김말동','여자','000000','123-1234','aa@naver.com','123-123','가나다라마바사','에이비씨',sysdate);

INSERT INTO gmember (gid, gpasswd, gname, ggender, gbirth, gphone, gemail, gaddr1, gaddr2, gaddr3, gjoindate)
		VALUES ('#{gid}', '#{gpasswd}', '#{gname}', 0, '#{gbirth}',
		'#{gphone}', '#{gemail}', '#{gaddr1}', '#{gaddr2}', '#{gaddr3}', sysdate)

		
UPDATE gmember
SET gid = 'user2', gpasswd = '1234', gname = '말동이', gbirth = '111111', gphone = '231-4567', gemail = 'ㅁㅁ11@anver.com', gaddr1 =  '352-256', gaddr2 = '메롱메롱', gaddr3 = 'ㅇㅇㅇㅇ'
WHERE gid = 'user1';

select * from gmember;

delete from gmember;

drop table gmember;

--create table gmember(
--gid varchar(20) not null auto_increment primary key,
--gpasswd varchar(50) not null,
--gname varchar(20) not null,
--ggender varchar(20) not null default 1,
--gbirth varchar(30) not null,
--gphone varchar(50) not null,
--gemail varchar(100) not null,
--gaddr1 varchar(10) not null,
--gaddr2 varchar(255) not null,
--gaddr3 varchar(255) not null,
--gjoindate datetime not null
--);