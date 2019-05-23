update proups$ set value$='utf-8' where name = 'nls_characterset';
	select name, value$ from sys.props$ where name ='nls_nchar_characterset';


drop table photo;
drop table diary;
drop table friend;
drop table info;
drop table visit;
drop table member;
drop table music;
drop table fmsg;

drop sequence music_seq;
drop trigger music_trigger;

drop sequence diary_seq;
drop trigger diary_trigger;

drop sequence photo_seq;
drop trigger photo_trigger;

drop sequence friend_seq;
drop trigger friend_trigger;

drop sequence fmsg_SEq;
drop trigger BI_fmsg;

create table music(
	musiccode number(4) primary key,
	musicname varchar2(500) not null,
	musicartist varchar2(500),
	musicaddress varchar2(3000)
);

create sequence music_seq start with 1 increment by 1 minvalue 1 nomaxvalue nocache nocycle;
		
create table member(
	m_id varchar2(200) primary key,
	m_pass varchar2(200) not null,
	m_name varchar2(100) not null,
	m_email varchar2(300) not null,
	m_phone varchar2(140) not null,
	m_open char(1) default 0,
	m_address varchar2(100) unique not null,
	m_code number(4) default 1 not null,
	
	constraint fk_member foreign key(m_code) references music(musiccode)
);

create table info(
   i_id varchar2(200) primary key,
   i_address varchar2(100) not null,
   i_name varchar2(200) not null,
   i_pic varchar2(1000),
   i_intro varchar2(100),
   i_open number(1) default 0,
   
   constraint fk_info foreign key(i_address) references member(m_address) on delete cascade
);

CREATE TABLE VISIT (
	V_DATE DATE NOT NULL,
	V_ID varchar2(200),
	V_address varchar2(100) not null
);

create table friend(
	f_num number primary key,
   	f_name varchar2(200) not null,
   	f_id varchar2(200) not null,
   	f_nickname varchar2(100) default '일촌' not null,
   	f_mid varchar2(200) not null,
   
   constraint fk_friend foreign key(f_mid) references member(m_id) on delete cascade
);

CREATE SEQUENCE friend_seq MINVALUE 1 NOMAXVALUE INCREMENT BY 1 START WITH 1 NOCACHE NOCYCLE;

create table diary(
   d_num number(4) default 1 primary key,
   d_day varchar2(200) default sysdate,
   d_subject varchar2(200) not null,
   d_content varchar2(2000) not null,
   d_id varchar2(200) not null,
   
   constraint fk_diary foreign key(d_id) references member(m_id) on delete cascade
); 

CREATE SEQUENCE diary_seq MINVALUE 1 NOMAXVALUE INCREMENT BY 1 START WITH 1 NOCACHE NOCYCLE;

create table photo(
   p_num number(4) default 1 primary key,
   p_day varchar2(200) default sysdate,
   p_subject varchar2(200) not null,
   p_content varchar2(2000) not null,
   p_addr varchar2(3000)not null,
   p_id varchar2(200) not null,
   
   constraint fk_photo foreign key(p_id) references member(m_id) on delete cascade
);

CREATE SEQUENCE photo_seq MINVALUE 1 NOMAXVALUE INCREMENT BY 1 START WITH 1 NOCACHE NOCYCLE;

create table fmsg(
f_num number primary key,
f_msg varchar2(500),
f_toid varchar2(20) not null,
f_tonick varchar2(20) default '바까',
f_fromid varchar2(20) not null,

constraint fk_fmsg foreign key(f_toid) references member(m_id) on delete cascade
);

CREATE SEQUENCE fmsg_SEq MINVALUE 1  NOMAXVALUE INCREMENT BY 1 START WITH 1 NOCACHE NOCYCLE ;

insert into music values(music_seq.nextval, '옥탑방', '엔플라잉', 'C:\Users\siwon\Desktop\source\responser2005\WebContent\music\2.mp3');
insert into music values(music_seq.nextval, 'SOLO', '제니', 'C:\Users\siwon\Desktop\source\responser2005\WebContent\music\3.mp3');
insert into music values(music_seq.nextval, '고고베베', '마마무', 'C:\Users\siwon\Desktop\source\responser2005\WebContent\music\4.mp3');
insert into music values(music_seq.nextval, '이웃집 토토로 ost', '히사시이 조', 'C:\Users\siwon\Desktop\source\responser2005\WebContent\music\5.mp3');
insert into music values(music_seq.nextval, 'grip', '이누야샤 4기 ost', 'C:\Users\siwon\Desktop\source\responser2005\WebContent\music\6.mp3');
insert into music values(music_seq.nextval, '전전전쟁', '너의 이름은 ost', 'C:\Users\siwon\Desktop\source\responser2005\WebContent\music\7.mp3');
insert into music values(music_seq.nextval, '스파클', '너의 이름은 ost', 'C:\Users\siwon\Desktop\source\responser2005\WebContent\music\8.mp3');
insert into music values(music_seq.nextval, '꿈의 등불', '너의 이름은 ost', 'C:\Users\siwon\Desktop\source\responser2005\WebContent\music\9.mp3');
insert into music values(music_seq.nextval, '모래요정 바람돌이', '남궁윤, 이경희', 'C:\Users\siwon\Desktop\source\responser2005\WebContent\music\10.mp3');
insert into music values(music_seq.nextval, '우산', '에픽하이, 윤하', 'C:\Users\siwon\Desktop\source\responser2005\WebContent\music\11.mp3');
insert into music values(music_seq.nextval, '당신과의 키스를 세어보아요', '코야나기 유키', 'C:\Users\siwon\Desktop\source\responser2005\WebContent\music\12.mp3');
insert into music values(music_seq.nextval, '겁쟁이', '버즈', 'C:\Users\siwon\Desktop\source\responser2005\WebContent\music\13.mp3');
insert into music values(music_seq.nextval, '주문', '동방신기', 'C:\Users\siwon\Desktop\source\responser2005\WebContent\music\14.mp3');
insert into music values(music_seq.nextval, '몽환의 숲', '키네틱 플로우(Feat.이루마)', 'C:\Users\siwon\Desktop\source\responser2005\WebContent\music\15.mp3');
insert into music values(1, '등록된 음악이 없습니다', null, null);

insert into member values('swlee', 'aaa', '이시원', 'swlee@gmail.com', '01056307660', 0, 'http://localhost:8080/responser2005/world/swlee.jsp', 15);
insert into member values('hjlee', 'bbb', '이혁주', 'hjlee@gmail.com', '01012345678', 0, 'http://localhost:8080/responser2005/world/hjlee.jsp', 10);
insert into member values('jhpark', 'ccc', '박지휘', 'jhpark@gmail.com', '01025549622', 0, 'http://localhost:8080/responser2005/world/jhpark.jsp', 6);
insert into member values('jskim', 'ddd', '김진석', 'jskim@gmail.com', '01019450075', 0, 'http://localhost:8080/responser2005/world/jskim.jsp', 13);


insert into info values('swlee', 'http://localhost:8080/responser2005/world/swlee.jsp', '이시원님의 미니홈피', 'C:\\Users\\siwon\\Desktop\\source\\responser2005\\WebContent\\memberimg\\default.jpg', '안녕하세요', 0);
insert into info values('hjlee', 'http://localhost:8080/responser2005/world/hjlee.jsp', '이혁주님의 미니홈피', 'C:\\Users\\siwon\\Desktop\\source\\responser2005\\WebContent\\memberimg\\default.jpg', '안녕하세요', 0);
insert into info values('jhpark', 'http://localhost:8080/responser2005/world/jhpark.jsp', '박지휘님의 미니홈피', 'C:\\Users\\siwon\\Desktop\\source\\responser2005\\WebContent\\memberimg\\default.jpg', '안녕하세요', 0);
insert into info values('jskim', 'http://localhost:8080/responser2005/world/jskim.jsp', '김진석님의 미니홈피', 'C:\\Users\\siwon\\Desktop\\source\\responser2005\\WebContent\\memberimg\\default.jpg', '안녕하세요', 0);

insert into member values('jhlee', 'eee', '이재희', 'jhlee@gmail.com', '01094147213', 0, 'http://localhost:8080/responser2005/world/jhlee.jsp', 11);
insert into member values('sjchoi', 'fff', '최성진', 'sjchoi@gmail.com', '01094147213', 0, 'http://localhost:8080/responser2005/world/sjchoi.jsp', 5);
insert into member values('hwchoi', 'ggg', '최형원', 'hwchoi@gmail.com', '01094147213', 0, 'http://localhost:8080/responser2005/world/hwchoi.jsp', 2);
insert into member values('glno', 'hhh', '노카푸레', 'glno@gmail.com', '01094147213', 0, 'http://localhost:8080/responser2005/world/glno.jsp', 4);
insert into member values('mgjeon', 'iii', '정밍키', 'mgjeon@gmail.com', '01094147213', 0, 'http://localhost:8080/responser2005/world/mgjeon.jsp', 3);

insert into member values('khkwon', 'jjj', '권기훈', 'khkwon@gmail.com', '01094147213', 0, 'http://localhost:8080/responser2005/world/khkwon.jsp', 11);
insert into member values('jhkim', 'kkk', '딕토', 'jhkim@gmail.com', '01094147213', 0, 'http://localhost:8080/responser2005/world/jhkim.jsp', 12);
insert into member values('jhyu', 'lll', '유까츄', 'mgjeon@gmail.com', '01094147213', 0, 'http://localhost:8080/responser2005/world/jhyu.jsp', 6);

insert into info values('jhlee', 'http://localhost:8080/responser2005/world/jhlee.jsp', '이재희님의 미니홈피', 'C:\\Users\\siwon\\Desktop\\source\\responser2005\\WebContent\\memberimg\\default.jpg', '안녕하세요', 0);
insert into info values('sjchoi', 'http://localhost:8080/responser2005/world/sjchoi.jsp', '최성진님의 미니홈피', 'C:\\Users\\siwon\\Desktop\\source\\responser2005\\WebContent\\memberimg\\default.jpg', '안녕하세요', 0);
insert into info values('hwchoi', 'http://localhost:8080/responser2005/world/hwchoi.jsp', '최형원님의 미니홈피', 'C:\\Users\\siwon\\Desktop\\source\\responser2005\\WebContent\\memberimg\\default.jpg', '안녕하세요', 0);
insert into info values('glno', 'http://localhost:8080/responser2005/world/glno.jsp', '노카푸레님의 미니홈피', 'C:\\Users\\siwon\\Desktop\\source\\responser2005\\WebContent\\memberimg\\default.jpg', '안녕하세요', 0);
insert into info values('mgjeon', 'http://localhost:8080/responser2005/world/mgjeon.jsp', '정밍키님의 미니홈피', 'C:\\Users\\siwon\\Desktop\\source\\responser2005\\WebContent\\memberimg\\default.jpg', '안녕하세요', 0);

insert into info values('khkwon', 'http://localhost:8080/responser2005/world/khkwon.jsp', '권기훈님의 미니홈피', 'C:\\Users\\siwon\\Desktop\\source\\responser2005\\WebContent\\memberimg\\default.jpg', '안녕하세요', 0);
insert into info values('jhkim', 'http://localhost:8080/responser2005/world/jhkim.jsp', '딕토님의 미니홈피', 'C:\\Users\\siwon\\Desktop\\source\\responser2005\\WebContent\\memberimg\\default.jpg', '안녕하세요', 0);
insert into info values('jhyu', 'http://localhost:8080/responser2005/world/jhyu.jsp', '유과장님의 미니홈피', 'C:\\Users\\siwon\\Desktop\\source\\responser2005\\WebContent\\memberimg\\default.jpg', '안녕하세요', 0);

insert into member values('kichoi', 'eee', '최케인', 'kichoi@gmail.com', '01019421945', 0, 'http://localhost:8080/responser2005/world/kichoi.jsp', 3);
insert into member values('cnjohn', 'fff', '존시나', 'cnjohn@gmail.com', '01078946121', 0, 'http://localhost:8080/responser2005/world/cnjohn.jsp', 4);
insert into member values('aniori', 'ggg', '오영택', 'aniori@gmail.com', '01078945484', 0, 'http://localhost:8080/responser2005/world/aniori.jsp', 5);
insert into member values('ebpung', 'hhh', '풍은범', 'ebpung@gmail.com', '01048153264', 0, 'http://localhost:8080/responser2005/world/ebpung.jsp', 9);

insert into info values('kichoi', 'http://localhost:8080/responser2005/world/kichoi.jsp', '최케인님의 미니홈피', 'C:\\track2p\\source\\responser2005\\WebContent\\memberimg\\default.jpg', '안녕하세요', 0);
insert into info values('cnjohn', 'http://localhost:8080/responser2005/world/cnjohn.jsp', '존시나님의 미니홈피', 'C:\\track2p\\source\\responser2005\\WebContent\\memberimg\\default.jpg', '안녕하세요', 0);
insert into info values('aniori', 'http://localhost:8080/responser2005/world/aniori.jsp', '오영택님의 미니홈피', 'C:\\track2p\\source\\responser2005\\WebContent\\memberimg\\default.jpg', '안녕하세요', 0);
insert into info values('ebpung', 'http://localhost:8080/responser2005/world/ebpung.jsp', '풍은범님의 미니홈피', 'C:\\track2p\\source\\responser2005\\WebContent\\memberimg\\default.jpg', '안녕하세요', 0);

insert into member values('ewjeong', 'iii', '정은원', 'ewjeong@gmail.com', '01022211154', 0, 'http://localhost:8080/responser2005/world/ewjeong.jsp', 22);
insert into member values('swjin', 'jjj', '진상원', 'swjin@gmail.com', '01079461325', 0, 'http://localhost:8080/responser2005/world/swjin.jsp', 14);
insert into member values('jhsang', 'kkk', '상재훈', 'jhsang@gmail.com', '01019739486', 0, 'http://localhost:8080/responser2005/world/jhsang.jsp', 17);
insert into member values('sjuchoi', 'lll', '최성준', 'sjuchoi@gmail.com', '01036485124', 0, 'http://localhost:8080/responser2005/world/sjuchoi.jsp', 18);

insert into info values('ewjeong', 'http://localhost:8080/responser2005/world/ewjeong.jsp', '정은원님의 미니홈피', 'C:\\track2p\\source\\responser2005\\WebContent\\memberimg\\default.jpg', '안녕하세요', 0);
insert into info values('swjin', 'http://localhost:8080/responser2005/world/swjin.jsp', '진상원님의 미니홈피', 'C:\\track2p\\source\\responser2005\\WebContent\\memberimg\\default.jpg', '안녕하세요', 0);
insert into info values('jhsang', 'http://localhost:8080/responser2005/world/jhsang.jsp', '상재훈님의 미니홈피', 'C:\\track2p\\source\\responser2005\\WebContent\\memberimg\\default.jpg', '안녕하세요', 0);
insert into info values('sjuchoi', 'http://localhost:8080/responser2005/world/sjuchoi.jsp', '최성준님의 미니홈피', 'C:\\track2p\\source\\responser2005\\WebContent\\memberimg\\default.jpg', '안녕하세요', 0);

CREATE or replace TRIGGER diary_trigger 
	BEFORE INSERT ON diary 
	FOR EACH ROW
		BEGIN
			SELECT diary_seq.NEXTVAL INTO :new.d_num FROM dual; 
		END;
		/

create or replace trigger photo_trigger 
	before insert on photo 
	for each row
		begin 
			select photo_seq.nextval into :new.p_num from dual; 
		end;
		
		
create or replace trigger BI_fmsg 
	before insert on fmsg 
	for each row
		begin
			select fmsg_seq.nextval into :new.f_num from dual;
		end;
		

create or replace trigger friend_trigger
	before insert on fmsg 
	for each row
		begin
			select friend_seq.nextval into :new.f_num from dual;
		end;
		
select * from music;		
select * from diary;
select * from member;
select * from fmsg;
select * from FRIEND;
select * from visit;
select * from info;
select * from photo;
