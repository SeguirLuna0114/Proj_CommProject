-- music계정(=mypage계정)의 테이블 및 시퀀스 조회
select * from tab;
select * from seq;

select * from pr_board;

--1) 회원 테이블
select * from member;
-- 데이터 입력
insert into member 
values ('test2', '1234', '홍길순', '01012341234',
		 'hong@naver.com', '축가', 'Y', sysdate, sysdate, 'N');


